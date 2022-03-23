output "instance_private_ip" {
    value = aws_instance.tf_instance1.private_ip
    description = "Private IP address of created instance"
}