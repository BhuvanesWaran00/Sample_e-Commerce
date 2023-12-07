curl -o kubectl https://amazon-eks.s3.us-west-2.amazonaws.com/1.18.9/2020-11-02/bin/linux/amd64/kubectl
chmod +x ./kubectl
"""
Copy the binary to a folder in your PATH.
If you have already installed a version of kubectl,
then we recommend creating a $HOME/bin/kubectl and ensuring that $HOME/bin comes first in your $PATH.
"""

mkdir -p $HOME/bin && cp ./kubectl $HOME/bin/kubectl && export PATH=$PATH:$HOME/bin

kubectl version --short --client
# Configure your AWS CloudShell to communicate with your cluster



# to install eksctl

curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp

sudo mv /tmp/eksctl /usr/local/bin

eksctl version


