Write a custom module for multiple virtual machines deployment with the same configuration. 
variable "instance_count" {
  type        = number
  default     = 2
  description = "Number of instances to create"
}

variable "instance_type" {
  type        = string
  default     = "t3.micro"
  description = "Instance type for the instances"
}

variable "ami_id" {
  type        = string
  default     = "ami-0c94855ba95c71c99"
  description = "AMI ID to use for the instances"
}

resource "aws_instance" "my_vm" {
  count         = var.instance_count
  instance_type = var.instance_type
  ami           = var.ami_id

  network_interface {
    device_index = 0
    subnet_id    = aws_subnet.my_subnet.id
    security_groups = [
      aws_security_group.my_security_group.id,
    ]
  }

  tags = {
    Name = "My VM ${count.index}"
  }
}

