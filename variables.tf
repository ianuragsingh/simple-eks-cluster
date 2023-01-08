#-------------------- Variables -------------------

variable "cluster_name" {
  description = "Name of the EKS Cluster. Must be between 1-100 characters in length. Must begin with an alphanumeric character, and must only contain alphanumeric characters, dashes and underscores (^[0-9A-Za-z][A-Za-z0-9-_]+$)."
  type        = string
  default     = "simple-eks-cluster"
}

variable "vpc_name" {
  description = "Name of VPC where cluster will be created on"
  type        = string
  default     = "my-vpc"
}

variable "create_vpc" {
  description = "Flag to create vpc, default false"
  type        = bool
  default     = false
}

variable "vpc_cidr" {
  description = "The Cidr of VPC where cluster will be created on, the default value is \"10.0.0.0/16\""
  type        = string
  default     = "10.0.0.0/16"
}

variable "subnet_ids" {
  description = "Subnet ids of cluster resources"
  type        = list(string)
  default     = []
}

variable "desired_size" {
  description = "Desired size of the worker node, the default value is 2"
  type        = number
  default     = 2
}

variable "max_size" {
  description = "Maximum size of the worker node, the default value is 2"
  type        = number
  default     = 2
}

variable "min_size" {
  description = "Minimum size of the worker node, the default value is 1"
  type        = number
  default     = 1
}

variable "instance_types" {
  description = "List of instance types associated with the EKS Node Group. the default vaule is [\"t3.medium\"]. Terraform will only perform drift detection if a configuration value is provided."
  type        = list(string)
  default     = ["t3.medium"]

}

#-------------- Cluster IAM roles -------------

variable "cluster_iam_role" {
  description = "Cluster IAM Role name. If undefined, is the same as the cluster name"
  type        = string
  default     = ""
}

variable "cluster_iam_boundary" {
  description = "IAM boundary for the cluster IAM role, if any"
  type        = string
  default     = null
}

#------------- Workers IAM Role -------------

variable "workers_iam_role" {
  description = "Workers IAM Role name. If undefined, is the same as the cluster name suffixed with 'workers'"
  type        = string
  default     = ""
}

variable "workers_iam_boundary" {
  description = "IAM boundary for the workers IAM role, if any"
  type        = string
  default     = null
}

variable "iam_role_additional_policies" {
  description = "Additional policies to be added to the IAM role"
  type        = set(string)
  default     = []
}

variable "tags" {
  description = "AWS resource tags"
  type        = map(string)
  default     = {}
}
