#!/bin/bash

# Turtlebot SBC

# Setup ROS_DOMAIN_ID change ID based on robot
export ROS_DOMAIN_ID=30
 
# ROS Middleware
export RMW_IMPLEMENTATION=rmw_fastrtps_cpp  

# Start bringup program [Turtlebot SBC]
export TURTLEBOT3_MODEL=burger
ros2 run turtlebot3_teleop teleop_keyboard