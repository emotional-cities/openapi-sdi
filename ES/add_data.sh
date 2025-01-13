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
echo "Loading igot data"
python3 /load_es_data.py /mount_s3/geojson/lisbon_life_births_rate.geojson FID
python3 /load_es_data.py /mount_s3/geojson/lisbon_mortality_rate.geojson FID
python3 /load_es_data.py /mount_s3/geojson/lisbon_patients_diabetes_mellitus.geojson FID
python3 /load_es_data.py /mount_s3/geojson/lisbon_patients_chronic_alcohol_abuse.geojson FID
python3 /load_es_data.py /mount_s3/geojson/lisbon_patients_tobacco_abuse.geojson FID
python3 /load_es_data.py /mount_s3/geojson/lisbon_patients_obesity.geojson FID
python3 /load_es_data.py /mount_s3/geojson/lisbon_patients_hypertension.geojson FID
python3 /load_es_data.py /mount_s3/geojson/lisbon_patients_dementia.geojson FID
python3 /load_es_data.py /mount_s3/geojson/lisbon_positive_tweets_density.geojson FID
python3 /load_es_data.py /mount_s3/geojson/lisbon_unemployed_people_ratio.geojson FID
python3 /load_es_data.py /mount_s3/geojson/lisbon_low_literacy_level_ratio.geojson FID
python3 /load_es_data.py /mount_s3/geojson/lisbon_population_density.geojson FID
python3 /load_es_data.py /mount_s3/geojson/lisbon_gender_ratio.geojson FID
python3 /load_es_data.py /mount_s3/geojson/lisbon_youth_people_ratio.geojson FID
python3 /load_es_data.py /mount_s3/geojson/lisbon_elderly_people_ratio.geojson FID
python3 /load_es_data.py /mount_s3/geojson/lisbon_average_age_buildings.geojson FID
python3 /load_es_data.py /mount_s3/geojson/lisbon_building_repair_needs_ratio.geojson FID
python3 /load_es_data.py /mount_s3/geojson/lisbon_walkability.geojson FID
python3 /load_es_data.py /mount_s3/geojson/lisbon_altimetry.geojson FID
python3 /load_es_data.py /mount_s3/geojson/lisbon_beds_tourist_accomodations.geojson FID
python3 /load_es_data.py /mount_s3/geojson/lisbon_fast_food_outlets_density.geojson FID
python3 /load_es_data.py /mount_s3/geojson/lisbon_ndvi.geojson FID
python3 /load_es_data.py /mount_s3/geojson/lisbon_noise.geojson FID
python3 /load_es_data.py /mount_s3/geojson/lisbon_pm2_5.geojson FID
python3 /load_es_data.py /mount_s3/geojson/lisbon_temperature.geojson FID
python3 /load_es_data.py /mount_s3/geojson/lisbon_vulnerability_excessive_heat.geojson FID
python3 /load_es_data.py /mount_s3/geojson/lisbon_vulnerability_flash_floods.geojson FID
python3 /load_es_data.py /mount_s3/geojson/lisbon_no2.geojson FID
python3 /load_es_data.py /mount_s3/geojson/lisbon_distance_green_spaces.geojson FID
python3 /load_es_data.py /mount_s3/geojson/lisbon_patients_anxiety_disorder.geojson FID
python3 /load_es_data.py /mount_s3/geojson/lisbon_patients_depressive_disorder.geojson FID
python3 /load_es_data.py /mount_s3/geojson/lisbon_vibrancy_index.geojson fid

echo "Loading camb data"
python3 /load_es_data.py /mount_s3/geojson/hex350_grid_popden_2020.geojson fid
python3 /load_es_data.py /mount_s3/geojson/hex350_grid_access2openspace.geojson fid
python3 /load_es_data.py /mount_s3/geojson/hex350_grid_active2020.geojson fid
python3 /load_es_data.py /mount_s3/geojson/hex350_grid_age2020.geojson fid
python3 /load_es_data.py /mount_s3/geojson/hex350_grid_avgLST.geojson fid
python3 /load_es_data.py /mount_s3/geojson/hex350_grid_cardio_1920.geojson fid
python3 /load_es_data.py /mount_s3/geojson/hex350_grid_crime_22.geojson fid
python3 /load_es_data.py /mount_s3/geojson/hex350_grid_cycleroutes2021.geojson fid
python3 /load_es_data.py /mount_s3/geojson/hex350_grid_demantia_1920.geojson fid
python3 /load_es_data.py /mount_s3/geojson/hex350_grid_depression_1920.geojson fid
python3 /load_es_data.py /mount_s3/geojson/hex350_grid_flood_4band.geojson fid
python3 /load_es_data.py /mount_s3/geojson/hex350_grid_gender2020.geojson fid
python3 /load_es_data.py /mount_s3/geojson/hex350_grid_hindex2020.geojson fid
python3 /load_es_data.py /mount_s3/geojson/hex350_grid_LAeq16h.geojson fid
python3 /load_es_data.py /mount_s3/geojson/hex350_grid_mental_1920.geojson fid
python3 /load_es_data.py /mount_s3/geojson/hex350_grid_ndvi2022.geojson fid
python3 /load_es_data.py /mount_s3/geojson/hex350_grid_no2_2019.geojson fid
python3 /load_es_data.py /mount_s3/geojson/hex350_grid_obesity_1920.geojson fid
python3 /load_es_data.py /mount_s3/geojson/hex350_grid_pm10_2019.geojson fid
python3 /load_es_data.py /mount_s3/geojson/hex350_grid_pm25_2019.geojson fid

echo "Loading clima data"
python3 /load_es_data.py /mount_s3/geojson/munich_220713_all.geojson id

echo "Loading nrg data"
python3 /load_es_data.py /mount_s3/geojson/lisbon_20210912_pr_.geojson fid
python3 /load_es_data.py /mount_s3/geojson/AirQuality.AirPressure.geojson id
python3 /load_es_data.py /mount_s3/geojson/AirQuality.Humidity.geojson id
python3 /load_es_data.py /mount_s3/geojson/AirQuality.IAQIndex.geojson id
python3 /load_es_data.py /mount_s3/geojson/AirQuality.Temperature.geojson id
python3 /load_es_data.py /mount_s3/geojson/AmbientLight.AmbientLight.geojson id
python3 /load_es_data.py /mount_s3/geojson/AnalogIn.Voltage.geojson id
python3 /load_es_data.py /mount_s3/geojson/CO2V2.CO2Conc.geojson id
python3 /load_es_data.py /mount_s3/geojson/CO2V2.Humidity.geojson id
python3 /load_es_data.py /mount_s3/geojson/CO2V2.Temperature.geojson id
python3 /load_es_data.py /mount_s3/geojson/GPS.Data.geojson id
python3 /load_es_data.py /mount_s3/geojson/GPS.Time.geojson id
python3 /load_es_data.py /mount_s3/geojson/Humidity.Humidity.geojson id
python3 /load_es_data.py /mount_s3/geojson/SoundPressureLevel.SPL.geojson id
python3 /load_es_data.py /mount_s3/geojson/london_whitechapel_sub-oe309002.geojson id

echo "Loading msu data"
# python3 /load_es_data.py /mount_s3/geojson/ucr_2019.geojson ObjectID
python3 /load_es_data.py /mount_s3/geojson/tl_rd22_26_bg.geojson id
python3 /load_es_data.py /mount_s3/geojson/500cities_city_11082016.geojson id
python3 /load_es_data.py /mount_s3/geojson/500cities_tracts_11082016.geojson id
python3 /load_es_data.py /mount_s3/geojson/lansing_chronicobstructivepulmonarydiseaseageabove18yrs_2019_cdc.geojson id
python3 /load_es_data.py /mount_s3/geojson/lansing_city_block_group_areadeprivationindex_nationalscore_2020.geojson id
python3 /load_es_data.py /mount_s3/geojson/lansing_city_blockgroup_areadeprivationindex_statescore_2020.geojson id
python3 /load_es_data.py /mount_s3/geojson/lansing_city_block_group_genderratio_mtow_2017_21.geojson id
python3 /load_es_data.py /mount_s3/geojson/lansing_city_block_group_nationalwalkabilityindex_2021.geojson id
python3 /load_es_data.py /mount_s3/geojson/lansing_city_block_group_percapitaincome_2020.geojson id
python3 /load_es_data.py /mount_s3/geojson/lansing_city_census_tracts_depression.geojson id
python3 /load_es_data.py /mount_s3/geojson/lansing_city_census_tracts_disability_2017_21.geojson id
python3 /load_es_data.py /mount_s3/geojson/lansing_city_census_tracts_lifeexpectancyatbirth_10_15.geojson id
python3 /load_es_data.py /mount_s3/geojson/lansing_city_census_tracts_lowaccesstofood.geojson id
python3 /load_es_data.py /mount_s3/geojson/lansing_city_census_tracts_lowincomelowaccess.geojson id
python3 /load_es_data.py /mount_s3/geojson/lansing_city_census_tracts_numberofpeopleaged65andabove_2020.geojson id
python3 /load_es_data.py /mount_s3/geojson/lansing_city_census_tracts_numberofpeoplebiketowork_2020.geojson id
python3 /load_es_data.py /mount_s3/geojson/lansing_city_census_tracts_peopleagedabove5disability.geojson id
python3 /load_es_data.py /mount_s3/geojson/lansing_city_census_tracts_percentageofpeoplebiketowork_2020.geojson id
python3 /load_es_data.py /mount_s3/geojson/lansing_city_census_tracts_traveltimetowork_17_21.geojson id
python3 /load_es_data.py /mount_s3/geojson/lansing_coronaryheartdiseaseageabove18yrs_2019_cdc.geojson id
python3 /load_es_data.py /mount_s3/geojson/lansing_currentasthmaageabove18yrs_2019_cdc.geojson id
python3 /load_es_data.py /mount_s3/geojson/lansing_diabetesageabove18yrs_2019_cdc.geojson id
python3 /load_es_data.py /mount_s3/geojson/lansing_highbpageabove18yrs_2019_cdc.geojson id
python3 /load_es_data.py /mount_s3/geojson/lansing_noleisuretimepaageabove18yrs_2019_cdc.geojson id
python3 /load_es_data.py /mount_s3/geojson/lansing_obesityageabove18yrs_2019_cdc.geojson id
python3 /load_es_data.py /mount_s3/geojson/lansing_physicalhealthnotgoodageabove18yrs_2019_cdc.geojson id
python3 /load_es_data.py /mount_s3/geojson/lansing_strokeageabove18yrs_2019_cdc.geojson id

echo "Loading dtu data"
python3 /load_es_data.py /mount_s3/geojson/air_pollution_wzones.geojson zoneid
python3 /load_es_data.py /mount_s3/geojson/dst_2012_wzones.geojson zoneid
python3 /load_es_data.py /mount_s3/geojson/dst_2013_wzones.geojson zoneid
python3 /load_es_data.py /mount_s3/geojson/dst_2014_wzones.geojson zoneid
python3 /load_es_data.py /mount_s3/geojson/dst_2015_wzones.geojson zoneid
python3 /load_es_data.py /mount_s3/geojson/dst_2016_wzones.geojson zoneid
python3 /load_es_data.py /mount_s3/geojson/dst_2017_wzones.geojson zoneid
python3 /load_es_data.py /mount_s3/geojson/dst_2018_wzones.geojson zoneid
python3 /load_es_data.py /mount_s3/geojson/landuse_poi_wzones.geojson zoneid
python3 /load_es_data.py /mount_s3/geojson/noise_wzones.geojson zoneid
python3 /load_es_data.py /mount_s3/geojson/zones.geojson zoneid

echo "Loading fmul data"
python3 /load_es_data.py /mount_s3/geojson/lisbon_agudo_sub-oe109003_2024-08-27t150441z.geojson id

echo "Seems that data was loaded"

## *************************************************************

# create a new index with the settings in es_index_config.json
#curl -v --insecure --user elastic:changeme -XPUT '0.0.0.0:9200/test?pretty' -H 'Content-Type: application/json' -d @es_index_config.json
