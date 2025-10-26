#!/bin/bash

# Turtlebot SBC
source /opt/ros/humble/setup.bash
source ~/turtlebot3_ws/install/setup.bash

# Setup ROS_DOMAIN_ID
export ROS_DOMAIN_ID=30
 
# ROS Middleware
export RMW_IMPLEMENTATION=rmw_fastrtps_cpp  

# Start bringup program [Turtlebot SBC]
export TURTLEBOT3_MODEL=burger
ros2 launch turtlebot3_bringup robot.launch.py