output "rg_location" {
    value = var.location
}

output "rg_name" {
    value = var.rg_name
}
output "resource_group_name" {
    value = azurerm_resource_group.resource_group.name
}

output "vnet_cidr" {
    value = var.vnet_cidr
}

output "vnet_name" {
    value = var.vnet_name
}

