# TERRAFORM

## Basics

### Qué es Terraform?

Terraform es una herramienta de infraestructura como código para automatizar y provisionar la infraestructura de manera declarativa.

Características de Terraform:

1. **Declarativo**: Describes el estado deseado de la infraestructura y Terraform se encarga de llevarla a ese estado.

2. **Multiplataforma**

3. **Control de versiones**: Puedes gestionarlo con sistemas de control de versiones como Git.

4. **Planificación de cambios**: Terraform puede generar un plan detallado de los cambios que realizará antes de aplicarlos.

5. **Automatización**: Puede integrarse fácilmente en flujos de trabajo de CI/CD.

*What is a Resource?**

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


## Instalación

```bash
wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg — dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo “deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main” | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update && sudo apt install terraform
```
## Comandos básicos

### `terraform init`
Initialize a new or existing Terraform working directory. Will download and install any required providers and modules specified in your configuration files

```bash
terraform init
```

### `terraform init -upgrade`
Will check for any outdated or missing providers and modules specified in your configuration files, and download and install the latest versions of these providers and modules. 

```bash
terraform init -upgrade
```

### `terraform plan`
Examine your configuration files and create a detailed execution plan that shows what changes will be made to your infrastructure. 

```bash
terraform plan
```

### `terraform apply`
Apply the changes defined in your configuration files to your infrastructure.

```bash
terraform apply
```

### `terraform validate`
is a command used in Terraform to validate the syntax and configuration of your Terraform files. 

```bash
terraform validate
```

### `terraform fmt`
Used to automatically format your configuration files in a standard and consistent style. This command is used to ensure that your configuration files are easy to read and maintain, and follow best practices for Terraform configuration.

```bash
terraform fmt
```

### `terraform destroy`
Remove all the resources that were created by a Terraform configuration. It is the opposite of the terraform apply command

```bash
terraform destroy
```

### `terraform output`
Ejecuta solo los bloques `outpouts` para mostrar las salidas

#### Mostrar todos los outputs definidos
```bash
terraform output
```

#### Mostrar un output específico
```bash
terraform output erver_public_ip
```

## Módulos en terraform

Permiten organizar y reutilizar código de infraestructura de manera modular. Un módulo de Terraform es una colección de archivos `.tf` que representan una pieza reutilizable de infraestructura. 

```hcl
module "ejemplo" {
  source = "./path/to/module"
  
  variable1 = "valor1"
  variable2 = "valor2"
  // ...
}
```

En este ejemplo, estamos llamando a un módulo local ubicado en ./path/to/module y proporcionándole algunos valores de variables específicas.


## Estado

El archivo `terraform.tfstate` es un archivo generado por Terraform que almacena el estado actual de la infraestructura gestionada por Terraform. Este archivo es fundamental para que Terraform pueda mantener un seguimiento de los recursos que ha creado y administrarlos de manera eficiente.

Esta información es utilizada por Terraform para planificar y aplicar cambios de manera precisa y para garantizar que la infraestructura gestionada se mantenga de acuerdo con la configuración definida.

El archivo `terraform.tfstate` es generado automáticamente por Terraform y debe ser tratado con cuidado, ya que es crítico para la gestión de la infraestructura. Algunos puntos importantes a tener en cuenta sobre el archivo `terraform.tfstate` incluyen:

1. **Persistencia**: El archivo `terraform.tfstate` se guarda localmente por defecto en el directorio de trabajo de Terraform. También puede ser almacenado de manera remota, por ejemplo, en un bucket de S3 en AWS o en un servicio de almacenamiento similar, lo que facilita el trabajo en equipo y la gestión de la infraestructura en entornos distribuidos.

2. **Seguridad**: Dado que el archivo `terraform.tfstate` contiene información sensible sobre la infraestructura, como identificadores de recursos y otros datos, debe ser tratado como información confidencial y protegido adecuadamente.

3. **Bloqueo de Estado (State Locking)**: Terraform proporciona la capacidad de bloquear el archivo `terraform.tfstate` para evitar conflictos de concurrencia si múltiples usuarios o procesos intentan modificar la infraestructura al mismo tiempo. Esto es especialmente importante en entornos colaborativos o en equipos grandes donde varias personas podrían estar trabajando en la misma infraestructura.

4. **Gestión de Versiones**: Aunque el archivo `terraform.tfstate` es binario y no está diseñado para ser legible o editado directamente por humanos, se puede utilizar en conjunción con sistemas de control de versiones como Git para mantener un historial de cambios en la infraestructura.

## Import

`terraform import` es un comando en Terraform que te permite importar recursos existentes de infraestructura a tu estado de Terraform. Esto significa que puedes agregar recursos que ya existen en tu proveedor de infraestructura.

```
terraform import [opciones] <nombre_del_recurso> <ID_del_recurso>
```

- `nombre_del_recurso`: Es el nombre del recurso en tu configuración de Terraform al que deseas asociar el recurso importado.
- `ID_del_recurso`: Es el identificador único del recurso en tu proveedor.f0`.

Ejemplo AWS:

```bash
terraform import aws_instance.mi_instancia i-1234567890abcdef0
```

Este comando importará la instancia EC2 con el ID `i-1234567890abcdef0` al estado de Terraform y lo asociará con el recurso `aws_instance.mi_instancia` en tu configuración de Terraform.


## Terraform and Docker

## Automate local DNS with BIND and Terraform

https://www.youtube.com/watch?v=eSUtsDUTzuc&pp=wgIGCgQQAhgB