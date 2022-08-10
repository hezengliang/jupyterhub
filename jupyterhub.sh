#!/bin/bash
echo "All the external user: $USERS"
# default group
groupadd jupyter
# default user
useradd -d /data/jupyter  -m jupyter -g jupyter
echo -e "jupyter\njupyter" | passwd jupyter

IFS=','
read -ra splitUsers <<< "$USERS"
for oneUser in "${splitUsers[@]}"; do
    if id -u ${oneUser} >/dev/null 2>&1 ; then
        echo "User ${oneUser} exists."
    else
        echo "Create user ${oneUser}."
	groupadd ${oneUser}
	useradd -d /data/${oneUser} -s /bin/bash -m ${oneUser} -g ${oneUser} -G jupyter
	echo -e "${oneUser}\n${oneUser}" | passwd ${oneUser}
    fi
done
IFS=''

node -v
python -V

pip install -r /opt/requirements.txt
jupyterhub -f /etc/jupyterhub/jupyterhub_config.py
