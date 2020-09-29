FROM ubuntu:18.04


RUN apt-get update && \
    apt-get install -y curl libcurl4 libssl1.0.0 && \
    rm -rf /var/lib/apt/lists/*
    
RUN curl https://dl.thd.vg/soldat2-linuxserver-release.tar.gz --output soldat-server.tar.gz && \
    mkdir /soldat-server && \
    tar -xzf soldat-server.tar.gz -C /soldat-server

VOLUME /soldat-server/soldat2-linuxserver-release/

WORKDIR /soldat-server/soldat2-linuxserver-release

CMD ./soldat2