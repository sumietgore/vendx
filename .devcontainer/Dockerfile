FROM ubuntu:20.04

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update

RUN apt-get install -y curl unzip git clang cmake pkg-config libfontconfig nano build-essential pkg-config libegl1-mesa-dev \
    libxkbcommon-dev libgles2-mesa-dev libwayland-dev wayland-protocols libdrm-dev libgbm-dev libinput-dev libudev-dev libsystemd-dev && \
    rm -rf /var/lib/apt/lists/* && \
    apt-get clean

RUN git clone https://github.com/sony/flutter-elinux.git && \
    mv flutter-elinux /opt/

# ==========> INSTALL zsh <=============
RUN sh -c "$(wget -O- https://github.com/deluan/zsh-in-docker/releases/download/v1.1.5/zsh-in-docker.sh)" -- \
    -t https://github.com/denysdovhan/spaceship-prompt \
    -a 'SPACESHIP_PROMPT_ADD_NEWLINE="false"' \
    -a 'SPACESHIP_PROMPT_SEPARATE_LINE="false"' \
    -p git \
    -p ssh-agent \
    -p https://github.com/zsh-users/zsh-autosuggestions \
    -p https://github.com/zsh-users/zsh-completions



RUN echo 'export PATH=$PATH:/opt/flutter-elinux/bin' >> ~/.bashrc

CMD ["/bin/bash"]