## Using Terraform CLI Commands (workspace and state) to Manipulate a Terraform Deployment

* Clone Terraform Code and Switch to the Proper Directory
```
ls -la
git clone https://github.com/linuxacademy/content-hashicorp-certified-terraform-associate-foundations.git
cd content-hashicorp-certified-terraform-associate-foundations/section4-lesson3
```

* Create a New Workspace

```
ls -la
cat main.tf
cat network.tf
terraform workspace list
terraform workspace new dev
terraform workspace list
```

* Deploy Infrastructure in the Test Workspace and Confirm Deployment via the AWS Management Console

```
terraform init
terraform validate
terraform apply --auto-approve
terraform state list
# new ressource been deployed in us-east-1 region
# new dir created terraform.tfstate.d contains dev space terraform.tfstate file
```

* Deploy Infrastructure in the Default Workspace and Confirm Deployment via AWS Management Console
```
terraform workspace select default
terraform state list 
# nothing displayed
terraform init
terraform validate
terraform apply --auto-approve
# the default terraform.tfstate been created
terraform state list
# new ressource deployed in us-east-1 region
```

* Destroy Resources in the Workspaces and Delete the Test Workspace
```
terraform workspace select dev
terraform destroy --auto-approve
```