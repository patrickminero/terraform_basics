variable "region" {
  default = "us-east-1"
}

variable "image_id" {
  type    = string
  default = "ami-0dfcb1ef8550277af"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "availability_zones" {
  type = list(string)
  default = [
    "us-east-1a",
    "us-east-1c",
  ]
}
