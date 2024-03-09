USE recipe_macros_database;

INSERT INTO recipe (recipe_name, minutes_of_prep, hrs_of_prep) VALUES 
    ('sandwich', 30, 0.0), 
    ('turkey', 31, 25.2),
    ('hamburger', 1, 10),
    ('bowl of store-bought olives', 0, 0),
    ('Hottodoggu', 10, 0),
    ('Hanbaga', 15, 0),
    ('Chips', 1, 0),
    ('Bob\'s Burgers', 1, 0);

INSERT INTO meal (date_of_meal, servings_consumed, fk_recipe) VALUES 
    ('2008-11-11', 3, 1),
    ('2008-11-11', 2, 2),
    ('2008-11-11', 3, 1);
    
INSERT INTO ingredient (ingredient_name, cals_per_hundred_grams, protein_grams, carbs_grams, fat_grams, fiber_grams) VALUES 
    ('buns', 43, 12, 1, 1, 1),
    ('meat patty', 100, 25, 10, 0, 1),
    ('cheddar cheese slice', 90, 8, 5, 8, 1);

INSERT INTO ingredient_recipe (ingredient_id, recipe_id) VALUES
    (1, 1),
    (2, 1),
    (3, 1);

SELECT * FROM recipe;
SELECT * FROM meal;
SELECT * FROM ingredient;
SELECT * FROM ingredient_recipe;







