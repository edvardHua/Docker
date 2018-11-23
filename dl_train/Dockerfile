FROM tensorflow/tensorflow:latest-gpu

MAINTAINER zengzihua (edvard_hua@live.com)

# pip source
ENV DOUBAN_SOURCE="https://pypi.douban.com/simple"
ENV CUDNN_VERSION=7.3.1.20-1+cuda9.0
ENV TENSORFLOW_VERSION=1.11.0

RUN apt-get update && apt-get install -y --no-install-recommends \
        build-essential \
        libcurl3-dev \
        libfreetype6-dev \
        libpng12-dev \
        libzmq3-dev \
        libcudnn7=${CUDNN_VERSION} \
        pkg-config \
        python3 \
        python3-pip \
        zlib1g-dev \
        cython \
        > /dev/null \
        && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN pip3 --no-cache-dir -q install -i $DOUBAN_SOURCE --upgrade pip setuptools

RUN pip3 --no-cache-dir -q install -i $DOUBAN_SOURCE \
        matplotlib==2.1.0 \
        numpy==1.13.3 \
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

RUN pip3 --no-cache-dir -q install -i $DOUBAN_SOURCE tensorflow-gpu==${TENSORFLOW_VERSION}

# Clean
RUN rm -rf /tmp/pip \
    && rm -rf /root/.cache

RUN apt-get install -y python-opencv

COPY .config /root/.config/

# Training default setting
ENV SCRIPT_PATH="/workspace/src/train.py" \
    BASE_PATH="/root" \
    LOG_PATH="/log" \
    PARAMETERS_FILE=""

WORKDIR $BASE_PATH

CMD cd $BASE_PATH && env DISPLAY=0.0 python3 $SCRIPT_PATH $PARAMETERS_FILE & tensorboard --logdir=$LOG_PATH
