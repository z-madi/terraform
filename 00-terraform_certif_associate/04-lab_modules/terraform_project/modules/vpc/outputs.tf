output "subnet_id" {
  value = aws_subnet.my_subnet.id
}

output "my_ami_id" {
  value = data.aws_ssm_parameter.this.value
}