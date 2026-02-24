# 1. Option root conection
```

sudo su
sudo nano /etc/ssh/sshd_config 
Знайти #PermitRootLogin... -> PermitRootLogin yes
sudo service ssh restart

nano ~/.ssh/authorized_keys

-----REMOVE All xt to ssh-rsa (стерти всеь текст до ssh-rsa)-----

systemctl restart ssh 
------Тепер можна конектитися через моду із root------
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
       proxy_pass         http://localhost:3987;
       proxy_http_version 1.1;
       proxy_set_header   Upgrade $http_upgrade;
       proxy_set_header   Connection keep-alive;
       proxy_set_header   Host $host;
       proxy_cache_bypass $http_upgrade;
       proxy_set_header   X-Forwarded-For $proxy_add_x_forwarded_for;
       proxy_set_header   X-Forwarded-Proto $scheme;
    }
	
	location /api/ {
       proxy_pass         http://localhost:5898;
       proxy_http_version 1.1;
       proxy_set_header   Upgrade $http_upgrade;
       proxy_set_header   Connection keep-alive;
       proxy_set_header   Host $host;
       proxy_cache_bypass $http_upgrade;
       proxy_set_header   X-Forwarded-For $proxy_add_x_forwarded_for;
       proxy_set_header   X-Forwarded-Proto $scheme;
    }
	
	location /swagger/ {
       proxy_pass         http://localhost:5898;
       proxy_http_version 1.1;
       proxy_set_header   Upgrade $http_upgrade;
       proxy_set_header   Connection keep-alive;
       proxy_set_header   Host $host;
       proxy_cache_bypass $http_upgrade;
       proxy_set_header   X-Forwarded-For $proxy_add_x_forwarded_for;
       proxy_set_header   X-Forwarded-Proto $scheme;
    }
	
	location /images/ {
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

sudo systemctl restart nginx

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
 
sudo cat /var/lib/jenkins/secrets/initialAdminPassword

Create admin:
Admin
Admin123!
Valentyn Admin
aaleksandruk2018@gmail.com

---Необов'язково (використовувалось в конкретному прикладі)---
sudo chown -R jenkins:www-data /var/www/html
sudo chmod -R 775 /var/www/html

```

#Kubernetes
```

https://kubernetes.io/docs/tasks/tools/

---- 1. Установка kubectl
Керування локальним або відаленим кластером
kubectl - це клієнт для взаємодії із кластером.
----Install ubuntu----
kubectl

curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"

curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256"

echo "$(cat kubectl.sha256)  kubectl" | sha256sum --check

sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

kubectl version --client

kubectl version --client --output=yaml


---- 2. ---Встановлення minikube---

https://minikube.sigs.k8s.io/docs/start/?arch=%2Fwindows%2Fx86-64%2Fstable%2F.exe+download

curl -LO https://github.com/kubernetes/minikube/releases/latest/download/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube && rm minikube-linux-amd64

minikube version

kubectl version --client

docker --version

docker ps -a

docker login

docker run -p 8089:80 -d nginx

docker ps

http://localhost:8089

docker stop 5ed52d8c218a

docker rm 5ed52d8c218a


---- 3. ---Start minikube---

https://minikube.sigs.k8s.io/docs/start/?arch=%2Fwindows%2Fx86-64%2Fstable%2F.exe+download

Список усіх підтримуваних віртуалок для minicube
https://minikube.sigs.k8s.io/docs/drivers/

minikube help

minikube status

-----Створення кластера міні куб на docker-------
-----перед цим потрібно перепідєднатись під звичайним коистувачем (ubuntu), не під root
minikube start

docker ps -a

minikube status


---- 4. ----Підключення до minikube----

kubectl version
//Важливо, щоб версія 1.35 + - 1 під версія
//kubectl - звязаний із кластером kubernetis
--Client Version: v1.35.0
--Kustomize Version: v5.7.1
--Server Version: v1.35.0

kubectl cluster-info

kubectl cluster-info dump - проблеми в середині кластера

minikube kubectl - список доступних команд для kubectl

minikube kubectl version - в середині minikube - було встановлено kubectl

minikube kubectl cluster-info


---- 5. ----Kubectl alaias----

alias k=kubectl

k get pods

minikube kubectl get pods

alias kubectl="minikube kubectl --"


---- 6. ----Kubectl nodes----

alias k=kubectl

k get nodes

control-plane - мастер нода

k get pods

k get namespace

default           Active   83m - поди тут немає запудених
kube-node-lease   Active   83m
kube-public       Active   83m
kube-system       Active   83m - тут запущені ноди

//Тут можна глянуди сервіси, які працють на master node
k get pods --namespace=kube-system 


---- 7. Підключення nodes

alias k=kubectl

minikube ip

ping 192.168.49.2

ssh root@192.168.49.2

//Потрапляємо в середину node - яка працює в середині контейнера docker
minikube ssh

//які контейнери запущені в середині кластера kubernatis в середині ноди
docker ps

Усі контейнери є службові

exit


---- 8. Створення pods

alias k=kubectl

docker version

minikube ssh

docker version

нода курбернетів незалежна від компютера на якому запущена

- два різних докера на ПК і у середині ноди

exit

k get pods

//в одному pod мжона зпускати декілька контейнерів, якщо вони звязані одни з одним

k run my-nginx-pod --image=nginx

k get pods

//усі деталі про запущений pod
k describe pod my-nginx-pod

//інформація IP:               10.244.0.8

k get pods

//пінгуватися не буде - тому, що він працює в середині контейнра minikube
ping 10.244.0.8

//заходимо в середину контейнера
minikube ssh

ping 10.244.0.8

//перевіряємо доступність веб-сервісу
curl 10.244.0.8

docker ps | grep nginx

//показує - 2 контейнера у яких є nginx - 1 - це ngix
// 2 - це pos container - він створюється для кожного pod - який ми створюємо
// 2 - для резервації ресурсій для певного pod - тому, що контейнера
// може бути заменений, зупинений, - ресурси мають бути не зміними

//Зайдемо в середину контейнера nginx
docker exec -it d8e23bfddd28 sh

hostname

hostname -I

ls /usr/share/nginx/html

cat /usr/share/nginx/html/index.html

exit

exit


---- 9. Прцюємо з nods

alias k=kubectl

//детальна інформація про pods
k get pods -o wide

ping 10.244.0.8

curl 10.244.0.8

k delete pod my-nginx-pod

k get pods

k run my-nginx-pod --image=nginx

k get pods

k get pods -o wide

k delete pod my-nginx-pod

k get pods


---- 10. Створення Deployment pod

alias k=kubectl

k get pods

k create deployment my-nginx-deploy --image=nginx

k get pods

k describe deploy my-nginx-deploy

k get pods

k describe pod my-nginx-deploy-6d777655c4-rhcxc

// Збільшимо кількість pods для my-nginx-deploy - це кількість реплік

k get deploy

k get pods
//збільшує кількість pods - до 3 у даному deploy
k scale deploy my-nginx-deploy --replicas=3

k get pods

// Збільшимо до 10
k scale deploy my-nginx-deploy --replicas=10

k get pods

k scale deploy my-nginx-deploy --replicas=4

k get pods

k describe deploy my-nginx-deploy

k scale deploy my-nginx-deploy --replicas=10

k describe deploy my-nginx-deploy

//Наші бажання
Replicas:               10 desired | 10 updated | 10 total | 4 available | 6 unavailable

k get pods

// Отриваємо доступ до IP у середині MINIKIUBE

k get pods -o wide
// заходимо в minikube
minikube ssh

ping 10.244.0.19

curl 10.244.0.19

exit

k get pods -o wide

k get pods

k delete pod my-nginx-deploy-6d777655c4-wqks5

автоматично запуститься новий под

```

#Робота з minikube - Офіційна документація
```

https://kompose.io/getting-started/

//If you don’t already have a Kubernetes cluster running, minikube is the best way to get started.

$ minikube start

Starting local Kubernetes v1.7.5 cluster...
Starting VM...
Getting VM IP address...
Moving files into cluster...
Setting up certs...
Connecting to cluster...
Setting up kubeconfig...
Starting cluster components...
Kubectl is now configured to use the cluster

$ sudo snap install kompose

//Download an example https://raw.githubusercontent.com/kubernetes/kompose/main/examples/compose.yaml file, or use your own:

$ wget https://raw.githubusercontent.com/kubernetes/kompose/main/examples/compose.yaml

//Перейменувати compose.yaml => docker-compose.yaml

//Run kompose convert in the same directory as your compose.yaml file.

$ kompose convert

INFO Kubernetes file "frontend-service.yaml" created
INFO Kubernetes file "redis-leader-service.yaml" created
INFO Kubernetes file "redis-replica-service.yaml" created
INFO Kubernetes file "frontend-deployment.yaml" created
INFO Kubernetes file "redis-leader-deployment.yaml" created
INFO Kubernetes file "redis-replica-deployment.yaml" created

//If you’re using minikube you may access it via the minikube service command.
$ minikube service frontend

//Otherwise, use kubectl to see what IP the service is using:

$ kubectl describe svc frontend

Name:                   frontend
Namespace:              default
Labels:                 service=frontend
Selector:               service=frontend
Type:                   LoadBalancer
IP:                     10.0.0.183
LoadBalancer Ingress:   123.45.67.89
Port:                   80      80/TCP
NodePort:               80      31144/TCP
Endpoints:              172.17.0.4:80
Session Affinity:       None
No events.

//If you have yet to expose your service (for example, within GCE), use the command:
kubectl expose deployment frontend --type="LoadBalancer"

//To check functionality, you may also curl the URL.

$ curl http://123.45.67.89

```