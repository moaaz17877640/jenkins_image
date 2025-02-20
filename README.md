# Jenkins Docker Image

This repository contains a Dockerfile to build a Docker image for running Jenkins.

## Description

This Docker image is based on the Ubuntu latest image and includes the following:

- OpenJDK 11
- SSH Server
- Docker client and dependencies
- Jenkins setup with a dedicated Jenkins user

## Installation and Setup Instructions

1. **Build the Docker Image**:
   ```sh
   docker build -t my-jenkins-image .
   ```

2. **Run the Docker Container**:
   ```sh
   docker run -p 8080:8080 -p 50000:50000 my-jenkins-image
   ```

3. **Access Jenkins**:
   Open your web browser and go to `http://localhost:8080` to access the Jenkins web interface.

## Usage Examples

- Once Jenkins is running, you can configure your Jenkins jobs and pipelines directly from the web interface.
- You can use the Jenkins Docker image to set up continuous integration and continuous delivery (CI/CD) pipelines for your projects.

## Additional Information

- The Dockerfile installs necessary dependencies, sets up a Jenkins user, and prepares the environment for running Jenkins.
- The Jenkins home directory is set to `/jenkins_home` and permissions are configured accordingly.
