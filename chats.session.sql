CREATE DATABASE chats;


CREATE TABLE users(
   id SERIAL PRIMARY KEY,
   nickname  VARCHAR (100) CHECK(nickname != '') NOT NULL
);
INSERT INTO users(nickname)
VALUES ('Natakia'),
        ('Jon'),
        ('Pheabi');



CREATE TABLE chats(
     id SERIAL PRIMARY KEY,
    name  VARCHAR (260) CHECK(name != '') NOT NULL,
    owner_id INT REFERENCES users(id)  ,
    created_at  TIMESTAMP  DEFAULT CURRENT_TIMESTAMP
);
INSERT INTO chats(name, owner_id)
VALUES ('Super chat', 1),
       ('Travel chat', 2),
       ('Shop chat', 3);



CREATE TABLE chats_to_users(
      chat_id INT REFERENCES chats(id),
      user_id INT REFERENCES users(id),
      join_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
     PRIMARY KEY (chat_id, user_id )
);
INSERT INTO chats_to_users(chat_id,user_id)
VALUES (1, 1),
       (2, 2),
       (3, 3);

INSERT INTO chats_to_users(chat_id,user_id)
VALUES (1, 2);      



CREATE TABLE messages(
    id SERIAL PRIMARY KEY,
    body TEXT CHECK(body != '') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    is_read BOOLEAN NOT NULL DEFAULT false,
    -- author_id INT REFERENCES chats_to_users(user_id),  -- варіант 1
    -- chat_id INT REFERENCES chats_to_users(chat_id)     -- варіант 1
    author_id INT,                                             -- варіант 2
    chat_id INT ,                                               -- варіант 2
    FOREIGN KEY (author_id, chat_id) REFERENCES chats_to_users(user_id, chat_id)  -- варіант 2
);

INSERT INTO messages(body,author_id,chat_id)
VALUES('Go to drink coffee', 1, 1),
      ('Go', 2, 1);
