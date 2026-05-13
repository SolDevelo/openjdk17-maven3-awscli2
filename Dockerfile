FROM maven:3.8.5-openjdk-17-slim

# Fix Debian Buster archive issues
RUN set -eux; \
    sed -i 's|http://archive.debian.org/debian|http://deb.debian.org/debian|g' /etc/apt/sources.list; \
    sed -i 's|http://archive.debian.org/debian-security|http://deb.debian.org/debian-security|g' /etc/apt/sources.list; \
    sed -i '/bullseye-updates/d' /etc/apt/sources.list; 

# Unzip & curl
RUN apt-get update
RUN apt-get install -y unzip curl git

# Install AWS CLI
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
RUN unzip awscliv2.zip
RUN ./aws/install
RUN rm -rf awscliv2.zip aws


