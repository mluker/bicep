param loc string = resourceGroup().location

resource virtualNetwork 'Microsoft.Network/virtualNetworks@2019-11-01' = {
  name: 'VNET2'
  location: loc
  properties: {
    addressSpace: {
      addressPrefixes: [
        '10.0.0.0/16'
      ]
    }
    subnets: [
      {
        name: 'subnet1'
        properties: {
          addressPrefix: '10.0.0.0/18'
        }
      }
      {
        name: 'subnet2'
        properties: {
          addressPrefix: '10.0.64.0/18'
        }
      }
       {
        name: 'subnet3'
        properties: {
          addressPrefix: '10.0.128.0/18'
        }
      }
       {
        name: 'subnet4'
        properties: {
          addressPrefix: '10.0.192.0/18'
        }
      }
    ]
  }
}
