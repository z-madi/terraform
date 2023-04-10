## **Using Terraform Dynamic Blocks and Built-in Functions to Deploy to AWS**

- **Primitive type : string, bool, number, any**
- ```tf
    variable data {
        type = list(any)
        default = ["test", 33, true]
    }
- **Complex types**: 
    - **Collections**: allow multiple values of one primitive type to be grouped together => list, map, set.
    -
    - ```tf
        variable "training" {
            type = list(string)
            default = ["foo","aa","eee"]
        }
    
    - **Structural**: allow multiple values of diff primitive type to be grouped together => object, set, tuple
    - 
    - ```
        variable "instructor" {
            type = object({
                name = string
                age = number
            })
            default ({
                name = "jo"
                age = 33
            })
        }

* **Check Terraform Status**

* **Clone Terraform Code and Switch to Proper Directory**

* **Examine the Code in the Files**

* **Review and Deploy the Terraform Code**

```
terraform init
terraform fmt
terraform validate
terraform plan
terraform apply --auto-approve
```

* **Test Out the Deployment and Clean Up**