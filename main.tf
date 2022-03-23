provider "aws" {
    region= "us-east-1"  
}

resource "aws_instance" "tf_instance1" {
    ami = var.instance_small_ami
    instance_type = var.instance_small
    tags = {
      "Name" = "tf_instance1"
      "env" = "dev_test"
    }
  
}
/*

resource "aws_ebs_volume" "ebs_east1b_type1" {
    size = 25
    availability_zone = "us-east-1b"
  
}

resource "aws_volume_attachment" "ec2_ebs_type1" {
    device_name = "/dev/ebs1"t
    instance_id = "aws_instance.tf_instance1.id"
    volume_id = "aws_ebs_volume.ebs_east1b_type1.id"

  
}

*/

module "tf_s3bucket" {

    source = "./module-s3/"
    
  
}