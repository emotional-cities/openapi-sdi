#!/bin/sh
# =================================================================
#
# Authors: Just van den Broecke <justb4@gmail.com>>
#          Jorge Samuel Mendes de Jesus <jorge.dejesus@geocat.net>
#
# Copyright (c) 2019 Just van den Broecke
# Copyright (c) 2019 Jorge Samuel Mendes de Jesus
#
# Permission is hereby granted, free of charge, to any person
# obtaining a copy of this software and associated documentation
# files (the "Software"), to deal in the Software without
# restriction, including without limitation the rights to use,
# copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the
# Software is furnished to do so, subject to the following
# conditions:
#
# The above copyright notice and this permission notice shall be
# included in all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
# OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
# HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
# WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
# FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
# OTHER DEALINGS IN THE SOFTWARE.
#
# =================================================================


echo "Starting script to add geojson"
# move to the directory of this setup script
cd "$(dirname "$0")"

# for some reason even when port 9200 is open Elasticsearch is unable to be accessed as authentication fails
# a few seconds later it works
# incresing to 50s for wait in a slow system /_cluster/health?wait_for_status=yellow&timeout=50s
until $(curl -sSf -XGET --insecure 'http://localhost:9200/_cluster/health?wait_for_status=yellow' > /dev/null); do
    printf 'No status yellow from ES, trying again in 10 seconds \n'
    sleep 10
done

## ADDING DATA *************************************************

#echo "Elasticsearch seems to be working - Adding $dataset to ES"

python3 /load_es_data.py /usr/share/elasticsearch/data/ne_110m_populated_places_simple.geojson geonameid

# python3 /load_es_data.py /in/masked.geojson fid

# # Waiting for geopackage_pusher container to create the file
# while ! test -f "/in/activity_level_ldn.geojson"; do
#   sleep 10
#   echo "Still waiting"
# done
# python3 /load_es_data.py /in/activity_level_ldn.geojson GSS_CODE

# # Waiting for geopackage_pusher container to create the file
# while ! test -f "/in/cardivasular_disease_ldn.geojson"; do
#   sleep 10
#   echo "Still waiting"
# done
# python3 /load_es_data.py /in/cardivasular_disease_ldn.geojson GSS_CODE

# # Waiting for geopackage_pusher container to create the file
# while ! test -f "/in/tweet_count_sample.geojson"; do
#   sleep 10
#   echo "Still waiting"
# done
# python3 /load_es_data.py /in/tweet_count_sample.geojson id

# echo "Pushing EC metadata"
# python3 /load_es_data.py /in/metadata/ec_catalog.geojson id

# echo "Loading igot data"
# python3 /load_es_data.py /in/a0000000a.geojson GRID_ID
# python3 /load_es_data.py /in/a0000000b.geojson GRID_ID
# python3 /load_es_data.py /in/a0000000c.geojson GRID_ID
# python3 /load_es_data.py /in/a00000009.geojson GRID_ID

echo "Seems that data was loaded"


## *************************************************************

# create a new index with the settings in es_index_config.json
#curl -v --insecure --user elastic:changeme -XPUT '0.0.0.0:9200/test?pretty' -H 'Content-Type: application/json' -d @es_index_config.json
