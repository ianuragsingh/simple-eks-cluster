#------------------- EKS Cluster configuration -----------------

resource "aws_eks_cluster" "this" {
  name       = var.cluster_name
  role_arn   = aws_iam_role.cluster_role.arn

  vpc_config {
    subnet_ids = var.subnet_ids
  }
    
  depends_on = [
    aws_iam_role_policy_attachment.cluster_role_policy_attachment
  ]
}

