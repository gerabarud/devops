GUÍA CERTIFICACIÓN AWS + SORTEO 
https://www.youtube.com/watch?v=f5uGX-pJuVw


## AWS Technical Essentials
https://explore.skillbuilder.aws/learn/course/1851

## Inrtoducción

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


## Informática como servicio

### Servidores

El primer bloque de creación que necesita para alojar una aplicación es un servidor. Por lo general, los servidores pueden gestionar las solicitudes del Protocolo de transferencia de hipertexto (HTTP) y enviar respuestas a los clientes al adoptar el modelo cliente-servidor, aunque cualquier comunicación basada en la API también se incluye en este modelo. 

Para ejecutar un servidor HTTP en AWS, debe encontrar un servicio que proporcione potencia de cómputo en la consola de administración de AWS. Puede iniciar sesión en la consola y ver la lista completa de servicios de cómputo de AWS.

**Elección de la opción de cómputo adecuada**

Si es responsable de configurar los servidores en AWS para ejecutar su infraestructura, tiene muchas opciones de cómputo. Tiene que saber qué servicio utilizar para un caso de uso determinado. En un nivel fundamental, hay tres tipos de opciones de cómputo disponibles: 

- máquinas virtuales (VM) “Amazon Elastic Compute Cloud” o “Amazon EC2”
- servicios de contenedores 
- modelo sin servidor.

### Amazon EC2

Amazon EC2 es un servicio web que proporciona capacidad de cómputo en la nube segura y de tamaño modificable. Permite aprovisionar servidores virtuales denominados “instancias EC2”.

Para crear una instancia EC2, debe definir lo siguiente:

- Especificaciones de hardware, como CPU, memoria, red y almacenamiento
- Configuraciones lógicas, como ubicación de redes, reglas de firewall, autenticación y el sistema operativo de su elección

**Amazon Machine Image**

En la nube de AWS, la instalación del sistema operativo no es responsabilidad suya. En cambio, está integrado en la AMI que elija.

Además, cuando utiliza una AMI, puede seleccionar mapeos de almacenamiento, el tipo de arquitectura (como 32 bits, 64 bits o ARM de 64 bits) y software adicional instalado.

**Relación entre las AMI y las instancias EC2**

Las instancias EC2 son instancias en directo de lo que se define en una AMI.

Cuando lanza una nueva instancia, AWS asigna una máquina virtual que se ejecuta en un hipervisor. A continuación, la AMI que seleccionó se copia en el volumen de dispositivo raíz, que contiene la imagen utilizada para arrancar el volumen. Al final, obtiene un servidor al que puede conectarse y donde puede instalar paquetes y software adicional. 

Una ventaja de utilizar las AMI es que son reutilizables. Si quiere crear una segunda instancia EC2 con las mismas configuraciones, podría crear una AMI a partir de la instancia en ejecución y utilizar la AMI para iniciar una nueva instancia. 

**Búsqueda de las AMI**

Puede seleccionar una AMI de las siguientes categorías:

- AMI de inicio rápido, creadas por AWS para ayudarlo a comenzar rápidamente
- AMI de AWS Marketplace, que proporcionan software comercial y de código abierto popular de proveedores de terceros
- Mis AMI, que se crean a partir de las instancias EC2
- AMI de la comunidad, proporcionadas por la comunidad de usuarios de AWS
- Una imagen personalizada creada con EC2 Image Builder

### Ciclo de vida de Amazon EC2

**Tipos de instancias de Amazon EC2**

Las instancias de Amazon EC2 son una combinación de procesadores virtuales (vCPU), memoria, red y, en algunos casos, unidades de procesamiento de gráficos (GPU) y almacenamiento de instancias. Cuando crea una instancia EC2, tiene que elegir cuánto necesita de cada uno de estos componentes.

AWS ofrece una variedad de instancias que difieren según el rendimiento. Algunas instancias proporcionan más capacidad que otras. Los tipos de instancias consisten en un prefijo que identifica el tipo de cargas de trabajo para las que están optimizadas, seguido de un tamaño. Por ejemplo, el tipo de instancias c5.large se puede desglosar de la siguiente manera:

- c5 define la familia de instancias y el número de generación. En este caso, la instancia pertenece a la quinta generación de instancias de una familia de instancias optimizada para el cálculo genérico.
- large establece la cantidad de capacidad de la instancia.

**Familias de instancias**

En el ejemplo, c5.large, la primera letra, c, significa “optimizada para cómputo”. Cada familia de instancias está optimizada para adaptarse a diferentes casos de uso. En la siguiente tabla, se describen las familias de instancias y algunas cargas de trabajo típicas.

| Familia de instancias | Descripción | Casos de uso |
| ----------------------- | --------------- |------------- |
| De uso general |	Equilibrio entre recursos de cómputo, memoria y redes |	Escalar horizontalmente cargas de trabajo |
| Optimizadas para cómputo | Cómputo que se benefician de procesadores de alto rendimiento. | Servidores web de alto rendimiento, modelado científico, procesamiento por lotes, análisis distribuidos, informática de alto rendimiento (HPC), machine learning y aprendizaje profundo, publicación de anuncios, juegos multijugador altamente escalables
| Optimizadas para memoria | Rendimiento rápido para las cargas de trabajo que procesan grandes conjuntos de datos en la memoria. | Bases de datos de alto rendimiento, cachés en memoria distribuidas a escala web, bases de datos en memoria de tamaño mediano, análisis de big data en tiempo real.
| Informática acelerada | Utilizan aceleradores de hardware o coprocesadores para realizar funciones, como cálculos de números de coma flotante, procesamiento de gráficos o concordancia de patrones de datos de forma más eficiente que lo posible con las CPU convencionales. | Visualizaciones 3D, uso intensivo de gráficos, renderizado 3D, streaming de aplicaciones, codificación de video.
| Optimizadas para almacenamiento | Gran medida el acceso secuencial de lectura y escritura a grandes conjuntos de datos en el almacenamiento local. | Bases de datos NoSQL, bases de datos en memoria, bases de datos transaccionales de escalado horizontal, almacenamiento de datos, Elasticsearch y análisis. 

**Ubicaciones de instancias EC2**

De forma predeterminada, las instancias EC2 se colocan en una red denominada “Amazon Virtual Private Cloud (Amazon VPC) predeterminada”. Cualquier recurso que coloque en la VPC predeterminada será público y accesible a través de Internet.

Una vez que esté más familiarizado con las redes en AWS, debe cambiar esta configuración predeterminada para elegir sus propias VPC personalizadas y restringir el acceso con mecanismos de enrutamiento y conectividad adicionales.

**Diseño para la alta disponibilidad**

Al diseñar la arquitectura de cualquier aplicación para obtener alta disponibilidad, considere utilizar al menos dos instancias EC2 en dos zonas de disponibilidad independientes.

**Ciclo de vida de la instancia EC2**

Una instancia EC2 cambia entre distintos estados desde el momento en que la crea hasta que se termina.
1. Pending: la facturación no ha comenzado. En esta etapa, la instancia se está preparando para entrar en estado de ejecución. 
2. Ejecutando: está lista para el uso. Esta es también la etapa en la que comienza la facturación.
3. Reinicio: equivalente al reinicio del sistema operativo. La instancia sigue estando en el mismo equipo host y conserva su dirección IP privada y pública, además de los datos en el almacén de instancias.
4. Detención: es posible que la instancia se coloque en un nuevo servidor físico subyacente. Por lo tanto, pierde cualquier dato del almacén de instancias que se encontraba en el equipo host anterior. Cuando detiene una instancia, esta obtiene una nueva dirección IP pública, pero mantiene la misma dirección IP privada.
5. Cuando termina una instancia, se borran los almacenes de instancias, y pierde la dirección IP pública y la dirección IP privada de la máquina. La terminación de una instancia significa que ya no se puede acceder a la máquina.

**Diferencia entre detener y detener-hibernar**

Cuando detiene una instancia, entra en el estado de detención hasta que alcanza el estado detenido. AWS no cobra tarifas de uso o transferencia de datos para su instancia después de detenerla, pero aún se cobra el almacenamiento de cualquier volumen de Amazon EBS. Mientras la instancia se encuentra en estado detenido, puede modificar algunos atributos, como el tipo de instancias. Cuando detiene la instancia, se pierden los datos almacenados en la memoria (RAM).

Cuando detiene-hiberna una instancia, AWS indica al sistema operativo que realice la hibernación (suspensión a disco), con lo cual se guarda el contenido de la memoria de la instancia (RAM) en el volumen raíz de Amazon EBS.

**Precio**

Una de las formas de reducir los costos con Amazon EC2 es elegir la opción de precio adecuada para la ejecución de sus aplicaciones. AWS ofrece tres opciones de compra principales para las instancias EC2: 

- instancias bajo demanda
- reservadas
- de spot.
Image7.png

**Pago por uso con las instancias bajo demanda**

Con las instancias bajo demanda, paga por la capacidad de cómputo sin compromisos a largo plazo. La facturación comienza cuando la instancia se está ejecutando y se detiene cuando la instancia se encuentra en estado detenido o terminado. El precio por segundo de una instancia bajo demanda en ejecución es fijo.

**Capacidad de reserva con las instancias reservadas (RI)**

Las RI le proporcionan un descuento importante en comparación con el precio de las instancias bajo demanda. Las RI ofrecen una tarifa horaria con descuento y una reserva de capacidad opcional para las instancias EC2. Puede elegir entre tres opciones de pago: 
- el pago total anticipado
- el pago inicial parcial 
- sin pago inicial. 

Puede seleccionar un periodo de 1 año o 3 años para cada una de estas opciones.

**Ahorro de costos con las instancias de spot**

Las instancias de spot de Amazon EC2 le permiten aprovechar la capacidad de EC2 sin utilizar en la nube de AWS. Están disponibles hasta con un 90 % de descuento en comparación con los precios bajo demanda.

Con las instancias de spot, establece un límite al pago por la hora de la instancia. Esto se compara con el precio de spot actual que define AWS. Si el monto que paga es superior al precio de spot actual y hay capacidad, recibirá una instancia. Aunque son muy prometedoras desde el punto de vista de la facturación, debe tener en cuenta algunas consideraciones de arquitectura para utilizarlas de manera efectiva.

Una consideración es que la instancia de spot podría interrumpirse. Por ejemplo, si AWS determina que la capacidad ya no está disponible para una instancia de spot concreta o si el precio de spot supera la cantidad que está dispuesto a pagar, AWS le dará una advertencia de 2 minutos antes de interrumpir la instancia.

### Contenedores

Un contenedor es una unidad estandarizada que empaqueta el código y sus dependencias. Este paquete está diseñado para ejecutarse de forma fiable en cualquier plataforma, ya que el contenedor crea su propio entorno independiente. 

**Docker**

Docker es un tiempo de ejecución de contenedores popular que simplifica la administración de toda la pila de sistemas operativos necesaria para el aislamiento de contenedores, incluidas las redes y el almacenamiento. 

**Orquestación de contenedores**

En AWS, los contenedores se ejecutan en instancias EC2. 

Si pretende administrar el cómputo a gran escala, debe saber lo siguiente:

- Cómo colocar los contenedores en las instancias
- Qué sucede si ocurre un error en el contenedor
- Qué sucede si ocurre un error en la instancia
- Cómo monitorear las implementaciones de sus contenedores

Un servicio de orquestación de contenedores gestiona esta coordinación. AWS ofrece dos servicios de orquestación de contenedores: Amazon Elastic Container Service (ECS) y Amazon Elastic Kubernetes Service (EKS).

#### Amazon ECS

**Gestión de contenedores con Amazon Elastic Container Service** 

Amazon ECS es un servicio de orquestación de contenedores integral que lo ayuda a activar nuevos contenedores y administrarlos en un clúster de instancias EC2.

Para ejecutar y administrar los contenedores, tiene que instalar el agente de contenedores de Amazon ECS en las instancias EC2. 

Una vez que las instancias de contenedor de Amazon ECS estén en funcionamiento, puede realizar acciones que incluyen, entre otras, lanzar y detener contenedores, obtener el estado del clúster, reducir y escalar horizontalmente, programar la ubicación de contenedores en el clúster, asignar permisos y cumplir los requisitos de disponibilidad.

Para preparar la aplicación a fin de que se ejecute en Amazon ECS, crea una definición de tarea. La definición de tarea es un archivo de texto en formato JSON que describe uno o más contenedores. 

Esta es una definición de tarea sencilla que puede utilizar para su aplicación de directorio corporativo. En este ejemplo, se ejecuta en el servidor web de Nginx.

```json
{
"family": "webserver",
"containerDefinitions": [ {
"name": "web",
"image": "nginx",
"memory": "100",
"cpu": "99"
} ],
"requiresCompatibilities": [ "FARGATE" ],
"networkMode": "awsvpc",
"memory": "512",
"cpu": "256"
}
```
#### Amazon EKS

**Uso de Kubernetes con Amazon Elastic Kubernetes Service (Amazon EKS)**

Kubernetes es una plataforma portátil, extensible y de código abierto para administrar las cargas de trabajo y los servicios en contenedores. 

Amazon EKS es conceptualmente similar a Amazon ECS, pero con las siguientes diferencias:

- Una instancia EC2 con el agente ECS instalado y configurado se denomina “instancia de contenedor”. En Amazon EKS, se denomina “nodo de empleado”.
- Un contenedor ECS se conoce como “tarea”. En Amazon EKS, se denomina “pod”.
- Mientras que Amazon ECS se ejecuta en tecnología nativa de AWS, Amazon EKS se ejecuta a partir de Kubernetes.

Eliminación de las cargas pesadas sin diferenciar

Si ejecuta el código en Amazon EC2, AWS es responsable del hardware físico, y usted es responsable de los controles lógicos, como el sistema operativo invitado, la seguridad y la aplicación de parches, las redes, la seguridad y el escalado.

Si ejecuta el código en contenedores de Amazon ECS y Amazon EKS, AWS es responsable de una mayor parte de la administración de contenedores, como la implementación de contenedores en las instancias EC2 y la administración del clúster de contenedores. Sin embargo, al ejecutar ECS y EKS en EC2, sigue siendo responsable de mantener las instancias EC2 subyacentes.

Si quiere implementar sus cargas de trabajo y aplicaciones sin tener que administrar ninguna instancia EC2, puede hacerlo en AWS con el cómputo sin servidor.

### Adopción del modelo sin servidor

En cada definición del modelo sin servidor, se mencionan los cuatro aspectos siguientes:

    No hay servidores para aprovisionar o administrar.
    Se escala con el uso.
    Nunca paga por recursos inactivos.
    La disponibilidad y la tolerancia a errores están integradas.

Con el modelo sin servidor, puede dedicar tiempo a los aspectos que diferencian su aplicación, en lugar de dedicarlo a garantizar la disponibilidad, el escalado y la gestión de los servidores.

AWS ofrece varias opciones de informática sin servidor, incluidas AWS Fargate y AWS Lambda.

Exploración de los contenedores sin servidor con AWS Fargate

Amazon ECS y Amazon EKS le permiten ejecutar sus contenedores en los dos modos siguientes:

    Modo Amazon EC2
    Modo AWS Fargate

73.png

AWS Fargate es un motor de informática sin servidor creado específicamente para los contenedores. Fargate escala y administra la infraestructura, lo que permite a los desarrolladores trabajar en lo que mejor hacen: el desarrollo de las aplicaciones. Lo logra al asignar la cantidad correcta de cómputo, eliminar la necesidad de elegir y gestionar las instancias EC2 y la capacidad de clúster, así como por medio del escalado. Fargate es compatible con la arquitectura de Amazon ECS y Amazon EKS, y proporciona aislamiento de la carga de trabajo y seguridad mejorada por diseño.

Fargate abstrae la instancia EC2 para que no tenga que administrarla. Sin embargo, con Fargate puede utilizar los mismos conceptos de ECS, las API y las integraciones de AWS. Se integra de forma nativa en AWS Identity and Access Management (IAM) y Amazon Virtual Private Cloud (VPC). La integración nativa en Amazon VPC le permite lanzar contenedores de Fargate en su red y controlar la conectividad con sus aplicaciones.

Ejecución de código en AWS Lambda

Si quiere implementar sus cargas de trabajo y aplicaciones sin tener que administrar contenedores o instancias EC2, puede utilizar AWS Lambda.

Con AWS Lambda, puede ejecutar código sin aprovisionar ni administrar servidores o contenedores. Puede ejecutar código para prácticamente cualquier tipo de aplicación o servicio de backend, incluidos el procesamiento de datos, el procesamiento de secuencias en tiempo real, machine learning, los WebSockets, los backends de IoT, los backends móviles y las aplicaciones web, como su aplicación de directorio corporativo.

AWS Lambda no requiere gestión por parte del usuario. Tiene que subir el código fuente, y Lambda se encarga de todo lo necesario para ejecutar y escalar el código con alta disponibilidad. No hay servidores que administrar, lo que le proporciona un escalado continuo con medición inferior a un segundo y un rendimiento coherente.

Funcionamiento de AWS Lambda

Una función de Lambda tiene tres componentes principales: el desencadenador, el código y la configuración.
Image19.jpg

El código es código fuente que describe lo que debe ejecutar la función de Lambda. Se puede crear de tres maneras.

    Crea el código desde cero.
    Utiliza un proyecto que proporciona AWS.
    Utiliza algún código de AWS Serverless Application Repository, un recurso que contiene aplicaciones de ejemplo, como código “hola, mundo”, código de muestra de Skill de Amazon Alexa, código de redimensionamiento de imagen, codificación de video y más.

Al crear la función de Lambda, especifica el tiempo de ejecución en el que quiere que se ejecute el código. Puede utilizar los tiempos de ejecución integrados, como Python, Node.js, Ruby, Go, Java o .NET Core, o bien puede implementar las funciones de Lambda para que se ejecuten en un tiempo de ejecución personalizado.

La configuración de una función de Lambda consiste en información que describe cómo debe ejecutarse la función. En la configuración, especifica la ubicación de red, las variables de entorno, la memoria, el tipo de invocación, los conjuntos de permisos y otras configuraciones. Para profundizar en estas configuraciones, consulte la sección de recursos.

Los desencadenadores describen cuándo debe ejecutarse una función de Lambda. Un desencadenador integra la función Lambda en otros servicios de AWS, lo que le permite ejecutar la función de Lambda en respuesta a determinadas llamadas a la API que se producen en la cuenta de AWS. De este modo, aumenta la capacidad de responder a los eventos de la consola sin tener que realizar acciones manuales. Necesita saber qué, cómo y cuándo en relación con una función de Lambda para tener una capacidad de cómputo funcional que se ejecute solo cuando lo necesita.

El director de tecnología de Amazon, Werner Vogels, explica lo siguiente: “No hay un servidor que sea más fácil de administrar que ningún servidor”. En esta cita, se resume lo conveniente que puede ser ejecutar las soluciones sin servidor, como AWS Fargate y AWS Lambda. Más adelante, aplicará toda la información que ha adquirido sobre Amazon EC2, Amazon ECS, Amazon EKS y AWS Fargate a algunos casos de uso de cada servicio.

Controlador de funciones de AWS Lambda

El controlador de funciones de AWS Lambda es el método del código de la función que procesa los eventos. Cuando se invoca una función, Lambda ejecuta el método del controlador. Si sale el controlador o devuelve una respuesta, pasa a estar disponible para gestionar otro evento. 

Puede utilizar la siguiente sintaxis general al crear un controlador de funciones en Python.
def handler_name(event, context):
…
return some_value

Nomenclatura
El nombre del controlador de funciones de Lambda especificado en el momento de crear una función de Lambda deriva de lo siguiente:

    Nombre del archivo en el que se encuentra la función de controlador de Lambda
    Nombre de la función de controlador de Python

Un controlador de funciones puede ser cualquier nombre; sin embargo, el valor predeterminado de la consola de Lambda es lambda_function.lambda_handler. Este nombre refleja el nombre de la función como lambda_handler y el archivo donde se almacena el código del controlador como lambda_function.py. Si elige un nombre diferente para el controlador de funciones en la consola de Lambda, debe actualizar el nombre en el panel Runtime settings (Configuración del tiempo de ejecución).

Pormenorización de la facturación
AWS Lambda le permite ejecutar código sin aprovisionar ni administrar servidores, y solo paga por lo que utiliza. Se le cobra el número de veces que se activa el código (solicitudes) y el tiempo que se ejecuta el código, redondeado a 1 ms más cercano (duración).

AWS redondea la duración al milisegundo más cercano sin tiempo de ejecución mínimo. Con este precio, puede ser rentable ejecutar funciones cuyo tiempo de ejecución es muy bajo, como las funciones con duraciones inferiores a 100 ms o las API de baja latencia. Puede obtener más información en el siguiente enlace: https://aws.amazon.com/blogs/aws/new-for-aws-lambda-1ms-billing-granularity-adds-cost-savings/(opens in a new tab)

Código fuente
A continuación, puede encontrar un tutorial sobre cómo crear la función de AWS Lambda así como el código utilizado en la demostración de AWS Lambda: https://aws.amazon.com/blogs/compute/resize-images-on-the-fly-with-amazon-s3-aws-lambda-and-amazon-api-gateway/