#!/bin/bash

# Update package lists
sudo apt-get update

# Install OpenJDK
sudo apt-get install -y openjdk-8-jdk

# Verify Java installation
java -version

# Download JMeter
wget https://dlcdn.apache.org//jmeter/binaries/apache-jmeter-5.5.tgz

# Extract the archive
tar -xzf apache-jmeter-5.5.tgz

# Navigate to JMeter directory
sudo mv ./apache-jmeter-5.5 ~/usr/bin
sudo rm ./apache-jmeter-5.5.tgz

# Optional: Set environment variables for non-GUI mode
echo 'export JMETER_HOME=~/usr/bin/apache-jmeter-5.5' >> ~/.bashrc
echo 'export PATH=$PATH:$JMETER_HOME/bin' >> ~/.bashrc

. ~/.bashrc