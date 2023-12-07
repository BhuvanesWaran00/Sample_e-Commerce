#!/bin/bash
yum update -y
yum install python3 mariadb105 git -y
mkdir app
cd app
git clone https://github.com/BhuvanesWaran00/Sample_e-Commerce.git
mv Sample_e-Commerce/* .
rm -r Sample_e-Commerce/
chmod +x docker_install_AL.sh
./docker_install_AL.sh
export DB_HOST='test.c19gkk3ng7md.ap-south-1.rds.amazonaws.com' # Replace Your host
export DB_USER='root'                     # Replace Your User_name
export DB_PASSWORD='Bh101299'             # Replace Your password
export DB_NAME='userdata'                 # Replace Your DB_name

#mysql -h $DB_HOST -u $DB_USER -P 3306 -p
# Enter Your Password
#Source database.sql
#exit
#python3 insertLaptops.py

# aws ecr get-login-password --region <your-region> | docker login --username AWS --password-stdin <your-account-id>.dkr.ecr.<your-region>.amazonaws.com
aws ecr get-login-password --region ap-south-1 | docker login --username AWS --password-stdin 271003692536.dkr.ecr.ap-south-1.amazonaws.com

# docker pull <your-account-id>.dkr.ecr.<your-region>.amazonaws.com/<your-repository>:<your-tag>
docker pull 271003692536.dkr.ecr.ap-south-1.amazonaws.com/container_images:latest

kubectl apply -f deployment.yaml
kubectl apply -f service.yaml

kubectl get deployment your-deployment
kubectl get service your-service




