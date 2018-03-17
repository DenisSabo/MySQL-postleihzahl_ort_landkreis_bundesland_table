

CREATE TABLE plz_ort_ldk(
    -- max 7 digits, mediumint = 3 bytes + unsigned -> 16.777.215 (max. value) > 7 digits 
	osm_id mediumint unsigned, 

    -- max length = 33, "Neukirchen bei Sulzbach-Rosenberg"
	ort varchar(33), 
    
    plz mediumint unsigned,
    
    -- max length = 45, but "landkreis" in name included,
    -- longest name = "Landkreis Neustadt an der Aisch-Bad Windsheim"
    -- if there is no landkreis, ort = landkreis
    landkreis varchar(45) null, 

    -- max length = 22 "Mecklenburg-Vorpommern"		   
    bundesland varchar(22), 
    
    CONSTRAINT pk_plz_ort_ldk PRIMARY KEY (ort, plz)
);

-- execute to load data into table "plz_ort_ldk"
LOAD DATA LOCAL INFILE 'directory/to/file/zuordnung_plz_ort_landkreis_default.csv'
INTO TABLE plz_ort_ldk
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    ENCLOSED BY '"'
IGNORE 1 LINES
(osm_id, ort, plz, landkreis, bundesland);