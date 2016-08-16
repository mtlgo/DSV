docker service create --name redis --constraint 'node.role == worker' --replicas=2 --publish 6379:6379 redis:alpine
docker service create --name nginx --constraint 'node.role == worker' --replicas=2 --publish 8080:80 nginx:alpine
mkdir /opt/registry
chmod 777 /opt/registry
docker service create --name registry --constraint 'node.role == manager' --replicas=1 --publish 5000:5000 --mount src=/opt/registry,dst=/tmp/registry-dev registry
