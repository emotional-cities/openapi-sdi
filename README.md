# eMOTIONAL Cities SDI

<img src="https://raw.githubusercontent.com/doublebyte1/yellow-bricks/master/dist/assets/img/portfolio/ecities.svg" width="200">

This document describes how to setup and run the Spatial Data Infrastructure (SDI) from the [eMOTIONAL Cities project](https://emotionalcities-h2020.eu/). If you are in rush, you can jump to the [next section](#Building-and-Running).

These docker-compositions are loosely based on the compositions from the [pygeoapi project](https://pygeoapi.io/). They enable building and running a stack of FOSS & FOSS4G/[OSGeo](https://www.osgeo.org/) software, which implements an SDI using the latest [OGC API](https://ogcapi.ogc.org/) standards. This infrastructure is mostly focused on **sharing vector data, and its related metadata**.

Regardess of the docker-composition you choose to run, you will launch a system which includes `pygeoapi` using an `Elasticsearch` backend for storing both, data and metadata. Vector tiles are served from a `Minio` bucket, which is launched by another composition.

In addition, we have leveraged other tools from the [ELK](https://www.elastic.co/what-is/elk-stack): `logstash` to transform and insert metadata and `kibana` to visualize the content of the elasticsearch indexes.

## Quick Setup


## pygeoapi with ElasticSearch (ES)

These folders contain a Docker Compose configuration necessary to setup a minimal
`pygeoapi` server that uses a local ES backend service.

This config is only for local development and testing.

### ElasticSearch

- official ElasticSearch: **5.6.8** on **CentosOS 7**
- ports **9300** and **9200**

ES requires the host system to have its virtual memory
parameter (**max_map_count**) [here](https://www.elastic.co/guide/en/elasticsearch/reference/current/vm-max-map-count.html)
set as follows:

```
sudo sysctl -w vm.max_map_count=262144
```

If the docker composition fails with the following error:
```
docker_elastic_search_1 exited with code 78
```

it is very likely that you forgot to setup the `sysctl`.

## Building and Running

To build and run the [Docker compose file](docker-compose.yml) in localhost:

```
sudo sysctl -w vm.max_map_count=262144
docker-compose build
docker-compose up
```

[![DOI](https://zenodo.org/badge/495373503.svg)](https://zenodo.org/badge/latestdoi/495373503)