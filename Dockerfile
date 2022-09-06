FROM ubuntu:20.04
RUN apt-get update
# Skip setting the timezone. https://stackoverflow.com/questions/44331836/apt-get-install-tzdata-noninteractive
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends tzdata
RUN apt-get install -y \
  g++ \
  git \
  libpng-dev \
  libtiff5-dev \
  python3 \
  python3-dev \
  python3-distutils

# Build Gamera 4.
RUN git clone https://github.com/DDMAL/gamera4-rodan.git
WORKDIR /gamera4-rodan
#this commit fixes miyao staff finder
RUN git checkout 76608f6 
WORKDIR /gamera4-rodan/gamera-4
RUN python3 setup.py --nowx build
# We need to install Gamera (even though it won't be used)
# so that we can build Musicstaves.
RUN python3 setup.py --nowx install

# Build Musicstaves.
WORKDIR /gamera4-rodan/musicstaves
RUN python3 setup.py build
