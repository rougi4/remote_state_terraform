#Set up remote state
terraform{
  backend "azurerm" { 
  resource_group_name   = "test3rg"
  storage_account_name  = "storagerougi4"
  container_name        = "tfblobrougi4"
  key                   = "tst.terraform.tfstate"
  }
}

#Configure the Azure Provider
terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "=2.26"
    }
  }
}

provider "azurerm"{
  features {}
}


#create resource group
resource "azurerm_storage_account" "rg" {
    resource_group_name = "test3rg"
    name     = "storagerougi4"
    location = "westeurope"
    account_tier = "Standard"
    account_replication_type = "ZRS"
}

resource "azurerm_storage_container" "rg" {
  name                  = "tfblobrougi4"
  storage_account_name  = "storagerougi4"
  container_access_type = "private"
}




