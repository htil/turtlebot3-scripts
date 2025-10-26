#!/bin/bash

# Turtlebot SBC

# Setup ROS_DOMAIN_ID
export ROS_DOMAIN_ID=30
 
# ROS Middleware
export RMW_IMPLEMENTATION=rmw_fastrtps_cpp  

# Start bringup program [Turtlebot SBC]
export TURTLEBOT3_MODEL=burger
ros2 launch turtlebot3_bringup robot.launch.py