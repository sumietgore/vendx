FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

ARG USERNAME=vscode
ARG USER_UID=1000
ARG USER_GID=$USER_UID

RUN groupadd --gid $USER_GID $USERNAME \
    && useradd -s /bin/bash --uid $USER_UID --gid $USER_GID -m $USERNAME \
    && apt-get update \
    && apt-get install -y sudo wget zsh git \
    curl unzip clang cmake pkg-config libfontconfig nano build-essential pkg-config libegl1-mesa-dev \
    libxkbcommon-dev libgles2-mesa-dev libwayland-dev wayland-protocols libdrm-dev libgbm-dev libinput-dev libudev-dev libsystemd-dev && \
    rm -rf /var/lib/apt/lists/* \
    && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME \
    #
    # Clean up
    && apt-get autoremove -y \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*


RUN git clone https://github.com/sony/flutter-elinux.git && \
    mv flutter-elinux /opt/

# ==========> INSTALL zsh <=============
RUN sh -c "$(wget -O- https://github.com/deluan/zsh-in-docker/releases/download/v1.1.5/zsh-in-docker.sh)" -- \
    -t robbyrussell \
    -p git \
    -p ssh-agent \
    -p https://github.com/zsh-users/zsh-autosuggestions \
    -p https://github.com/zsh-users/zsh-completions



RUN echo 'export PATH=$PATH:/opt/flutter-elinux/bin' >> ~/.bashrc
RUN echo "alias run='FLUTTER_ELINUX_CUSTOM_RUN_ARGS="--width=480 --height=800 --window-decoration" flutter-elinux run -d elinux-wayland'"  >> ~/.bashrc

RUN echo 'export PATH=$PATH:/opt/flutter-elinux/bin' >> ~/.zshrc
RUN echo "alias run='FLUTTER_ELINUX_CUSTOM_RUN_ARGS="--width=480 --height=800 --window-decoration" flutter-elinux run -d elinux-wayland'"  >> ~/.zshrc

# Set default shell to Zsh
RUN chsh -s /bin/zsh

ENTRYPOINT [ "/bin/zsh" ]
CMD ["-l"]