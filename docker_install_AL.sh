sudo yum install -y docker
sudo service docker start
sudo systemctl start docker
sudo chkconfig docker on    # For Amazon Linux
sudo systemctl enable docker   # For Amazon Linux 2
docker --version
docker run hello-world