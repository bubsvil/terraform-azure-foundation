output "resource_groups" {
  value = {
    connectivity = azurerm_resource_group.connectivity.name
    workload     = azurerm_resource_group.workload.name
  }
}

output "vnet_name" {
  value = azurerm_virtual_network.main.name
}