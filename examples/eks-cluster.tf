module "eks_cluster" {
  source         = "../../"
  vpc_name       = "my-vpc"
  create_vpc     = true
  cluster_name   = "simple-eks-cluster"
  desired_size   = 1
  max_size       = 2
  min_size       = 1
  instance_types = ["t3.medium"]
}
