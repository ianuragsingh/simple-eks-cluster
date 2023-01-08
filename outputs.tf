#--------------- Outputs --------------

output "cluster_name" {
  description = "Name of the cluster."
  value       = aws_eks_cluster.this.id
}

output "cluster_arn" {
  description = "EKS Cluster ARN"
  value       = aws_eks_cluster.this.arn
}

output "cluster_host" {
  description = "Endpoint for EKS API server."
  value       = aws_eks_cluster.this.endpoint

}

output "cluster_certificate_authority_data" {
  description = "Base64 encoded certificate data required to communicate with the cluster"
  value       = try(aws_eks_cluster.this.certificate_authority.0.data, null)
}

output "identity" {
  description = "Attribute block containing identity provider information for your cluster"
  value       = aws_eks_cluster.this.identity
}

output "vpc_id" {
  description = "ID of the VPC associated with your cluster"
  value       = aws_eks_cluster.this.vpc_config.0.vpc_id
}

output "cluster_security_group_id" {
  description = "Cluster security group that was created by Amazon EKS for the cluster"
  value       = aws_eks_cluster.this.vpc_config.0.cluster_security_group_id
}


