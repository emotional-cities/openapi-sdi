# eMOTIONAL Cities SDI

<img src="https://raw.githubusercontent.com/doublebyte1/yellow-bricks/master/dist/assets/img/portfolio/ecities.svg" width="200">

[![DOI](https://zenodo.org/badge/495373503.svg)](https://zenodo.org/badge/latestdoi/495373503)

This document describes how to setup and run *a simplified version* of the Spatial Data Infrastructure (SDI) from the [eMOTIONAL Cities project](https://emotionalcities-h2020.eu/). If you are in rush, you can jump to the [next section](#Quick-Setup).

These docker-compositions are loosely based on the compositions from the [pygeoapi project](https://pygeoapi.io/). They enable building and running a stack of FOSS & FOSS4G/[OSGeo](https://www.osgeo.org/) software, which implements an SDI using the latest [OGC API](https://ogcapi.ogc.org/) standards. This infrastructure is mostly focused on **sharing vector data, and its related metadata**.

## Quick Setup

You will need `docker` and `docker-compose` installed in your system, in order to run this infrastructure. If you don't have them already, you can use the provided convenience script to install them:

```
./install_docker.sh
```

## Start pygeoapi

The simplest way to start the SDI is by using the `docker-compose.yml` composition:

```
docker-compose up -d
```

This will pull and run all the relevant docker images. If you encounter any issues, please read the [Troubleshooting section](#Troubleshooting). If you have a more advanced use case, please continue reading.

You can read more about docker-compose on this [link](https://docs.docker.com/compose/gettingstarted/)

Regardless the composition you choosen, when all goes well, pygeoapi will be available at port 80 of the host: http://localhost.

## Environment Variables

This compositions read secrets from an environment file on this folder: ```.env```.

Create this file with the following format, replacing "SOMEPASSWORD" by reasonable values.

```
POSTGRES_PASSWORD="SOMEPASSWORD"
POSTGRES_DB="SOMEPASSWORD"
POSTGRES_USER="SOMEPASSWORD"
```

## Troubleshooting

If you cannot launch the docker-composition due to permission errors, try this:

```
sudo chown -R $USER ES/data/*
```

Elasticsearch requires the host system to have its virtual memory
parameter (**max_map_count**) [here](https://www.elastic.co/guide/en/elasticsearch/reference/current/vm-max-map-count.html)
set as follows:

```
sudo sysctl -w vm.max_map_count=262144
```

If the docker composition fails with the following error:
```
docker_elastic_search_1 exited with code 78
```

it is very likely that you need to setup the `sysctl`.

## License

This project is released under an [MIT License](./LICENSE)

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
