#!/bin/bash
CWD=`pwd`
docker rm jupyterhub
docker run -it --name jupyterhub -p 38888:38888 -p 38081:38081 \
	-v ${CWD}/data:/data \
 	--mount type=bind,source=${CWD}/requirements.txt,destination=/opt/requirements.txt \
  	-e USERS=user1,user2 hezengliang/jupyterhub
