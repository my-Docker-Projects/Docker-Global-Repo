# Build Docker image in ubuntu

```

wsl --list --verbose
#Запуск Ubuntu-24.04
wsl -d Ubuntu-24.04

#Вихід (дія "назад") із mc CTRL + O
mc

ifconfig

#Клонування проєкта на сервер
git clone https://github.com/my-Docker-Projects/Docker-OneMVCProject.git

#Перейтии за вказаним шляхом
cd Docker-OneMVCProject/Classwork/Projects/OneMVCProject

#Перегяд файлів які розташовані за вказаним шляхом
ls

#Перегляд існуючих images на данаий момент
docker images

#Створення image
docker build -t one-mvc-project .

#Перед цим залогінитись у hub.docker.com
docker login

#Створення тега
#tag - це назва репозиторія на hub.docker.com
docker tag one-mvc-project:latest avalentyn/one-mvc-project:latest

docker images

#Запушити image на hub.docker.com
docker push avalentyn/one-mvc-project:latest

#Видалити image
docker rmi avalentyn/one-mvc-project:latest
docker rmi one-mvc-project

#Перегляд існуючих контейнерів
docker ps -a

#Зупинити контейнер якщо він запущений
docker stop [id]

#Видалити контейнер по id
docker rm [id]

```