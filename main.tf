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
  name       = var.helm_release_name
  namespace  = var.namespace_name
  repository = "https://victoriametrics.github.io/helm-charts/"
  chart      = "victoria-logs-single"
  version    = var.helm_chart_version
  values     = [file("${path.module}/values.yaml")]

    depends_on = [kubernetes_namespace.victoria_system]
}

#
# Walrus Information
#

locals {
  context = var.context
}