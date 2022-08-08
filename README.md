## A multi-user JupyterHub docker image
Support multi-user JupyterHub.
Optimized for the network in China.

### Usage:
docker cli:
```bash
docker run -it --name jupyterhub -p 38888:38888 -p 38081:38081 \
        -v <your_jupyterhub_path>/data:/data \
        -e USERS=user1,user2 hezengliang/jupyterhub
```

docker compose:
```yaml
version: "2.7"
services:
  jupyterhub:
    image: hezengliang/jupyterhub
    ports:
      - 38888:38888
      - 38081:38081
    volumes:
      - <your_jupyterhub_path>/data:/data
    environment:
      TZ: Asia/Shanghai
      USERS: user1,user2
    restart: always
```

### Infomation
Default User: jupyter / jupyter  
Enviroment "USERS" indicates all the users in the system, which seperated by comma (',').   
If the user does not exists, then the container will create it. Default password is the same as the username.
