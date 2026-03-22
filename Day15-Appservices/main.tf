import {
  to = azurerm_app_service_source_control_slot.scm2
  id = "/subscriptions/a8eab392-b3a3-4e19-9a87-43eabe325240/resourceGroups/Day15-rg/providers/Microsoft.Web/sites/Day15webapp/slots/Day15slot1"
}

variable "prefix" {
  default = "Day15"
  type    = string
}

resource "azurerm_resource_group" "rg" {
  name     = "${var.prefix}-rg"
  location = "CanadaCentral"
}

resource "azurerm_service_plan" "asp" {
  name                = "${var.prefix}asp"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  sku_name            = "S1"
  os_type             = "Linux"
}

resource "azurerm_linux_web_app" "webapp" {
  name                = "${var.prefix}webapp"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  service_plan_id     = azurerm_service_plan.asp.id

  site_config {
    application_stack {
      dotnet_version = "10.0"
    }
  }
}

resource "azurerm_linux_web_app_slot" "appslot1" {
  name           = "${var.prefix}slot1"
  app_service_id = azurerm_linux_web_app.webapp.id


  site_config {
    application_stack {
      dotnet_version = "10.0"
    }
    always_on = true
  }
}

resource "azurerm_app_service_source_control_slot" "scm" {
  slot_id  = azurerm_linux_web_app_slot.appslot1.id
  repo_url = "https://github.com/surenderbangaru91/awesome-terraform"
  branch   = "master"
}

resource "azurerm_app_service_source_control_slot" "scm2" {
  slot_id  = azurerm_linux_web_app_slot.appslot1.id
  repo_url = "https://github.com/surenderbangaru91/awesome-terraform"
  branch   = "appServiceSlot_Working_DO_NOT_MERGE"
}

resource "azurerm_web_app_active_slot" "activeslot" {
  slot_id = azurerm_linux_web_app_slot.appslot1.id
}
