FROM ubuntu:24.04 AS astrotuxlauncher
USER root
#更换源
RUN sed -i 's|http://archive.ubuntu.com|https://mirrors.tencentyun.com|g' /etc/apt/sources.list.d/ubuntu.sources && \
    sed -i 's|security.ubuntu.com|mirrors.tencentyun.com|g' /etc/apt/sources.list.d/ubuntu.sources
#禁用证书验证
RUN touch /etc/apt/apt.conf.d/99verify-peer.conf && \
    echo >>/etc/apt/apt.conf.d/99verify-peer.conf "Acquire { https::Verify-Peer false }"
WORKDIR /astrotuxlauncher
ENV TZ=Asia/Shanghai
ENV PYTHONUNBUFFERED=1
ENV PIP_INDEX_URL=https://pypi.tuna.tsinghua.edu.cn/simple
RUN apt-get update && apt-get install -y git python3 python3-pip wine && rm -rf /var/lib/apt/lists/* && ln -sf python3 /usr/bin/python
RUN git clone https://github.com/mekumiao/AstroTuxLauncher ./
RUN pip install -r requirements.txt --break-system-packages
COPY --chmod=0755 entrypoint.sh /usr/bin/entrypoint.sh
ENTRYPOINT /usr/bin/entrypoint.sh
