#
# Victoria Metrics Resources
#
resource "kubernetes_namespace" "victoria_logs" {
  metadata {
    name = var.namespace_name
  }
}

resource "helm_release" "victoria_logs" {
  name       = var.helm_release_name
  namespace  = var.namespace_name
  repository = "https://victoriametrics.github.io/helm-charts/"
  chart      = "victoria-logs-single"
  version    = var.helm_chart_version
  values     = [file("${path.module}/values.yaml")]
}

#
# Walrus Information
#

locals {
  context = var.context
}