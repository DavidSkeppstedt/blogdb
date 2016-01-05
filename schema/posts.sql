CREATE TABLE posts (
	  id SERIAL PRIMARY KEY,
	  title TEXT NOT NULL,
	  body TEXT NOT NULL,
	  author TEXT NOT NULL,
	  created_at timestamp default current_timestamp,
	  updated_at timestamp default current_timestamp
  );
