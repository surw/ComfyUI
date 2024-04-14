FROM nvidia/cuda:11.8.0-devel-ubuntu22.04
ARG PYTHON_VERSION=3.10.6
RUN apt update -y && apt install curl git make build-essential ffmpeg libedit-dev libssl-dev zlib1g-dev libreadline-dev libbz2-dev libsqlite3-dev wget curl llvm libncurses5-dev build-essential liblzma-dev -y && curl https://pyenv.run | bash
RUN wget https://www.python.org/ftp/python/$PYTHON_VERSION/Python-$PYTHON_VERSION.tgz
RUN tar -xvf Python-$PYTHON_VERSION.tgz
RUN cd Python-$PYTHON_VERSION && ./configure --enable-optimizations && make && make install

WORKDIR /app

# RUN pip3 install torch==2.2.2+cu121 torchvision torchaudio --index-url https://download.pytorch.org/whl/cu121

COPY ./entrypoint.sh /entrypoint.sh
ENTRYPOINT [ "/entrypoint.sh" ] 