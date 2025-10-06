FROM maven:3.6.3-openjdk-17-slim

# Fix Debian Buster archive issues
RUN sed -i 's|http://deb.debian.org|http://archive.debian.org|g' /etc/apt/sources.list
RUN sed -i 's|http://security.debian.org|http://archive.debian.org|g' /etc/apt/sources.list
RUN echo 'Acquire::Check-Valid-Until "false";' > /etc/apt/apt.conf.d/99no-check-valid-until

# Unzip & curl
RUN apt-get update
RUN apt-get install -y unzip curl

# Install AWS CLI
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
RUN unzip awscliv2.zip
RUN ./aws/install
RUN rm -rf awscliv2.zip aws


