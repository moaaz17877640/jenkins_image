FROM ubuntu:latest

USER root

# Update package lists and install necessary dependencies in one step
RUN apt-get update -qq && \
    apt-get install -y \
        openjdk-11-jre \
        openssh-server \
        ca-certificates \
        curl \
        gnupg \
        lsb-release \
        sudo \
        wget && \
    rm -rf /var/lib/apt/lists/*

# Install Docker client
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg && \
    echo "deb [arch=amd64 signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null && \
    apt-get update && \
    apt-get install -y \
        docker-ce \
        docker-ce-cli \
        containerd.io \
        docker-buildx-plugin \
        docker-compose-plugin && \
    rm -rf /var/lib/apt/lists/*

# Create Jenkins home directory and set permissions
RUN mkdir -p /jenkins_home && \
    chmod 777 /jenkins_home

# Create Jenkins user
RUN useradd -d /jenkins_home -m -s /bin/bash jenkins && \
    usermod -aG docker jenkins && \
    chown -R jenkins:jenkins /jenkins_home

# Set the working directory
WORKDIR /jenkins_home

# Set the default command to run bash
CMD ["/bin/bash"]
