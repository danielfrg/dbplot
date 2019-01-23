DROP TABLE IF EXISTS airlines;

CREATE TABLE airlines (
  carrier varchar(7) NOT NULL DEFAULT '',
  name varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (carrier)
);

DROP TABLE IF EXISTS airports;

CREATE TABLE airports (
  faa varchar(3) NOT NULL DEFAULT '',
  name varchar(255),
  lat decimal(10,7) DEFAULT NULL,
  lon decimal(10,7) DEFAULT NULL,
  alt int DEFAULT NULL,
  tz decimal DEFAULT NULL,
  dst char(1),
  tzone varchar(255),
  PRIMARY KEY (faa)
);

DROP TABLE IF EXISTS planes;

CREATE TABLE planes (
  tailnum varchar(6) NOT NULL DEFAULT '',
  year int DEFAULT NULL,
  type text,
  manufacturer text,
  model text,
  engines int DEFAULT NULL,
  seats int DEFAULT NULL,
  speed int DEFAULT NULL,
  engine text,
  PRIMARY KEY (tailnum)
);

DROP TABLE IF EXISTS flights CASCADE;

-- "year","month","day","dep_time","dep_delay","arr_time","arr_delay","carrier","tailnum","flight","origin","dest","air_time","distance","hour","minute"
CREATE TABLE flights (  
  year smallint DEFAULT NULL,
  month smallint DEFAULT NULL,
  day smallint DEFAULT NULL,
  -- dep_time varchar(4) NOT NULL DEFAULT '',
  dep_time varchar(4) NULL DEFAULT '',
  dep_delay smallint DEFAULT NULL,
  -- arr_time varchar(4) NOT NULL DEFAULT '',
  arr_time varchar(4) NULL DEFAULT '',
  arr_delay smallint DEFAULT NULL,
  carrier varchar(2) NOT NULL DEFAULT '',
  tailnum varchar(6) DEFAULT NULL,
  flight smallint DEFAULT NULL,
  origin varchar(3) NOT NULL DEFAULT '',
  dest varchar(3) NOT NULL DEFAULT '',
  air_time smallint DEFAULT NULL,
  distance smallint DEFAULT NULL,
  hour smallint DEFAULT NULL,
  minute smallint DEFAULT NULL
);

CREATE INDEX IF NOT EXISTS year_idx ON flights (year);
CREATE INDEX IF NOT EXISTS date_idx ON flights (year, month, day);
CREATE INDEX IF NOT EXISTS origin_idx ON flights (origin);
CREATE INDEX IF NOT EXISTS dest_idx ON flights (dest);
CREATE INDEX IF NOT EXISTS carrier_idx ON flights (carrier);
CREATE INDEX IF NOT EXISTS tailnum_idx ON flights (tailnum);

-- Import CSVs
COPY airlines(carrier, name) 
FROM '/raw-data/nycflights13/airlines.csv' DELIMITER ',' CSV HEADER;

COPY airports(faa, name, lat, lon, alt, tz, dst, tzone) 
FROM '/raw-data/nycflights13/airports.csv' DELIMITER ',' CSV HEADER;

COPY planes(tailnum, year, type, manufacturer, model, engines, seats, speed, engine)
FROM '/raw-data/nycflights13/planes.csv' DELIMITER ',' CSV HEADER;

COPY flights(year, month, day, dep_time, dep_delay, arr_time, arr_delay, carrier, tailnum, flight, origin, dest, air_time, distance, hour,minute) 
FROM '/raw-data/nycflights13/nycflights13.csv' DELIMITER ',' CSV HEADER;

