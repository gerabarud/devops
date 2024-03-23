# Ejemplo de automatización Terraform + AWS

## Fuente

https://www.youtube.com/watch?v=kmC45yFMQr0

https://github.com/caosbinario/webinar-terraform

## Instalar AWS y conectar 

//TODO

## Definir Variables

```json
####### Variables #######

variable "ami_id" {
  description = "ID de la AMI para la instancia EC2"
  default     = "ami-0440d3b780d96b29d"
}

variable "instance_type" {
  description = "Tipo de instancia EC2"
  default     = "t3.micro"
}

variable "server_name" {
  description = "Nombre del servidor web"
  default     = "nginx-server"
}

variable "environment" {
  description = "Ambiente de la aplicación"
  default     = "test"
}
```

## Definir provider

```hcl

####### provider #######

provider "aws" {
  region = "us-east-1"
}
```

## Definir instancia EC2
```hcl

####### resources #######

resource "aws_instance" "nginx-server" {
  ami           = var.ami_id
  instance_type = var.instance_type

  user_data = <<-EOF
              #!/bin/bash
              sudo yum install -y nginx
              sudo systemctl enable nginx
              sudo systemctl start nginx
              EOF

  key_name = aws_key_pair.nginx-server-ssh.key_name
  
  vpc_security_group_ids = [
	aws_security_group.nginx-server-sg.id
  ]

  tags = {
    Name        = var.server_name
    Environment = var.environment
    Owner       = "ariel.molina@caosbinario.com"
    Team        = "DevOps"
    Project     = "webinar"
  }
}
```

## Copiar SSH public key

```hcl
####### ssh ####### 
# ssh-keygen -t rsa -b 2048 -f "nginx-server.key"

resource "aws_key_pair" "nginx-server-ssh" {
  key_name   = "${var.server_name}-ssh"
  public_key = file("~/.ssh/id_rsa.pub")

  tags = {
    Name        = "${var.server_name}-ssh"
    Environment = "${var.environment}"
    Owner       = "ariel.molina@caosbinario.com"
    Team        = "DevOps"
    Project     = "webinar"
  }
}
```

## Configurar firewall con `securty group`

```hcl
####### SG ####### 
resource "aws_security_group" "nginx-server-sg" {
  name        = "${var.server_name}-sg"
  description = "Security group allowing SSH and HTTP access"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "${var.server_name}-sg"
    Environment = "${var.environment}"
    Owner       = "ariel.molina@caosbinario.com"
    Team        = "DevOps"
    Project     = "webinar"
  }
}
```

## Definir outputs

```hcl
#######  output ####### 
output "server_public_ip" {
  description = "Dirección IP pública de la instancia EC2"
  value       = aws_instance.nginx-server.public_ip
}

output "server_public_dns" {
  description = "DNS público de la instancia EC2"
  value       = aws_instance.nginx-server.public_dns
}
```

## Definir `terraform.tfvars` 
es un archivo utilizado para definir variables que serán utilizadas en el/los archivos de configuración principal (generalmente con la extensión .tf). 

```ini
ami_id          = "ami-0440d3b780d96b29d"
instance_type   = "t3.medium"
server_name     = "nginx-server"
environment     = "dev"
```

## Estructurar proyecto para modularizar

Definir la sigueinte estructura de archivos con lo definido anteriormente:

```bash
├── main.tf
├── nginx_server_module
│   ├── 00.variables.tf
│   ├── 01.provider.tf
│   ├── 02.ec2.tf
│   ├── 03.key.tf
│   ├── 04.sg.tf
│   ├── 99.outputs.tf
```

### Definir `main.tf`

```hcl
####### tfstate #######

terraform {
  backend "s3" {
    bucket         = "webinar-terraform-caosbinario-123asd123ad123asd"
    key            = "webinar-terraform/terraform.tfstate"
    region         = "us-east-1"
  }
}

####### modulos #######
module "nginx_server_dev" {
    source = "./nginx_server_module"

    ami_id           = "ami-0440d3b780d96b29d"
    instance_type    = "t3.medium"
    server_name      = "nginx-server-dev"
    environment      = "dev"
}

module "nginx_server_qa" {
    source = "./nginx_server_module"

    ami_id           = "ami-0440d3b780d96b29d"
    instance_type    = "t3.small"
    server_name      = "nginx-server-qa"
    environment      = "qa"
}

#######  output ####### 
output "nginx_dev_ip" {
  description = "Dirección IP pública de la instancia EC2"
  value       = module.nginx_server_dev.server_public_ip
}

output "nginx_dev_dns" {
  description = "DNS público de la instancia EC2"
  value       = module.nginx_server_dev.server_public_dns
}

output "nginx_qa_ip" {
  description = "Dirección IP pública de la instancia EC2"
  value       = module.nginx_server_qa.server_public_ip
}

output "nginx_qa_dns" {
  description = "DNS público de la instancia EC2"
  value       = module.nginx_server_qa.server_public_dns
}

##### Import

# aws_instance.server-web:
resource "aws_instance" "server-web" {
    ami                                  = "ami-0440d3b780d96b29d"
    instance_type                        = "t2.medium"
    tags = {
        Name        = "server-web"
        Environment = "test"
        Owner       = "ariel.molina@caosbinario.com"
        Team        = "DevOps"
        Project     = "webinar"
    }
    vpc_security_group_ids               = [
        "sg-0d5b0d5e416f094c1",
    ]
}
```

### Iniciar proyecto

```bash
terraform init
```

### Verificar plan

```bash
terraform plan
```

### Aplicar

```bash
terraform apply
```