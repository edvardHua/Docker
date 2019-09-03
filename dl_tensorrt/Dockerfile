FROM nvcr.io/nvidia/tensorflow:19.08-py3

# install zsh
RUN apt-get update && apt-get install -y \
    zsh \
	git-core && rm -rf /var/lib/apt/lists/*
RUN git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh \
	&& cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc \
	&& chsh -s /bin/zsh

WORKDIR /workspace

RUN pip3 install ipython jupyter notebook pycuda

#CMD ["bash", "-c", "source /etc/bash.bashrc && jupyter notebook --notebook-dir=/tf --ip 0.0.0.0 --no-browser --allow-root --NotebookApp.custom_display_url='http://localhost:8888'"]