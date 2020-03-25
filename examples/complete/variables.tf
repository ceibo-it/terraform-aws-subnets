variable "region" {
  type = string
}

variable "namespace" {
  type        = string
  description = "Namespace (e.g. `cp` or `cloudposse`)"
}

variable "stage" {
  type        = string
  description = "Stage (e.g. `prod`, `dev`, `staging`)"
}

variable "name" {
  type        = string
  description = "Name (e.g. `app`)"
}

variable "cidr_blocks" {
  type        = list(string)
  description = "List of CIDR blocks corresponding with each Availability Zone (e.g. `['10.0.0.0/24', '10.0.1.0/24', '10.0.2.0/24']`)"
}

variable "availability_zones" {
  type        = list(string)
  description = "List of Availability Zones (e.g. `['us-east-1a', 'us-east-1b', 'us-east-1c']`)"
}
