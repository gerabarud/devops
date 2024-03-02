GUÍA CERTIFICACIÓN AWS + SORTEO 
https://www.youtube.com/watch?v=f5uGX-pJuVw


## AWS Technical Essentials
https://explore.skillbuilder.aws/learn/course/1851

### AWS Global Infrastructure

- **Regions:** Las regiones son ubicaciones geográficas de todo el mundo donde AWS aloja sus centros de datos. 

Consideraciones en la elección de una Región: 
    - Latencia
    - Precio
    - Disponibilidad del Servicio
    - Conformidad de los datos (políticas)

- **Zonas de disponibilidad (AZs):** Dentro de cada región hay un clúster de zonas de disponibilidad (AZ). Una AZ consiste en uno o más centros de datos con alimentación, redes y conectividad redundantes. Estos centros de datos operan en instalaciones discretas de ubicaciones no reveladas. Se conectan mediante enlaces redundantes de alta velocidad y baja latencia.

- **Edge Locations (cache):** In addition to regions and availability zones, AWS has a global network of edge locations. Edge locations are smaller data centers that are distributed around the world to bring content closer to end-users. These locations are used by AWS services like Amazon CloudFront (a content delivery network) to cache and deliver content with low latency.

- **Global Network:** AWS has built a global network infrastructure called AWS Global Accelerator, which helps improve the performance and availability of applications. It uses the AWS global network backbone to route traffic from end-users to the closest AWS edge location or directly to the application hosted in an AWS region.

- **Services Availability:** While most AWS services are available across all regions, some services might have specific regional limitations or be initially launched in specific regions before expanding to others. 

### Interactuando con AWS

- AWS Management Console
- AWS CLI: https://aws.amazon.com/cli/
- AWS SDKs: https://aws.amazon.com/developer/tools/ (python)

### Seguridad y modelo de responsabilidad compartida de AWS

**Responsabilidad de AWS**

AWS es responsable de la seguridad de la nube. Esto significa que AWS proporciona seguridad y protección a la infraestructura que ejecuta los servicios ofrecidos en la nube de AWS.

**Responsabilidad del cliente**

Los clientes son responsables de la seguridad en la nube. Al utilizar cualquier servicio de AWS, es responsable de configurar correctamente el servicio y las aplicaciones, además de garantizar que sus datos estén seguros.

### Protección del usuario root de AWS

**Autenticación**

La autenticación garantiza que el usuario sea quien dice ser.

**Autorización**

La autorización es el proceso por el cual se concede a los usuarios el permiso para acceder a los recursos y servicios de AWS.

**Usuario raíz de AWS**

Cuando crea una cuenta de AWS por primera vez, comienza con una identidad de inicio de sesión único que tiene acceso total a todos los servicios y recursos de AWS en la cuenta. Esta identidad recibe el nombre de “usuario raíz de AWS”.

**Credenciales de usuario raíz de AWS**

El usuario raíz de AWS tiene dos conjuntos de credenciales asociados. Un conjunto de credenciales es la dirección de correo electrónico y la contraseña que se utilizan para crear la cuenta. Esto le permite acceder a la consola de administración de AWS. El segundo conjunto de credenciales se denomina “claves de acceso” y le permite realizar solicitudes programáticas desde AWS Command Line Interface (AWS CLI) o la API de AWS.

#### Prácticas recomendadas al trabajar con el usuario raíz de AWS

- Elegir una contraseña segura para el usuario raíz
- No compartir la contraseña de usuario raíz ni las claves de acceso con nadie
- Desactivar o eliminar las claves de acceso asociadas al usuario raíz
- No utilizar el usuario raíz para las tareas administrativas o las tareas cotidianas

#### Autenticación multifactor (MFA)**

MFA requiere dos o más métodos de autenticación para verificar una identidad. 

**MFA en AWS**

La habilitación de MFA en la cuenta de usuario raíz de AWS es una práctica recomendada de AWS.

### AWS IAM (Identity and Access Management)

**IAM**

AWS Identity and Access Management (IAM) es un servicio de AWS que lo ayuda a administrar el acceso a sus recursos y cuenta de AWS. También proporciona una vista centralizada de quién y qué está permitido en la cuenta de AWS (autenticación), y quién y qué tiene permisos para utilizar y trabajar con sus recursos de AWS (autorización).

**Características de IAM**

- IAM es global y no es específica de ninguna región. 
- IAM se integra en muchos servicios de AWS de forma predeterminada.
- Puede establecer políticas de contraseñas en IAM
- IAM admite MFA.
- IAM admite la identidad federada, que permite a los usuarios que ya tienen contraseñas en otro lugar obtener acceso temporal a su cuenta de AWS.
- El servicio se ofrece sin cargo adicional.

**Usuario de IAM**

Un usuario de IAM representa a la persona o el servicio que interactúa con AWS. 

**Credenciales de usuario de IAM**

Un usuario de IAM consta de un nombre y un conjunto de credenciales. Al crear un usuario, puede proporcionarle los siguientes tipos de acceso:

- Acceso a la consola de administración de AWS
- Acceso programático a AWS Command Line Interface (AWS CLI) y a la interfaz de programación de la aplicación de AWS (API de AWS)

**Grupos de IAM**

Un grupo de IAM es una colección de usuarios. Todos los usuarios del grupo heredan los permisos asignados al grupo. 

**Políticas de IAM**

Para administrar el acceso y proporcionar permisos a los servicios y recursos de AWS, crea políticas de IAM y las adjunta a los usuarios, grupos y roles de IAM.

En el ejemplo siguiente, se proporciona acceso de administrador a través de una política basada en la identidad de IAM.

```json
{
"Version": "2012-10-17",
"Statement": [{
"Effect": "Allow",
"Action": "*",
"Resource": "*"
}]
}
```

- El elemento Version (Versión) define la versión del lenguaje de la política. Especifica las reglas de sintaxis del lenguaje que AWS necesita para procesar una política. Para utilizar todas las características de política disponibles, incluya "Version": "2012-10-17" antes del elemento "Statement" de sus políticas.
- El elemento Effect (Efecto) especifica si la instrucción permite o deniega el acceso. 
- El elemento Action (Acción) describe el tipo de acción que se debe permitir o denegar. 
- El elemento Resource (Recurso) especifica el objeto o los objetos que cubre la instrucción de política. 

En este ejempplo ws lo que llamamos “política de administrador”.

En el siguiente ejemplo, se muestra una política de IAM más pormenorizada.

```json
{
"Version": "2012-10-17",
"Statement": [{
"Effect": "Allow",
"Action": [
"iam: ChangePassword",
"iam: GetUser"
]
"Resource": "arn:aws:iam::123456789012:user/${aws:username}"
}]
}
```

Esta política permite al usuario de IAM cambiar su propia contraseña de IAM (iam:ChangePassword) y obtener información sobre su propio usuario (iam:GetUser). Solo permite al usuario acceder a sus propias credenciales porque el recurso restringe el acceso con la sustitución de variables ${aws:username}.

### Roles

1. **IAM Roles (Identity and Access Management)**: Estos roles son utilizados para delegar permisos a entidades dentro o fuera de tu cuenta de AWS. Por ejemplo, puedes crear un IAM Role para permitir que una instancia de EC2 acceda a determinados recursos de S3 sin necesidad de utilizar credenciales de acceso permanentes.

2. **EC2 Instance Roles**: Estos roles están diseñados específicamente para las instancias de EC2 y permiten que las aplicaciones que se ejecutan en esas instancias accedan a otros servicios de AWS de manera segura, sin necesidad de utilizar credenciales de seguridad almacenadas en la instancia.

3. **Service Roles**: Estos roles son utilizados por los servicios de AWS para acceder a otros recursos dentro de tu cuenta de AWS. Por ejemplo, cuando configuras un bucket de S3 para hospedar un sitio web estático, puedes asignar un rol de servicio a ese bucket para que tenga acceso a los permisos necesarios para servir el contenido web.

4. **Cross-Account Roles**: Estos roles permiten a una entidad en una cuenta de AWS (llamada "cuenta principal") delegar acceso a otra cuenta de AWS (llamada "cuenta secundaria"). Esto es útil cuando necesitas que una aplicación o servicio en una cuenta acceda a recursos en otra cuenta de AWS.

5. **AWS Organizations Roles**: En el contexto de AWS Organizations, los roles se utilizan para delegar permisos de administración a las cuentas miembro dentro de una organización de AWS.

6. **Custom Roles**: Además de los roles predefinidos mencionados anteriormente, puedes crear roles personalizados según las necesidades específicas de tu aplicación o entorno en AWS.



EC2
-> Instances
-> Load Balancers
-> AutoScaling Groups

VPCs
-> Connectivity
-> Routing
-> Gateways
-> Subnetting

S3 Storage

IAM
-> Users
-> Groups
-> Policies
-> Roles

DATABASES
-> RDS
-> Aurora
-> Dynamodb

LAMBDA
-> Creating Serverless Scripts
