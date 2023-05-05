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

python3 /load_es_data.py /in/masked.geojson fid

# Waiting for geopackage_pusher container to create the file
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

echo "Loading igot data"
python3 /load_es_data.py /in/a0000000a.geojson OBJECTID
python3 /load_es_data.py /in/a0000000b.geojson OBJECTID
python3 /load_es_data.py /in/a0000000c.geojson OBJECTID
python3 /load_es_data.py /in/a00000009.geojson OBJECTID

echo "Loading camb data"
python3 /load_es_data.py /in/hex350_grid_popden_2020.geojson fid
python3 /load_es_data.py /in/hex350_grid_access2openspace.geojson fid
python3 /load_es_data.py /in/hex350_grid_active2020.geojson fid
python3 /load_es_data.py /in/hex350_grid_age2020.geojson fid
python3 /load_es_data.py /in/hex350_grid_avgLST.geojson fid
python3 /load_es_data.py /in/hex350_grid_cardio_1920.geojson fid
python3 /load_es_data.py /in/hex350_grid_crime_22.geojson fid
python3 /load_es_data.py /in/hex350_grid_cycleroutes2021.geojson fid
python3 /load_es_data.py /in/hex350_grid_demantia_1920.geojson fid
python3 /load_es_data.py /in/hex350_grid_depression_1920.geojson fid
python3 /load_es_data.py /in/hex350_grid_flood_4band.geojson fid
python3 /load_es_data.py /in/hex350_grid_gender2020.geojson fid
python3 /load_es_data.py /in/hex350_grid_hindex2020.geojson fid
python3 /load_es_data.py /in/hex350_grid_LAeq16h.geojson fid
python3 /load_es_data.py /in/hex350_grid_mental_1920.geojson fid
python3 /load_es_data.py /in/hex350_grid_ndvi2022.geojson fid
python3 /load_es_data.py /in/hex350_grid_no2_2019.geojson fid
python3 /load_es_data.py /in/hex350_grid_obesity_1920.geojson fid
python3 /load_es_data.py /in/hex350_grid_pm10_2019.geojson fid
python3 /load_es_data.py /in/hex350_grid_pm25_2019.geojson fid

echo "Loading clima data"
python3 /load_es_data.py /in/Munich_220713_All.geojson id

echo "Loading nrg data"
python3 /load_es_data.py /in/AirQuality.AirPressure.geojson id
python3 /load_es_data.py /in/AirQuality.Humidity.geojson id
python3 /load_es_data.py /in/AirQuality.IAQIndex.geojson id
python3 /load_es_data.py /in/AirQuality.Temperature.geojson id
python3 /load_es_data.py /in/AmbientLight.AmbientLight.geojson id
python3 /load_es_data.py /in/AnalogIn.Voltage.geojson id
python3 /load_es_data.py /in/CO2V2.CO2Conc.geojson id
python3 /load_es_data.py /in/CO2V2.Humidity.geojson id
python3 /load_es_data.py /in/CO2V2.Temperature.geojson id
python3 /load_es_data.py /in/GPS.Data.geojson id
python3 /load_es_data.py /in/GPS.Time.geojson id
python3 /load_es_data.py /in/Humidity.Humidity.geojson id
python3 /load_es_data.py /in/SoundPressureLevel.SPL.geojson id

echo "Loading msu data"
python3 /load_es_data.py /in/ucr_2019.geojson ObjectID
python3 /load_es_data.py /in/tl_rd22_26_bg.geojson id
python3 /load_es_data.py /in/500cities_city_11082016.geojson id
python3 /load_es_data.py /in/500cities_tracts_11082016.geojson id
python3 /load_es_data.py /in/lansing_chronicobstructivepulmonarydiseaseageabove18yrs_2019_cdc.geojson id
# python3 /load_es_data.py /in/lansing_city_block_group_areadeprivationindex_nationalscore_2020.geojson id
python3 /load_es_data.py /in/lansing_city_blockgroup_areadeprivationindex_statescore_2020.geojson id
python3 /load_es_data.py /in/lansing_city_block_group_genderratio_mtow_2017_21.geojson id
python3 /load_es_data.py /in/lansing_city_block_group_nationalwalkabilityindex_2021.geojson id
python3 /load_es_data.py /in/lansing_city_block_group_percapitaincome_2020.geojson id
python3 /load_es_data.py /in/lansing_city_census_tracts_depression.geojson id
python3 /load_es_data.py /in/lansing_city_census_tracts_disability_2017_21.geojson id
python3 /load_es_data.py /in/lansing_city_census_tracts_lifeexpectancyatbirth_10_15.geojson id
python3 /load_es_data.py /in/lansing_city_census_tracts_lowaccesstofood.geojson id
python3 /load_es_data.py /in/lansing_city_census_tracts_lowincomelowaccess.geojson id
# python3 /load_es_data.py /in/lansing_city_census_tracts_numberofpeopleaged65andabove_2020.geojson id
# python3 /load_es_data.py /in/lansing_city_census_tracts_numberofpeoplebiketowork_2020.geojson id
# python3 /load_es_data.py /in/lansing_city_census_tracts_peopleagedabove5disability.geojson id
# python3 /load_es_data.py /in/lansing_city_census_tracts_percentageofpeoplebiketowork_2020.geojson id
# python3 /load_es_data.py /in/lansing_city_census_tracts_traveltimetowork_17_21.geojson id
# python3 /load_es_data.py /in/lansing_coronaryheartdiseaseageabove18yrs_2019_cdc.geojson id
# python3 /load_es_data.py /in/lansing_currentasthmaageabove18yrs_2019_cdc.geojson id
# python3 /load_es_data.py /in/lansing_diabetesageabove18yrs_2019_cdc.geojson id
# python3 /load_es_data.py /in/lansing_highbpageabove18yrs_2019_cdc.geojson id
# python3 /load_es_data.py /in/lansing_noleisuretimepaageabove18yrs_2019_cdc.geojson id
# python3 /load_es_data.py /in/lansing_obesityageabove18yrs_2019_cdc.geojson id
# python3 /load_es_data.py /in/lansing_physicalhealthnotgoodageabove18yrs_2019_cdc.geojson id
# python3 /load_es_data.py /in/lansing_strokeageabove18yrs_2019_cdc.geojson id


echo "Seems that data was loaded"

## *************************************************************

# create a new index with the settings in es_index_config.json
#curl -v --insecure --user elastic:changeme -XPUT '0.0.0.0:9200/test?pretty' -H 'Content-Type: application/json' -d @es_index_config.json
