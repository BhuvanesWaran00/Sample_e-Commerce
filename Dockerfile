FROM ubuntu:latest

# Install dependencies
RUN apt-get update && \
    apt-get install -y pip python3-venv  mysql-server git  && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY . /app/

RUN chmod +x run1.sh

CMD [ "./run1.sh" ]