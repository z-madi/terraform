## Practicing Terraform CLI Commands (fmt, taint, and import)

* Clone Terraform Code and Switch to the Proper Directory
```
ls -la
git clone https://github.com/linuxacademy/content-hashicorp-certified-terraform-associate-foundations.git
cd content-hashicorp-certified-terraform-associate-foundations/
cd section4-hol1/
```

* Use the 'fmt' Command to Format Any Unformatted Code Before Deployment
```
cat main.tf
cat setup.tf
terraform fmt
cat main.tf
terraform init
terraform apply --auto-approve
```

* Use the 'taint' Command to Replace a Resource

```
vi main.tf 
curl http://54.166.230.5  
# <h1><center>My Website via Terraform Version 1</center></h1>
terraform state list
terraform taint aws_instance.webserver
# Resource instance aws_instance.webserver has been marked as tainted.
terraform apply --auto-approve
curl http://184.72.198.177
# <h1><center>My Website via Terraform Version 2</center></h1>
```

* Use the 'import' Command to Import a Resource
```
vi main.tf
cat ../../resource_ids.txt
terraform import aws_instace.web_server2 i-014eada8f5032e5f8
# syntax => terraform import palceholder resource_real_id
vi main.tf
terraform import aws_instance.web_server2 i-014eada8f5032e5f8
cat main.tf
terraform state list
terraform state show aws_instance.web_server2
# display the code of the imported resource find below
vi main.tf
terraform apply --auto-approve
```

```
resource "aws_instance" "web_server2" {
    ami                                  = "ami-01d3ae06c56012dcd"
    arn                                  = "arn:aws:ec2:us-east-1:530351599659:instance/i-014eada8f5032e5f8"
    associate_public_ip_address          = true
    availability_zone                    = "us-east-1a"
    cpu_core_count                       = 1
    cpu_threads_per_core                 = 1
    disable_api_stop                     = false
    disable_api_termination              = false
    ebs_optimized                        = false
    get_password_data                    = false
    hibernation                          = false
    id                                   = "i-014eada8f5032e5f8"
    instance_initiated_shutdown_behavior = "stop"
    instance_state                       = "running"
    instance_type                        = "t2.micro"
    ipv6_address_count                   = 0
    ipv6_addresses                       = []
    monitoring                           = false
    placement_partition_number           = 0
    primary_network_interface_id         = "eni-08e36cadd45c34418"
    private_dns                          = "ip-10-0-1-245.ec2.internal"
    private_ip                           = "10.0.1.245"
    public_dns                           = "ec2-18-234-246-82.compute-1.amazonaws.com"
    public_ip                            = "18.234.246.82"
    secondary_private_ips                = []
    security_groups                      = []
    source_dest_check                    = true
    subnet_id                            = "subnet-04bba07ab2e20c27e"
    tags                                 = {
        "Name"   = "ApacheWebServer1"
        "UserId" = "17320377"
    }
    tags_all                             = {
        "Name"   = "ApacheWebServer1"
        "UserId" = "17320377"
    }
    tenancy                              = "default"
    user_data                            = "c207f5c45119f2182cebf58df8f532963c79661a"
    vpc_security_group_ids               = [
        "sg-0c5df3daa579de07f",
    ]

    capacity_reservation_specification {
        capacity_reservation_preference = "open"
    }

    credit_specification {
        cpu_credits = "standard"
    }

    enclave_options {
        enabled = false
    }

    maintenance_options {
        auto_recovery = "default"
    }

    metadata_options {
        http_endpoint               = "enabled"
        http_put_response_hop_limit = 1
        http_tokens                 = "optional"
        instance_metadata_tags      = "disabled"
    }

    private_dns_name_options {
        enable_resource_name_dns_a_record    = false
        enable_resource_name_dns_aaaa_record = false
        hostname_type                        = "ip-name"
    }

    root_block_device {
        delete_on_termination = true
        device_name           = "/dev/xvda"
        encrypted             = false
        iops                  = 0
        tags                  = {}
        throughput            = 0
        volume_id             = "vol-00729f81eab8c572c"
        volume_size           = 8
        volume_type           = "standard"
    }
}
```
* Modify the Imported Resource
```
terraform apply 
terraform destroy 
```