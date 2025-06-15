DROP TABLE messages;

CREATE TABLE messages(
    id SERIAL PRIMARY KEY,
    body TEXT NOT NULL CHECK(body != ''),
    author VARCHAR(256) NOT NULL CHECK(author != ''),
    created_at TIMESTAMP DEFAULT current_timestamp,
    is_read BOOLEAN DEFAULT false
);
INSERT INTO messages
VALUES('Hello, Jon', 'I am author');

INSERT INTO messages(author,body)
VALUES
('Jon', 'Hello'),
('Me', 'Hello, Jon'),
('Jon','Let is go to drink coffe'),
('Me', 'Yes, let is go');


INSERT INTO messages(author,body)
VALUES
('Jon', 'Hello'),
('Jon', 'Hello');


INSERT INTO messages
VALUES('140','Jon', 'Me');