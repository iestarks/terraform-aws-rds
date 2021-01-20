
variable "vpcname" {
  description = "Name to be used on all the resources as identifier"
  type        = string
  default     = "bankus_east-1-vpc"
}


variable "create" {
  description = "Whether to create this resource or not?"
  type        = bool
  default     = true
}

variable "name_prefix" {
  description = "Creates a unique name beginning with the specified prefix"
  type        = string
}

variable "identifier" {
  description = "The identifier of the resource"
  type        = string

}



variable "tags" {
  description = "A mapping of tags to assign to the resource"
  type        = map(string)
  default     = {}
}

# variable "subnet_ids" {
#   description = "A list of VPC subnet IDs"
#   type        = list(string)
#   default     = ["subnet-072f9a82b6c55846c","subnet-02a62a99a28e2215c"]
# }
