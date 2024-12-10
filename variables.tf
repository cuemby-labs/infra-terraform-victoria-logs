#
# Victoria Metrics Variables
#

variable "release_name" {
  description = "The name of the Helm release."
  type        = string
  default     = "victoria-logs-single"
}

variable "namespace_name" {
  description = "The namespace where the Helm release will be installed."
  type        = string
  default     = "victoria-system"
}

variable "chart_version" {
  description = "The version of the victoria-logs-single Helm chart."
  type        = string
  default     = "0.8.11"
}

variable "victoria_logs_image" {
  description = "The victoria logs image version."
  type        = string
  default     = "v0.15.0-victorialogs"
}

variable "resources" {
  description = "Resource limits and requests for the Helm release."
  type        = map(map(string))

  default = {
    limits = {
      cpu    = "500m"
      memory = "512Mi"
    }
    requests = {
      cpu    = "250m"
      memory = "256Mi"
    }
  }
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