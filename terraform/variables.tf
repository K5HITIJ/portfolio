variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "production"
}

variable "cluster_name" {
  description = "EKS cluster name"
  type        = string
  default     = "portfolio-cluster"
}

variable "node_instance_types" {
  description = "EC2 instance types for EKS nodes"
  type        = list(string)
  default     = ["t3.medium"]
}

variable "node_desired_capacity" {
  description = "Desired number of nodes"
  type        = number
  default     = 2
}

variable "node_max_capacity" {
  description = "Maximum number of nodes"
  type        = number
  default     = 10
}

variable "node_min_capacity" {
  description = "Minimum number of nodes"
  type        = number
  default     = 1
}

variable "domain_name" {
  description = "Domain name for the application"
  type        = string
  default     = "yourdomain.com"
}

variable "acm_certificate_arn" {
  description = "ACM certificate ARN for HTTPS"
  type        = string
  default     = ""
}
