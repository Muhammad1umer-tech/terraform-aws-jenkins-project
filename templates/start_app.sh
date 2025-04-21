#!/bin/bash

# Exit script on any error
set -e

# # Go to home directory
cd /home/ubuntu 

# Update and install necessary packages
sudo apt update -y
sudo apt install -y python3 python3-pip git
sudo apt install -y python3.12-venv

# Clone the GitHub repo if it doesn't already exist
if [ ! -d "simple-flask-app-for-cloud" ]; then
  git clone https://github.com/Muhammad1umer-tech/simple-flask-app-for-cloud.git
else
  echo "Repo already exists, skipping clone."
fi

# Give it a moment (optional)
sleep 5

cd simple-flask-app-for-cloud || exit 1

cat <<EOF > .env
DB_HOST=${host}
DB_USERNAME=${username}
DB_PASSWORD=${password}
DB_NAME=${db}
EOF


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

