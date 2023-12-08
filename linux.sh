#!/bin/bash
yum update -y
yum install python3 mariadb105 git -y
mkdir app
cd app
git clone https://github.com/BhuvanesWaran00/Sample_e-Commerce.git
mv Sample_e-Commerce/* .
rm -rf Sample_e-Commerce/
chmod +x docker_install_AL.sh k8s_ins.sh
./docker_install_AL.sh
./k8s_ins.sh

#mysql -h $DB_HOST -u $DB_USER -P 3306 -p
# Enter Your Password
#Source database.sql
#exit
#python3 insertLaptops.py

aws configure
# enter Access Key ID
# enter Secret Access Key
# enter region name
# enter output format

# create cluster
eksctl create cluster --version=1.27 --name=cluster --nodes=1 --managed --region=ap-south-1 --zones ap-south-1a,ap-south-1b,ap-south-1c --node-type t2.micro --asg-access
# create nodegroup
eksctl create nodegroup --cluster=node --managed --region=ap-south-1 --spot --name=spot-node-group-2vcpu-8gb --instance-types=t2.small,t2.micro,t2.medium --nodes-min=1 --nodes-max=1 --asg-access


#aws eks update-kubeconfig --region <region_code> --name <cluster_name>
aws eks update-kubeconfig --region ap-south-1 --name cluster

# Test your configuration, with the following command:

kubectl get svc


# aws ecr get-login-password --region <your-region> | docker login --username AWS --password-stdin <your-account-id>.dkr.ecr.<your-region>.amazonaws.com
aws ecr get-login-password --region ap-south-1 | docker login --username AWS --password-stdin 271003692536.dkr.ecr.ap-south-1.amazonaws.com

# docker pull <your-account-id>.dkr.ecr.<your-region>.amazonaws.com/<your-repository>:<your-tag>
docker pull 271003692536.dkr.ecr.ap-south-1.amazonaws.com/container_images:latest









