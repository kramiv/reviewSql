-- notes:
-- recipe_ak_1 = tablename_alternatekey_1 (or 2, 3, ...)
-- 		represents another unique value per row of data like the primary key

USE recipe_macros_database;

DROP TABLE IF EXISTS `ingredient_recipe`;
DROP TABLE IF EXISTS `ingredient`;
DROP TABLE IF EXISTS `recipe`;
DROP TABLE IF EXISTS `meal`;

-- a meal has multiple recipes (main course, dessert, etc.)
CREATE TABLE meal (
	id int NOT NULL AUTO_INCREMENT,
    date_of_meal date,
    servings_consumed int NOT NULL,
    CONSTRAINT meal_pk UNIQUE (id)
);

-- ingredient is many-many with recipe
CREATE TABLE recipe (
	id INT NOT NULL AUTO_INCREMENT,
    recipe_name char(128) NOT NULL,
    minutes_of_prep decimal(10,0),
    hrs_of_prep decimal(10,1) NOT NULL,
    CONSTRAINT recipe_ak_1 UNIQUE (recipe_name),
    CONSTRAINT recipe_pk PRIMARY KEY (id),
    CONSTRAINT fk_meal FOREIGN KEY (id)
    REFERENCES meal(id)
);

-- ingredient is many-many with recipe
CREATE TABLE ingredient (
	id int NOT NULL AUTO_INCREMENT,
    ingredient_name char(128) NOT NULL,
    cals_per_hundred_grams int,
    protein_grams int,
    carbs_grams int,
    fat_grams int,
    fiber_grams int,
    CONSTRAINT ingredient_ak_1 UNIQUE (ingredient_name),
    CONSTRAINT ingredient_pk PRIMARY KEY (id)
);

-- ingredient is many-many with recipe
CREATE TABLE ingredient_recipe (
	ingredient_id int NOT NULL,
    recipe_id int NOT NULL,
    CONSTRAINT ingredient_id FOREIGN KEY (ingredient_id)
	REFERENCES ingredient(id),
    CONSTRAINT recipe_id FOREIGN KEY (recipe_id)
    REFERENCES recipe(id),
    PRIMARY KEY (ingredient_id, recipe_id)
);







