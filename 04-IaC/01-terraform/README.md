# ABOUT TERRAFORM

**What is Terraform?**

Terraform is an infrastructure as code (IaC) tool that allows you to create, manage, and update infrastructure resources such as virtual machines, networks, and storage in a repeatable, scalable, and automated way.

**What is a Resource?**

Resources are the most important element in the Terraform language. Each resource block describes one or more infrastructure objects, such as virtual networks, compute instances, or higher-level components such as DNS records. Resource Blocks documents the syntax for declaring resources.

**What is Provider?**

A provider is a plugin that terraform used to create and manage resources from a specific provider.

**Whats is State file in terraform?**

State file stores information about your infrastructure .State is useful to keep information of why and how infrastructure is created at first place.

State is a blueprint of real world infrastructure with some unique id and attributes

The state file not only records what resources have been deployed but also what resources have dependencies on each other. This should prevent the deletion of resources where there are dependencies that have not been deleted.

**What is Desired and Current State?**

In Terraform, the desired state represents the configuration of infrastructure resources that you want to achieve, as defined in your Terraform configuration files

On the other hand, the current state represents the actual state of the infrastructure resources that you have created or managed using Terraform. The current state is stored in the Terraform state file, which is a JSON-formatted file that tracks the status and attributes of all the resources managed by Terraform.

When you run terraform apply, Terraform will compare the desired state with the current state and make changes to the infrastructure to bring it in line with the desired state.


# Instalation

```bash
wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg — dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo “deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main” | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update && sudo apt install terraform
```
## Basics commands

**terraform init:** Initialize a new or existing Terraform working directory. Will download and install any required providers and modules specified in your configuration files

```bash
terraform init
```

**terraform init -upgrade:** Will check for any outdated or missing providers and modules specified in your configuration files, and download and install the latest versions of these providers and modules. 

```bash
terraform init -upgrade
```

**terraform plan:** Examine your configuration files and create a detailed execution plan that shows what changes will be made to your infrastructure. 

```bash
terraform plan
```

**terraform apply:** Apply the changes defined in your configuration files to your infrastructure.

```bash
terraform apply
```

**terraform validate:** is a command used in Terraform to validate the syntax and configuration of your Terraform files. 

```bash
terraform validate
```

**terraform fmt:** Used to automatically format your configuration files in a standard and consistent style. This command is used to ensure that your configuration files are easy to read and maintain, and follow best practices for Terraform configuration.

```bash
terraform fmt
```

**terraform destroy:** Remove all the resources that were created by a Terraform configuration. It is the opposite of the terraform apply command

```bash
terraform destroy
```

## Terraform and Docker

