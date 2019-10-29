FROM tensorflow/tensorflow:1.15.0-gpu-py3

MAINTAINER zengzihua (edvard_hua@live.com)

# pip source
ENV DOUBAN_SOURCE="https://pypi.douban.com/simple"

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends \
        build-essential \
        libcurl3-dev \
        libfreetype6-dev \
        libzmq3-dev \
        pkg-config \
        python3 \
        python3-pip \
        zlib1g-dev \
        cython \
        unzip \
        zip \
        > /dev/null \
        && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN pip3 --no-cache-dir -q install -i $DOUBAN_SOURCE --upgrade pip setuptools

RUN pip3 --no-cache-dir -q install -i $DOUBAN_SOURCE \
        matplotlib==2.1.0 \
        numpy \
        scipy==1.0.0 \
        pandas==0.21.0 \
        seaborn==0.8.1 \
        simplejson==3.10.0 \
        requests==2.9.1 \
        Pillow==5.2.0 \
        tqdm==4.19.5 \
        tornado==4.5.3 \
        ipython==6.2.1 \
        opencv-python==3.4.1.15 \
        configparser==3.5.0

# install zsh
RUN apt-get update && apt-get install -y \
    zsh \
	git-core && rm -rf /var/lib/apt/lists/*
RUN git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh \
	&& cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc \
	&& chsh -s /bin/zsh

RUN apt-get update && apt-get install -yq python3 python3-dev python3-pip python3-setuptools python3-tk

# Install cocoapi package
RUN pip3 install Cython==0.27.3
COPY cocoapi /cocoapi/
RUN cd /cocoapi/PythonAPI && python3 setup.py build_ext --inplace && python3 setup.py build_ext install


# Clean
RUN rm -rf /tmp/pip \
    && rm -rf /root/.cache

RUN apt-get install -y python-opencv

COPY .config /root/.config/

RUN apt update && apt-get install -yq curl
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash - \
    && \
    apt-get install -y nodejs
RUN pip3 install --upgrade setuptools
RUN pip3 install jupyter notebook jupyterlab
RUN jupyter labextension install jupyterlab_toastify
RUN pip3 install jupyter_contrib_nbextensions && jupyter contrib nbextension install --user
RUN pip3 install jupyter_nbextensions_configurator && jupyter nbextensions_configurator enable --user
RUN pip3 uninstall -y ipython prompt_toolkit && pip3 install ipython prompt_toolkit
COPY .jupyter /root/.jupyter

WORKDIR /workspace
