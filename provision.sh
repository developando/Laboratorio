# Garantindo as chaves
#  ssh-keygen -q -t rsa -f key -N ''

KEY_PATH='/vagrant/'
cd $KEY_PATH
mkdir -p /root/.ssh
cp $KEY_PATH/key /root/.ssh/id_rsa
cp $KEY_PATH/key.pub /root/.ssh/id_rsa.pub
cp $KEY_PATH/key.pub /root/.ssh/authorized_keys
chmod 400 /root/.ssh/id_rsa*
cat /root/.ssh/id_rsa.pub >> /home/vagrant/.ssh/authorized_keys


echo "Garantindo os hosts"
HOSTS=$(head -n7 /etc/hosts)
echo -e "$HOSTS" > /etc/hosts
echo '192.168.1.101 python01.docker-dca.example' >> /etc/hosts
#echo '192.168.1.110 node01.docker-dca.example' >> /etc/hosts
#echo '192.168.1.120 node02.docker-dca.example'>> /etc/hosts
#echo '192.168.1.200 registry.docker-dca.example' >> /etc/hosts

echo "Instalando o Docker"
sudo dnf install -y dnf-utils -y >/dev/null 2>&1
sudo dnf config-manager --add-repo https://download.docker.com/linux/rhel/docker-ce.repo -y >/dev/null 2>&1
sudo yum install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y >/dev/null 2>&1
sudo systemctl enable docker >/dev/null 2>&1 
sudo systemctl start docker >/dev/null 2>&1
sudo usermod -aG docker vagrant >/dev/null 2>&1
sudo yum install vim -y >/dev/null 2>&1

echo "Testando o Docker"
docker pull crccheck/hello-world >/dev/null 2>&1
docker run -d --name web-test -p 80:8000 crccheck/hello-world >/dev/null 2>&1
curl 127.0.0.1:80

echo "Instalando o conversor de arquivos"
yum install -y dos2unix 






