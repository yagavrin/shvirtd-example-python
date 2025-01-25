#!/bin/bash
REPO_DIR="/opt/shvirtd-example-python"
REPO_URL="https://github.com/yagavrin/shvirtd-example-python.git"

if [ -d "$REPO_DIR" ]; then
  # If the directory exists, perform a git pull
  echo "Repository exists. Pulling latest changes..."
  cd "$REPO_DIR" && git pull
else
  # If the directory does not exist, perform a git clone
  echo "Repository does not exist. Cloning..."
  git clone "$REPO_URL" "$REPO_DIR" && cd "$REPO_DIR"
fi \
&& docker build -t shvirtd-example-python-web:1.0.0 -f Dockerfile.python . \
&& docker compose up -d
