-- 1 до 1 

CREATE TABLE coaches(
    id SERIAL PRIMARY KEY,
    name VARCHAR(250) CHECK(name != '') NOT NULL  
);

CREATE TABLE teams(
    id SERIAL PRIMARY KEY,
    name VARCHAR(250) CHECK(name != '') NOT NULL,
    coache_id INT REFERENCES coaches(id)
);

ALTER TABLE coaches
ADD COLUMN team_id INT REFERENCES teams(id);