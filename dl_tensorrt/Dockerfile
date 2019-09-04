FROM nvcr.io/nvidia/tensorflow:19.08-py3

# install zsh
RUN apt-get update && apt-get install -y \
    zsh \
	git-core && rm -rf /var/lib/apt/lists/*
RUN git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh \
	&& cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc \
	&& chsh -s /bin/zsh

WORKDIR /workspace

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -yq ffmpeg

RUN apt-get install -yq build-essential cmake git libgtk2.0-dev pkg-config libavcodec-dev libavformat-dev libswscale-dev

# install opencv
RUN wget -O opencv.zip https://github.com/Itseez/opencv/archive/3.4.2.zip \
    && unzip opencv.zip \
    && cd opencv-3.4.2 \
    && mkdir build && cd build \
    && cmake -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/local .. \
    && make && make install

RUN curl -sL https://deb.nodesource.com/setup_8.x | bash - \
    && \
    apt-get install -y nodejs python-tk

# avoid pip error
RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py \
    && python3 get-pip.py --force-reinstall \
    && pip3 install ffmpeg-python opencv-python

RUN pip3 config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple

RUN pip3 --no-cache-dir -q install \
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
        configparser==3.5.0

RUN pip3 install jupyter notebook jupyterlab \
    && pip3 install --upgrade notebook \
    && pip3 install lesscpy \
    && pip3 install --upgrade jupyterthemes