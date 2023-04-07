## Terraform Lab o1

### Installing Terraform and Working with Terraform Providers

The terraform code deploy 02 SNS services into two diff aws regions using 02 diff providers code section
```tf
provider "aws" {
  alias  = "us-east-1"
  region = "us-east-1"
}

provider "aws" {
  alias  = "us-west-2"
  region = "us-west-2"
}


resource "aws_sns_topic" "topic-us-east" {
  provider = aws.us-east-1
  name     = "topic-us-east"
}

resource "aws_sns_topic" "topic-us-west" {
  provider = aws.us-west-2
  name     = "topic-us-west"
}
```

- Download And Manually Install the Terraform Binary

```bash
uname -a
cat /etc/*release
lscpu
wget -c https://releases.hashicorp.com/terraform/1.4.4/terraform_1.4.4_linux_amd64.zip
unzip terraform_1.4.4_linux_amd64.zip
echo $PATH
ls
mv terraform /usr/local/bin/
sudo mv terraform /usr/local/bin/
ls
terraform --help
```

- Clone Over Code for Terraform Providers
```bash
mkdir providers
cd providers

git clone https://github.com/linuxacademy/content-hashicorp-certified-terraform-associate-foundations/blob/master/section3-hol1/main.tf

```
- Deploy the Code with Terraform Apply

```bash
export TF_LOG=TRACE
echo $TF_LOG
terraform init
terraform plan
terraform fmt
export TF_LOG=
terraform apply --auto-approve
terraform destroy --auto-approve
```