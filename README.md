# Azure Infrastructure as Code Solution

## Objective
The purpose of this project is to demonstrate proficiency in designing and provisioning Azure infrastructure using Terraform. The solution is structured to be secure, extensible, and maintainable, following best practices for Infrastructure as Code (IaC).

## Assumptions
- The solution assumes that the API and frontend applications are containerized and can be deployed using Azure App Service.
- A third-party API requires a secure private key for access, which is stored in Azure Key Vault.
- The infrastructure needs to be deployed across three environments: Development (`dev`), Quality Assurance (`qa`), and Production (`prod`).

## Architectural Design
The solution consists of the following components:
1. **Azure Key Vault**: Used to securely store secrets, such as the API private key.
2. **Azure Cosmos DB**: A globally distributed NoSQL database for data storage.
3. **Azure App Service**: Hosting the .NET 6 API and React frontend applications.
4. **Environment Isolation**: Each environment (dev, qa, prod) is isolated with its own resource group and configuration settings.

### Infrastructure Diagram
An architecture diagram will be provided separately (or can be described if diagrams are not included).

## Code Structure
The project is structured as follows:

```
azure-app-infrastructure/
├── README.md
├── variables.tf             # Centralized variable definitions
├── environments
│   ├── dev
│   │   ├── dev.tfvars       # Variables specific to the dev environment
│   │   └── main.tf          # References to reusable modules
│   ├── qa
│   │   ├── qa.tfvars        # Variables specific to the qa environment
│   │   └── main.tf          # References to reusable modules
│   └── prod
│       ├── prod.tfvars      # Variables specific to the prod environment
│       └── main.tf          # References to reusable modules
└── modules
    ├── app_service
    │   └── main.tf          # Reusable configuration for Azure App Service
    ├── cosmosdb
    │   └── main.tf          # Reusable configuration for Azure Cosmos DB
    └── keyvault
        └── main.tf          # Reusable configuration for Azure Key Vault
```

## Security Considerations
- **Secrets Management**: All sensitive information, such as the API private key, is stored in Azure Key Vault and accessed securely.
- **Access Control**: Resource access is managed using Azure role-based access control (RBAC).
- **CI/CD Pipeline Security**: The API private key is securely stored as a GitHub Secret and injected into the workflow only when needed.

## CI/CD Workflow
The project uses GitHub Actions for automating the deployment of infrastructure. The workflow includes:
1. **Code Checkout**: Retrieves the code from the repository.
2. **Security Scanning**: Uses tools like Trivy and Terrascan to scan for vulnerabilities and Terraform misconfigurations.
3. **Terraform Commands**: Executes `terraform init`, `terraform plan`, and `terraform apply` to deploy the infrastructure.

## Deployment Instructions
### Prerequisites
- Azure subscription with sufficient permissions.
- Terraform installed on your local machine.
- GitHub account with access to create secrets.

### Steps to Deploy
1. **Clone the Repository**
   ```bash
   git clone https://github.com/MAHESHSARAI/azure-app-infrastructure.git
   cd azure-app-infrastructure
   ```

2. **Configure Environment Variables**
   - Set up your `dev.tfvars`, `qa.tfvars`, and `prod.tfvars` files with the appropriate values.
   - Ensure sensitive values like `api_private_key` are managed securely using GitHub Secrets.

3. **Run Terraform Commands**
   - Initialize Terraform
     ```bash
     terraform init
     ```
   - Plan the Deployment
     ```bash
     terraform plan -var-file="environments/dev/dev.tfvars"
     ```
   - Apply the Deployment
     ```bash
     terraform apply -var-file="environments/dev/dev.tfvars"
     ```
