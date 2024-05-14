- [Networking en Linux](#networking-en-linux)
  - [`dig`:  información detallada sobre registros DNS.](#dig--información-detallada-sobre-registros-dns)
  - [`iptable`: filtrado de paquetes y administración de firewall](#iptable-filtrado-de-paquetes-y-administración-de-firewall)
    - [Ejemplos](#ejemplos)
  - [`nmap`: escaneo de red](#nmap-escaneo-de-red)
    - [Opciones Comunes](#opciones-comunes)
    - [Casos de Uso](#casos-de-uso)
  - [`nslookup`: info de servidore DNS](#nslookup-info-de-servidore-dns)
  - [`ping`: envía un `ICMP ECHO_REQUEST` y espera un `ICMP ECHO_REPLY`](#ping-envía-un-icmp-echo_request-y-espera-un-icmp-echo_reply)
    - [Opciones Comunes:](#opciones-comunes-1)
    - [Casos de Uso:](#casos-de-uso-1)
  - [`telnet`: probar conectividad y accesibilidad a un servicio en un puerto](#telnet-probar-conectividad-y-accesibilidad-a-un-servicio-en-un-puerto)
    - [Opciones Comunes:](#opciones-comunes-2)
    - [Casos de Uso:](#casos-de-uso-2)
  - [`traceroute`: rastear rutas que toman los paquetes IP](#traceroute-rastear-rutas-que-toman-los-paquetes-ip)
    - [Opciones Comunes:](#opciones-comunes-3)
    - [Casos de Uso:](#casos-de-uso-3)

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