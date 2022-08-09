#!/bin/bash
docker rm jupyterhub
docker run -it --name jupyterhub -p 38888:38888 -p 38081:38081 \
	-v data:/data \
	-e USERS=user1,user2 hezengliang/jupyterhub
