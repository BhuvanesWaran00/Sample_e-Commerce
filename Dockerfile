FROM ubuntu:latest

# Install dependencies
RUN apt-get update && \
    apt-get install -y pip python3-venv  mysql-server git  && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY . /app/