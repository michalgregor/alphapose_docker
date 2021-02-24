FROM nvidia/cuda:10.0-devel-ubuntu18.04
WORKDIR "/"
ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Europe/London

RUN apt-get update && \
    apt-get install -y \
    apt-utils \
    git \
    libyaml-dev \
    python3-pip \
    python3-tk \
    libsm-dev \
    libxrender-dev

RUN git config --global user.email "you@example.com" && git config --global user.name "Your Name"
RUN pip3 install pip==19.3.1
RUN apt-get remove -y python3-pip
RUN pip3 install --no-cache-dir cython==0.29.21
RUN pip3 install --no-cache-dir pyyaml==5.2 scipy==1.1.0 pillow==6.2.2 matplotlib==3.3 opencv-python==4.1.2.30
RUN pip3 install --no-cache-dir cython_bbox pycocotools==2.0.2
RUN pip3 install --no-cache-dir torch==1.2.0 torchvision==0.4.0
RUN pip3 install gdown

RUN git clone --depth=1 https://github.com/MVIG-SJTU/AlphaPose.git alphapose-repo
#RUN git pull origin pull/592/head
WORKDIR /alphapose-repo

RUN sed -i "s/install_requires.append('pycocotools==2.0.0')/pass/g" setup.py
RUN python3 setup.py build develop --user

WORKDIR /alphapose

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

