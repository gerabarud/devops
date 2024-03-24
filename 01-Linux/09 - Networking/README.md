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
