module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  version         = "17.1.0"
  cluster_version = "1.20"
  # insert the 9 required variables here
  cluster_name              = "eks-module-cluster"
  subnets                   = ["subnet-0d9ebf05cf410ab7b", "subnet-09ae7fe5ff4f1de9b", "subnet-0e2c31f5f8c67b7a1"]
  vpc_id                    = "vpc-0c270506c25b85b0f"
  cluster_enabled_log_types = ["api", "audit"]
  cluster_iam_role_name     = "eks-module-cluster-role"
  map_users                 = var.map_users
  node_groups = [
    {
      name = "sample_node"
      instance_types = ["t2.micro"]
      max_capacity = 1
      disk_size = 8
    }
  ]
}