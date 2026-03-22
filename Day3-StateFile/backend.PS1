# Variables
$ResourceGroupName = "tfstatebck-rg"
$StorageAccountName = "aztfstate001299"
$ContainerName = "tfstate"
$Location = "Canada Central"

# Login to Azure (if not already logged in)
az login

# Create Resource Group
az group create --name $ResourceGroupName --location "$Location"

# Create Storage Account
az storage account create --resource-group $ResourceGroupName --name $StorageAccountName --sku Standard_LRS --encryption-services blob

# Get Storage Account Key
$StorageKey = (az storage account keys list --resource-group $ResourceGroupName --account-name $StorageAccountName --query "[0].value" -o tsv)

# Create Blob Container
az storage container create --name $ContainerName --account-name $StorageAccountName --account-key $StorageKey