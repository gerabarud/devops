## `dig`

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

## `iptable`

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

### Ejemplos de comandos

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

## `nslookup`

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
