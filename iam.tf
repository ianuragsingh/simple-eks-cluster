locals {
  account_id        = data.aws_caller_identity.current.account_id
  policy_arn_prefix = "arn:${data.aws_partition.current.partition}:iam::aws:policy"
}


#---------------Cluster IAM Role-----------------------

resource "aws_iam_role" "cluster_role" {
  name        = coalesce(var.cluster_iam_role, "{var.cluster_name}-role")
  description = "IAM Role for the EKS Cluster named ${var.cluster_name}"

  assume_role_policy    = data.aws_iam_policy_document.eks_assume_role_policy.json
  permissions_boundary  = var.cluster_iam_boundary
  force_detach_policies = true

  tags = var.tags
}

resource "aws_iam_role_policy_attachment" "cluster_role_policy_attachment" {
  for_each = toset([
    "${local.policy_arn_prefix}/AmazonEKSClusterPolicy",
    "${local.policy_arn_prefix}/AmazonEKSVPCResourceController",
  ])

  policy_arn = each.key
  role       = aws_iam_role.cluster_role.name
}

# Optionally, enable Security Groups for Pods
# Reference: https://docs.aws.amazon.com/eks/latest/userguide/security-groups-for-pods.html

#----------------- Workers IAM Role ---------------

resource "aws_iam_role" "workers_role" {
  name        = coalesce(var.workers_iam_role, "${var.cluster_name}-node-role")
  description = "IAM Role for the workers in EKS Cluster named ${var.cluster_name}"

  assume_role_policy    = data.aws_iam_policy_document.ec2_assume_role_policy.json
  permissions_boundary  = var.workers_iam_boundary
  force_detach_policies = true

  tags = var.tags
}

resource "aws_iam_role_policy_attachment" "workers_role_policy_attachment" {
  for_each = setunion(toset([
    "${local.policy_arn_prefix}/AmazonEKSWorkerNodePolicy",
    "${local.policy_arn_prefix}/AmazonEC2ContainerRegistryReadOnly",
    "${local.policy_arn_prefix}/AmazonSSMManagedInstanceCore",
    "${local.policy_arn_prefix}/AmazonEKS_CNI_Policy",
  ]), var.iam_role_additional_policies)

  policy_arn = each.value
  role       = aws_iam_role.workers_role.name
}

