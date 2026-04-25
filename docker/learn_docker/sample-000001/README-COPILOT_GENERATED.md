# Docker Learning Sample - 000001

A Docker learning project demonstrating containerization and orchestration with Docker Compose.

## Project Structure

```
sample-000001/
├── docker-compose.yml     # Docker Compose configuration for multi-container setup
├── nginx/                 # Nginx web server configuration
│   └── nginx.conf        # Nginx server configuration file
├── doc/                  # Documentation files
└── README.md            # This file
```

## Getting Started

### Prerequisites

- Docker (v20.10+)
- Docker Compose (v1.29+)

### Running the Project

1. **Clone or navigate to the project directory:**
   ```bash
   cd sample-000001
   ```

2. **Start the Docker containers:**
   ```bash
   docker-compose up -d
   ```

3. **Verify the services are running:**
   ```bash
   docker-compose ps
   ```

4. **View logs:**
   ```bash
   docker-compose logs -f
   ```

### Stopping the Project

```bash
docker-compose down
```

## Configuration

### Docker Compose

The `docker-compose.yml` file defines the services and their configurations. Modify this file to:
- Add or remove services
- Change port mappings
- Adjust resource limits
- Set environment variables

### Nginx

The `nginx/nginx.conf` file contains the Nginx configuration. Use this to:
- Configure reverse proxies
- Set up SSL/TLS
- Define upstream servers
- Customize request/response handling

## Documentation

Additional documentation and session notes are available in the `doc/` directory.

## Common Tasks

### View running containers
```bash
docker-compose ps
```

### Execute a command in a container
```bash
docker-compose exec <service-name> <command>
```

### Rebuild images
```bash
docker-compose build
```

### Remove all containers, networks, and volumes
```bash
docker-compose down -v
```

## Troubleshooting

- **Port already in use:** Change the port mappings in `docker-compose.yml`
- **Permission denied:** Run commands with `sudo` or add your user to the docker group
- **Container won't start:** Check logs with `docker-compose logs <service-name>`

## Resources

- [Docker Documentation](https://docs.docker.com/)
- [Docker Compose Documentation](https://docs.docker.com/compose/)
- [Nginx Documentation](https://nginx.org/en/docs/)

## License

This is a learning project. Modify as needed for educational purposes.
