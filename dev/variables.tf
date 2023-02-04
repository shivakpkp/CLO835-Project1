variable "aws_vpc_name" {
  default     = "nonprod"
  type        = string
  description = "assignment-1"
}

variable "cidr_block" {
  default     = "10.1.0.0/16"
  type        = string
  description = "cider block"
}

variable "cidr_subnet_block" {
  type = string
  default = "10.1.1.0/24"
}

variable "igw_name" {
  default = "igw"
  type    = string
}

variable "vmprefix" {
    type = string
    default = "webapp-key"
}

variable "region" {
  type = string
  default = "us-east-1"
}


variable "ecr_name" {
  type = list
  default = ["webapp","mysql"]
}
