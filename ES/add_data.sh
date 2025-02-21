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

# ## ADDING DATA *************************************************
echo "Loading data into ES..."

python3 /load_es_data.py /mount_s3/geojson/hex350_grid_cardio_1920.geojson fid
python3 /load_es_data.py /mount_s3/geojson/hex350_grid_obesity_1920.geojson fid
python3 /load_es_data.py /mount_s3/geojson/hex350_grid_depression_1920.geojson fid
python3 /load_es_data.py /mount_s3/geojson/hex350_grid_mental_1920.geojson fid
python3 /load_es_data.py /mount_s3/geojson/hex350_grid_demantia_1920.geojson fid
python3 /load_es_data.py /mount_s3/geojson/hex350_grid_access2openspace.geojson fid
python3 /load_es_data.py /mount_s3/geojson/hex350_grid_ndvi2022.geojson fid
python3 /load_es_data.py /mount_s3/geojson/hex350_grid_pm25_2019.geojson fid
python3 /load_es_data.py /mount_s3/geojson/hex350_grid_pm10_2019.geojson fid
python3 /load_es_data.py /mount_s3/geojson/hex350_grid_no2_2019.geojson fid
python3 /load_es_data.py /mount_s3/geojson/hex350_grid_laeq16h.geojson fid
python3 /load_es_data.py /mount_s3/geojson/hex350_grid_flood_4band.geojson fid
python3 /load_es_data.py /mount_s3/geojson/hex350_grid_avglst.geojson fid
python3 /load_es_data.py /mount_s3/geojson/hex350_grid_cycleroutes2021.geojson fid
python3 /load_es_data.py /mount_s3/geojson/hex350_grid_hindex2020.geojson fid
python3 /load_es_data.py /mount_s3/geojson/hex350_grid_popden_2020.geojson fid
python3 /load_es_data.py /mount_s3/geojson/hex350_grid_gender2020.geojson fid
python3 /load_es_data.py /mount_s3/geojson/hex350_grid_age2020.geojson fid
python3 /load_es_data.py /mount_s3/geojson/hex350_grid_active2020.geojson fid
python3 /load_es_data.py /mount_s3/geojson/hex350_grid_crime_22.geojson fid
python3 /load_es_data.py /mount_s3/geojson/airquality_airpressure.geojson id
python3 /load_es_data.py /mount_s3/geojson/airquality_humidity.geojson id
python3 /load_es_data.py /mount_s3/geojson/airquality_iaqindex.geojson id
python3 /load_es_data.py /mount_s3/geojson/airquality_temperature.geojson id
python3 /load_es_data.py /mount_s3/geojson/ambientlight_ambientlight.geojson id
python3 /load_es_data.py /mount_s3/geojson/analogin_voltage.geojson id
python3 /load_es_data.py /mount_s3/geojson/co2v2_co2conc.geojson id
python3 /load_es_data.py /mount_s3/geojson/co2v2_humidity.geojson id
python3 /load_es_data.py /mount_s3/geojson/co2v2_temperature.geojson id
python3 /load_es_data.py /mount_s3/geojson/gps_data.geojson id
python3 /load_es_data.py /mount_s3/geojson/gps_time.geojson id
python3 /load_es_data.py /mount_s3/geojson/humidity_humidity.geojson id
python3 /load_es_data.py /mount_s3/geojson/soundpressurelevel_spl.geojson id
python3 /load_es_data.py /mount_s3/geojson/tl_rd22_26_bg.geojson id
python3 /load_es_data.py /mount_s3/geojson/500cities_city_11082016.geojson id
python3 /load_es_data.py /mount_s3/geojson/500cities_tracts_11082016.geojson id
python3 /load_es_data.py /mount_s3/geojson/lansing_city_block_group_genderratio_mtow_2017_21.geojson id
python3 /load_es_data.py /mount_s3/geojson/lansing_city_census_tracts_numberofpeopleaged65andabove_2020.geojson id
python3 /load_es_data.py /mount_s3/geojson/lansing_city_block_group_percapitaincome_2020.geojson id
python3 /load_es_data.py /mount_s3/geojson/lansing_city_blockgroup_areadeprivationindex_statescore_2020.geojson id
python3 /load_es_data.py /mount_s3/geojson/lansing_city_census_tracts_disability_2017_21.geojson id
python3 /load_es_data.py /mount_s3/geojson/lansing_city_census_tracts_depression.geojson id
python3 /load_es_data.py /mount_s3/geojson/lansing_chronicobstructivepulmonarydiseaseageabove18yrs_2019_cdc.geojson id
python3 /load_es_data.py /mount_s3/geojson/lansing_coronaryheartdiseaseageabove18yrs_2019_cdc.geojson id
python3 /load_es_data.py /mount_s3/geojson/lansing_currentasthmaageabove18yrs_2019_cdc.geojson id
python3 /load_es_data.py /mount_s3/geojson/lansing_highbpageabove18yrs_2019_cdc.geojson id
python3 /load_es_data.py /mount_s3/geojson/lansing_strokeageabove18yrs_2019_cdc.geojson id
python3 /load_es_data.py /mount_s3/geojson/lansing_diabetesageabove18yrs_2019_cdc.geojson id
python3 /load_es_data.py /mount_s3/geojson/lansing_obesityageabove18yrs_2019_cdc.geojson id
python3 /load_es_data.py /mount_s3/geojson/lansing_physicalhealthnotgoodageabove18yrs_2019_cdc.geojson id
python3 /load_es_data.py /mount_s3/geojson/lansing_noleisuretimepaageabove18yrs_2019_cdc.geojson id
python3 /load_es_data.py /mount_s3/geojson/lansing_city_census_tracts_lifeexpectancyatbirth_10_15.geojson id
python3 /load_es_data.py /mount_s3/geojson/lansing_city_block_group_nationalwalkabilityindex_2021.geojson id
python3 /load_es_data.py /mount_s3/geojson/ucr_2019.geojson ObjectID
python3 /load_es_data.py /mount_s3/geojson/lansing_city_census_tracts_lowaccesstofood.geojson id
python3 /load_es_data.py /mount_s3/geojson/lansing_city_census_tracts_lowincomelowaccess.geojson id
python3 /load_es_data.py /mount_s3/geojson/lansing_city_census_tracts_numberofpeoplebiketowork_2020.geojson id
python3 /load_es_data.py /mount_s3/geojson/lansing_city_census_tracts_traveltimetowork_17_21.geojson id
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
python3 /load_es_data.py /mount_s3/geojson/air_pollution_wzones.geojson zoneid
python3 /load_es_data.py /mount_s3/geojson/dst_2012_wzones.geojson zoneid
python3 /load_es_data.py /mount_s3/geojson/dst_2013_wzones.geojson zoneid
python3 /load_es_data.py /mount_s3/geojson/dst_2014_wzones.geojson zoneid
python3 /load_es_data.py /mount_s3/geojson/dst_2015_wzones.geojson zoneid
python3 /load_es_data.py /mount_s3/geojson/dst_2016_wzones.geojson zoneid
python3 /load_es_data.py /mount_s3/geojson/dst_2017_wzones.geojson zoneid
python3 /load_es_data.py /mount_s3/geojson/dst_2018_wzones.geojson zoneid
python3 /load_es_data.py /mount_s3/geojson/zones.geojson zoneid
python3 /load_es_data.py /mount_s3/geojson/landuse_poi_wzones.geojson zoneid
python3 /load_es_data.py /mount_s3/geojson/noise_wzones.geojson zoneid
python3 /load_es_data.py /mount_s3/geojson/copenhagen_hellerup_sub-oe204002.geojson id
python3 /load_es_data.py /mount_s3/geojson/copenhagen_hellerup_sub-oe204005.geojson id
python3 /load_es_data.py /mount_s3/geojson/copenhagen_hellerup_sub-oe204018.geojson id
python3 /load_es_data.py /mount_s3/geojson/copenhagen_hellerup_sub-oe204019.geojson id
python3 /load_es_data.py /mount_s3/geojson/copenhagen_hellerup_sub-oe204021.geojson id
python3 /load_es_data.py /mount_s3/geojson/copenhagen_nordhavn_sub-oe203005.geojson id
python3 /load_es_data.py /mount_s3/geojson/copenhagen_nordhavn_sub-oe203009.geojson id
python3 /load_es_data.py /mount_s3/geojson/copenhagen_nordhavn_sub-oe203010.geojson id
python3 /load_es_data.py /mount_s3/geojson/copenhagen_nordhavn_sub-oe203011.geojson id
python3 /load_es_data.py /mount_s3/geojson/copenhagen_nordhavn_sub-oe203020.geojson id
python3 /load_es_data.py /mount_s3/geojson/copenhagen_nordhavn_sub-oe203022.geojson id
python3 /load_es_data.py /mount_s3/geojson/copenhagen_nordhavn_sub-oe203023.geojson id
python3 /load_es_data.py /mount_s3/geojson/copenhagen_nordhavn_sub-oe203024.geojson id
python3 /load_es_data.py /mount_s3/geojson/copenhagen_norrebro_sub-oe201009.geojson id
python3 /load_es_data.py /mount_s3/geojson/copenhagen_norrebro_sub-oe201020.geojson id
python3 /load_es_data.py /mount_s3/geojson/copenhagen_norrebro_sub-oe201021.geojson id
python3 /load_es_data.py /mount_s3/geojson/copenhagen_norrebro_sub-oe201022.geojson id
python3 /load_es_data.py /mount_s3/geojson/copenhagen_norrebro_sub-oe201023.geojson id
python3 /load_es_data.py /mount_s3/geojson/copenhagen_norreport_sub-oe2002004.geojson id
python3 /load_es_data.py /mount_s3/geojson/copenhagen_norreport_sub-oe2002015.geojson id
python3 /load_es_data.py /mount_s3/geojson/copenhagen_norreport_sub-oe202022.geojson id
python3 /load_es_data.py /mount_s3/geojson/copenhagen_norreport_sub-oe202023.geojson id
python3 /load_es_data.py /mount_s3/geojson/lansing_downtownnatural_sub-oe109002.geojson id
python3 /load_es_data.py /mount_s3/geojson/lansing_downtownnatural_sub-oe824001.geojson id
python3 /load_es_data.py /mount_s3/geojson/lansing_downtownurban_sub-oe109001.geojson id
python3 /load_es_data.py /mount_s3/geojson/lansing_downtownurban_sub-oe821001.geojson id
python3 /load_es_data.py /mount_s3/geojson/lansing_downtownurban_sub-oe822001.geojson id
python3 /load_es_data.py /mount_s3/geojson/lansing_downtownurban_sub-oe823001.geojson id
python3 /load_es_data.py /mount_s3/geojson/lansing_northnatural_sub-oe036001.geojson id
python3 /load_es_data.py /mount_s3/geojson/lansing_northnatural_sub-oe971001.geojson id
python3 /load_es_data.py /mount_s3/geojson/lansing_northurban_sub-oe036001.geojson id
python3 /load_es_data.py /mount_s3/geojson/lansing_northurban_sub-oe971001.geojson id
python3 /load_es_data.py /mount_s3/geojson/lansing_southnatural_sub-oe931001.geojson id
python3 /load_es_data.py /mount_s3/geojson/lansing_southnatural_sub-oe932001.geojson id
python3 /load_es_data.py /mount_s3/geojson/lansing_southnatural_sub-oe933001.geojson id
python3 /load_es_data.py /mount_s3/geojson/lansing_southnatural_sub-oe933002.geojson id
python3 /load_es_data.py /mount_s3/geojson/lansing_southurban_sub-oe109003.geojson id
python3 /load_es_data.py /mount_s3/geojson/lansing_southurban_sub-oe109004.geojson id
python3 /load_es_data.py /mount_s3/geojson/lansing_southurban_sub-oe109005.geojson id
python3 /load_es_data.py /mount_s3/geojson/lisbon_agudo_sub-oe109003.geojson id
python3 /load_es_data.py /mount_s3/geojson/lisbon_agudo_sub-oe109031.geojson id
python3 /load_es_data.py /mount_s3/geojson/lisbon_alfarrobeira_sub-oe116003.geojson id
python3 /load_es_data.py /mount_s3/geojson/lisbon_alfarrobeira_sub-oe116031.geojson id
python3 /load_es_data.py /mount_s3/geojson/lisbon_baixa_sub-oe104003.geojson id
python3 /load_es_data.py /mount_s3/geojson/lisbon_baixa_sub-oe104004.geojson id
python3 /load_es_data.py /mount_s3/geojson/lisbon_baixa_sub-oe104008.geojson id
python3 /load_es_data.py /mount_s3/geojson/lisbon_baixa_sub-oe104011.geojson id
python3 /load_es_data.py /mount_s3/geojson/lisbon_baixa_sub-oe104013.geojson id
python3 /load_es_data.py /mount_s3/geojson/lisbon_baixa_sub-oe104028.geojson id
python3 /load_es_data.py /mount_s3/geojson/lisbon_baixa_sub-oe104033.geojson id
python3 /load_es_data.py /mount_s3/geojson/lisbon_baixa_sub-oe104051.geojson id
python3 /load_es_data.py /mount_s3/geojson/lisbon_baixa_sub-oe104056.geojson id
python3 /load_es_data.py /mount_s3/geojson/lisbon_baixa_sub-oe104058.geojson id
python3 /load_es_data.py /mount_s3/geojson/lisbon_belem_sub-oe101001.geojson id
python3 /load_es_data.py /mount_s3/geojson/lisbon_belem_sub-oe101002.geojson id
python3 /load_es_data.py /mount_s3/geojson/lisbon_belem_sub-oe101003.geojson id
python3 /load_es_data.py /mount_s3/geojson/lisbon_belem_sub-oe101005.geojson id
python3 /load_es_data.py /mount_s3/geojson/lisbon_belem_sub-oe101006.geojson id
python3 /load_es_data.py /mount_s3/geojson/lisbon_belem_sub-oe101007.geojson id
python3 /load_es_data.py /mount_s3/geojson/lisbon_belem_sub-oe101012.geojson id
python3 /load_es_data.py /mount_s3/geojson/lisbon_belem_sub-oe101027.geojson id
python3 /load_es_data.py /mount_s3/geojson/lisbon_belem_sub-oe101031.geojson id
python3 /load_es_data.py /mount_s3/geojson/lisbon_belem_sub-oe101065.geojson id
python3 /load_es_data.py /mount_s3/geojson/lisbon_casamoeda_sub-oe108003.geojson id
python3 /load_es_data.py /mount_s3/geojson/lisbon_casamoeda_sub-oe108031.geojson id
python3 /load_es_data.py /mount_s3/geojson/lisbon_estrelaa_sub-oe120003.geojson id
python3 /load_es_data.py /mount_s3/geojson/lisbon_estrelaa_sub-oe120031.geojson id
python3 /load_es_data.py /mount_s3/geojson/lisbon_estrelab_sub-oe121031.geojson id
python3 /load_es_data.py /mount_s3/geojson/lisbon_estrela_sub-oe119003.geojson id
python3 /load_es_data.py /mount_s3/geojson/lisbon_estrela_sub-oe119031.geojson id
python3 /load_es_data.py /mount_s3/geojson/lisbon_graça_sub-oe105005.geojson id
python3 /load_es_data.py /mount_s3/geojson/lisbon_graça_sub-oe105006.geojson id
python3 /load_es_data.py /mount_s3/geojson/lisbon_graça_sub-oe105007.geojson id
python3 /load_es_data.py /mount_s3/geojson/lisbon_graça_sub-oe105016.geojson id
python3 /load_es_data.py /mount_s3/geojson/lisbon_graça_sub-oe105017.geojson id
python3 /load_es_data.py /mount_s3/geojson/lisbon_graça_sub-oe105025.geojson id
python3 /load_es_data.py /mount_s3/geojson/lisbon_graça_sub-oe105029.geojson id
python3 /load_es_data.py /mount_s3/geojson/lisbon_graça_sub-oe105049.geojson id
python3 /load_es_data.py /mount_s3/geojson/lisbon_graça_sub-oe105056.geojson id
python3 /load_es_data.py /mount_s3/geojson/lisbon_graça_sub-oe105071.geojson id
python3 /load_es_data.py /mount_s3/geojson/lisbon_gulb1_sub-oe107003.geojson id
python3 /load_es_data.py /mount_s3/geojson/lisbon_gulb1_sub-oe107031.geojson id
python3 /load_es_data.py /mount_s3/geojson/lisbon_gulbenkian_sub-oe103024.geojson id
python3 /load_es_data.py /mount_s3/geojson/lisbon_gulbenkian_sub-oe103026.geojson id
python3 /load_es_data.py /mount_s3/geojson/lisbon_gulbenkian_sub-oe103031.geojson id
python3 /load_es_data.py /mount_s3/geojson/lisbon_gulbenkian_sub-oe103035.geojson id
python3 /load_es_data.py /mount_s3/geojson/lisbon_gulbenkian_sub-oe103040.geojson id
python3 /load_es_data.py /mount_s3/geojson/lisbon_gulbenkian_sub-oe103041.geojson id
python3 /load_es_data.py /mount_s3/geojson/lisbon_gulbenkian_sub-oe103061.geojson id
python3 /load_es_data.py /mount_s3/geojson/lisbon_gulbenkian_sub-oe103073.geojson id
python3 /load_es_data.py /mount_s3/geojson/lisbon_gulbenkian_sub-oe103074.geojson id
python3 /load_es_data.py /mount_s3/geojson/lisbon_lapa_sub-oe102002.geojson id
python3 /load_es_data.py /mount_s3/geojson/lisbon_lapa_sub-oe102003.geojson id
python3 /load_es_data.py /mount_s3/geojson/lisbon_lapa_sub-oe102006.geojson id
python3 /load_es_data.py /mount_s3/geojson/lisbon_lapa_sub-oe102009.geojson id
python3 /load_es_data.py /mount_s3/geojson/lisbon_lapa_sub-oe102015.geojson id
python3 /load_es_data.py /mount_s3/geojson/lisbon_lapa_sub-oe102023.geojson id
python3 /load_es_data.py /mount_s3/geojson/lisbon_lapa_sub-oe102029.geojson id
python3 /load_es_data.py /mount_s3/geojson/lisbon_lapa_sub-oe102031.geojson id
python3 /load_es_data.py /mount_s3/geojson/lisbon_lapa_sub-oe102054.geojson id
python3 /load_es_data.py /mount_s3/geojson/lisbon_luz_sub-oe115003.geojson id
python3 /load_es_data.py /mount_s3/geojson/lisbon_luz_sub-oe115031.geojson id
python3 /load_es_data.py /mount_s3/geojson/lisbon_madre_sub-oe113003.geojson id
python3 /load_es_data.py /mount_s3/geojson/lisbon_madre_sub-oe113031.geojson id
python3 /load_es_data.py /mount_s3/geojson/lisbon_marvila_sub-oe111003.geojson id
python3 /load_es_data.py /mount_s3/geojson/lisbon_marvila_sub-oe111031.geojson id
python3 /load_es_data.py /mount_s3/geojson/lisbon_msoares_sub-oe110031.geojson id
python3 /load_es_data.py /mount_s3/geojson/lisbon_oriente_sub-oe112003.geojson id
python3 /load_es_data.py /mount_s3/geojson/lisbon_oriente_sub-oe112031.geojson id
python3 /load_es_data.py /mount_s3/geojson/lisbon_parque_sub-oe106001.geojson id
python3 /load_es_data.py /mount_s3/geojson/lisbon_parque_sub-oe106005.geojson id
python3 /load_es_data.py /mount_s3/geojson/lisbon_parque_sub-oe106010.geojson id
python3 /load_es_data.py /mount_s3/geojson/lisbon_parque_sub-oe106011.geojson id
python3 /load_es_data.py /mount_s3/geojson/lisbon_parque_sub-oe106013.geojson id
python3 /load_es_data.py /mount_s3/geojson/lisbon_parque_sub-oe106016.geojson id
python3 /load_es_data.py /mount_s3/geojson/lisbon_parque_sub-oe106021.geojson id
python3 /load_es_data.py /mount_s3/geojson/lisbon_parque_sub-oe106022.geojson id
python3 /load_es_data.py /mount_s3/geojson/lisbon_parque_sub-oe106034.geojson id
python3 /load_es_data.py /mount_s3/geojson/lisbon_prazeres_sub-oe122003.geojson id
python3 /load_es_data.py /mount_s3/geojson/lisbon_prazeres_sub-oe122031.geojson id
python3 /load_es_data.py /mount_s3/geojson/lisbon_pupilos_sub-oe114031.geojson id
python3 /load_es_data.py /mount_s3/geojson/lisbon_restauradores_sub-oe117003.geojson id
python3 /load_es_data.py /mount_s3/geojson/lisbon_restelo_sub-oe118031.geojson id
python3 /load_es_data.py /mount_s3/geojson/london_bigben_sub-oe550001.geojson id
python3 /load_es_data.py /mount_s3/geojson/london_nottinghill_sub-oe309001.geojson id
python3 /load_es_data.py /mount_s3/geojson/london_nottinghill_sub-oe309002.geojson id
python3 /load_es_data.py /mount_s3/geojson/london_nottinghill_sub-oe550001.geojson id
python3 /load_es_data.py /mount_s3/geojson/london_nottinghill_sub-oe576003.geojson id
python3 /load_es_data.py /mount_s3/geojson/london_whitechapel_sub-oe309002.geojson id
python3 /load_es_data.py /mount_s3/geojson/london_whitechapel_sub-oe550001.geojson id
python3 /load_es_data.py /mount_s3/geojson/london_whitechapel_sub-oe576003.geojson id


echo "Creating the ec_catalog index"
ELASTIC_HOST="http://localhost:9200"
INDEX_NAME="ec_catalog"

# Use curl to send a HEAD request to check if the index exists
response=$(curl -s -o /dev/null -w "%{http_code}" "$ELASTIC_HOST/$INDEX_NAME")

# Check the HTTP status code
if [ "$response" -eq 200 ]; then
    echo "Index '$INDEX_NAME' exists."
elif [ "$response" -eq 404 ]; then
    echo "Index '$INDEX_NAME' does not exist. Creating..."
    response=$(curl -X PUT "$ELASTIC_HOST/$INDEX_NAME")
  echo $response
  echo "Index '$INDEX_NAME' created."
else
    echo "Unexpected response code: $response"
fi


echo "Seems that data was loaded"

## *************************************************************

# create a new index with the settings in es_index_config.json
#curl -v --insecure --user elastic:changeme -XPUT '0.0.0.0:9200/test?pretty' -H 'Content-Type: application/json' -d @es_index_config.json
