#rg module calling
module "rg" {
  source   = "../../modules/Resource_group"

  rg_name  = var.rg_name
  location = var.location
}

#Storage module calling
module "storage" {
  source = "../../modules/storage"

  rg_name     = module.rg.rg_name
  location    = var.location
  storage_map = var.storage_map
  tags        = var.tags

  depends_on = [module.rg]
}

#Networking module calling
module "vnet" {
  source = "../../modules/networking"

  vnet_name      = var.vnet_name
  location       = var.location
  rg_name        = module.rg.rg_name
  address_space  = var.address_space
  subnets        = var.subnets
  tags           = var.tags

  depends_on = [module.rg]
}
#Sql Modele calling
module "sql" {
  source = "../../modules/sql"

  rg_name  = module.rg.rg_name
  location = var.location
  sql_map  = var.sql_map

  depends_on = [module.rg]
}

#keyvault module calling
module "keyvault" {
  source = "../../modules/keyvault"

  rg_name   = module.rg.rg_name
  location  = var.location
  tenant_id = var.tenant_id
  kv_map    = var.kv_map

  depends_on = [module.rg]
}

#Basian module calling
module "bastion" {
  source = "../../modules/bastion"

  rg_name  = module.rg.rg_name
  location = var.location

  bastion_map = {
    bastion1 = {
      subnet_id = module.vnet.subnet_ids["AzureBastionSubnet"]
    }
  }

  depends_on = [module.vnet]
}

#Loadbalancer module calling
module "Loadbalancer" {
  source = "../../modules/Loadbalancer"

  rg_name  = module.rg.rg_name
  location = var.location

  lb_map = {
    lb1 = {
      subnet_id = module.vnet.subnet_ids["subnet3"]
    }
  }

  depends_on = [module.vnet]
}

# Application Gateway
module "appgw" {
  source = "../../modules/appgw"

  rg_name  = module.rg.rg_name
  location = var.location

  appgw_map = {
    appgw1 = {
      subnet_id = module.vnet.subnet_ids["AppGatewaySubnet"]
    }
  }

  depends_on = [module.vnet]
}

# VMSS
module "vmss" {
  source = "../../modules/vmss"

  rg_name        = module.rg.rg_name
  location       = var.location
  admin_username = var.admin_username
  admin_password = var.admin_password

  subnet_ids = module.vnet.subnet_ids
  vmss_map   = var.vmss_map

  #tags = var.tags

  depends_on = [module.vnet]
}