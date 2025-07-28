# Define config variables
variable "label_prefix" {
  type        = string
  description = "Your college username. This will form the beginning of various resource names."
  default = "mo10serek"
}

variable "region" {
  type        = string
  description = "the location of where the resources are located"
  default = "westus3"
}