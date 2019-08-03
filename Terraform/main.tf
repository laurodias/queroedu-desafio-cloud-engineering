provider "aws" {
  region = var.region
}

/* DATA
 > aws_vpc - gets data from vpc in the selected region to create security group
 > template_cloudinit_config - set of instructions to be executed as user_data, during the instance's first boot
*/
data "aws_vpc" "default" {
  default = true
}

data "template_cloudinit_config" "userdata" {
  base64_encode = true

  part {
    content_type = "text/cloud-config"
    content = <<EOF
#cloud-config
---
packages:
  - docker
runcmd:
  - systemctl enable docker
  - systemctl start docker
  - docker run -d --name apachesrv -p 80:80 httpd:latest >/dev/null 2>&1 </dev/null
  - docker exec apachesrv sed -i 's/<\/h1>/<\/h1><br><h2>Lauro Dias (laurodias1@gmail.com)<\/h2>/g' htdocs/index.html
    EOF
  }
}

/* VARIABLES
 > region - region where the instance will be launched
 > ssh_range - cidr to allow ssh access to the instance
 > amis - mapping of ami ids for each region
*/

variable "region" {
  type = "string"
  description = "Allowed values: ap-northeast-1, ap-northeast-2, ap-south-1, ap-southeast-1, ap-southeast-2, ca-central-1, eu-central-1, eu-west-1, eu-west-2, eu-west-3, sa-east-1, us-east-1, us-east-2, eu-north-1, us-west-1, us-west-2"
  default = "us-west-1"
}

variable "ssh_range" {
  type = "string"
  description = "Must be a class C in CIDR format"
  default = "1.1.1.0/24"
}

variable "amis" {
  type = "map"
  default = {
    "ap-northeast-1" = "ami-0c3fd0f5d33134a76"
    "ap-northeast-2" = "ami-095ca789e0549777d"
    "ap-south-1" = "ami-0d2692b6acea72ee6"
    "ap-southeast-1" = "ami-01f7527546b557442"
    "ap-southeast-2" = "ami-0dc96254d5535925f"
    "ca-central-1" = "ami-0d4ae09ec9361d8ac"
    "eu-central-1" = "ami-0cc293023f983ed53"
    "eu-north-1" = "ami-3f36be41"
    "eu-west-1" = "ami-0bbc25e23a7640b9b"
    "eu-west-2" = "ami-0d8e27447ec2c8410"
    "eu-west-3" = "ami-0adcddd3324248c4c"
    "sa-east-1" = "ami-058943e7d9b9cabfb"
    "us-east-1" = "ami-0b898040803850657"
    "us-east-2" = "ami-0d8f6eb4f641ef691"
    "us-west-1" = "ami-056ee704806822732"
    "us-west-2" = "ami-082b5a644766e0e6f"
  }
}

resource "aws_security_group" "queroedu" {
  name = "QueroEdu-SG"
  description = "Allows access to port 80/443 from anywhere and access to SSH from a specific subnet"
  vpc_id = "${data.aws_vpc.default.id}"

  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = [var.ssh_range]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_key_pair" "queroedu" {
  key_name = "queroedu-key"
  public_key = "PUBLIC_SSH_KEY_HERE"
}

resource "aws_instance" "queroedu" {
  ami = "${var.amis[var.region]}"
  instance_type = "t2.micro"
  key_name = "queroedu-key"
  user_data_base64 = "${data.template_cloudinit_config.userdata.rendered}"
  security_groups = ["QueroEdu-SG"]

  tags = {
    Name = "queroedusrv"
  }
}

output "public_ip" {
  value = "${aws_instance.queroedu.public_ip}"
}

output "public_dns" {
  value = "${aws_instance.queroedu.public_dns}"
}
