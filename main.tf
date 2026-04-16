data "azurerm_client_config" "current" {}

locals {
  prefix = "${var.project}-${var.environment}"
}

# resource groups

resource "azurerm_resource_group" "connectivity" {
  name     = "rg-${local.prefix}-connectivity"
  location = var.location
  tags     = var.tags
}

resource "azurerm_resource_group" "workload" {
  name     = "rg-${local.prefix}-workload"
  location = var.location
  tags     = var.tags
}

# network

resource "azurerm_virtual_network" "main" {
  name                = "vnet-${local.prefix}"
  location            = var.location
  resource_group_name = azurerm_resource_group.connectivity.name
  address_space       = ["10.0.0.0/16"]

  tags = var.tags
}

resource "azurerm_subnet" "aks" {
  name                 = "snet-${var.project}-aks-${var.environment}"
  resource_group_name  = azurerm_resource_group.connectivity.name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_subnet" "db" {
  name                 = "snet-${var.project}-db-${var.environment}"
  resource_group_name  = azurerm_resource_group.connectivity.name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = ["10.0.2.0/28"]
}

resource "azurerm_subnet" "apps" {
  name                 = "snet-${var.project}-apps-${var.environment}"
  resource_group_name  = azurerm_resource_group.connectivity.name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = ["10.0.3.0/28"]
}

# rbac groups

resource "azuread_group" "devops" {
  display_name     = "grp-${local.prefix}-devops"
  security_enabled = true
}

resource "azuread_group" "security" {
  display_name     = "grp-${local.prefix}-security"
  security_enabled = true
}

resource "azuread_group" "finops" {
  display_name     = "grp-${local.prefix}-finops"
  security_enabled = true
}

# role assignments

resource "azurerm_role_assignment" "devops" {
  scope                = azurerm_resource_group.workload.id
  role_definition_name = "Contributor"
  principal_id         = azuread_group.devops.object_id
}

resource "azurerm_role_assignment" "security" {
  scope                = azurerm_resource_group.workload.id
  role_definition_name = "Reader"
  principal_id         = azuread_group.security.object_id
}

resource "azurerm_role_assignment" "finops" {
  scope                = azurerm_resource_group.workload.id
  role_definition_name = "Cost Management Reader"
  principal_id         = azuread_group.finops.object_id
}