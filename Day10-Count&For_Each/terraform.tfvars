environment          = "Production"
resource_group_name  = "terraform-rg"
location             = "Canada Central"
virtual_network_name = "SBI-VNET"
//storage_account        = "tfstg0099"
//storage_container_name = "content"
network_interface    = "web-vm"
ip_config            = "testconfiguration1"
virtual_machine_name = "dev-web"
disk_size_gb         = "80"
is_os_disk_delete    = true

storage_account = {

  stg1 = {
    storage_account_name = "devstg001demo1"
    container_name       = "data"
    blob_name            = "AzureDevops.txt"
    blob_source          = "I:\\Terraform\\Day10-Count&For_Each\\AzureDevops.txt"
  }

  stg2 = {
    storage_account_name = "devstg001demo2"
    container_name       = "file"
    blob_name            = "file1.txt"
    blob_source          = "I:\\Terraform\\Day10-Count&For_Each\\file.txt"
  }

  stg3 = {
    storage_account_name = "devstg001demo3"
    container_name       = "logs"
    blob_name            = "logs.txt"
    blob_source          = "I:\\Terraform\\Day10-Count&For_Each\\file.txt"
  }
}
