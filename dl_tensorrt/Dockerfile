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

RUN apt-get install build-essential cmake git libgtk2.0-dev pkg-config libavcodec-dev libavformat-dev libswscale-dev

# install opencv
RUN wget -O opencv.zip https://github.com/Itseez/opencv/archive/3.4.2.zip \
    && unzip opencv.zip \
    && cd opencv-3.4.2 \
    && mkdir build && cd build \
    && cmake -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/local .. \
    && make && make install

RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py \
    && python3 get-pip.py --force-reinstall \
    && pip3 install ffmpeg-python opencv-python

#RUN apt-get --fix-missing update && apt-get install -yq python-opencv
#RUN pip3 install ipython jupyter notebook pycuda opencv-python

#CMD ["bash", "-c", "source /etc/bash.bashrc && jupyter notebook --notebook-dir=/tf --ip 0.0.0.0 --no-browser --allow-root --NotebookApp.custom_display_url='http://localhost:8888'"]