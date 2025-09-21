output "acr_login_server" {
  description = "El servidor de inicio de sesión del Azure Container Registry."
  value       = azurerm_container_registry.acr.login_server
}

output "acr_admin_username" {
  description = "El nombre de usuario de administrador para el ACR."
  value       = azurerm_container_registry.acr.admin_username
}

output "acr_admin_password" {
  description = "La contraseña de administrador para el ACR. ¡Tratar como secreto!"
  value       = azurerm_container_registry.acr.admin_password
  sensitive   = true # Esto evita que se muestre en los logs de la consola
}

output "resource_group_name" {
  value = azurerm_resource_group.rg.name
}

output "cae_id" {
  value = azurerm_container_app_environment.cae.id
}
