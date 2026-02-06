#!/bin/bash
set -e  # зупиняє скрипт при помилці

# ==== WEB ====
cd my-transfer-ts\transfer-fromt
docker build -t transfer-react .
docker tag transfer-react:latest avalentyn/transfer-react:latest
docker push avalentyn/transfer-react:latest
echo "Done ---client---!"

# ==== API ====
cd ..\WebApiTransfer\transfer-back
docker build -t transfer-api .
docker tag transfer-api:latest avalentyn/transfer-api:latest
docker push avalentyn/transfer-api:latest

echo "Done ---api---!"

read -p "Press any key to exit..."
 