ARG PYTHON_CUDA_VERSION=1.0.0

FROM xandai/python-cuda:${PYTHON_CUDA_VERSION}

ARG NODE_REPO_SCRIPT_URL='https://deb.nodesource.com/setup_10.x'
ARG NODE_VERSION='10.15.3-1nodesource1'
ARG JUPYTERHUB_VERSION='0.9.4'
ARG NOTEBOOK_VERSION='5.7.6'
ARG CONFIGURABLE_HTTP_PROXY_VERSION='4.0.1'

RUN apt-get update &&\
    apt-get install -y --no-install-recommends curl lsb-release &&\
    curl -sL $NODE_REPO_SCRIPT_URL | bash - &&\
    apt-get install -y --no-install-recommends nodejs=$NODE_VERSION &&\
    rm -rf /var/lib/apt/lists/* &&\
    python3 -m pip install --no-cache-dir jupyterhub==$JUPYTERHUB_VERSION &&\
    npm install -g configurable-http-proxy@$CONFIGURABLE_HTTP_PROXY_VERSION &&\
    python3 -m pip install --no-cache-dir notebook==$NOTEBOOK_VERSION &&\
    mkdir -p /opt/jupyterhub

WORKDIR /opt/jupyterhub

EXPOSE 8000

# TODO:
# JUPYTERHUB HTTPS
