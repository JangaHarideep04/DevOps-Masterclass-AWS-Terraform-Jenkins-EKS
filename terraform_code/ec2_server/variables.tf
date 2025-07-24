variable "ami" {
  description = "Ubuntu AMI ID"
  default     = "ami-0c7217cdde317cfec"
}

variable "instance_type" {
  default = "t2.medium"
}

variable "key_name" {
  default = "your-key-name"
}

variable "volume_size" {
  default = 30
}

variable "server_name" {
  default = "Jenkins-Server"
}

variable "region_name" {
  default = "us-east-1"
}
