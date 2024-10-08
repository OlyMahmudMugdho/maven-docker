FROM maven:3.9.8-eclipse-temurin-21-jammy
USER root

# Add Docker's official GPG key:
 RUN apt-get update
 RUN apt-get install ca-certificates curl
 RUN install -m 0755 -d /etc/apt/keyrings
 RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
 RUN chmod a+r /etc/apt/keyrings/docker.asc
  
  # Add the repository to Apt sources:
 RUN echo \
    "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
    $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
     tee /etc/apt/sources.list.d/docker.list > /dev/null

 RUN apt-get update && apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
 RUN apt update && apt install tzdata -y
ENV TZ="Asia/Dhaka"