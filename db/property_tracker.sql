DROP TABLE IF EXISTS property;

CREATE TABLE property(
  id SERIAL PRIMARY KEY,
  address VARCHAR(255),
  value VARCHAR(255),
  number_of_rooms INT,
  buy_or_let_status VARCHAR(255)
);
