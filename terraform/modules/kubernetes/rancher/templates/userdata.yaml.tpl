#cloud-config
packages:
  - nfs-kernel-server
  - curl
  - wget
  - git
  - apt-transport-https
  - ca-certificates
  - gnupg-agent
  - software-properties-common
runcmd:
  - mkdir -p /mnt/sharedfolder
  - curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
  - add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
  - apt install -y docker-ce docker-ce-cli containerd.io
  - usermod -aG docker ubuntu
