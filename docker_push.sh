docker build -t blockchain .

docker tag blockchain:latest 265003810362.dkr.ecr.us-east-1.amazonaws.com/blockchain:latest

docker push 265003810362.dkr.ecr.us-east-1.amazonaws.com/blockchain:latest