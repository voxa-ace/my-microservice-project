# Terraform AWS Infrastructure – Homework 5

## 📁 Project Structure

```
lesson-5/
│
├── main.tf               # Main Terraform file with module calls
├── backend.tf            # Backend configuration (S3 + DynamoDB)
├── outputs.tf            # Root-level outputs
│
├── modules/
│   ├── s3-backend/       # Module for state storage
│   ├── vpc/              # VPC networking module
│   └── ecr/              # ECR repository module
│
└── README.md             # Project documentation
```

---

## 📦 Module Descriptions

### 🔹 `s3-backend/`
- Creates an S3 bucket with versioning enabled for storing Terraform state.
- Creates a DynamoDB table to enable state locking and prevent conflicts.

### 🔹 `vpc/`
- Creates a VPC with 3 public and 3 private subnets.
- Includes an Internet Gateway for public subnets.
- Adds a NAT Gateway and route tables for private subnets.

### 🔹 `ecr/`
- Creates an Elastic Container Registry (ECR) repository.
- Enables image scanning on push.
- Sets basic repository policies.

---

##  Deployment Instructions

###  Initialize Terraform

```bash
terraform init
```

###  Preview Changes

```bash
terraform plan
```

###  Apply Infrastructure

```bash
terraform apply
```

###  Destroy Infrastructure

```bash
terraform destroy
```

---

## ⚠️ Notes

- After running `terraform destroy`, the S3 bucket and DynamoDB table used for the Terraform backend will also be deleted.  
  To deploy again, you'll need to recreate them manually or through `terraform apply` using the backend module.

- To avoid unexpected AWS charges, remember to destroy all resources once the assignment is reviewed.

- All module inputs and outputs are configured in the respective `variables.tf` and `outputs.tf` files.

---

##  Author

**Volodymyr Kashnikov**  
Terraform AWS Modules
