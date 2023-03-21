-- CREATE SCHEMA geostore 
CREATE user geostore LOGIN PASSWORD 'geostore123!4' NOSUPERUSER INHERIT NOCREATEDB NOCREATEROLE;

CREATE SCHEMA geostore;

GRANT USAGE ON SCHEMA geostore TO geostore ;
GRANT ALL ON SCHEMA geostore TO geostore ;

--GRANT SELECT ON public.spatial_ref_sys to geostore;
--GRANT SELECT,INSERT,DELETE ON public.geometry_columns to geostore;

alter user geostore set search_path to geostore , public;

