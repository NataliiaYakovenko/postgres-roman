DROP TABLE coordinates;
CREATE TABLE coordinates(
    x INTEGER,
    y INTEGER,
    z INTEGER,
    CONSTRAINT "unique_coord" PRIMARY KEY(x, y, z)
);
INSERT INTO coordinates
VALUES
(111, 34, 25),
(113, 55, 78),
(117, 77, 58);