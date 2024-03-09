-- SELECT (CASE WHEN 1+2 > 2*3 THEN 'greater' ELSE 'smaller' END) AS comparison;

USE recipe_macros_database;

-- SELECT * FROM recipe;
-- SELECT * FROM meal;
-- SELECT * FROM ingredient;
-- SELECT * FROM ingredient_recipe;

-- join tables from many-many relationship:

-- SELECT recipe_id, ingredient_id
-- FROM recipe AS r
-- INNER JOIN 
-- ingredient_recipe AS ir
-- ON r.id = ir.recipe_id
-- INNER JOIN
-- ingredient AS i
-- ON ir.ingredient_id = i.id;


-- get macros information for sandwich:

-- first, get ingredient info where recipe id = 1
-- note: without i.id vs just id, it has ambiguous error. samd with r.id
SELECT i.id, r.id, ir.ingredient_id, ir.recipe_id, ingredient_name, cals_per_hundred_grams, protein_grams, carbs_grams, fat_grams, fiber_grams
FROM ingredient AS i
INNER JOIN 
ingredient_recipe AS ir
ON i.id = ir.ingredient_id
INNER JOIN 
recipe AS r
ON ir.recipe_id = r.id
WHERE r.id = 1;

-- modify the query above to get the sum of nutritional info for each column
SELECT r.recipe_name, r.id, SUM(cals_per_hundred_grams) AS cals, SUM(protein_grams) AS protein, SUM(carbs_grams) AS carbs, SUM(fat_grams) AS fat, SUM(fiber_grams) AS fiber
FROM ingredient AS i
INNER JOIN 
ingredient_recipe AS ir
ON i.id = ir.ingredient_id
INNER JOIN 
recipe AS r
ON ir.recipe_id = r.id
WHERE r.id = 1 
GROUP BY r.id;