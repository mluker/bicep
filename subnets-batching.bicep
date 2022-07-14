var subnets = [
  {
    name: 'subnet1'
    subnetPrefix: '10.0.0.0/18'
  }
  {
    name: 'subnet2'
    subnetPrefix: '10.0.64.0/18'
  }
  {
    name: 'subnet3'
    subnetPrefix: '10.0.128.0/18'
  }
  {
    name: 'subnet4'
    subnetPrefix: '10.0.192.0/18'
  }
]

param loc string = resourceGroup().location

resource virtualNetwork 'Microsoft.Network/virtualNetworks@2019-11-01' = {
  name: 'VNET3'
  location: loc
  properties: {
    addressSpace: {
      addressPrefixes: [
        '10.0.0.0/16'
      ]
    }
  }
}

@batchSize(1)
resource Subnets 'Microsoft.Network/virtualNetworks/subnets@2020-11-01' = [for (sn, index) in subnets: {
  name: sn.name
  parent: virtualNetwork
  properties: {
    addressPrefix: sn.subnetPrefix
  }
}]
