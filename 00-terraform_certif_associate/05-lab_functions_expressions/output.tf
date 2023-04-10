output "web_url" {
    value = join("",["http://", aws_instance.my_vm.public_ip])

}

output "DateTime" {
    value = timestamp()
  
}