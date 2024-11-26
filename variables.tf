#
# Victoria Metrics Variables
#

variable "helm_release_name" {
  description = "The name of the Helm release."
  type        = string
  default     = "victoria-metrics-logs"
}

variable "namespace_name" {
  description = "The namespace where the Helm release will be installed."
  type        = string
  default     = "victoria-system"
}

variable "helm_chart_version" {
  description = "The version of the ingress-nginx Helm chart."
  type        = string
  default     = "0.5.2"
}

#
# Contextual Fields
#

variable "context" {
  description = <<-EOF
Receive contextual information. When Walrus deploys, Walrus will inject specific contextual information into this field.

Examples:
```
context:
  project:
    name: string
    id: string
  environment:
    name: string
    id: string
  resource:
    name: string
    id: string
```
EOF
  type        = map(any)
  default     = {}
}