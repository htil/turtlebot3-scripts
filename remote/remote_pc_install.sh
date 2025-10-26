#!/bin/bash

#Gazebo
sudo apt-get update 
sudo apt-get install ros-humble-ros-gz

# Cartographer
sudo apt install ros-humble-cartographer
sudo apt install ros-humble-cartographer-ros

# Navigation 
sudo apt install ros-humble-navigation2
sudo apt install ros-humble-nav2-bringup

# Turtlebot packages 
source /opt/ros/humble/setup.bash
sudo apt install ros-humble-cartographer
sudo apt install ros-humble-cartographer-ros
sudo apt install ros-humble-navigation2
sudo apt install ros-humble-nav2-bringup

cd ~/ros2_ws/src/
git clone -b humble https://github.com/ROBOTIS-GIT/DynamixelSDK.git
git clone -b humble https://github.com/ROBOTIS-GIT/turtlebot3_msgs.git
git clone -b humble https://github.com/ROBOTIS-GIT/turtlebot3.git

sudo apt install python3-colcon-common-extensions
cd ~/ros2_ws/
colcon build --symlink-install

# Avoid setting static ROS_DOMAIN_ID since we will be using multiple turtlebots
#echo 'export ROS_DOMAIN_ID=30 #TURTLEBOT3' >> ~/.bashrc