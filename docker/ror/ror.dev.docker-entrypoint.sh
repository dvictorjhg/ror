#!/bin/bash

echo "Starting entrypoint script ($0)..."
source ~/.bashrc

echo "Environment variables:"
env | sort
echo "Running as user: $(id)"
echo "Current directory: $(pwd)"
echo "Current directory contents:"
ls -la

if [ -f tmp/pids/server.pid ]; then
  echo "Removing stale server PID file..."
  rm -f tmp/pids/server.pid
fi

exec "$@"
