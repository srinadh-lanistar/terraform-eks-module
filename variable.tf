variable "map_users" {
  description = "Additional IAM users to add to the aws-auth configmap."
  type = list(object({
    userarn  = string
    username = string
    groups   = list(string)
  }))

  default = [
    {
      userarn  = "arn:aws:sts::571075478230:assumed-role/OrganizationAccountAccessRole"
      username = "OrganizationAccountAccessRole"
      groups   = ["system:masters"]
    },
    {
      userarn  = "arn:aws:iam::571075478230:user/srinadh"
      username = "srinadh"
      groups   = ["system:masters"]
    }
  ]
}