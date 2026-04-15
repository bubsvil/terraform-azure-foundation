variable "project" {
  type = string
}

variable "environment" {
  type = string
}

variable "location" {
  type    = string
  default = "eastus"
}

variable "tags" {
  type = map(string)
}