param saName string
param saSku string
param saKind string

resource sa 'Microsoft.Storage/storageAccounts@2021-04-01' = {
  name: saName
  location: resourceGroup().location
  sku: {
    name: saSku
  }
  kind: saKind
}

resource tableservice 'Microsoft.Storage/storageAccounts/tableServices@2021-04-01' = {
  name: 'default'
  parent: sa
}

resource ipamsmall 'Microsoft.Storage/storageAccounts/tableServices/tables@2021-04-01' = {
  name: 'ipam-small'
  parent: tableservice
}

resource ipammedium 'Microsoft.Storage/storageAccounts/tableServices/tables@2021-04-01' = {
  name: 'ipam-medium'
  parent: tableservice
}

resource ipamlarge 'Microsoft.Storage/storageAccounts/tableServices/tables@2021-04-01' = {
  name: 'ipam-large'
  parent: tableservice
}
