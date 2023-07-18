CREATE TABLE "person" (
	id SERIAL PRIMARY KEY,
	name VARCHAR(30)
	);
	
CREATE TABLE "hobby" (
	id SERIAL PRIMARY KEY,
	name VARCHAR(100)
);

INSERT INTO "person" (name) 
VALUES ('Savon'), ('Peder'), ('Georgie');

INSERT INTO "hobby" (name)
VALUES ('Biking'), ('Climbing'), ('Golf'), ('Birdwatching');

SELECT * FROM "hobby";

CREATE TABLE "person_hobby" (
	id SERIAL PRIMARY KEY,
	person_id INT REFERENCES "person",
	hobby_id INT REFERENCES "hobby",
	skill INT
);

INSERT INTO "person_hobby" (person_id, hobby_id, skill)
VALUES (1, 3, 7), (2, 2, 8), (3, 1, 8), (1, 4, 2), (2, 3, 7), (3, 4, 2);

SELECT * FROM "person_hobby";

SELECT * FROM "person"
JOIN "person_hobby"
-- The ON statement is how the two tables fit together
-- These tables should connect where the person id's match 
ON "person"."id" = "person_hobby"."person_id";

-- Get back all the data
SELECT * FROM "person"
JOIN "person_hobby" 
ON "person"."id" = "person_hobby"."person_id"
JOIN "hobby" 
ON "hobby"."id" = "person_hobby"."hobby_id";

-- After the SELECT, we can define which columns we get back
SELECT "person"."name" AS "person_name", 
"hobby"."name" AS "hobby_name", 
"person_hobby"."skill"
FROM "hobby"
JOIN "person_hobby"
ON "hobby"."id" = "person_hobby"."hobby_id"
JOIN "person"
ON "person"."id" = "person_hobby"."person_id"
WHERE "person"."name" LIKE 'Peder';

-- Get back total count of people
SELECT count(*) FROM "person";

-- Get back minimum value for skill
SELECT MIN("skill") FROM "person_hobby";

-- Get back maximum value for skill
SELECT MAX("skill") FROM "person_hobby";

SELECT MAX("skill"), MIN("skill") FROM "person_hobby";

-- How many users have each hobby?
SELECT "hobby"."name", count("person_hobby"."hobby_id") FROM "hobby"
JOIN "person_hobby"
ON "person_hobby"."hobby_id" = "hobby"."id"
GROUP BY "hobby"."name";
