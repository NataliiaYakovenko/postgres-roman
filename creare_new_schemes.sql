CREATE SCHEMA new_schema;


CREATE TABLE new_schema.users(
    first_name VARCHAR(200) NOT NULL CHECK(first_name != ''),
    last_name VARCHAR(200) NOT NULL CHECK(last_name != ''),
    email VARCHAR(200) NOT NULL CHECK(email != '')
  );