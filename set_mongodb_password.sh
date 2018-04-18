#!/bin/bash

# Reads admin user defined or use default values.
MONGODB_ADMIN_USER=${MONGODB_ADMIN_USER:-"admin"}
MONGODB_ADMIN_PASS=${MONGODB_ADMIN_PASS:-"admin"}

# Wait for MongoDB to boot.
RET=1
while [[ RET -ne 0 ]]; do
    echo "=> Waiting for MongoDB completely initialization..."
    sleep 5
    mongo admin --eval "help" >/dev/null 2>&1
    RET=$?
done

# Creates the admin user.
echo "=> Creating admin user..."
mongo admin --eval "db.createUser({user: '$MONGODB_ADMIN_USER', pwd: '$MONGODB_ADMIN_PASS', roles:[{role:'root',db:'admin'}]});"

sleep 3

# If everything went well, add a file as a flag so we know in the future to not re-create the users if we're recreating the container.
touch /data/db/.mongodb_password_set

echo "MongoDB configured successfully and ready to go!"