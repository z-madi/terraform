variable "main_region" {
    type = string
    default = "us-east-1"
}

variable "rules" {
    type = list(object({
        port = number
        prot = string
        cidr_blocks = list(string)
        
    }))

    default = [ 
    {
      cidr_blocks = ["0.0.0.0/0"]
      port = 80
      prot = "tcp"
    },
    {
      cidr_blocks = ["0.0.0.0/0"]
      port = 22
      prot = "tcp"
    } 
    ]
}