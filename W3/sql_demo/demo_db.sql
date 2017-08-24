--comment
/*commment*/
CREATE TABLE stuff_lower_plural (
  id INTEGER PRIMARY KEY,
  name TEXT NOT NULL,
  f_id INTEGER NOT NULL,

  FOREIGN KEY (f_id) REFERENCES other_table(id)
);

CREATE TABLE other_table (
  id INTEGER PRIMARY KEY,
  col_name TEXT NOT NULL,
  other_notes TEXT
);


INSERT INTO
  other_table ( col_name, other_notes)
VALUES
  ('some name', 'some notes include a ''quote which uses an extra quote'),
  ('other name', 'some other notes');

  INSERT INTO
    stuff_lower_plural (name, f_id)
  VALUES
    ('name1', (SELECT id FROM other_table WHERE name = "name1")),
    ('name2', (SELECT id FROM other_table WHERE name = "name2"));
