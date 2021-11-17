# ns3-dock [![deploy to docker hub](https://github.com/firejox/ns3-dock/actions/workflows/deploy.yaml/badge.svg)](https://github.com/firejox/ns3-dock/actions/workflows/deploy.yaml)

Docker image for network simulator [ns-3](https://www.nsnam.org) based on [x11docker](https://github.com/mviereck/x11docker)

## Installation

You can pull the image from dockerhub or clone and built this project locally

```sh
docker pull firejox/ns3-dock
```

## Usage

The following command will start an interactive shell. The ns-3 source code will be located in`/ns-3`.
```sh
x11docker -i firejox/ns3-dock
```

The visualizer `NetAnim` has been built in the image. You can run `NetAnim` in `/ns-3/netanim-$version$`. For example,
```sh
/ns-3/netanim-3.108/NetAnim
```

