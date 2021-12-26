FROM ubuntu:20.04

RUN export DEBIAN_FRONTEND="noninteractive" && \
    apt update && \
    apt-get install -y \
    --no-install-recommends \
    curl \
    apt-transport-https \
    gnupg \
    ca-certificates && \
    apt-get autoclean && \
    apt-get autoremove;

RUN echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list; \
    curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -;

RUN export DEBIAN_FRONTEND="noninteractive" && \
    apt update && \
    apt-get install -y \
    --no-install-recommends \
    google-cloud-sdk && \
    apt-get autoclean && \
    apt-get autoremove;