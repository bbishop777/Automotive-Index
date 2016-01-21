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

SELECT make_code, model_code, model_title, year FROM car_models WHERE make_code= 'LAM';
-- timing took 21.652 ms

SELECT count(*) FROM car_models WHERE make_code= 'LAM';


SELECT * FROM car_models WHERE year BETWEEN 2010 AND 2015;
-- timing took 61.986 ms
SELECT count(*) FROM car_models WHERE year BETWEEN 2010 AND 2015;

SELECT * FROM car_models WHERE year= 2010;
-- timing took 31.176 ms


-- // indexes creation:
-- Create a query to get a list of all make_title values from the car_models table where the
-- make_code is 'LAM', without any duplicate rows, and note the time somewhere. (should have
  -- 1 result)
CREATE INDEX make_code_index ON car_models (make_code);
SELECT DISTINCT make_title FROM car_models WHERE make_code LIKE '%LAM%';
-- timing 24.897 ms...maybe no improvement because HD is solid state and data base is not that large

-- Create a query to list all model_title values where the make_code is 'NISSAN', and the
-- model_code is 'GT-R' without any duplicate rows, and note the time somewhere.
-- (should have 1 result)
CREATE INDEX make_codeANDmodel_code ON car_models (make_code, model_code);
SELECT DISTINCT model_title FROM car_models WHERE make_code= 'NISSAN' AND model_code= 'GT-R';
-- timing .817 ms


-- Create a query to list all make_code, model_code, model_title, and year from car_models
-- where the make_code is 'LAM', and note the time somewhere. (should have 1360 rows)

-- Already have index set on make_code so no need to set another:
SELECT make_code, model_code, model_title, year FROM car_models WHERE make_code= 'LAM';
-- timing 1.867 ms


-- Create a query to list all fields from all car_models in years between 2010 and 2015,
-- and note the time somewhere (should have 78840 rows)
CREATE INDEX year_index ON car_models (year);
SELECT * FROM car_models WHERE year BETWEEN 2010 AND 2015;
-- timing 50.13 ms


-- Create a query to list all fields from all car_models in the year of 2010, and note the
-- time somewhere (should have 13140 rows)
-- Already set index on year so no need to set again
SELECT * FROM car_models WHERE year= 2010;
-- timing 12.934 ms