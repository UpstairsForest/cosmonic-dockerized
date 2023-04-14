# Dockerized Cosmonic Environment

Automated cosmonic installation with Dockerfile and docker-compose


## Usage
1. download docker
2. open terminal in cloned repository
3. create image and start the container
```bash
docker-compose up -d
```
4. open bash inside the container
```bash
docker-compose exec cosmonic bash
```
5. change directory to the volume
```bash
cd /CosmonicProjects
```
6. start the cosmonic tutorial
```bash
cosmo tutorial hello
```