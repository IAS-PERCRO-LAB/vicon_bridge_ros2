FROM ros:humble-ros-base

ARG USER=docker
ARG USER_ID=1000
ARG GROUP_ID=1000

# Base dependencies
RUN DEBIAN_FRONTEND=noninteractive apt-get update && \
    apt-get install --no-install-recommends -y \
        vim git build-essential sudo \
        libboost-thread-dev
#    && apt-get -y autoremove && apt-get clean

ENV TZ=Europe/Rome

# Configure normal user with same IDs as in the host
RUN addgroup --gid $GROUP_ID ${USER} && \
    adduser --disabled-password --gecos '' --uid $USER_ID --gid $GROUP_ID ${USER} && \
    adduser ${USER} sudo && \
    echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

USER ${USER}
RUN mkdir -p /home/${USER}/ws /home/${USER}/ws/src
WORKDIR /home/${USER}/ws
ENV ROS2_WS /home/${USER}/ws

# # Setup cmake for Clion
# COPY ./cmake /home/${USER}/cmake

# setup entrypoint
COPY ./entrypoint.sh /
RUN echo "source /entrypoint.sh" >> /home/${USER}/.bashrc

ENTRYPOINT ["/entrypoint.sh"]
CMD ["bash"]

# vim: set et fenc=utf-8 ff=unix ft=dockerfile sts=0 sw=2 ts=2 :
