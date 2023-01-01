# Deploying-Jupyterhub-using-Docker
Deployment Jupyter hub using Docker in VM which runs Ubuntu.
## 1.Create Docker File:
*Write in Text Editor (for ubuntu only)
```
# Get image
FROM jupyterhub/jupyterhub:latest

# Updating system
RUN apt-get -y update

# Installing Jupyter Hub packages
COPY requirements.txt .
RUN python3 -m pip install -r requirements.txt && rm requirements.txt

# Creating user and home directory
RUN useradd -m -d /home/admin -s /bin/bash -p $(openssl passwd -1 admin) admin
```

## 2.Create docker-compose.yml file:
*Write in Text Editor (for ubuntu only)
```
version: "3.9"

services:
    jupyterhub:
        build: .
        ports:
            - "80:8000"
        volumes:
            - data:/home

volumes:
    data:
```
## 3.Build the JupyterHub Docker image
Use docker-compose to build the JupyterHub Docker image:
```
sudo docker-compose build
```
## 4.Run JupyterHub
To run the JupyterHub container
```
sudo docker-compose up 
```
Once the container is running, you should be able to access the JupyterHub console at
```
http://localhost:80
```
To bring down the JupyterHub container:
```
docker-compose down
```
IP address of the virtual machine where Jupyter Hub is deployed: [35.225.207.199](http://35.225.207.199/user/admin/lab)
