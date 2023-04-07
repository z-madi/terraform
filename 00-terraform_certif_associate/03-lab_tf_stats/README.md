## Exploring Terraform State Functionality

* Check Terraform and Minikube Status
```
terraform versoion
minikube status
```

* Clone Terraform Code and Switch to the Proper Directory

* Deploy Terraform Code And Observe the State File

```
terraform inti
terraform plan
# new file terraform.tfstate was generated after the plan cmd 
terraform apply --auto-approve
kubectl get pods
terraform state list
terraform state show my -deployement
# edit main.tf replicats from 2 to 4
terraform plan
terraform apply --auto-approve
terraform destroy
# new file terraform.tfstate.backup was generated after the destroy cmd
```

### **Restore from backup**
> To make an old backup state file your new one, all you need do is to move your current one to a different (safe) folder/directory (in case anything goes wrong), then rename the backup file as your new terraform. tfstate file, and run terraform plan again