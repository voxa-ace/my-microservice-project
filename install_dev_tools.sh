#!/bin/bash

echo "🔧 Checking and installing DevOps tools..."

# Docker
if ! command -v docker &> /dev/null; then
  echo "🧱 Installing Docker..."
  sudo apt update
  sudo apt install -y docker.io
  sudo systemctl start docker
  sudo systemctl enable docker
else
  echo "✅ Docker is already installed"
fi

# Docker Compose
if ! command -v docker-compose &> /dev/null; then
  echo "🧱 Installing Docker Compose..."
  sudo apt install -y docker-compose
else
  echo "✅ Docker Compose is already installed"
fi

# Python
if ! command -v python3 &> /dev/null; then
  echo "🧱 Installing Python..."
  sudo apt install -y python3 python3-pip
else
  echo "✅ Python is already installed"
fi

# Django
if ! python3 -m django &> /dev/null; then
  echo "🧱 Installing Django..."
  pip3 install django
else
  echo "✅ Django is already installed"
fi

echo "🎉 Installation completed!"


