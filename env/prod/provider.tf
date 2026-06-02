terraform {
  required_providers {
    azurerm = {
    source = "hashicorp/azurerm"
    version = "4.68.0"
    }
  }
}

provider "azurerm" {
    features {
      
    }
  subscription_id = "ba18a571-c291-4129-ab4b-d845f86fc40d"
}
