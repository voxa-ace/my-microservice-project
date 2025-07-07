variable "cluster_name" {
  type        = string
  description = "EKS cluster name"
}

variable "subnet_ids" {
  type        = list(string)
  description = "List of subnet IDs for the EKS cluster"
}
