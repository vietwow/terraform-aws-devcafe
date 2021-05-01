## VPC INPUTS

variable "name" {
  description = "The project name"
  type        = string
  default     = "nashtech"
}

variable "cidr_block" {
  description = "The CIDR block for the VPC"
  type        = string
}

variable "enable_dns_hostnames" {
  description = "A boolean flag to enable/disable DNS hostnames in the VPC"
  type        = bool
  default     = true
}

variable "enable_dns_support" {
  description = "A boolean flag to enable/disable DNS support in the VPC"
  type        = bool
  default     = true
}

variable "public_subnets" {
  description = "A list of public subnets inside the VPC"
  type        = list(string)
}

variable "private_subnets" {
  description = "A list of private subnets inside the VPC"
  type        = list(string)
}

## TAGGING INPUT

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}
