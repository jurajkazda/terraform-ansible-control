# Variable to decide if VM will be created or not
variable "create_vm" {
  description = "Boolean to decide if VM will be created or not"
  type        = bool
  default     = true
}

# Variables for OCI resources
variable "compartment_ocid" {
  description = "OCID of the compartment"
  type        = string
}

variable "subnet_ocid" {
  description = "OCID of the subnet"
  type        = string
}

variable "availability_domain" {
  description = "Availability domain"
  type        = string
}

variable "image_ocid" {
  description = "OCID of the Oracle Linux 8 image"
  type        = string
}

variable "instance_name" {
  description = "Instance display name"
  type        = string
}

variable "ansible_tags" {
  type        = list(string)
  description = "What tags to run"
  default     = []
}