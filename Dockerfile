FROM ubuntu:20.04

# Install dependencies
RUN apt-get update && \
    apt-get install -y pip python3-venv  mysql-server git  && \
    rm -rf /var/lib/apt/lists/*

# Copy application files
RUN git clone https://github.com/BhuvanesWaran00/Sample_e-Commerce.git

RUN mv Sample_e-Commerce app

WORKDIR /app

RUN python3 -m venv venv && \
    source venv/bin/activate && \
    pip install -r req.txt && \
    cp service.txt /etc/systemd/system/app.service && \
    chmod 100 run1.sh && \
    chmod 100 run2.sh && \
    chmod 100 run3.sh 

CMD ["./run2.sh"]
CMD ["./run3.sh"]

RUN gunicorn -b 0.0.0.0:80 app:app
# Set working directory


# Your application-specific setup
