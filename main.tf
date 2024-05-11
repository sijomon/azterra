
# terraform settings block
terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.101.0"
    }
  }
}
# azure provide block
provider "azurerm" {
  # Configuration options
  features {}
}

# Create a resource group

module "resourcegroup" {
  source         = "./modules/resourcegroup"
  name           = var.name
  location       = var.location
}

module "virtualnetwork" {
  source         = "./modules/virtualnetwork"
  name           = var.vmname
  address_space  = [var.vnetcidr]
  location       = module.resourcegroup.location_id
  resource_group = module.resourcegroup.resource_group_name
}



