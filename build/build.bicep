param regionName string

var rgIpamName = 'rg-hmrc-${regionName}-ipam'

targetScope = 'subscription'
resource rgIpam 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: rgIpamName
  location: regionName
}

module storage './modules/storage.bicep' = {
  name: 'storageDeployment'
  scope: rgIpam
  params: {
    saName: 'sahmrcuksouth${uniqueString('resourceGroup.id')}'
    saSku: 'Standard_LRS'
    saKind: 'StorageV2'
  }
}
