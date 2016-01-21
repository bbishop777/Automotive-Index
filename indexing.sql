CREATE USER indexed_cars_user;
CREATE DATABASE indexed_cars;
ALTER DATABASE indexed_cars OWNER TO inexed_cars_user;

\c indexed_cars;
\i /scripts/car_models.sql;