CREATE TABLE userss(
   id SERIAL PRIMARY KEY,
   nickname  VARCHAR (100) CONSTRAINT nickname_not_empty CHECK(nickname != '') NOT NULL
);

CREATE TABLE chats(
     id SERIAL PRIMARY KEY,
    name  VARCHAR (260) CONSTRAINT name_not_empty CHECK(name != '') NOT NULL,
    owner_id INT REFERENCES userss(id)  ,
    created_at  TIMESTAMP CONSTRAINT created_at_not_empty CHECK(created_at <=     
            CURRENT_DATE) NOT NULL DEFAULT CURRENT_DATE
);


CREATE TABLE chats_to_userss(
      chat_id INT REFERENCES chats(id),
      user_id INT REFERENCES userss(id),
      join_at TIMESTAMP CONSTRAINT join_at_not_empty CHECK(join_at <= CURRENT_DATE) NOT NULL DEFAULT CURRENT_DATE,
     PRIMARY KEY (chat_id, user_id )
);

CREATE TABLE messages(
    id SERIAL PRIMARY KEY,
    body TEXT CONSTRAINT body_not_empty CHECK(body != '') NOT NULL,
    created_at TIMESTAMP CONSTRAINT created_at_not_empty CHECK(created_at <= CURRENT_DATE) NOT NULL DEFAULT CURRENT_DATE,
    author_id INT REFERENCES userss(id),
    chat_id INT REFERENCES chats(id)
);

DROP TABLE messages;