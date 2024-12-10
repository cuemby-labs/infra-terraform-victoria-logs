#
# Victoria Metrics Resources
#

# Validar si el namespace ya existe
data "kubernetes_namespace" "victoria_system" {
  metadata {
    name = var.namespace_name
  }
}

# Crear el namespace solo si no existe
resource "kubernetes_namespace" "victoria_system" {
  metadata {
    name = var.namespace_name
  }
  count = length(data.kubernetes_namespace.victoria_system.id) == 0 ? 1 : 0
}

resource "helm_release" "victoria_logs" {
  name       = var.release_name
  namespace  = var.namespace_name
  repository = "https://victoriametrics.github.io/helm-charts/"
  chart      = "victoria-logs-single"
  version    = var.chart_version

  values = [
    templatefile("${path.module}/values.yaml.tpl", {
      victoria_logs_image = var.victoria_logs_image,
      request_memory      = var.resources["requests"]["memory"],
      limits_memory       = var.resources["limits"]["memory"],
      request_cpu         = var.resources["requests"]["cpu"],
      limits_cpu          = var.resources["limits"]["cpu"]
    })
  ]

  depends_on = [kubernetes_namespace.victoria_system]
}

#
# Walrus Information
#

locals {
  context = var.context
}

module "submodule" {
  source = "./modules/submodule"

  message = "Hello, submodule"
}