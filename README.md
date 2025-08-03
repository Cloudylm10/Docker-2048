Here's the updated README.md with the additional information about copying from GitHub, presented in a clear and professional way:

```markdown
# 2048 Game Deployment with Docker and AWS Elastic Beanstalk

This project demonstrates how to containerize the popular 2048 game using Docker and deploy it to AWS Elastic Beanstalk. The 2048 game files were copied directly from the original GitHub repository.

## Table of Contents
- [Prerequisites](#prerequisites)
- [Project Overview](#project-overview)
- [Docker Implementation](#docker-implementation)
  - [Dockerfile Explanation](#dockerfile-explanation)
  - [Building the Image](#building-the-image)
  - [Running the Container](#running-the-container)
- [AWS Elastic Beanstalk Deployment](#aws-elastic-beanstalk-deployment)
- [Source Attribution](#source-attribution)
- [Acknowledgements](#acknowledgements)

## Prerequisites

Before you begin, ensure you have the following installed:
- Docker Engine
- AWS CLI (with configured credentials)
- EB CLI (Elastic Beanstalk Command Line Interface)
- Git (optional)

## Project Overview

This project packages the open-source 2048 game (created by Gabriele Cirulli) into a Docker container running on Nginx web server, then deploys it to AWS Elastic Beanstalk for scalable hosting. The game files are sourced directly from the original GitHub repository.

## Docker Implementation

### Dockerfile Explanation

Here's the complete Dockerfile with explanations for each section:

```dockerfile
# Start from Ubuntu 22.04 base image
FROM ubuntu:22.04

# Update package lists and install necessary software
RUN apt-get update
RUN apt-get install -y nginx zip curl

# Download and set up 2048 game directly from GitHub repository
RUN curl -L -o /var/www/html/master.zip https://codeload.github.com/gabrielecirulli/2048/zip/master && \
    cd /var/www/html && \
    unzip master.zip && \
    mv 2048-master/* . && \
    rm -rf 2048-master master.zip

# Expose port 80 for web traffic
EXPOSE 80

# Start nginx in the foreground
CMD ["/usr/sbin/nginx", "-g", "daemon off;"]
```

Key components:
1. **Base Image**: Uses Ubuntu 22.04 as the foundation
2. **Package Installation**: Installs Nginx (web server), zip, and curl
3. **Game Setup**: Downloads the 2048 game directly from the [original GitHub repository](https://github.com/gabrielecirulli/2048), extracts it, and places it in Nginx's web directory
4. **Port Configuration**: Exposes port 80 for HTTP traffic
5. **Runtime Command**: Starts Nginx in foreground mode

### Building the Image

To build the Docker image:

```bash
docker build -t 2048-game .
```

### Running the Container

To run the container locally:

```bash
docker run -d -p 8080:80 --name 2048-container 2048-game
```

Access the game at: http://localhost:8080

## AWS Elastic Beanstalk Deployment

### 1. Initialize Elastic Beanstalk Application

```bash
eb init -p docker 2048-game-app --region us-east-1
```

### 2. Create Elastic Beanstalk Environment

```bash
eb create 2048-game-env
```

### 3. Deploy the Application

```bash
eb deploy
```

### 4. Open the Application in Browser

```bash
eb open
```

Deployment Verification
After successful deployment, you should see:

In AWS Elastic Beanstalk console:

Environment health status "OK"

Application available at the generated domain (e.g., 2048-envelope-gbm@ipk.us-east-1.elasticbeanstalk.com)

Successful deployment events in the event log

<img width="1919" height="982" alt="Screenshot 2025-08-04 021115" src="https://github.com/user-attachments/assets/69842778-09f5-4c7b-8c47-04adc5c9664f" />

In your web browser:

The 2048 game interface with the title "Join the numbers and get to the 2048 tile!"

Functional game controls using arrow keys

Working tile merging mechanics

<img width="1908" height="942" alt="Screenshot 2025-08-04 021136" src="https://github.com/user-attachments/assets/11fde10a-4100-4caf-9753-6f75f4098efb" />



## Source Attribution

The 2048 game files used in this project are copied directly from the original source:
- **GitHub Repository**: [gabrielecirulli/2048](https://github.com/gabrielecirulli/2048)
- **Download URL**: `https://codeload.github.com/gabrielecirulli/2048/zip/master`
- **License**: MIT License

The files are downloaded during the Docker build process using the `curl` command in the Dockerfile, then extracted and placed in the web server directory.

## Acknowledgements

- **2048 Game**: Created by [Gabriele Cirulli](https://github.com/gabrielecirulli/2048)
- **Docker**: For containerization technology
- **Nginx**: For the lightweight web server
- **AWS Elastic Beanstalk**: For simplified deployment and scaling

## License

This project is open-source and available under the MIT License. The 2048 game is also distributed under the MIT License.
```
