resource "azurerm_linux_web_app_slot" "staging" {
    name = "staging"
    app_service_id = azurerm_linux_web_app.app.id

    app_settings = {
        "ENV" = "staging"
    }
    site_config {
        application_stack {
            node_version = "18-lts"
        }
    }
}