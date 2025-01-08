#!/bin/bash
echo "**************************************************"
echo " Setting up CI/CD Final Project Environment"
echo "**************************************************"

# echo "*** Checking if Anaconda is installed..."
# if ! command -v conda &> /dev/null; then
#   echo "Anaconda could not be found, please install it first"
#   exit 1
# else
#   echo "Anaconda is installed"
# fi

# echo "*** Creating a Python 3.9 virtual environment with Anaconda"
# conda create --name python-3-9-21 python=3.9 -y

# echo "*** Activating the virtual environment..."
# source activate python-3-9-21

echo "*** Checking the Python version..."
python --version

echo "*** Configuring the developer environment..."
echo "# CI/CD Final Project additions" >> ~/.bashrc
echo "export GITHUB_ACCOUNT=$GITHUB_ACCOUNT" >> ~/.bashrc
echo 'export PS1="\[\e]0;\u:\W\a\]${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u\[\033[00m\]:\[\033[01;34m\]\W\[\033[00m\]\$ "' >> ~/.bashrc
echo "source activate python-3-9-21" >> ~/.bashrc

echo "*** Installing Selenium and Chrome for BDD"
sudo apt-get update
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y sqlite3 ca-certificates chromium-driver python3-selenium

echo "*** Installing Python dependencies..."
pip install --upgrade pip wheel
pip install -r requirements.txt

echo "**************************************************"
echo " CI/CD Final Project Environment Setup Complete"
echo "**************************************************"
echo ""
echo "Use 'exit' to close this terminal and open a new one to initialize the environment"
echo ""
