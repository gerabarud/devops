- [Networking en Linux](#networking-en-linux)
  - [`dig`:  información detallada sobre registros DNS.](#dig--información-detallada-sobre-registros-dns)
  - [`ifcongif`: configurar y mostrar la configuración de las interfaces de red](#ifcongif-configurar-y-mostrar-la-configuración-de-las-interfaces-de-red)
    - [Casos de Uso](#casos-de-uso)
    - [Ejemplos Prácticos](#ejemplos-prácticos)
  - [`ip`: administrar y mostrar la configuración de red](#ip-administrar-y-mostrar-la-configuración-de-red)
    - [Opciones Comunes:](#opciones-comunes)
    - [Casos de Uso:](#casos-de-uso-1)
    - [TTL: Time To Live](#ttl-time-to-live)
      - [En el Comando `ping`](#en-el-comando-ping)
      - [Interpretación del TTL](#interpretación-del-ttl)
      - [Configuración Inicial de TTL](#configuración-inicial-de-ttl)
      - [Ejemplo de Uso del Comando `ping` con TTL](#ejemplo-de-uso-del-comando-ping-con-ttl)
      - [Consideraciones Adicionales](#consideraciones-adicionales)
  - [`iptable`: filtrado de paquetes y administración de firewall](#iptable-filtrado-de-paquetes-y-administración-de-firewall)
    - [Ejemplos](#ejemplos)
  - [`netcat`: permite leer y escribir datos a través de conexiones de red utilizando el protocolo TCP o UDP](#netcat-permite-leer-y-escribir-datos-a-través-de-conexiones-de-red-utilizando-el-protocolo-tcp-o-udp)
    - [Sintaxis Básica](#sintaxis-básica)
    - [Opciones Comunes](#opciones-comunes-1)
    - [Ejemplos de Uso](#ejemplos-de-uso)
    - [Casos de Uso](#casos-de-uso-2)
  - [`netstat`: información sobre las conexiones de red, tablas de enrutamiento, interfaces de red y estadísticas de protocolos](#netstat-información-sobre-las-conexiones-de-red-tablas-de-enrutamiento-interfaces-de-red-y-estadísticas-de-protocolos)
    - [Sintaxis Básica](#sintaxis-básica-1)
    - [Opciones Comunes](#opciones-comunes-2)
    - [Ejemplos de Uso](#ejemplos-de-uso-1)
    - [Ejemplo de Salida](#ejemplo-de-salida)
    - [Interpretación de la Salida](#interpretación-de-la-salida)
    - [Casos de Uso](#casos-de-uso-3)
  - [`nmcli`: gestionar y configurar conexiones de red](#nmcli-gestionar-y-configurar-conexiones-de-red)
    - [Opciones Comunes:](#opciones-comunes-3)
    - [Casos de Uso:](#casos-de-uso-4)
  - [`nmap`: escaneo de red](#nmap-escaneo-de-red)
    - [Opciones Comunes](#opciones-comunes-4)
    - [Casos de Uso](#casos-de-uso-5)
  - [`nslookup`: info de servidore DNS](#nslookup-info-de-servidore-dns)
  - [`ping`: envía un `ICMP ECHO_REQUEST` y espera un `ICMP ECHO_REPLY`](#ping-envía-un-icmp-echo_request-y-espera-un-icmp-echo_reply)
    - [Opciones Comunes:](#opciones-comunes-5)
    - [Casos de Uso:](#casos-de-uso-6)
  - [`route`: mostrar y manipular la tabla de enrutamiento IP](#route-mostrar-y-manipular-la-tabla-de-enrutamiento-ip)
    - [Opciones Comunes](#opciones-comunes-6)
    - [Casos de Uso](#casos-de-uso-7)
    - [Ejemplos Prácticos](#ejemplos-prácticos-1)
  - [`ss`: información detallada sobre las conexiones de red, sockets, y estadísticas de protocolos](#ss-información-detallada-sobre-las-conexiones-de-red-sockets-y-estadísticas-de-protocolos)
    - [Sintaxis Básica](#sintaxis-básica-2)
    - [Opciones Comunes](#opciones-comunes-7)
    - [Ejemplos de Uso](#ejemplos-de-uso-2)
    - [Casos de Uso](#casos-de-uso-8)
  - [`tcpdump`: capturar y analizar el tráfico de red en un sistema](#tcpdump-capturar-y-analizar-el-tráfico-de-red-en-un-sistema)
    - [Sintaxis Básica](#sintaxis-básica-3)
    - [Opciones Comunes](#opciones-comunes-8)
    - [Ejemplos de Uso](#ejemplos-de-uso-3)
    - [Casos de Uso](#casos-de-uso-9)
  - [`telnet`: probar conectividad y accesibilidad a un servicio en un puerto](#telnet-probar-conectividad-y-accesibilidad-a-un-servicio-en-un-puerto)
    - [Opciones Comunes:](#opciones-comunes-9)
    - [Casos de Uso:](#casos-de-uso-10)
  - [`tracepath`: rastrear la ruta que toman los paquetes a través de una red](#tracepath-rastrear-la-ruta-que-toman-los-paquetes-a-través-de-una-red)
    - [Sintaxis Básica](#sintaxis-básica-4)
    - [Opciones Comunes](#opciones-comunes-10)
    - [Ejemplos de Uso](#ejemplos-de-uso-4)
  - [`traceroute`: rastear rutas que toman los paquetes IP](#traceroute-rastear-rutas-que-toman-los-paquetes-ip)
    - [Opciones Comunes:](#opciones-comunes-11)
    - [Casos de Uso:](#casos-de-uso-11)

# Networking en Linux

## `dig`:  información detallada sobre registros DNS.

Used to retrieve DNS-related information such as domain names, IP addresses, DNS records, and more. 

**Basic Usage:**
```bash
dig [options] domain_name
```

**Common Options and Use Cases:**

1. **Query for a Domain's IP Address (A Record):**
   ```bash
   dig example.com
   ```

2. **Query for a Specific Type of DNS Record:**
   ```bash
   dig -t record_type domain_name
   ```
   > Replace `record_type` with the specific DNS record type you want to query, such as A, AAAA, MX, TXT, CNAME, etc. For example:
   ```bash
   dig -t AAAA example.com
   ```

3. **Query a Specific DNS Server:**
   ```bash
   dig @dns_server_ip domain_name
   ```
   > This command specifies a DNS server by its IP address to use for the query. For example:
   ```bash
   dig @8.8.8.8 example.com
   ```

4. **Query a Domain's Authoritative Name Servers:**
   ```bash
   dig +nssearch domain_name
   ```

5. **Reverse DNS Lookup (PTR Record):**
   ```bash
   dig -x IP_address
   ```
   > This command performs a reverse DNS lookup to find the domain name associated with an IP address.

6. **Query for DNSSEC Information:**
   ```bash
   dig +dnssec domain_name
   ```
   > This command retrieves DNSSEC (Domain Name System Security Extensions) information for the specified domain.

7. **Show Detailed Query Information:**
   ```bash
   dig +trace domain_name
   ```
   This command traces the DNS query process and displays detailed information about each step.

8. **Display Short Answer Format:**
   ```bash
   dig +short domain_name
   ```
9. **Specify a Non-Standard DNS Port:**
   ```bash
   dig -p port_number domain_name
   ```

## `ifcongif`: configurar y mostrar la configuración de las interfaces de red 

Configurar y mostrar la configuración de las interfaces de red. Aunque ha sido reemplazada en gran medida por el comando `ip` del paquete `iproute2` en muchas distribuciones modernas, sigue siendo útil y ampliamente utilizado en algunos entornos.

### Casos de Uso

1. **Mostrar configuración de todas las interfaces de red**:
```bash
ifconfig
```

2. **Mostrar configuración de una interfaz específica**:
```bash
ifconfig <interface>
```

3. **Activar una interfaz de red**:
```bash
sudo ifconfig <interface> up
```

4. **Desactivar una interfaz de red**:
```bash
sudo ifconfig <interface> down
```

5. **Asignar una dirección IP a una interfaz de red**:
```bash
sudo ifconfig <interface> <IP address>
```

6. **Asignar una máscara de subred a una interfaz de red**:
```bash
sudo ifconfig <interface> netmask <netmask>
```

7. **Asignar una dirección de broadcast a una interfaz de red**:
```bash
sudo ifconfig <interface> broadcast <broadcast address>
```

### Ejemplos Prácticos

1. **Configurar una interfaz con una dirección IP, máscara de subred y dirección de broadcast**:
   Configurar la interfaz `eth0` con la dirección IP `192.168.1.100`, la máscara de subred `255.255.255.0` y la dirección de broadcast `192.168.1.255`:
```bash
sudo ifconfig eth0 192.168.1.100 netmask 255.255.255.0 broadcast 192.168.1.255
```

2. **Configurar una interfaz para obtener una dirección IP automáticamente (DHCP)**:
   Aunque `ifconfig` no se usa normalmente para configurar DHCP (se utiliza `dhclient` o `dhcpcd`), puede desactivar y activar una interfaz para reiniciar la configuración de red, lo que a veces provoca una nueva solicitud DHCP:
```bash
sudo ifconfig eth0 down
sudo ifconfig eth0 up
```

3. **Verificar el estado de todas las interfaces de red**:
   Este comando muestra información sobre todas las interfaces de red, incluyendo el estado, la dirección IP, la máscara de subred y más:
```bash
ifconfig -a
```

## `ip`: administrar y mostrar la configuración de red

Administrar y mostrar la configuración de red en sistemas Linux. 

### Opciones Comunes:

1. `address`: Administrar direcciones IP y subredes.
2. `link`: Administrar interfaces de red.
3. `route`: Administrar tablas de enrutamiento.
4. `netns`: Administrar espacios de nombres de red.
5. `rule`: Administrar reglas de política de enrutamiento.
6. `neighbor`: Mostrar y manipular la tabla ARP.
7. `maddress`: Administrar direcciones multicast.
8. `mroute`: Administrar tablas de enrutamiento multicast.
9. `monitor`: Monitorizar eventos de cambio de configuración de red.

### Casos de Uso:

**Mostrar Información de Interfaces de Red**:
```bash
ip addr show
```

**Mostrar Tabla de Enrutamiento**:
```bash
ip route show
```

**Agregar una Dirección IP a una Interfaz de Red**:
```bash
ip addr add 192.168.1.10/24 dev eth0
```

**Eliminar una Dirección IP de una Interfaz de Red**:
```bash
ip addr del 192.168.1.10/24 dev eth0
```

**Activar una Interfaz de Red**:
```bash
ip link set eth0 up
```

**Desactivar una Interfaz de Red**:
```bash
ip link set eth0 down
```

**Agregar una Ruta Estática**:
```bash
ip route add 192.168.2.0/24 via 192.168.1.1 dev eth0
```

**Eliminar una Ruta Estática**:
```bash
ip route del 192.168.2.0/24 via 192.168.1.1 dev eth0
```

**Crear un Espacio de Nombres de Red**:
```bash
ip netns add mynamespace
```

**Mostrar Vecinos ARP**:
```bash
ip neighbor show
```

**Mostrar Estadísticas de una Interfaz de Red Específica**:
```bash
ip -s link show eth0
```

**Mostrar Estadísticas de una Dirección IP Específica**:
```bash
ip -s addr show dev eth0
```

### TTL: Time To Live

Valor en los paquetes IP que indica el número máximo de saltos (routers o nodos) que el paquete puede atravesar antes de ser descartado. Este valor se decrece en uno por cada salto que realiza el paquete a través de un router. Si el TTL llega a cero antes de alcanzar su destino, el paquete es descartado y no se entregará.

#### En el Comando `ping`

Cuando ejecutas el comando `ping`, verás un valor de TTL en la salida que proporciona información útil sobre la red. Aquí hay un ejemplo de salida de `ping`:

```sh
$ ping google.com
PING google.com (142.250.72.238): 56 data bytes
64 bytes from 142.250.72.238: icmp_seq=0 ttl=117 time=12.876 ms
64 bytes from 142.250.72.238: icmp_seq=1 ttl=117 time=13.053 ms
64 bytes from 142.250.72.238: icmp_seq=2 ttl=117 time=12.742 ms
```

En este ejemplo, `ttl=117` significa que el paquete ICMP (protocolo utilizado por `ping`) ha hecho 117 saltos antes de llegar al destino.

#### Interpretación del TTL

1. **Diagnóstico de Red**: Un TTL alto generalmente significa que el destino está cerca en términos de saltos de red, mientras que un TTL bajo indica que el destino está más lejos. 
2. **Prevención de Bucles**: El TTL ayuda a prevenir que los paquetes circulen indefinidamente en la red debido a bucles de enrutamiento.

#### Configuración Inicial de TTL

El TTL inicial puede variar dependiendo del sistema operativo:
- **Linux/Unix**: Usualmente 64.
- **Windows**: Generalmente 128.
- **Routers**: A menudo 255.

#### Ejemplo de Uso del Comando `ping` con TTL

**En Linux/Unix**:
```sh
ping -t 10 google.com
```

#### Consideraciones Adicionales

- **Seguridad**: Algunos sistemas y firewalls ajustan el TTL o lo utilizan como una técnica de seguridad para mitigar ataques como el spoofing de IP.
- **Trazado de Ruta**: La herramienta `traceroute` utiliza el concepto de TTL incrementando el valor de TTL en cada intento de rastrear la ruta tomada por los paquetes para llegar a su destino.

## `iptable`: filtrado de paquetes y administración de firewall

Herramienta de filtrado de paquetes y administración de firewall. Permite configurar reglas para controlar cómo los paquetes de red entran, salen y atraviesan el sistema. 

Componentes y funcionamiento:

1. **Tablas**: iptables utiliza tablas para organizar y almacenar las reglas. Las tablas más comunes son:
   - **filter**: Es la tabla predeterminada y se utiliza para el filtrado de paquetes. Aquí es donde se configuran las reglas del firewall.
   - **nat**: Esta tabla se utiliza para modificar las direcciones IP y puertos en los paquetes.
   - **mangle**: Se utiliza para modificar los paquetes de red de manera más avanzada.
   - **raw**: Esta tabla se utiliza principalmente para marcar paquetes para que no sean procesados por la tabla de conexiones establecidas.

2. **Cadenas (Chains)**: Las cadenas son secuencias de reglas que determinan qué se debe hacer con un paquete de red. Hay tres cadenas predeterminadas en cada tabla:
   - **INPUT**: Controla los paquetes que entran al sistema.
   - **OUTPUT**: Controla los paquetes generados por el sistema que salen.
   - **FORWARD**: Controla los paquetes que se están reenviando a través del sistema.

3. **Reglas (Rules)**: Las reglas son las directivas que especifican cómo se deben manejar los paquetes. Cada regla consta de varios campos, incluidos criterios de coincidencia (como direcciones IP, puertos, protocolos, etc.) y acciones a tomar (como aceptar, rechazar, dejar pasar, etc.).

4. **Objetivos (Targets)**: Los objetivos son las acciones que se toman cuando un paquete coincide con una regla. Algunos ejemplos comunes de objetivos incluyen:
   - **ACCEPT**: El paquete se permite pasar.
   - **DROP**: El paquete se descarta silenciosamente.
   - **REJECT**: El paquete se rechaza y se envía un mensaje de error al remitente.
   - **LOG**: El paquete se registra en el registro del sistema.

5. **Comandos**: iptables se administra mediante comandos en la línea de comandos. Algunos comandos comunes incluyen:
   - `iptables -A` para agregar una regla.
   - `iptables -D` para eliminar una regla.
   - `iptables -L` para listar las reglas existentes.
   - `iptables -F` para eliminar todas las reglas de una cadena.
   - `iptables-save` y `iptables-restore` para guardar y restaurar las reglas de iptables.

### Ejemplos

1. **Listar todas las reglas:**
```bash
iptables -L
```

2. **Permitir tráfico entrante HTTP (puerto 80):**
```bash
iptables -A INPUT -p tcp --dport 80 -j ACCEPT
```

3. **Permitir tráfico saliente SSH (puerto 22):**
```bash
iptables -A OUTPUT -p tcp --dport 22 -j ACCEPT
```

4. **Bloquear una dirección IP específica:**
```bash
iptables -A INPUT -s <dirección_IP> -j DROP
```

5. **Eliminar una regla específica:**
```bash
iptables -D INPUT <número_de_regla>
```

## `netcat`: permite leer y escribir datos a través de conexiones de red utilizando el protocolo TCP o UDP

### Sintaxis Básica

```sh
nc [opciones] host puerto
```

### Opciones Comunes

- `-l` : Escuchar para conexiones entrantes.
- `-p puerto` : Especificar el puerto.
- `-v` : Modo verbose (verbose output).
- `-z` : Escanear un rango de puertos.
- `-u` : Usar el protocolo UDP.
- `-w segundos` : Tiempo de espera para conexiones.
- `-q segundos` : Tiempo de espera de inactividad.

### Ejemplos de Uso

1. **Establecer una Conexión TCP a un Servidor Remoto**

```sh
nc ejemplo.com 80
```

Este comando establece una conexión TCP al puerto 80 de ejemplo.com.

2. **Establecer una Conexión UDP a un Servidor Remoto**

```sh
nc -u ejemplo.com 53
```

Este comando establece una conexión UDP al puerto 53 de ejemplo.com.

3. **Escuchar en un Puerto Específico para Conexiones Entrantes**

```sh
nc -l 12345
```

Este comando pone a la escucha en el puerto 12345 para conexiones entrantes.

4. **Escuchar en un Puerto Específico y Guardar la Salida en un Archivo**

```sh
nc -l 12345 > salida.txt
```

Este comando pone a la escucha en el puerto 12345 para conexiones entrantes y guarda los datos recibidos en un archivo llamado `salida.txt`.

5. **Enviar Datos a un Puerto Específico**

```sh
echo "Hola Mundo" | nc ejemplo.com 12345
```

Este comando envía el mensaje "Hola Mundo" al puerto 12345 de ejemplo.com.

6. **Escanear un Rango de Puertos en un Host Remoto**

```sh
nc -zv ejemplo.com 1-100
```

Este comando escanea los puertos del 1 al 100 en ejemplo.com para ver cuáles están abiertos.

7. **Establecer una Conexión y Limitar el Tiempo de Espera**

```sh
nc -w 5 ejemplo.com 80
```

Este comando establece una conexión TCP al puerto 80 de ejemplo.com y establece un tiempo de espera de 5 segundos.

8. **Establecer una Conexión y Limitar el Tiempo de Inactividad**

```sh
nc -q 10 ejemplo.com 80
```

Este comando establece una conexión TCP al puerto 80 de ejemplo.com y cierra la conexión si no hay actividad durante 10 segundos.

### Casos de Uso

1. **Pruebas de Conectividad**: Verificar si un servidor remoto está disponible y acepta conexiones.
2. **Depuración de Redes**: Probar la conectividad y el funcionamiento de los puertos en una red.
3. **Transferencia de Archivos**: Enviar o recibir archivos a través de una conexión de red.
4. **Escanear Puertos**: Identificar los puertos abiertos en un host remoto.
5. **Monitorización de Red**: Supervisar el tráfico de red y las conexiones activas.


## `netstat`: información sobre las conexiones de red, tablas de enrutamiento, interfaces de red y estadísticas de protocolos


### Sintaxis Básica

```bash
netstat [opciones]
```

### Opciones Comunes

- `-a` : Muestra todas las conexiones y puertos de escucha.
- `-t` : Muestra sólo las conexiones TCP.
- `-u` : Muestra sólo las conexiones UDP.
- `-n` : Muestra las direcciones y números de puerto en formato numérico.
- `-l` : Muestra sólo los puertos en escucha.
- `-p` : Muestra el PID y el nombre del programa de cada conexión.
- `-r` : Muestra la tabla de enrutamiento.
- `-i` : Muestra una lista de interfaces de red.
- `-s` : Muestra estadísticas de los distintos protocolos.
- `-c` : Actualiza la información continuamente.

### Ejemplos de Uso

1. **Mostrar Todas las Conexiones y Puertos de Escucha**

```sh
netstat -a
```

Este comando muestra todas las conexiones de red y los puertos en escucha.

2. **Mostrar Sólo las Conexiones TCP**

```sh
netstat -t
```

Este comando muestra sólo las conexiones TCP activas.

3. **Mostrar Sólo las Conexiones UDP**

```sh
netstat -u
```

Este comando muestra sólo las conexiones UDP activas.

4. **Mostrar Direcciones y Números de Puerto en Formato Numérico**

```sh
netstat -n
```

Este comando muestra las direcciones IP y los números de puerto en formato numérico, en lugar de resolver los nombres de host y servicio.

5. **Mostrar Puertos en Escucha**

```sh
netstat -l
```

Este comando muestra sólo los puertos que están en estado de escucha.

6. **Mostrar PID y Nombre del Programa**

```sh
sudo netstat -p
```

Este comando muestra el PID y el nombre del programa asociado a cada conexión. Es necesario tener privilegios de superusuario para ver esta información.

7. **Mostrar la Tabla de Enrutamiento**

```sh
netstat -r
```

Este comando muestra la tabla de enrutamiento del sistema.

8. **Mostrar Estadísticas de Protocolos**

```sh
netstat -s
```

Este comando muestra estadísticas detalladas de los distintos protocolos de red.

9. **Mostrar Información de Interfaces de Red**

```sh
netstat -i
```

Este comando muestra una lista de interfaces de red y sus estadísticas.

10. **Actualizar Información Continuamente**

```sh
netstat -c
```

Este comando actualiza la información de red continuamente.

### Ejemplo de Salida

```sh
$ netstat -tuln
Active Internet connections (only servers)
Proto Recv-Q Send-Q Local Address           Foreign Address         State
tcp        0      0 0.0.0.0:22              0.0.0.0:*               LISTEN
tcp6       0      0 :::80                   :::*                    LISTEN
udp        0      0 0.0.0.0:123             0.0.0.0:*
udp6       0      0 :::123                  :::*
```

### Interpretación de la Salida

- **Proto**: El protocolo (TCP o UDP).
- **Recv-Q** y **Send-Q**: Cantidad de datos no leídos en la cola de recepción y envío, respectivamente.
- **Local Address**: Dirección local y puerto.
- **Foreign Address**: Dirección remota y puerto.
- **State**: Estado de la conexión (por ejemplo, LISTEN, ESTABLISHED).

### Casos de Uso

1. **Diagnóstico de Conexiones de Red**: Identificar conexiones activas y servicios en escucha.
2. **Resolución de Problemas de Red**: Detectar conexiones sospechosas o no autorizadas.
3. **Monitoreo de Estadísticas de Red**: Obtener estadísticas detalladas de tráfico y rendimiento de la red.
4. **Verificación de la Tabla de Enrutamiento**: Comprobar y analizar las rutas de red configuradas en el sistema.

## `nmcli`: gestionar y configurar conexiones de red

Interfaz de línea de comandos para NetworkManager, que permite gestionar y configurar conexiones de red en sistemas Linux. 

### Opciones Comunes:

1. `connection`: Administrar conexiones de red.
2. `device`: Administrar dispositivos de red.
3. `general`: Mostrar información general de NetworkManager.
4. `monitor`: Mostrar eventos de NetworkManager en tiempo real.
5. `radio`: Administrar dispositivos de radio (Wi-Fi, Bluetooth, etc.).
6. `show`: Mostrar información detallada de una conexión o dispositivo específico.
7. `status`: Mostrar el estado actual de las conexiones de red.

### Casos de Uso:

**Mostrar dispositivos**:
```bash
nmcli dev
```

**Mostrar todas las Conexiones**:
```bash
nmcli connection show
```

**Conectar a una Red Wi-Fi**:
```bash
nmcli device wifi connect SSID password PASSWORD
```

**Desconectar de una Red Wi-Fi**:
```bash
nmcli device disconnect wlan0
```

**Mostrar Estado de la Red**:
```bash
nmcli device status
```

**Mostrar Detalles de una Conexión Específica**:
```bash
nmcli connection show "Wired connection 1"
```

**Activar y Desactivar Wi-Fi**:
```bash
nmcli radio wifi on
nmcli radio wifi off
```

**Conectar a una Red Ethernet**:
```bash
nmcli connection up "Wired connection 1"
```

**Desconectar de una Red Ethernet**:
```bash
nmcli connection down "Wired connection 1"
```

**Mostrar Información General de NetworkManager**:
```bash
nmcli general status
```

**Monitorizar Eventos de NetworkManager**:
```bash
nmcli monitor
```

## `nmap`: escaneo de red  

Herramienta de escaneo de red que se utiliza para descubrir hosts y servicios en una red, así como para crear un mapa de la red.

### Opciones Comunes

1. `-p port(s)`: Especifica el puerto o los puertos a escanear.
2. `-sS`: Realiza un escaneo TCP SYN.
3. `-sU`: Realiza un escaneo UDP.
4. `-A`: Realiza un escaneo de detección de sistemas operativos y versiones de servicios.
5. `-T timing`: Especifica el tiempo de escaneo (valores: `paranoid`, `sneaky`, `polite`, `normal`, `aggressive`, `insane`).
6. `-oN filename`: Guarda la salida del escaneo en un archivo en formato normal.
7. `-v`: Incrementa el nivel de verbosidad de la salida.
8. `-iL filename`: Lee los objetivos de un archivo en lugar de especificarlos en la línea de comandos.
9. `-R`: Realiza un escaneo de red aleatorio.

### Casos de Uso

1. **Escaneo de Puertos en un Host**:
```bash
nmap example.com
```

2. **Escaneo de Puertos Específicos**:
```bash
nmap -p 22,80,443 example.com
```

3. **Escaneo de Todos los Puertos TCP**:
```bash
nmap -p- example.com
```

4. **Escaneo de Puertos UDP**:
```bash
nmap -sU example.com
```

5. **Detección de Sistema Operativo**:
```bash
nmap -A example.com
```

6. **Escaneo de Redes Múltiples**:
```bash
nmap -v -iL targets.txt
```

7. **Escaneo Agresivo**:
```bash
nmap -T4 -A -v example.com
```

8. **Guardar Resultados en un Archivo**:
```bash
nmap -p 22,80,443 -oN scan_results.txt example.com
```

9. **Escaneo de Red Aleatorio**:
```bash
nmap -R example.com
```

## `nslookup`: info de servidore DNS

Se utiliza para consultar servidores de nombres de dominio (DNS) para obtener información sobre direcciones IP, nombres de hosts y otros datos relacionados con la resolución de nombres.

Aquí hay algunos usos comunes del comando `nslookup`:

1. **Consulta de resolución de nombres de dominio**: Puedes utilizar `nslookup` para obtener la dirección IP asociada con un nombre de dominio y viceversa. Por ejemplo:
   ```
   nslookup example.com
   ```
   Esto devolverá la dirección IP asociada con el dominio "example.com".

2. **Consultar un servidor DNS específico**: Puedes especificar el servidor DNS al que deseas enviar la consulta. Por ejemplo:
   ```
   nslookup example.com 8.8.8.8
   ```
   Esto enviará la consulta al servidor DNS de Google (8.8.8.8) en lugar de usar el servidor DNS predeterminado del sistema.

3. **Verificación de registros de recursos específicos**: Puedes buscar registros de recursos específicos, como registros A (dirección IPv4), registros AAAA (dirección IPv6), registros MX (intercambiadores de correo), registros PTR (resolución inversa), entre otros. Por ejemplo:
   ```
   nslookup -type=mx example.com
   ```
   Esto devolverá los registros MX asociados con el dominio "example.com".

4. **Consulta inversa**: Puedes realizar una consulta inversa para obtener el nombre de dominio asociado con una dirección IP. Por ejemplo:
   ```
   nslookup 8.8.8.8
   ```
   Esto devolverá el nombre de dominio asociado con la dirección IP 8.8.8.8.

## `ping`: envía un `ICMP ECHO_REQUEST` y espera un `ICMP ECHO_REPLY`

Envía paquetes ICMP ECHO_REQUEST al host especificado y espera una respuesta ICMP ECHO_REPLY.

### Opciones Comunes:

1. `-c count`: Especifica el número de paquetes que se enviarán antes de detener la prueba.
2. `-i interval`: Establece el intervalo de tiempo entre cada paquete enviado.
3. `-s packetsize`: Especifica el tamaño del paquete en bytes.
4. `-t ttl`: Establece el límite de tiempo de vida (TTL) de los paquetes.
5. `-q`: Modo silencioso, solo muestra la salida final.

### Casos de Uso:

1. **Verificar Conectividad Básica**: Comprueba si el host remoto está accesible.
```bash
ping example.com
```

2. **Especificar Número de Paquetes**: Envía un número específico de paquetes antes de detener la prueba.
```bash
ping -c 5 example.com
```

3. **Establecer Intervalo de Envío**: Controla el intervalo de tiempo entre cada paquete enviado.
```bash
ping -i 2 example.com
```

4. **Modificar el Tamaño del Paquete**: Cambia el tamaño del paquete ICMP enviado.
```bash
ping -s 100 example.com
```

5. **Limitar el Tiempo de Vida de los Paquetes**: Establece el límite de tiempo de vida (TTL) de los paquetes ICMP.
```bash
ping -t 64 example.com
```

6. **Modo Silencioso**: Ejecuta ping en modo silencioso, mostrando solo la salida final.
```bash
ping -q example.com
```

## `route`: mostrar y manipular la tabla de enrutamiento IP
Mostrar y manipular la tabla de enrutamiento IP en sistemas Unix y Linux. Aunque el comando `ip route` del paquete `iproute2` es el método preferido y más moderno para manejar la tabla de enrutamiento, `route` sigue siendo una herramienta útil y ampliamente utilizada en algunos contextos.

### Opciones Comunes

1. `add`: Agregar una nueva ruta.
2. `del`: Eliminar una ruta existente.
3. `-n`: Mostrar direcciones numéricas en lugar de resolver nombres de host.
4. `-C`: Mostrar la caché de rutas.

### Casos de Uso

**Mostrar la Tabla de Enrutamiento**:
```bash
route
```

**Mostrar la tabla de enrutamiento sin resolver nombres de host**
```bash
route -n
```

**Agregar una Ruta Estática**:
Agregar una ruta estática a una red específica a través de una puerta de enlace:
```bash
sudo route add -net 192.168.1.0/24 gw 192.168.0.1
```

**Agregar una ruta predeterminada (gateway por defecto)**:
```bash
sudo route add default gw 192.168.0.1
```

**Eliminar una Ruta Estática**:
Eliminar una ruta estática específica:
```bash
sudo route del -net 192.168.1.0/24 gw 192.168.0.1
```

**Eliminar la ruta predeterminada**:
```bash
sudo route del default gw 192.168.0.1
```

**Mostrar la Caché de Rutas**:
Mostrar la caché de rutas (usado principalmente para debugging):
```bash
route -C
```

### Ejemplos Prácticos

1. **Agregar una Ruta Específica a una Red**:
Supongamos que quieres enrutar el tráfico destinado a la red `10.0.0.0/8` a través de la puerta de enlace `192.168.1.1`:
```bash
sudo route add -net 10.0.0.0/8 gw 192.168.1.1
```

2. **Eliminar una Ruta a una Red Específica**:
Para eliminar la ruta anterior:
```bash
sudo route del -net 10.0.0.0/8 gw 192.168.1.1
```

3. **Agregar una Ruta a una Dirección IP Específica**:
Si necesitas enrutar el tráfico a una IP específica `172.16.0.5` a través de una puerta de enlace `192.168.0.1`:
```bash
sudo route add -host 172.16.0.5 gw 192.168.0.1
```

4. **Eliminar una Ruta a una Dirección IP Específica**:
Para eliminar la ruta anterior:
```bash
sudo route del -host 172.16.0.5 gw 192.168.0.1
```

## `ss`: información detallada sobre las conexiones de red, sockets, y estadísticas de protocolos

El comando `ss` (Socket Statistics) es una herramienta utilizada para mostrar información detallada sobre las conexiones de red, sockets, y estadísticas de protocolos.

### Sintaxis Básica

```sh
ss [opciones]
```

### Opciones Comunes

- `-t` : Muestra sólo las conexiones TCP.
- `-u` : Muestra sólo las conexiones UDP.
- `-a` : Muestra todas las conexiones.
- `-l` : Muestra sólo las conexiones locales (puertos en escucha).
- `-n` : Muestra las direcciones y números de puerto en formato numérico.
- `-p` : Muestra el PID y el nombre del programa de cada conexión.
- `-i` : Muestra información de las interfaces de red.
- `-s` : Muestra estadísticas de los distintos protocolos.
- `-o` : Muestra más detalles sobre cada conexión.
- `-H` : Muestra las columnas de encabezado.
- `-4` : Muestra sólo las conexiones IPv4.
- `-6` : Muestra sólo las conexiones IPv6.

### Ejemplos de Uso

1. **Mostrar Todas las Conexiones TCP**

```sh
ss -t
```

Este comando muestra sólo las conexiones TCP activas.

2. **Mostrar Todas las Conexiones UDP**

```sh
ss -u
```

Este comando muestra sólo las conexiones UDP activas.

3. **Mostrar Todas las Conexiones y Puertos de Escucha**

```sh
ss -a
```

Este comando muestra todas las conexiones de red y los puertos en escucha.

4. **Mostrar Sólo los Puertos en Escucha**

```sh
ss -l
```

Este comando muestra sólo los puertos en estado de escucha (conexiones locales).

5. **Mostrar PID y Nombre del Programa**

```sh
sudo ss -p
```

Este comando muestra el PID y el nombre del programa asociado a cada conexión. Es necesario tener privilegios de superusuario para ver esta información.

6. **Mostrar Estadísticas de Protocolos**

```sh
ss -s
```

Este comando muestra estadísticas detalladas de los distintos protocolos de red.

7. **Mostrar Información de Interfaces de Red**

```sh
ss -i
```

Este comando muestra una lista de interfaces de red y sus estadísticas.

8. **Mostrar Detalles de Conexiones**

```sh
ss -o
```

Este comando muestra más detalles sobre cada conexión, incluyendo el estado de la conexión.

9. **Mostrar Encabezados de Columnas**

```sh
ss -H
```

Este comando muestra las columnas de encabezado en la salida, lo que facilita la interpretación de los resultados.

10. **Mostrar Sólo Conexiones IPv4**

```sh
ss -4
```

Este comando muestra sólo las conexiones IPv4 activas.

11. **Mostrar Sólo Conexiones IPv6**

```sh
ss -6
```

Este comando muestra sólo las conexiones IPv6 activas.

### Casos de Uso

1. **Diagnóstico de Conexiones de Red**: Identificar conexiones activas y servicios en escucha.
2. **Resolución de Problemas de Red**: Detectar conexiones sospechosas o no autorizadas.
3. **Monitoreo de Estadísticas de Red**: Obtener estadísticas detalladas de tráfico y rendimiento de la red.
4. **Verificación de Conexiones por Protocolo**: Obtener información específica sobre conexiones TCP o UDP.
5. **Inspección de Interfaces de Red**: Analizar el estado y la actividad de las interfaces de red del sistema.

## `tcpdump`: capturar y analizar el tráfico de red en un sistema

Herramienta de captura de paquetes en línea de comandos que permite a los usuarios capturar y analizar el tráfico de red en un sistema. 

### Sintaxis Básica

```sh
tcpdump [opciones] [filtro]
```

### Opciones Comunes

- `-i interfaz` : Especifica la interfaz de red para capturar paquetes.
- `-n` : No resuelve direcciones IP ni nombres de host a nombres de dominio.
- `-c cantidad` : Limita el número de paquetes a capturar.
- `-w archivo` : Guarda la salida de tcpdump en un archivo.
- `-r archivo` : Lee paquetes de un archivo previamente guardado.
- `-v` : Modo verbose (verbose output).
- `-vv` : Modo verbose más detallado.
- `-X` : Muestra el contenido hexadecimal y ASCII de los paquetes.
- `-s bytes` : Limita la cantidad de bytes a capturar por paquete.
- `-A` : Muestra el contenido ASCII completo de los paquetes capturados.

### Ejemplos de Uso

1. **Capturar Paquetes en una Interfaz Específica**

```sh
tcpdump -i eth0
```

Este comando captura paquetes en la interfaz `eth0`.

2. **Guardar Paquetes Capturados en un Archivo**

```sh
tcpdump -i eth0 -w captura.pcap
```

Este comando captura paquetes en la interfaz `eth0` y los guarda en el archivo `captura.pcap`.

3. **Leer Paquetes desde un Archivo Capturado**

```sh
tcpdump -r captura.pcap
```

Este comando lee y muestra los paquetes capturados previamente en el archivo `captura.pcap`.

4. **Capturar Paquetes con Filtro por Dirección IP**

```sh
tcpdump -i eth0 src 192.168.1.100
```

Este comando captura paquetes en la interfaz `eth0` que tienen como origen la dirección IP `192.168.1.100`.

5. **Mostrar el Contenido de los Paquetes Capturados en Modo Verbose**

```sh
tcpdump -i eth0 -v
```

Este comando captura paquetes en la interfaz `eth0` y muestra información detallada sobre cada paquete.

6. **Mostrar el Contenido ASCII de los Paquetes Capturados**

```sh
tcpdump -i eth0 -A
```

Este comando captura paquetes en la interfaz `eth0` y muestra el contenido ASCII completo de cada paquete.

7. **Capturar Paquetes UDP en un Puerto Específico**

```sh
tcpdump -i eth0 udp port 53
```

Este comando captura paquetes UDP en la interfaz `eth0` que están destinados al puerto `53` (DNS).

8. **Mostrar el Contenido Hexadecimal y ASCII de los Paquetes Capturados**

```sh
tcpdump -i eth0 -X
```

Este comando captura paquetes en la interfaz `eth0` y muestra tanto el contenido hexadecimal como ASCII de cada paquete.

### Casos de Uso

1. **Depuración de Redes**: Analizar el tráfico de red para resolver problemas de conectividad.
2. **Monitoreo de Red**: Observar el tráfico de red para detectar anomalías o comportamientos inusuales.
3. **Análisis de Seguridad**: Identificar posibles amenazas o actividades maliciosas en la red.
4. **Resolución de Problemas de Protocolo**: Investigar problemas relacionados con protocolos de red específicos.
5. **Auditoría de Red**: Registrar y analizar el tráfico de red para fines de auditoría y cumplimiento.

## `telnet`: probar conectividad y accesibilidad a un servicio en un puerto

Se utiliza para establecer una conexión de texto sin cifrar a un servidor remoto. Puede ser útil para probar la conectividad y la accesibilidad de un servicio en un host remoto.

### Opciones Comunes:

1. `-l username`: Especifica el nombre de usuario para autenticación en el servidor remoto.
2. `-p port`: Especifica el puerto al que se realizará la conexión.
3. `-a`: Utiliza la opción "autenticar" durante la conexión (si es compatible).
4. `-e escapechar`: Define el carácter de escape (por defecto, Ctrl + ']').
5. `-E`: Deshabilita el uso de los caracteres de escape.

### Casos de Uso:

1. **Conexión a un Servidor en un Puerto Específico**: Conecta a un servidor remoto en un puerto determinado.
```bash
telnet example.com 80
```

2. **Autenticación**: Conéctate a un servidor remoto y proporciona un nombre de usuario para autenticación.
```bash
telnet -l username example.com
```

3. **Usar un Carácter de Escape Personalizado**: Establece un carácter de escape personalizado para la sesión.
```bash
telnet -e # example.com
```

4. **Conexión a un Servidor SSL/TLS (si es compatible)**: Intenta una conexión segura (SSL/TLS) con el servidor.
```bash
telnet -a example.com 443
```

5. **Conexión a un Servidor y Ejecución de Comandos**: Conéctate a un servidor y ejecuta comandos directamente.
```bash
echo "GET / HTTP/1.0" | telnet example.com 80
```

6. **Pruebas de Diagnóstico**: Utiliza telnet para probar la conectividad y la accesibilidad de servicios en un servidor remoto.
```bash
telnet example.com 22
```

## `tracepath`: rastrear la ruta que toman los paquetes a través de una red

Se utiliza para rastrear la ruta que toman los paquetes a través de una red hacia un destino específico. A diferencia de `traceroute`, `tracepath` no requiere privilegios de superusuario y es más fácil de usar en ciertos sistemas.

### Sintaxis Básica

```sh
tracepath [opciones] <destino>
```

### Opciones Comunes

- `-n`: No resuelve las direcciones IP en nombres de host.
- `-b`: Intenta resolver nombres de host.
- `-p <puerto>`: Especifica el puerto a utilizar.
- `-m <saltos>`: Establece el TTL máximo.
- `-l <tamaño>`: Establece el tamaño del paquete en bytes.
- `-4`: Utiliza sólo IPv4.
- `-6`: Utiliza sólo IPv6.

### Ejemplos de Uso

1. **Rastrear la Ruta a un Destino**

```sh
tracepath google.com
```

Este comando rastrea la ruta que toman los paquetes desde tu computadora hasta `google.com`.

2. **No Resolver Direcciones IP**

```sh
tracepath -n google.com
```

Este comando rastrea la ruta pero no intenta resolver las direcciones IP a nombres de host, lo que puede hacer que el comando se ejecute más rápido.

3. **Establecer el TTL Máximo**

```sh
tracepath -m 10 google.com
```

Este comando establece el TTL máximo a 10, limitando el número de saltos que se rastrean.

4. **Especificar el Tamaño del Paquete**

```sh
tracepath -l 60 google.com
```

Este comando establece el tamaño del paquete en 60 bytes.

5. **Utilizar IPv4 o IPv6**

```sh
tracepath -4 google.com
tracepath -6 google.com
```

Estos comandos fuerzan a `tracepath` a utilizar IPv4 o IPv6 respectivamente.

## `traceroute`: rastear rutas que toman los paquetes IP

Se utiliza para rastrear la ruta que toman los paquetes IP desde tu computadora hasta un destino específico, mostrando cada salto intermedio (o "hop") en el camino. 

### Opciones Comunes:

1. `-n`: Muestra las direcciones IP en lugar de resolver los nombres de host.
2. `-q N`: Establece el número de intentos de cada salto a N.
3. `-m N`: Establece el límite máximo de saltos a N.
4. `-w N`: Establece el tiempo de espera para cada intento de N segundos.
5. `-I`: Utiliza ICMP ECHO para las sondas en lugar de los puertos UDP predeterminados.
6. `-T`: Utiliza TCP SYN para las sondas en lugar de los puertos UDP predeterminados.
7. `-U`: Utiliza UDP para las sondas (este es el comportamiento predeterminado).
8. `-p port`: Especifica el puerto de destino (solo se aplica con TCP o UDP).

### Casos de Uso:

1. **Verificar la Ruta de Red**: Muestra todos los saltos entre tu máquina y el destino.
```bash
traceroute example.com
```

2. **Identificar Problemas de Red**: Encuentra dónde se produce la congestión o los retrasos en la red.
```bash
traceroute -q 5 example.com
```

3. **Analizar Calidad de la Conexión**: Observa la latencia entre los saltos y determina la calidad de la conexión.
```bash
traceroute -I example.com
```

4. **Depuración de Conexiones TCP**: Utiliza el traceroute con TCP SYN para depurar problemas en conexiones TCP.
```bash
traceroute -T -p 80 example.com
```

5. **Depuración de Conexiones UDP**: Utiliza el traceroute con UDP para depurar problemas en conexiones UDP.
```bash
traceroute -U example.com
```

6. **Resolución de Problemas de Firewall**: Identifica si un firewall bloquea el tráfico en ciertos puertos.
```bash
traceroute -p 22 example.com
```