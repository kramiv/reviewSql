-- notes:
-- recipe_ak_1 = tablename_alternatekey_1 (or 2, 3, ...)
-- 		represents another unique value per row of data like the primary key

USE recipe_macros_database;

DROP TABLE IF EXISTS `ingredient_recipe`;
DROP TABLE IF EXISTS `ingredient`;
DROP TABLE IF EXISTS `meal`;
DROP TABLE IF EXISTS `recipe`;

-- ingredient is many-many with recipe
CREATE TABLE recipe (
    id INT NOT NULL AUTO_INCREMENT,
    recipe_name char(128) NOT NULL,
    minutes_of_prep decimal(10,0),
    hrs_of_prep decimal(10,1) NOT NULL,
    CONSTRAINT recipe_ak_1 UNIQUE (recipe_name),
    CONSTRAINT recipe_pk PRIMARY KEY (id)
);

-- in this example, a meal can have only one recipe. 
-- a given recipe can show up in multiple meals. 
-- could I include a constraint here to make combo of fk_recipe, date_of_meal unique, 
-- or is that business logic?
CREATE TABLE meal (
    id int NOT NULL AUTO_INCREMENT,
    fk_recipe int NOT NULL, 
    date_of_meal date,
    servings_consumed int NOT NULL,
    CONSTRAINT meal_pk UNIQUE (id),
    CONSTRAINT fk_recipe FOREIGN KEY (id)
    REFERENCES recipe(id)
);
-- todo: do I need to add fk_recipe as a table variable above?

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
    PRIMARY KEY (ingredient_id, recipe_id),
    CONSTRAINT ingredient_id FOREIGN KEY (ingredient_id)
    REFERENCES ingredient(id),
    CONSTRAINT recipe_id FOREIGN KEY (recipe_id)
    REFERENCES recipe(id)
);
-- todo: mess around with variable names to see what "ingredient_id" is exactly in each chunk







