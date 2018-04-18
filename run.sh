#!/bin/bash
set -m

# Cmd command to execute MongoDB with customized configurations.
cmd="mongod"

# Adds authentication settings if it was enabled.
if [ "$MONGODB_ENABLE_AUTH" == "yes" ]; then
    cmd="$cmd --auth"
fi

# Adds bind ip settings if an ip was defined.
if [ -n "$MONGODB_BIND_IP" ]; then
    cmd="$cmd --bind_ip $MONGODB_BIND_IP"
fi

# Changes mongo db port if antoher one was defined.
port=${MONGODB_PORT:-"27017"}
cmd="$cmd --port $port"

$cmd &

# Creates new users if wasn't created before.
if [ ! -f /data/db/.mongodb_password_set ]; then
    /set_mongodb_password.sh
fi

fg