# Get image
FROM jupyterhub/jupyterhub:latest

# Updating system
RUN apt-get -y update

# Installing Jupyter Hub packages
COPY requirements.txt .
RUN python3 -m pip install -r requirements.txt && rm requirements.txt

# Creating user and home directory
RUN useradd -m -d /home/admin -s /bin/bash -p $(openssl passwd -1 admin) admin

