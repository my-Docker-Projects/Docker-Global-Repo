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

(docker hub password - JCCpKds9hVuA8WJ)

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

#Pull and run prokect ASP.NET Core with Docker Hub
```

docker images
docker pull avalentyn/one-mvc-project
dokcer images

docker run -d --restart=no --name one-mvc-container -p 4242:8080 avalentyn/one-mvc-project:latest
docker ps -a

```

#Pull postgres image run container Ubuntu-24.04
```

docker pull postgres:17.7
docker images

docker run --name container-postgres \
 --restart=always \
 -e POSTGRES_PASSWORD=p%rSDj4Imds07djc**dmUntdOidd3dZ_#WTi4B9Zo \
 -e POSTGRES_USER=halosh \
 -p 5024:5432 \
 -d postgres:17.7

```

#Підключення до контейнера
```

docker exec -it [id] [command]
docker exec -it 243e /bin/bash

#Вихід із контейнера
exit

```

#docker database
```

docker pull postgres:18.1

docker run --name container-postgres \
 --restart=always \
 -e POSTGRES_PASSWORD=mimi45Wh**xaxalala \
 -e POSTGRES_USER=halosh \
 -p 5028:5432 \
 -d postgres:18.1

Глянемо, що в докер контейнері, бо volume не працює. Помилка шляху.

docker exec -it <container_name_or_id> bash
визначили шлях до папки /var/lib/postgresql

docker run --name container-postgres \
 --restart=always \
 -e POSTGRES_PASSWORD=mimi45Wh**xaxalala \
 -e POSTGRES_USER=halosh \
 -p 5028:5432 \
 -v /data/postgresql/data:/var/lib/postgresql \
 -d postgres:18.1
 

```

#Docker command
```

docker logs [id]

```

#test
