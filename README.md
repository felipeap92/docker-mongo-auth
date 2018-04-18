# Customizable MongoDB (Docker)

This project build a docker image for MongoDB with customizable settings like authentication, port and ip bind.

You can clone the project and build a local image or find it on [Docker Cloud](https://cloud.docker.com/swarm/felipeap92/repository/docker/felipeap92/customizable-mongodb)

# Settings
There are a number of optional environment variables which you can specify to customize your MongoDB container. 
  
- With docker-compose.yml
  ```
  services:
    db:
      image: felipeap92/customizable-mongodb:latest
      environment:
        - MONGODB_ENABLE_AUTH=yes
        - MONGODB_ADMIN_USER=admin
        - MONGODB_ADMIN_PASS=adminpass
        - MONGODB_BIND_IP=0.0.0.0
        - MONGODB_PORT=27017
      ports:
        - "27017:27017"
  // more configuration
  ```

- With command line
  ```
  docker run -it \
    -e MONGODB_ENABLE_AUTH=yes \
    -e MONGODB_ADMIN_USER=admin \
    -e MONGODB_ADMIN_PASS=adminpass \
    -e MONGODB_BIND_IP=0.0.0.0 \
    -e MONGODB_PORT=27017 \
    -p 27017:27017 felipeap92/customizable-mongodb:latest
  ```
