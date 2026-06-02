rg_name  = "prod-rg-01"
location = "Central India"

storage_map = {
  sa1 = { name = "prodstgacct001x9k" }
  sa2 = { name = "prodstgacct002x9k" }
}

tags = {
  environment = "prod"
  project     = "terraform-platform"
  owner       = "platform-team"
}

vnet_name = "prod-vnet-01"

address_space = ["10.10.0.0/16"]

subnets = {
  AzureBastionSubnet = "10.10.1.0/27"
  AppGatewaySubnet    = "10.10.2.0/27"
  subnet3             = "10.10.3.0/24"
  subnet4             = "10.10.4.0/24"
}

sql_map = {
  sql1 = {
    name     = "prodsqldb01x9k"
    admin    = "sqladminuser"
    password = "UseStrongPassword@123!"
    db_name  = "proddb"
  }
}

tenant_id = "96899f98-d43b-481f-9217-dd347668081f"

kv_map = {
  kv1 = { name = "prod-kv-01-x9k" }
}

admin_username = "azureuser"
admin_password = "UseStrongPassword@123!"

vmss_map = {
  vmss1 = {
    subnet    = "subnet4"
    instances = 3
  }
}