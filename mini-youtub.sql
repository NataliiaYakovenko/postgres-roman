CREATE DATABASE mini_youtub;

CREATE TABLE users(
   id SERIAL PRIMARY KEY,
   nickname  VARCHAR (100) CHECK(nickname != '') NOT NULL
);
INSERT INTO users(nickname)
VALUES ('Natalia'),
        ('Jon'),
        ('Pheabi');


CREATE TABLE contents(
  id SERIAL PRIMARY KEY,
  name VARCHAR (256) CHECK(name != '') NOT NULL,
  description TEXT,
  author_id INT REFERENCES users(id),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);  
INSERT INTO contents(name, author_id)
VALUES ('funy dogs', 3);



CREATE TABLE reactions(
    content_id INT REFERENCES contents(id),
    user_id INT REFERENCES users(id),
    is_liked BOOLEAN
);
INSERT INTO reactions(content_id, user_id,is_liked)
VALUES (1, 1, true);