variable "cidr" {
  type = list
  default = ["10.0.1.0/24","10.0.2.0/24"]
}

variable "az" {
  type = list
  default = ["us-west-1a","us-west-1c"]
}

variable "prefix" {
  type    = string
  default = "terraform-to-setup-aws-env"

}