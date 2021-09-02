param cgZoneId string
param regionName string
param addressRange string

var rgNetworkName = 'rg-${cgZoneId}-${regionName}-network'
var vnetName = 'vnet-${cgZoneId}-${regionName}-01'

targetScope = 'subscription'
resource rgNetwork 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: rgNetworkName
  location: regionName
}

module vnet './modules/network.bicep' = {
  name: 'vnetDeployment'
  scope: rgNetwork
  params: {
    vnetName: vnetName
    addressRange: addressRange
  }
}
