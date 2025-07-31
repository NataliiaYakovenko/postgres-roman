DROP TABLE employee, positions,departments

CREATE TABLE employee (
    id SERIAL PRIMARY KEY,
    name VARCHAR(200),
    position VARCHAR(200) REFERENCES positions(name)
);

CREATE TABLE positions(
        name VARCHAR(300) PRIMARY KEY,
        department VARCHAR(200) REFERENCES departments(name),
        car_aviability BOOLEAN
)  

CREATE TABLE departments (
    name VARCHAR(200) PRIMARY KEY,
    phone_namber VARCHAR(15)
)       


ALTER TABLE employee
DROP COLUMN department_phone

ALTER TABLE employee
ADD FOREIGN KEY (department) REFERENCES departments(name)



INSERT INTO positions (name,department,car_aviability)
VALUES ('JS developer', 'Top manadgment',false),
       ( 'Sales manager','Top manadgment', false),
       ( 'Bodyguard for developers','Hoz department', true),
       ('Driver','Hoz department', true),
       ('CFO','Finantial', true),
       ( 'CEO', 'Finantial',true),
       ( 'SMM/PR division', 'Top manadgment',false),
       ('Accountant','Finantial', false) 

INSERT INTO employee (name,position)
VALUES ('Nataliia', 'JS developer'),
       ('Roll', 'Sales manager'),
       ('Jeck', 'Bodyguard for developers'),
       ('Ann', 'Driver'),
       ('Naris','CFO' ),
       ('Serg', 'CEO'),
       ('Jon', 'SMM/PR division'),
       ('Adrea', 'Accountant')      


     

 INSERT INTO positions (name,car_aviability)
VALUES ('CFO', true),
       ( 'CEO', true),
       ( 'SMM/PR division', false),
       ('Accountant', false)      



INSERT INTO departments (name,phone_namber)
VALUES ('Top manadgment', '234-55-66'),
       ('Finantial','222-66-77'),
       ('Hoz department', '999-44-55')
     

SELECT *
FROM employee AS e JOIN positions AS p
ON e.position = p.name

SELECT *
FROM employee AS e JOIN positions AS p
ON e.position = p.name
                   JOIN departments AS d
                   ON  p.department = d.name

