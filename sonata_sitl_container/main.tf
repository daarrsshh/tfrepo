module "client_container_cluster" {
    source = "../modules/container_cluster"
    client = "sonata"
    location = "eastus"
    product = "cca"

  
}