#!/bin/bash
###############################
# INSTALLATION SCRIPT FOR RODAN CONTAINER
# In the root directory
cd /
# upgrade apt to download the dependencies of the Cpp gamera-4 files
echo "###### update apt-get and gamera-4 dependencies ######"
apt update && apt-get update
apt-get install libpng-dev && apt-get install libtiff5-dev

# clone the repository 
echo "###### cloning git repo ######"
git clone https://github.com/DDMAL/gamera4-rodan.git
cd gamera4-rodan
git checkout c7e2f84 #specifies commit

# install gamera-4 on the container
echo "###### build and install gamera ######"
cd gamera-4
python3.7 setup.py --nowx build && python3.7 setup.py --nowx install

# install musicstaves toolkits
echo "###### build and install musicstaves ######"
cd ../musicstaves
python3.7 setup.py build && python3.7 setup.py install


# IF THE PROCESS IS TERMINATED BY AN ERROR, REFER TO THE 
# Rodan/rodan-main/code/rodan/jobs/gamera_rodan/gamera-rodan-doc.md FILE AND FIX IT. 
# THEN RERUN THE SCRIPT.

# remove the gamera-4 directory from the container. 
echo "###### removing gamera4-rodan ######"
cd / && rm -rf gamera4-rodan

# for more information refer to:
# Rodan/rodan-main/code/rodan/jobs/gamera_rodan/gamera-rodan-doc.md
###############################