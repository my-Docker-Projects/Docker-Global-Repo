#Запуск back/front-end через docker-compose
```

Файл docker-compose.yml

networks:
  transfer_net:
    driver: bridge

services:
  db:
    image: postgres:18.1
    container_name: postgres_db
    restart: always
    ports:
      - "5022:5432"
    environment:
      POSTGRES_DB: ${POSTGRES_DB}
      POSTGRES_USER: ${POSTGRES_USER}
      POSTGRES_PASSWORD: ${POSTGRES_PASSWORD}
    volumes:
      - /data/transfer/postgres:/var/lib/postgresql
    networks:
      - transfer_net
    
  server:
    build: ./WebApiTransfer/transfer-back
    container_name: transfer_api
    restart: always
    volumes:
      - /data/transfer/images:/app/images
    environment:
      ASPNETCORE_ENVIRONMENT: Production
      ConnectionStrings__DefaultConnection: Host=172.31.201.235;Database=mydb;Port=5022;Username=ivan;Password=marko123halosh
    ports:
      - "5898:8080"
    depends_on:
      - db
    networks:
      - transfer_net

  front:
    build: 
      context: ./my-transfer-ts/transfer-front
    container_name: react_front
    depends_on:
      - server
    ports:
      - "3987:80"
    networks:
      - transfer_net

Файл .env

POSTGRES_DB=mydb
POSTGRES_USER=ivan
POSTGRES_PASSWORD=marko123halosh


Запустити усі контейнери у файлі docker-compose
docker compose up -d

Стопанути і видалити усі контейнери запущені через docker-compose
docker compose down --volumes --rmi all

```