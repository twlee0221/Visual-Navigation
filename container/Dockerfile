FROM ubuntu:22.04

# Set locale
RUN apt-get update && apt-get install -y locales \
    && locale-gen en_US en_US.UTF-8 \
    && update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8 \
    && export LANG=en_US.UTF-8

# setup timezone for ROS setup
ENV TIME_ZONE="Etc/UTC"
RUN ln -snf /usr/share/zoneinfo/${TIME_ZONE} /etc/localtime && echo ${TIME_ZONE} > /etc/timezone

# install bootstrap tools
RUN apt-get update && apt-get install --no-install-recommends -y \
  build-essential \
  nano \
  software-properties-common \
  gnupg2 \
  lsb-release \
  curl \
  iputils-ping \
  unzip \
  wget \
  && add-apt-repository universe \
  && rm -rf /var/lib/apt/lists/*

# Add the ROS 2 GPG key with apt
RUN curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg

# Add the repository to your sources list
ENV UBUNTU_CODENAME="jammy"
RUN echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu ${UBUNTU_CODENAME} main" | tee /etc/apt/sources.list.d/ros2.list > /dev/null

# Install ROS2
RUN apt-get update && apt-get upgrade -y \
  && apt-get install -y ros-humble-desktop

# ROS environment setup
RUN echo 'source /opt/ros/humble/setup.bash' >> ~/.bashrc

# Install Bazel
RUN apt-get install apt-transport-https curl gnupg -y
RUN curl -fsSL https://bazel.build/bazel-release.pub.gpg | gpg --dearmor >bazel-archive-keyring.gpg
RUN mv bazel-archive-keyring.gpg /usr/share/keyrings
RUN echo "deb [arch=amd64 signed-by=/usr/share/keyrings/bazel-archive-keyring.gpg] https://storage.googleapis.com/bazel-apt stable jdk1.8" | tee /etc/apt/sources.list.d/bazel.list
RUN apt-get update && apt-get install -y bazel=6.0.0

# install PIGPIO library
RUN wget https://github.com/joan2937/pigpio/archive/master.zip \
&& unzip master.zip \
&& cd pigpio-master \
&& make \
&& make install
