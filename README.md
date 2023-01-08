## Scope
This module creates a simple EKS cluster with basic requirements as in the [AWS documentation](https://docs.aws.amazon.com/eks/latest/userguide/create-cluster.html) using infrastructure as a code tool [Terraform](https://www.terraform.io/) 


<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.0 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | >= 2.10 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 4.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_vpc"></a> [vpc](#module\_vpc) | terraform-aws-modules/vpc/aws | >3.18.0 |

## Resources

| Name | Type |
|------|------|
| [aws_eks_cluster.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eks_cluster) | resource |
| [aws_eks_node_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eks_node_group) | resource |
| [aws_iam_role.cluster_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role.workers_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.cluster_role_policy_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.workers_role_policy_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_partition.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/partition) | data source |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster_iam_boundary"></a> [cluster\_iam\_boundary](#input\_cluster\_iam\_boundary) | IAM boundary for the cluster IAM role, if any | `string` | `null` | no |
| <a name="input_cluster_iam_role"></a> [cluster\_iam\_role](#input\_cluster\_iam\_role) | Cluster IAM Role name. If undefined, is the same as the cluster name | `string` | `""` | no |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | Name of the EKS Cluster. Must be between 1-100 characters in length. Must begin with an alphanumeric character, and must only contain alphanumeric characters, dashes and underscores (^[0-9A-Za-z][A-Za-z0-9-\_]+$). | `string` | `"simple-eks-cluster"` | no |
| <a name="input_create_vpc"></a> [create\_vpc](#input\_create\_vpc) | Flag to create vpc, default false | `bool` | `false` | no |
| <a name="input_desired_size"></a> [desired\_size](#input\_desired\_size) | Desired size of the worker node, the default value is 2 | `number` | `2` | no |
| <a name="input_iam_role_additional_policies"></a> [iam\_role\_additional\_policies](#input\_iam\_role\_additional\_policies) | Additional policies to be added to the IAM role | `set(string)` | `[]` | no |
| <a name="input_instance_types"></a> [instance\_types](#input\_instance\_types) | List of instance types associated with the EKS Node Group. the default vaule is ["t3.medium"]. Terraform will only perform drift detection if a configuration value is provided. | `list(string)` | <pre>[<br>  "t3.medium"<br>]</pre> | no |
| <a name="input_max_size"></a> [max\_size](#input\_max\_size) | Maximum size of the worker node, the default value is 2 | `number` | `2` | no |
| <a name="input_min_size"></a> [min\_size](#input\_min\_size) | Minimum size of the worker node, the default value is 1 | `number` | `1` | no |
| <a name="input_subnet_ids"></a> [subnet\_ids](#input\_subnet\_ids) | Subnet ids of cluster resources | `bool` | `false` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | AWS resource tags | `map(string)` | `{}` | no |
| <a name="input_vpc_cidr"></a> [vpc\_cidr](#input\_vpc\_cidr) | The Cidr of VPC where cluster will be created on, the default value is "10.0.0.0/16" | `string` | `"10.0.0.0/16"` | no |
| <a name="input_vpc_name"></a> [vpc\_name](#input\_vpc\_name) | Name of VPC where cluster will be created on | `string` | `"my-vpc"` | no |
| <a name="input_workers_iam_boundary"></a> [workers\_iam\_boundary](#input\_workers\_iam\_boundary) | IAM boundary for the workers IAM role, if any | `string` | `null` | no |
| <a name="input_workers_iam_role"></a> [workers\_iam\_role](#input\_workers\_iam\_role) | Workers IAM Role name. If undefined, is the same as the cluster name suffixed with 'workers' | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cert"></a> [cert](#output\_cert) | Certificate authority |
| <a name="output_cluster_arn"></a> [cluster\_arn](#output\_cluster\_arn) | EKS Cluster ARN |
| <a name="output_cluster_host"></a> [cluster\_host](#output\_cluster\_host) | Endpoint for EKS API server. |
| <a name="output_cluster_name"></a> [cluster\_name](#output\_cluster\_name) | Name of the cluster. |
| <a name="output_cluster_security_group_id"></a> [cluster\_security\_group\_id](#output\_cluster\_security\_group\_id) | Cluster security group that was created by Amazon EKS for the cluster. Managed node groups use this security group for control-plane-to-data-plane communication. |
| <a name="output_identity"></a> [identity](#output\_identity) | Attribute block containing identity provider information for your cluster |
| <a name="output_vpc_id"></a> [vpc\_id](#output\_vpc\_id) | ID of the VPC associated with your cluster. |
<!-- END_TF_DOCS -->