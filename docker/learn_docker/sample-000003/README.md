# Sample-000003: Docker Platform Deployment

This project is a self-training environment for learning how to deploy a source code hosting platform in Docker containers.

## Overview

Sample-000003 demonstrates the deployment of a complete platform combining two key components:

- **Nginx**: A high-performance HTTP and reverse proxy server used for handling web traffic and SSL/TLS termination.
- **Forgejo**: A lightweight, self-hosted Git service for managing source code repositories.

## Platform Architecture

The platform is containerized using Docker Compose, enabling easy deployment and management of all services. Nginx acts as a reverse proxy, routing incoming HTTP/HTTPS requests to the Forgejo application.

## Project Structure

```
sample-000003/
├── nginx/                 # Nginx configuration
│   ├── certs/            # SSL/TLS certificates
│   ├── http.d/           # HTTP configuration files
│   ├── nginx.conf        # Main Nginx configuration
│   └── forgejo.conf      # Forgejo-specific HTTP configuration
├── forgejo/              # Forgejo configuration and data
├── doc/                  # Documentation
├── compose.yml           # Docker Compose configuration
└── README.md            # This file
```

## Getting Started

1. Configure SSL certificates in `nginx/certs/`
2. Review and adjust `nginx/nginx.conf` and `nginx/http.d/forgejo.conf` as needed
3. Run the platform using Docker Compose:

```bash
docker compose up -d
```

## Components

### Nginx
- Reverse proxy and load balancer
- SSL/TLS termination
- Configuration located in `nginx/` directory

### Forgejo
- Git service for source code hosting
- Configuration and data stored in `forgejo/` directory

## Documentation

Additional documentation and guides are available in the `doc/` directory.

## License

This is a training project for educational purposes.
