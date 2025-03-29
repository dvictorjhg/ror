#!/bin/bash

echo "Starting entrypoint script ($0)..."
source ~/.bashrc

echo "Environment variables:"
env | sort
echo "Running as user: $(id)"
echo "Current directory: $(pwd)"
echo "Current directory contents:"
ls -la

sudo chown -R rails:rails "$BASE_PATH"

cd "$BASE_PATH"/src
if ! bundle _1.17.3_ check; then
    bundle _1.17.3_ install
fi

# Check if migrations table exists and create database if needed
if ! bin/rake db:migrate:status &>/dev/null; then
    echo "Schema migrations table does not exist. Setting up database..."
    bin/rake db:setup
elif bin/rake db:migrate:status | grep -qE '^\s*down\s+'; then
    echo "Pending migrations detected. Running migrations..."
    bin/rake db:migrate
else
    echo "No pending migrations."
fi

if [ -f tmp/pids/server.pid ]; then
  echo "Removing stale server PID file..."
  rm -f tmp/pids/server.pid
fi

exec "$@"
