DROP TABLE employee

CREATE TABLE employee (
    id SERIAL PRIMARY KEY,
    name VARCHAR(200),
    position VARCHAR(300) REFERENCES positions(name)
);

CREATE TABLE positions(
        name VARCHAR(300) PRIMARY KEY,
        department VARCHAR(200),
        car_aviability BOOLEAN
)  

INSERT INTO positions (name,car_aviability)
VALUES ('JS developer', false),
       ( 'Sales manager', false),
       ( 'Bodyguard for developers', true),
       ('Driver', true)

INSERT INTO employee (name,position)
VALUES ('Nataliia', 'JS developer'),
       ('Roll', 'Sales manager'),
       ('Jeck', 'Bodyguard for developers'),
       ('Ann', 'Driver')


 INSERT INTO employee (name,position)
VALUES ('Naris', 'CFO'),
       ('Serg', 'CEO'),
       ('Jon', 'SMM/PR division'),
       ('Adrea', 'Accountant')      

 INSERT INTO positions (name,car_aviability)
VALUES ('CFO', true),
       ( 'CEO', true),
       ( 'SMM/PR division', false),
       ('Accountant', false)      


SELECT *
FROM employee AS e JOIN positions AS p
ON e.position = p.name