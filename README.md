# Vicon bridge for ROS 2

**vicon_bridge_ros2** is a ROS 2 package, written in C++, that retrieves data from Vicon software and publishes it on ROS 2 topics.

The code is partly derived from a mixture of [Vicon-ROS2](https://github.com/aheuillet/Vicon-ROS2) and [Vicon bridge](https://github.com/ethz-asl/vicon_bridge) and [ros2-vicon-receiver](https://github.com/OPT4SMART/ros2-vicon-receiver).

This is NOT an official ROS 2 package, but at the moment there is none.

## Requirements

### Base dependencies

ROS 2 (obviously) needs to be installed (follow the instructions at the [ROS 2 website](https://index.ros.org/doc/ros2/Installation/)).

Then:
```
sudo apt install -y python3-colcon-common-extensions build-essential libbost-thread-dev
```

### Datastream SDK

The Datastream SDK libraries are required to be installed in the system. You can find them on [the official website](https://www.vicon.com/software/datastream-sdk/?section=downloads), but the needed files are copied in `DataStreamSDK_1.12.0` for reference.

This package is shipped with ViconDataStreamSDK_1.12_145507h (the latest version at the time of writing).
If you are running Linux x64 and you want to install them, run `./install_libs.sh`.

## Quick start

### Building the package

:warning: Do not forget to source the ROS 2 workspace: `source /opt/ros/humble/setup.bash`.

Add this repo in the `src` directory of your ROS2 workspace, then build it with
```
cd <your_ws>
colcon build --symlink-install
```

### Running the program

Open a new terminal and source the project workspace:
```
source <your_ws>/install/setup.bash
```

To run the program, use the [launch file template](vicon_bridge/launch/client.launch.py) provided in the package.
First, open the file and edit the parameters.

Running `colcon build` is not needed because of the `--symlink-install` option previously used.
Now you can the program with
```
ros2 launch vicon_bridge client.launch.py
```

### Information on ROS 2 topics and messages

The **vicon_bridge_ros2** package creates a topic for each segment in each subject with the pattern `namespace/subject_name/segment_name`. Information is published on the topics as soon as new data is available from the vicon client (typically at the vicon client frequency). The message type [PoseStamped](https://docs.ros2.org/latest/api/geometry_msgs/msg/PoseStamped.html) is used.

Example: suppose your namespace is the default `vicon` and you have two subjects (`subject_1` and `subject_2`) with two segments each (`segment_1` and `segment_2`). Then **vicon_bridge_ros2** will publish [PoseStamped](https://docs.ros2.org/latest/api/geometry_msgs/msg/PoseStamped.html) messages on the following topics:
```
vicon/subject_1/segment_1
vicon/subject_1/segment_2
vicon/subject_2/segment_1
vicon/subject_2/segment_2
```

## Constributors
**ros2-vicon-receiver** is developed by
[Andrea Camisa](https://www.unibo.it/sitoweb/a.camisa),
[Andrea Testa](https://www.unibo.it/sitoweb/a.testa),
[Giuseppe Notarstefano](https://www.unibo.it/sitoweb/giuseppe.notarstefano).

This repo starts from a fork of **ros2-vicon-receiver** and is developed and maintened by [Michael Mugnai](https://maik93.github.io/)
