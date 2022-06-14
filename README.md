# gamera4-rodan
[Gamera 4](https://gamera.informatik.hsnr.de) and [MusicStaves Toolkit](https://gamera.informatik.hsnr.de/addons/musicstaves/index.html) code and installation for Rodan jobs. More information in each subdirectory.

## Package Information
### Gamera 4 
Forked from [here](https://github.com/hsnr-gamera/gamera-4) with specific commit [1b62614](https://github.com/hsnr-gamera/gamera-4/commit/1b62614d9f3500f61b9bdae13f8f0788d7ccf48b). 

### MusicStaves Toolkit 
Gamera Add-on toolkit originally in Python2 and was moved to Python3 ([source](https://gamera.informatik.hsnr.de/addons/musicstaves/index.html)). Only tasks relevant to the current Rodan workflow are migrated, including:
- stafffinder_miyao
- stafffinder_dalitz
- stafffinder_projections

The rest were left out of the repository. 

## Installation
[INSTALL.sh](https://github.com/DDMAL/gamera4-rodan/blob/main/INSTALLL.sh) is an example script to build and install Gamera 4 and MusicStaves Toolkit, intended for building Rodan py3-celery Docker container. Also can be run manually by running:

`chmod u+x INSTALL.sh`

`./INSTALL.sh` 
