# Fork by ns3-dock [![deploy to docker hub](https://github.com/firejox/ns3-dock/actions/workflows/deploy.yaml/badge.svg)](https://github.com/firejox/ns3-dock/actions/workflows/deploy.yaml)

Docker image for network simulator [ns-3](https://www.nsnam.org) based on [x11docker](https://github.com/mviereck/x11docker)

# Introduce

Use XServer to run GUI in container on windows 10, so windows10 users can use it directly without linux VM.

There has WSL can run GUI without downloading XServer, you can change the dockerfile to implement it.


## XServer for windows

https://sourceforge.net/projects/vcxsrv/

## Installation

Pull the image from dockerhub or clone and built this project locally.

```sh
$ docker pull nightring/ns3

or

# download dockerfile to <file_name> and open CMD here
$ docker build -t <docker_name> .
```

## Usage

This docker images is about ns-3, you can check the information [here](https://www.nsnam.org/wiki/Main_Page)

## Reference

Use XServer to run GUI in container
https://www.youtube.com/watch?v=BDilFZ9C9mw&ab_channel=AgileDevArt

The latest you can use wslg rather than XServer
https://www.youtube.com/watch?v=UEre6Bd75dw&ab_channel=AgileDevArt
