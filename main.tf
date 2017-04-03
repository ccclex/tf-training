#
# DO NOT DELETE THESE LINES!
#
# Your AMI ID is:
#
#     ami-1a14807a
#
# Your subnet ID is:
#
#     subnet-e0a4cb87
#
# Your security group ID is:
#
#     sg-6313eb18
#
# Your Identity is:
#
#     training-jb-goldfish
#


variable aws_access_key {}
variable aws_secret_key {}
variable aws_region {}
variable num_webs {}

#module "example" {
#  source = "./example-module"
#  command = "hello world, hello world"
#}

provider "aws" {
#  access_key = "AKIAIWAMI4VCTIELD3PA"
#  secret_key = "9muEJnHsPJJVEDU+bK6BPtGEUTOkN1QR9yZ6cPoE"
#  region     = "us-west-2"
   access_key = "${var.aws_access_key}"
   secret_key = "${var.aws_secret_key}"
   region = "${var.aws_region}"
}

resource "aws_instance" "web" {
  count = "${var.num_webs}"
  ami                    = "ami-1a14807a"
  subnet_id              = "subnet-e0a4cb87"
  vpc_security_group_ids = ["sg-6313eb18"]
  instance_type          = "t2.micro"

  tags = {
    Identity = "training", size = "t2.micro", name = "web "
  }
}

output "public_dns" {
  value =  ["${aws_instance.web.*.public_ip}" ]
}
