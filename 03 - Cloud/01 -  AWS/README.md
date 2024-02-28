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
