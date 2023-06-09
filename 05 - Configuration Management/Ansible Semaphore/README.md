# Ansible-Semaphore
Web UI for Ansible: 
https://www.youtube.com/watch?v=NyOSoLn5T5U

## Installing

### Docker

Creating a `docker-compose.yml`

```yml
services:
  
  postgres:
    restart: unless-stopped
    ports:
      - 54321:5432
    image: postgres:14
    hostname: postgres
    volumes: 
     - semaphore-postgres:/var/lib/postgresql/data
    env_file: .postgres.env
  
  semaphore:
    restart: unless-stopped
    ports:
      - 3000:3000
    image: semaphoreui/semaphore:latest
    env_file: .env
    volumes:
      - ./inventory/:/inventory:ro     
      - ./files/:/files:ro       
    depends_on:
      - postgres

volumes:
  semaphore-postgres:
```

Run the following command to start Semaphore with configured database:
```bash
docker compose up
```