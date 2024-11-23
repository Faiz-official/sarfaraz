variable "vpc_cidr" {
  type = string
}

variable "all_subnets" {
  type = list(string)
}

variable "availability_zones" {
  type = list(string)
}

variable "ingress_ports" {
  type = list(number)
}

variable "allowed_cidrs" {
  type = list(string)
}
