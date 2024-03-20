locals {
   region = var.location == "eastus" ? "eus" : "wus"
}

resource "azurerm_storage_container" "container" {
  for_each = local.container_cluster_config
  name                  = "${each.value.container_name}" #"tfs-${var.product}-${terraform.workspace}-${var.client}-${each.key}"
  storage_account_name  =  "ssnast${var.product}${terraform.workspace}${local.region}client"
  metadata = each.value.metadata
}

locals {

    container_cluster_config = {
        config-bucket={

            container_name = "tfs-${terraform.workspace}-${var.product}"
            metadata = { 
                "ci_client" = "${var.client}" 
            }
        },
        audio-landing={

            container_name = "tfs-${terraform.workspace}-${var.product}-${var.client}-audio-landing"
            metadata = {

                "ci_client" = "${var.client}"
                "ci_step" = "landing"
                "ci_media_type" = "audio"
            }
        },
        video-landing={
            container_name = "tfs-${terraform.workspace}-${var.product}-${var.client}-video-landing"
            metadata = {

                "ci_client" = "${var.client}"
                "ci_step" = "landing"
                "ci_media_type" = "video"
            }
        },

        staging={
            container_name = "tfs-${terraform.workspace}-${var.product}-${var.client}-staging"
            metadata = {

                "ci_client" = "${var.client}"
                "ci_step" = "staging"
                
            }
        },
        content={
            container_name = "tfs-${terraform.workspace}-${var.product}-${var.client}-content"
            metadata = {

                "ci_client" = "${var.client}"
                "ci_step" = "content"
                
            }
        }


    }
  
}

