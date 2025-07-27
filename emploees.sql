CREATE TABLE emploees(
    id SERIAL PRIMARY KEY,
    first_name varchar(64) NOT NULL CHECK(first_name != ''),
    salary NUMERIC(10, 2)
    work_hours NUMERIC(5, 2)
)

INSERT INTO emploees (first_name, salary, work_hours)
VALUES ('Nataliia', 100 000, 120),
       ('Evgen', 150 000, 120),
       ('Roll', 160 000, 120),