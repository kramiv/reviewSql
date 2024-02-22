-- see setup.txt

DROP DATABASE IF EXISTS recipe_macros_database;
CREATE DATABASE recipe_macros_database;

-- identity = start at 1, increase by 1, auto-generate
DROP TABLE IF EXISTS `recipe`;
CREATE TABLE recipe (
	id int NOT NULL AUTO_INCREMENT,
    recipe_name char(128) NOT NULL,
    minutes_of_prep decimal(10,0),
    hrs_of_prep decimal(10,1) NOT NULL,
    CONSTRAINT recipe_pk PRIMARY KEY (id)
);