FROM pytorch/pytorch:1.5-cuda10.1-cudnn7-runtime

ARG DEBIAN_FRONTEND=noninteractive

# COPY sources.list /etc/apt
COPY .oh-my-zsh /root/.oh-my-zsh

RUN pip config set global.index-url https://mirrors.cloud.tencent.com/pypi/simple

RUN apt-get update && \
    apt-get install -yq vim curl git zsh cmake && \
    curl -sL https://deb.nodesource.com/setup_12.x | bash - && \
    apt-get install -yq nodejs

RUN sh /root/.oh-my-zsh/tools/install.sh

RUN pip install jupyterlab \
                IPython \
                face_alignment \
                opencv-python \
                Pillow \
                matplotlib \
                porsche

RUN apt-get update && apt-get install -yq g++ 

RUN apt-get update && apt-get install -yq python-opencv zip unzip

RUN git clone https://github.com/davisking/dlib.git && \
    cd dlib && \
    git checkout v19.21 && \
    python3 setup.py install


COPY sources.list /etc/apt
