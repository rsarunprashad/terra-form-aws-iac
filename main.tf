provider "aws" {
    region= "us-east-1"  
}





resource "aws_volume_attachment" "ec2_ebs_type1" {
    device_name = "/dev/ebs1"
    instance_id = "aws_instance.tf_instance1.id"
    volume_id = "aws_ebs_volume.ebs_east1b_type1.id"

  
}