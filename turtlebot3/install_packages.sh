#!/bin/bash

sudo apt install python3-argcomplete python3-colcon-common-extensions libboost-system-dev build-essential
sudo apt install ros-humble-hls-lfcd-lds-driver
sudo apt install ros-humble-turtlebot3-msgs
sudo apt install ros-humble-dynamixel-sdk
sudo apt install ros-humble-xacro
sudo apt install libudev-dev
mkdir -p ~/turtlebot3_ws/src && cd ~/turtlebot3_ws/src
git clone -b humble https://github.com/ROBOTIS-GIT/turtlebot3.git
git clone -b humble https://github.com/ROBOTIS-GIT/ld08_driver.git
git clone -b humble https://github.com/ROBOTIS-GIT/coin_d4_driver
cd ~/turtlebot3_ws/src/turtlebot3
rm -r turtlebot3_cartographer turtlebot3_navigation2
cd ~/turtlebot3_ws/
#echo 'source /opt/ros/humble/setup.bash' >> ~/.bashrc
colcon build --symlink-install --parallel-workers 1
#echo 'source /home/csc/turtlebot3_ws/install/setup.bash' >> ~/.bashrc
#source /home/csc/.bashrc
#source /home/csc/turtlebot3_ws/install/setup.bash
sudo cp `ros2 pkg prefix turtlebot3_bringup`/share/turtlebot3_bringup/script/99-turtlebot3-cdc.rules /etc/udev/rules.d/
sudo udevadm control --reload-rules
sudo udevadm trigger
#echo 'export LDS_MODEL=LDS-01' >> ~/.bashrc
#source /home/csc/.bashrc
#export LDS_MODEL=LDS-01
echo "Remember to setup ROS_DOMAIN_ID"
echo "See https://emanual.robotis.com/docs/en/platform/turtlebot3/sbc_setup/#sbc-setup"