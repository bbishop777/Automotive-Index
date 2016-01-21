CREATE USER indexed_cars_user;
CREATE DATABASE indexed_cars;
ALTER DATABASE indexed_cars OWNER TO inexed_cars_user;

\c indexed_cars;
\i scripts/car_models.sql;

\i scripts/car_model_data.sql
\i scripts/car_model_data.sql
\i scripts/car_model_data.sql
\i scripts/car_model_data.sql
\i scripts/car_model_data.sql
\i scripts/car_model_data.sql
\i scripts/car_model_data.sql
\i scripts/car_model_data.sql
\i scripts/car_model_data.sql
\i scripts/car_model_data.sql
-- Turns on timing ot time statements

\timing
SELECT DISTINCT make_title FROM car_models WHERE make_code LIKE '%LAM%';
-- timing took 24.363 ms

SELECT DISTINCT model_title FROM car_models WHERE make_code= 'NISSAN' AND model_code= 'GT-R';
-- timing took 21.356 ms