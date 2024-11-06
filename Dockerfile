# Use the base image Ubuntu
FROM ubuntu:latest

# Switch to root user to install system packages
USER root

# Update the system and install build tools, including git
RUN apt-get update && apt-get install -y \
    build-essential \
    gdb \
    python3 \
    python3-pip \
    sudo \
    git \ 
    cmake \
    && apt-get clean

# Create the 'build' user and add it to the sudo group if it does not already exist
RUN id -u build &>/dev/null || useradd -m -s /bin/bash build && echo "build ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# Adjust permissions for the home folder for the build user
RUN chown -R build:build /home/build

# Create the 'ohsi' folder and set permissions for the 'build' user
RUN mkdir -p /home/build/ohsi && chown -R build:build /home/build/ohsi

# Install Google Test
RUN mkdir -p /tmp/gtest && cd /tmp/gtest && \
    git clone https://github.com/google/googletest.git && \
    cd googletest && \
    cmake -S . -B build && \
    cmake --build build --target install && \
    rm -rf /tmp/gtest

# Switch to the 'build' user
USER build

# Environment configuration
ENV PATH="/home/build/.local/bin:${PATH}"

# Set the working directory
WORKDIR /home/build

# Command to keep the container running
CMD ["/bin/bash"]
