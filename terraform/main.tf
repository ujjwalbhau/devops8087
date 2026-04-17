provider "azurerm" {
  features {
    
  }
}

resource "azurerm_resource_group" "rg" {
  name     = "webapp-rg"
  location = "Central India"
}

resource "azurerm_service_plan" "plan" {
  name  = "devops"
  location = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  os_type = "Linux"
  sku_name = "S1"
  
}

resource "azurerm_linux_web_app" "app" {
  name = "devops8087"
  location = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  service_plan_id = azurerm_service_plan.plan.id
 

  site_config {
    always_on = true
    websockets_enabled = true
    
    application_stack {
      node_version = "18-lts"
    }
   app_command_line = ""
  }

  app_settings = {
    "ENV" = "production"
    "SCM_DO_BUILD_DURING_DEPLOYMENT" = "false"
    "WEBSITE_RUN_FROM_PACKAGE" = "0"
    
  }
  
}


# resource "azurerm_linux_web_app_slot" "staging" {
#   name = "staging"
#   app_service_id = azurerm_linux_web_app.app.id

#   site_config {
#     application_stack {
#       node_version = "18-lts"
#     }
#   }
#   app_settings = {
#     "ENV" = "staging"
#   }

# }

