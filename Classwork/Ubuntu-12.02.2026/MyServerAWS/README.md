# 1. Option root conection
```

sudo su
sudo nano /etc/ssh/sshd_config 
Знайти #PermitRootLogin... -> PermitRootLogin yes
sudo service ssh restart

nano ~/.ssh/authorized_keys

-----REMOVE All xt to ssh-rsa (стерти всеь текст до ssh-rsa)-----

systemctl restart ssh 
------Тепер можна конектитися через моду із рута------
ifconfig

```

# 2. Install nginx
```

sudo apt update
sudo apt install nginx

systemctl status nginx
-----На даному етапі можна перейти по ip в браузері-----
-----і якщо до цього моменту все пройшло без помилок у браузері має з'явитися "Welcome to nginx!"-----

```

# 3. Install Docker
```

sudo apt update

sudo apt install apt-transport-https ca-certificates curl software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

echo "deb [signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt update

sudo apt install docker-ce

sudo systemctl start docker
sudo systemctl enable docker

sudo systemctl status docker
sudo usermod -aG docker $USER

docker --version

```

# 4. Install MC
```

apt install mc

```

# 5. Run and Up Project docker-compose
```

docker compose pull
docker images
docker compose up -d
docker ps -a


```

#Option DNS in server AWS
```

Відкрити файл /etc/nginx/sites-avalible/default

server {
    server_name   av-transfer.itstep.click *.av-transfer.itstep.click;
 client_max_body_size 200M;
    location / {
       proxy_pass         http://localhost:5898;
       proxy_http_version 1.1;
       proxy_set_header   Upgrade $http_upgrade;
       proxy_set_header   Connection keep-alive;
       proxy_set_header   Host $host;
       proxy_cache_bypass $http_upgrade;
       proxy_set_header   X-Forwarded-For $proxy_add_x_forwarded_for;
       proxy_set_header   X-Forwarded-Proto $scheme;
    }
}

```

#Додаємо серифікат
```

apt-get update
apt-get install snapd
snap --version

sudo snap install --classic certbot

certbot

```

#Install Jenkins
```

sudo apt update
sudo apt install fontconfig openjdk-21-jre
java -version


sudo wget -O /etc/apt/keyrings/jenkins-keyring.asc https://pkg.jenkins.io/debian-stable/jenkins.io-2026.key
echo "deb [signed-by=/etc/apt/keyrings/jenkins-keyring.asc]" https://pkg.jenkins.io/debian-stable binary/ | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt update
sudo apt install jenkins

sudo systemctl start jenkins
sudo systemctl enable jenkins
sudo systemctl status jenkins

---Change port jenkins---
nano /lib/systemd/system/jenkins.service
 YOURPORT=8080
 PERM="--permanent"
 SERV="$PERM --service=jenkins"
 
 firewall-cmd $PERM --new-service=jenkins
 firewall-cmd $SERV --set-short="Jenkins ports"
 firewall-cmd $SERV --set-description="Jenkins port exceptions"
 firewall-cmd $SERV --add-port=$YOURPORT/tcp
 firewall-cmd $PERM --add-service=jenkins
 firewall-cmd --zone=public --add-service=http --permanent
 firewall-cmd --reload

open 8080 port
open site ip:8080
sudo cat /var/lib/jenkins/secrets/initialAdminPassword

Create admin:
Admin
Admin123!
Valentyn Admin
aaleksandruk2018@gmail.com

sudo chown -R jenkins:www-data /var/www/html
sudo chmod -R 775 /var/www/html

```