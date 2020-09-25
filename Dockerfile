FROM ubuntu:18.04

RUN apt-get update && \
    apt-get install -y curl libcurl4 libssl1.0.0 && \
    rm -rf /var/lib/apt/lists/*
    
RUN curl https://dl.thd.vg/soldat2-linuxserver-release.tar.gz --output soldat-server.tar.gz && \
    mkdir /soldat-server && \
    tar -xzf soldat-server.tar.gz -C /soldat-server

#Symbolic links for configuration files.
RUN mkdir /soldat-configs && \
    mv /soldat-server/soldat2-linuxserver-release/Configs /soldat-configs/Configs && \
    mv /soldat-server/soldat2-linuxserver-release/Cycles /soldat-configs/Cycles && \
    mv /soldat-server/soldat2-linuxserver-release/Data /soldat-configs/Data && \
    mv /soldat-server/soldat2-linuxserver-release/Levels /soldat-configs/Levels && \
    mv /soldat-server/soldat2-linuxserver-release/Modifiers /soldat-configs/Modifiers && \
    ln -s /soldat-configs/Configs /soldat-server/soldat2-linuxserver-release/Configs && \
    ln -s /soldat-configs/Cycles /soldat-server/soldat2-linuxserver-release/Cycles && \
    ln -s /soldat-configs/Data /soldat-server/soldat2-linuxserver-release/Data && \
    ln -s /soldat-configs/Levels /soldat-server/soldat2-linuxserver-release/Levels && \
    ln -s /soldat-configs/Modifiers /soldat-server/soldat2-linuxserver-release/Modifiers 

VOLUME /soldat-configs

WORKDIR /soldat-server/soldat2-linuxserver-release

CMD ./soldat2