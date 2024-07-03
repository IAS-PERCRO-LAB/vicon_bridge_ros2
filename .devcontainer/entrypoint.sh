#!/bin/bash

# Install libraries, if missing /usr/lib/libViconDataStreamSDK_CPP.so
if [ ! -f /usr/lib/libViconDataStreamSDK_CPP.so ]; then
    echo "Installing Vicon SDK..."
    cd /home/docker/ws/src/ros2-vicon-receiver
    sudo ./install_libs.sh
fi

# Source ros2 environment
source "/opt/ros/humble/setup.bash" --
source "/home/docker/ws/install/local_setup.bash" --
exec "$@"
