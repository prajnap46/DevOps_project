provider "aws" {
    region = "us-west-1"
    access_key = ""
    secret_key = ""  
}

resource "aws_instance" "admin" {
    ami = "ami-04f7a54071e74f488"
    instance_type = "t2.medium"
    security_groups =[ "default" ]
    key_name = "GIT"
    root_block_device {
      volume_size = 20
      volume_type = "gp3"
      delete_on_termination = true
    } 
    tags = {
      Name = "Admin-server"
    }
}


output "PublicIP" {
    value = aws_instance.admin.public_ip
}
