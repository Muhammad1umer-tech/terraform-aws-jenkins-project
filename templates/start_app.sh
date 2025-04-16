#!/bin/bash

# Exit script on any error
set -e

# Go to home directory
cd /home/ubuntu || exit 1

# Update and install necessary packages
sudo apt update -y
sudo apt install -y python3 python3-pip git

# Clone the GitHub repo if it doesn't already exist
if [ ! -d "python-mysql-db-proj-1" ]; then
  git clone https://github.com/rahulwagh/python-mysql-db-proj-1.git
else
  echo "Repo already exists, skipping clone."
fi

# Give it a moment (optional)
sleep 20

cd python-mysql-db-proj-1 || exit 1

# Create a virtual environment
python3 -m venv venv
sleep 5
# Activate the environment
source venv/bin/activate

# Then install requirements
pip install -r requirements.txt

echo "Waiting for 30 seconds before running the app.py"
sleep 30

setsid python3 -u app.py > app.log 2>&1 &

echo "App started in background"

