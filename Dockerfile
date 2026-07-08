FROM python:3.11-slim
RUN apt-get update
# Skip setting the timezone. https://stackoverflow.com/questions/44331836/apt-get-install-tzdata-noninteractive
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends tzdata
# NB: the python:3.11-slim image already provides python3 + dev headers + stdlib distutils
# under /usr/local, and Debian bookworm no longer packages python3-distutils, so we only
# add the C/build deps here.
RUN apt-get install -y \
  g++ \
  git \
  libpng-dev \
  libtiff-dev

# Build Gamera 4.
#RUN git clone https://github.com/DDMAL/gamera4-rodan.git
COPY . /gamera4-rodan
#WORKDIR /gamera4-rodan
#this commit fixes miyao staff finder
#RUN git checkout 76608f6 
WORKDIR /gamera4-rodan/gamera-4
RUN python3 setup.py --nowx build
# We need to install Gamera (even though it won't be used)
# so that we can build Musicstaves.
RUN python3 setup.py --nowx install

# Gamera's distutils `data_files` header install no longer lands the .hpp files in
# get_python_inc()/gamera under py3.11/modern setuptools, so Musicstaves can't find
# gameramodule.hpp. Copy the source headers into the dir gamera_setup searches.
RUN GAMERA_INC="$(python3 -c 'from distutils.sysconfig import get_python_inc; print(get_python_inc())')/gamera" \
  && mkdir -p "$GAMERA_INC" \
  && cp -r /gamera4-rodan/gamera-4/include/* "$GAMERA_INC"/

# Build Musicstaves.
WORKDIR /gamera4-rodan/musicstaves
RUN python3 setup.py build
