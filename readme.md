# ROS Resources

# Physical Robot

### Credentials 

login: csc

password: uacs460

### Addresses 

192.168.1.90

192.168.1.89

## Starting Program

Note: Prior to connecting you need to configure the following both on the  `remote PC`  and `turtlebot3 SBC`   

## Turtlebot3 SBC

Startup bringup 

```bash
# Startup bring up program
~/scripts/startup.sh
```

~/.bashrc exports 

```bash
# change IDS
export ROS_DOMAIN_ID=XX 
export RMW_IMPLEMENTATION=rmw_fastrtps_cpp
export TURTLEBOT3_MODEL=burger
```

Turtlebot3 Startup Script 

```bash
#!/bin/bash

# Turtlebot SBC

# Setup ROS_DOMAIN_ID
export ROS_DOMAIN_ID=30
 
# ROS Middleware
export RMW_IMPLEMENTATION=rmw_fastrtps_cpp  

# Start bringup program [Turtlebot SBC]
export TURTLEBOT3_MODEL=burger
ros2 launch turtlebot3_bringup robot.launch.py
```

## Remote PC Startup

```bash
#!/bin/bash

# Turtlebot SBC

# Setup ROS_DOMAIN_ID change ID based on robot
export ROS_DOMAIN_ID=30
 
# ROS Middleware
export RMW_IMPLEMENTATION=rmw_fastrtps_cpp  

# Start bringup program [Turtlebot SBC]
export TURTLEBOT3_MODEL=burger
ros2 run turtlebot3_teleop teleop_keyboard
```

Getting Started 

[ROBOTIS e-Manual](https://emanual.robotis.com/docs/en/platform/turtlebot3/quick-start/#pc-setup)

## Configuring & Installing

Script Steps 

```bash
# System will reboot after this script
# In nano script flip "1" to "0" 
./configure.sh

# After reboot
./install_ros.sh
./install_packages.sh
```

Create Script Files 

```bash

mkdir scripts

cd scripts/

touch configure.sh & touch install_ros.sh & touch install_packages.sh

chmod +x *.sh
```

Configure Raspberry Pi [Turtlebot SBC] 

```bash
#!/bin/bash

# Configure raspberry pi 
systemctl mask systemd-networkd-wait-online.service
sudo systemctl mask sleep.target suspend.target hibernate.target hybrid-sleep.target
sudo nano /etc/apt/apt.conf.d/20auto-upgrades
sudo reboot
```

Install ROS Bare Bones [Turtlebot SBC] 

```bash
#!/bin/bash

# Install ROS (Turtlebot SBC) 
sudo apt update && sudo apt install locales
sudo locale-gen en_US en_US.UTF-8
sudo update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
export LANG=en_US.UTF-8

sudo apt install software-properties-common
sudo add-apt-repository universe
sudo apt update && sudo apt install curl -y
export ROS_APT_SOURCE_VERSION=$(curl -s https://api.github.com/repos/ros-infrastructure/ros-apt-source/releases/latest | grep -F "tag_name" | awk -F\" '{print $4}')
curl -L -o /tmp/ros2-apt-source.deb "https://github.com/ros-infrastructure/ros-apt-source/releases/download/${ROS_APT_SOURCE_VERSION}/ros2-apt-source_${ROS_APT_SOURCE_VERSION}.$(. /etc/os-release && echo ${UBUNTU_CODENAME:-${VERSION_CODENAME}})_all.deb"
sudo dpkg -i /tmp/ros2-apt-source.deb
sudo apt update
sudo apt upgrade

# Install ROS barebones
sudo apt install ros-humble-ros-base
```

Install packages  [Turtlebot SBC] 

```bash
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
echo 'source /opt/ros/humble/setup.bash' >> ~/.bashrc
colcon build --symlink-install --parallel-workers 1
echo 'source ~/turtlebot3_ws/install/setup.bash' >> ~/.bashrc
source ~/.bashrc
sudo cp `ros2 pkg prefix turtlebot3_bringup`/share/turtlebot3_bringup/script/99-turtlebot3-cdc.rules /etc/udev/rules.d/
sudo udevadm control --reload-rules
sudo udevadm trigger
echo 'export LDS_MODEL=LDS-01' >> ~/.bashrc
source ~/.bashrc
echo "Remember to setup ROS_DOMAIN_ID"
echo "See https://emanual.robotis.com/docs/en/platform/turtlebot3/sbc_setup/#sbc-setup"
```

Remote PC Install Script  [Remote PC] 

```bash
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
```