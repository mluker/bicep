param loc string = resourceGroup().location

resource virtualNetwork 'Microsoft.Network/virtualNetworks@2019-11-01' = {
  name: 'VNET4'
  location: loc
  properties: {
    addressSpace: {
      addressPrefixes: [
        '10.0.0.0/16'
      ]
    }
  }
}

resource sub1 'Microsoft.Network/virtualNetworks/subnets@2020-11-01' = {
  name: 'subnet1'
  parent: virtualNetwork
  properties: {
    addressPrefix: '10.0.0.0/18'
  }
}

resource sub2 'Microsoft.Network/virtualNetworks/subnets@2020-11-01' = {
  name: 'subnet2'
  parent: virtualNetwork
  dependsOn: [sub1]
  properties: {
    addressPrefix: '10.0.64.0/18'
  }
}

resource sub3 'Microsoft.Network/virtualNetworks/subnets@2020-11-01' = {
  name: 'subnet3'
  parent: virtualNetwork
  dependsOn: [sub2]
  properties: {
    addressPrefix: '10.0.128.0/18'
  }
}

resource sub4 'Microsoft.Network/virtualNetworks/subnets@2020-11-01' = {
  name: 'subnet4'
  parent: virtualNetwork
  dependsOn: [sub3]
  properties: {
    addressPrefix: '10.0.192.0/18'
  }
}
