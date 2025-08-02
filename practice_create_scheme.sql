CREATE SCHEMA Nataliia

CREATE TABLE nataliia.users(
    login VARCHAR(20) CHECK(login != '') NOT NULL,
    password VARCHAR(20) CHECK(password != '')  NOT NULL,
    email VARCHAR(20) PRIMARY KEY
);

CREATE TABLE nataliia.employees(
    id SERIAL PRIMARY KEY,
    name VARCHAR(200) CHECK(name != '') NOT NULL,
    salary NUMERIC(10, 2) CHECK(salary >= 0) NOT NULL,
    position int REFERENCES nataliia.positions(id),
    hire_date TIMESTAMP DEFAULT CURRENT_DATE
);


CREATE TABLE nataliia.positions(
    id SERIAL PRIMARY KEY,
    position VARCHAR(200) CHECK(position != '') NOT NULL,
    department VARCHAR(200) CHECK(department != '') NOT NULL
);
