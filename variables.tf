variable "aws_region" {
  description = "AWS region to deploy resources."
  type        = string
}

variable "newrelic_account_id" {
  description = "New Relic account ID."
  type        = string
}

variable "newrelic_account_region" {
  description = "New Relic account region (US or EU)."
  type        = string
  default     = "US"
}

variable "name" {
  description = "A name prefix for all resources."
  type        = string
  default     = "default"
}

variable "integration_mode" {
  description = "Integration mode: PUSH or PULL."
  type        = string
  default     = "PUSH"
}

variable "include_metric_filters" {
  description = "Map of namespaces to metric names to include."
  type        = map(list(string))
  default     = {}
}

variable "exclude_metric_filters" {
  description = "Map of namespaces to metric names to exclude."
  type        = map(list(string))
  default     = {}
}

variable "newrelic_api_key" {
  description = "New Relic User or Ingest API key."
  type        = string
  sensitive   = true
}

variable "newrelic_ingest_license_key" {
  description = "New Relic Ingest License key for Firehose (starts with NRAA- or LICENSE-)."
  type        = string
  sensitive   = true
}
