<<<<<<< HEAD
# Create IAM role for the EKS cluster
resource "aws_iam_role" "eks_cluster" {
  name = "${var.cluster_name}-eks-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action    = "sts:AssumeRole"
        Effect    = "Allow"
=======
# IAM-роль для EKS-кластера
resource "aws_iam_role" "eks" {
  # Ім'я IAM-ролі для кластера EKS
  name = "${var.cluster_name}-eks-cluster"
  # Політика, яка дозволяє сервісу EKS «асумувати» цю IAM-роль
  assume_role_policy = jsonencode({
    Version   = "2012-10-17"
    Statement = [
      {
        Effect    = "Allow"
        Action    = "sts:AssumeRole"
>>>>>>> eb91a6e (Add full code for lesson-8-9)
        Principal = {
          Service = "eks.amazonaws.com"
        }
      }
    ]
  })
}
<<<<<<< HEAD

# Attach AmazonEKSClusterPolicy to the IAM role
resource "aws_iam_role_policy_attachment" "eks_cluster_policy" {
=======
# Прив'язка IAM-ролі до політики AmazonEKSClusterPolicy
resource "aws_iam_role_policy_attachment" "eks" {
  # ARN політики, що надає дозволи для EKS-кластера
>>>>>>> eb91a6e (Add full code for lesson-8-9)
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  # IAM-роль, до якої прив'язується політика
  role = aws_iam_role.eks.name
}
<<<<<<< HEAD

# Create IAM role for worker nodes
resource "aws_iam_role" "eks_node_group" {
  name = "${var.cluster_name}-node-group-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })
}

# Attach managed policies to the node IAM role
resource "aws_iam_role_policy_attachment" "worker_node_AmazonEKSWorkerNodePolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
  role       = aws_iam_role.eks_node_group.name
}

resource "aws_iam_role_policy_attachment" "worker_node_AmazonEC2ContainerRegistryReadOnly" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  role       = aws_iam_role.eks_node_group.name
}

resource "aws_iam_role_policy_attachment" "worker_node_AmazonEKS_CNI_Policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
  role       = aws_iam_role.eks_node_group.name
}

# EKS Cluster
resource "aws_eks_cluster" "this" {
  name     = var.cluster_name
  role_arn = aws_iam_role.eks_cluster.arn
  version  = "1.32"

  vpc_config {
    subnet_ids = var.subnet_ids
  }

  depends_on = [
    aws_iam_role_policy_attachment.eks_cluster_policy
  ]
}

# EKS Node Group
resource "aws_eks_node_group" "this" {
  cluster_name    = aws_eks_cluster.this.name
  node_group_name = "${var.cluster_name}-ng"
  node_role_arn   = aws_iam_role.eks_node_group.arn
  subnet_ids      = var.subnet_ids

  scaling_config {
    desired_size = 2
    max_size     = 3
    min_size     = 1
  }

  ami_type       = "AL2_x86_64"
  instance_types = ["t3.micro"]

  depends_on = [
    aws_iam_role_policy_attachment.worker_node_AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.worker_node_AmazonEC2ContainerRegistryReadOnly,
    aws_iam_role_policy_attachment.worker_node_AmazonEKS_CNI_Policy
  ]
}
=======
# Створення EKS-кластера
resource "aws_eks_cluster" "eks" {
  # Назва кластера
  name = var.cluster_name
  # ARN IAM-ролі, яка потрібна для керування кластером
  role_arn = aws_iam_role.eks.arn
  # Налаштування мережі (VPC)
  vpc_config {
    endpoint_private_access = true                # Включає приватний доступ до API-сервера
    endpoint_public_access  = true                # Включає публічний доступ до API-сервера
    subnet_ids              = var.subnet_ids      # Список підмереж, де буде працювати EKS
  }
  # Налаштування доступу до EKS-кластера
  access_config {
    authentication_mode                         = "API"  # Автентифікація через API
    bootstrap_cluster_creator_admin_permissions = true   # Надає адміністративні права користувачу, який створив кластер
  }
  # Залежність від IAM-політики для ролі EKS
  depends_on = [aws_iam_role_policy_attachment.eks]
}
>>>>>>> eb91a6e (Add full code for lesson-8-9)
