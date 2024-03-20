output "sas_key_map" {
  value = module.eventhub.sas_key
  sensitive = true
}