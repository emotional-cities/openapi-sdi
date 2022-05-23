>&2 echo "Pushing geopackage indexes"
rm -f /out/activity_level_ldn.geojson
ogr2ogr -geomfield geom -nlt MULTIPOLYGON -s_srs EPSG:27700 -t_srs EPSG:4326 -makevalid -overwrite -f GeoJSON /out/activity_level_ldn.geojson /in/activity_level_ldn.gpkg 
rm -f /out/cardivasular_disease_ldn.geojson
ogr2ogr -geomfield geom -nlt MULTIPOLYGON -s_srs EPSG:27700 -t_srs EPSG:4326 -makevalid -overwrite -f GeoJSON /out/cardivasular_disease_ldn.geojson /in/cardivasular_disease_ldn.gpkg 
rm -f /out/tweet_count_sample.geojson
ogr2ogr -geomfield geom -nlt MULTIPOLYGON -s_srs EPSG:27700 -t_srs EPSG:4326 -makevalid -overwrite -f GeoJSON /out/tweet_count_sample.geojson /in/tweet_count_sample.gpkg 
chmod 744 /out/*.geojson
>&2 echo "Geopackage indexes are loaded"
exec $@