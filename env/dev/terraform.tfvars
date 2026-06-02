rg_name  = "dev-rg-01"
location = "eastus"

storage_map = {
  sa1 = { name = "projectstg12345" }
  sa2 = { name = "devstorageacct002xyz" }
}

tags = {
  environment = "dev"
  project     = "terraform-demo"
}

vnet_name = "dev-vnet-01"

address_space = ["10.0.0.0/16"]

subnets = {
  AzureBastionSubnet = "10.0.1.0/27"
  AppGatewaySubnet   = "10.0.2.0/27"
  subnet3            = "10.0.3.0/24"
  subnet4            = "10.0.4.0/24"
}

sql_map = {
  sql1 = {
    name     = "devsqlserver01xyz"
    admin    = "sqladminuser"
    password = "StrongPassword@123"
    db_name  = "devdb1"
  }
}

tenant_id = "96899f98-d43b-481f-9217-dd347668081f"

kv_map = {
  kv1 = { name = "devkv01xyz" }
}

admin_username = "azureuser"
admin_password = "StrongPassword@123!"

vmss_map = {
  vmss1 = {
    subnet    = "subnet4"
    instances = 2
  }
}