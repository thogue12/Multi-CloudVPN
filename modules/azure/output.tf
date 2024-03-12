output "rg_location" {
    value = azurerm_resource_group.resource_group.location
    description = "the lcoation of the azure vnet"
}

output "rg_name" {
    value = azurerm_resource_group.resource_group.name
    description = "the name of the azure vnet"
}