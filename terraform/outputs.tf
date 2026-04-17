output "app_url" {
  value = "https://${azurerm_linux_web_app.app.default_hostname}"
}
output "staging_url" {
  value = "https://${azurerm_linux_web_app.app.default_hostname}/?slot=staging"
}