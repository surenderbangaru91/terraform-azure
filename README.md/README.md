# Repository
    Terraform-Azure
       This repository is about terraform with azure.

DAY-1: PROVIDER
# Initialize the Provider
    Terraform 
        provider "azurerm"
        version "4.57.0"

# Terraform Version
    version ">=1.13.5"

# Authentication Type
    ServicePrincial

What is Infra as a Code
    Provisioning your infrastructure through code.

# Provider
    It is will create empty repository and it will initialize and download required terraform provider plugins i.e It sends API request to azure based on the provider version.


DAY-2: RESOURCE GROUPS
# Resource Groups
    RG are logical container that groups all the resources in one single container

    Create resource groups using terraform

DAY-3: STORAGE ACCOUNTS
# Storeage Accounts
    Create Storage accounts using terraform
    Create Containers and blob

DAY-4: STATEFILE
# Remote Backend
    Create Storage account for statefile
    Create Remote Backend for Terraform Statefile

# Update the Remote Storage Account Backend
    Update the Remote Backed Details in provider block for locking, securing, statefile.

DAY-5: VARIABLES
# Varibales 
    In Terraform we have different types of variables sucha as Premetive Variables and Non-Premetive Variables. They are type constraints and hold single value

    1. Local : These are internal to terraform
    2. Input : Input variable that can be given to process function
    3. Output: These returns value from function or terraform apply 

    Premitive Variables : String, Number, Boolean

DAY-6: *.TFVARS
# *.TFVARS
    1. Here we can use .tfvars file for refering the declared variables in terraform code.
    2. Variables cannot reference themselves by default values.
    3. .tfvars file provides the value for variables
    4. Resource reference Var.* or local.* is correctly.
    5. Use terraform plan -var-file="*.tfvars" to avoid interactive prompts.

Day-7: Terraform File Structure
# Terraform File Structure
   create and Maintain the TF File Structure to better reabability of code.
   It is the best practice as per industry standards

Day-8: Virtual Network
# Virtual Network

    Create Virtual Network and 2 Subnets
    Attach a NIC using Dynamic allocation

Day-9: Virtual Machine
# Virtual Machine

    Create Virtual Machine and using public ip 

Day-10: Meta-Arguments
# Meta-Arguments

    Count and For_Each
    1. Create Resource Group
    2. Create 3 Storage Accounts
    3. Create 3 Containers
    4. Create 3 Blobs

Day-11: Life Cycle Arguments
# Life Cycle Arguments

    1. Create before changes
    2. Prevent Destroy
    3. Ignore Changes
    4. Replace trigger by
    5. Custom Condition

Day-12: Data Source
# Data Source
    Data source is used to for manually created resources explicitily calling into terraform code and creating resources. 
    Eg: Vnets, Subnets

Day-13: Mini Project
# Mini Project using terraform and deploying resources into azure cloud

Advanced Azure Infrastructure with Terraform - Hands-on Assignment

create a scalable web application infrastructure in Azure using Terraform. The infrastructure will include a Virtual Machine Scale Set (VMSS) behind a load balancer with proper security and scaling configurations.

## Requirments


### Base Infrastructure
 1.   Create a resource group in one of these regions:
       - East US
       - West Europe
       - Southeast Asia 
       Also create the validation rule that restrict other regions

### Networking
 1. Create a VNet with two subnets:
    - Application subnet (for VMSS)
    - Management subnet (for future use)
 2. Configure an NSG that:
    - Only allows traffic from the load balancer to VMSS
    - Uses dynamic blocks for rule configuration
    - Denies all other inbound traffic
    
### Compute
 1. Set up a VMSS with:
    - Ubuntu 20.04 LTS
    - VM sizes with conditions based on environment(hint: use lookup function):
    * Dev: Standard_B1s
    * Stage: Standard_B2s
    * Prod: Standard_B2ms
 2. Configure auto-scaling:
    - Scale in when CPU < 10%
    - Scale out when CPU > 80%
    - Minimum instances: 2
    - Maximum instances: 5

### Load Balancer:
 1. Create an Azure Load Balancer:
    - Public IP
    - Backend pool connected to VMSS
    - Health probe on port 80

### Technical Requirements

### Variables
 1. Create a terraform.tfvars file with:
    - Environment name
    - Region
    - Resource name prefix
    - Instance counts
    Network address spaces


#### Locals
 1. Implement locals block for:
    - Common tags
    - Resource naming convention
    - Network configuration


### Dynamic Blocks
 1. Use dynamic blocks for:
    - NSG rules
    - Load balancer rules

Day14: Virtual Network Peering
# Virtual Network Peering

    Create the Virtual Networks in two different regions
    Create subnet in each vnet
    Create vnet peering accross the regions

Day15: Azure App Service
# Azure App Service

    Create and deploy app service using terraform 
    Deploy dotnet application using Blue Green Deploymet strategy.

Day16:  Azure Funtions
# Azure Functions


