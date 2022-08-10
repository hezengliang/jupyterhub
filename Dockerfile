FROM ubuntu:20.04
MAINTAINER hezengliang@hotmail.com
USER root
RUN apt update && apt install -y openssl libssl-dev
ADD ca-certificates_20211016_all.deb /tmp/ca-certificates_20211016_all.deb
RUN dpkg -i /tmp/ca-certificates_20211016_all.deb && \
    rm -f /etc/apt/sources.list && \
    mkdir /root/.pip
ADD pip.conf /root/.pip/pip.conf
ADD sources.list /etc/apt/sources.list
ADD jupyterhub.sh /opt/jupyterhub.sh
RUN apt update && apt install -y sudo curl git && \
    curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash - && \
    apt update && apt install python3 python3-pip curl nodejs libffi-dev vim -y && \
    cd /usr/bin && ln -s python3 python  && \
    npm install -g configurable-http-proxy && \
    pip install -i https://pypi.tuna.tsinghua.edu.cn/simple notebook jupyterhub && \
    mkdir /etc/jupyterhub && chmod 755 /opt/jupyterhub.sh && mkdir -p /data/jupyterhub && chmod -R 777 /data
ADD jupyterhub_config.py /etc/jupyterhub/jupyterhub_config.py
# RUN pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple
ADD requirements.txt /opt/requirements.txt
ADD plugins.sh /opt/plugins.sh
RUN pip install jupyterlab astroid && \
    chmod +x /opt/plugins.sh && \
    /opt/plugins.sh
VOLUME ["/data"]
WORKDIR /data
EXPOSE 38888/tcp
EXPOSE 38081/tcp
ENTRYPOINT ["/opt/jupyterhub.sh"]
