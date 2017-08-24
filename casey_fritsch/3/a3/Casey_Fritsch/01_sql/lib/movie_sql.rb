require 'singleton'
require 'sqlite3'

# CREATE TABLE movies (
#   id INTEGER PRIMARY KEY,
#   title VARCHAR(255) NOT NULL,
#   yr INTEGER NOT NULL,
#   director INTEGER NOT NULL
# );
# CREATE TABLE actors (
#   id INTEGER PRIMARY KEY,
#   name VARCHAR(255) NOT NULL
# );
# CREATE TABLE castings (
#   movie_id INTEGER NOT NULL,
#   actor_id INTEGER NOT NULL,
#   ord INTEGER NOT NULL,
#
#   FOREIGN KEY(movie_id) REFERENCES movies(id),
#   FOREIGN KEY(actor_id) REFERENCES actors(id)
# );

class MovieDatabase < SQLite3::Database
  include Singleton

  def initialize
    super(File.dirname(__FILE__) + "/../movie.db")

    self.results_as_hash = true
    self.type_translation = true
  end

  def self.execute(*args)
    self.instance.execute(*args)
  end
end

# 1. Obtain the cast list for the movie "Top Gun"; order by the
# actor's name.
def top_gun_cast
  MovieDatabase.execute(<<-SQL)
  SELECT actors.name
  FROM actors
  JOIN castings ON castings.actor_id = actors.id
  JOIN movies ON movies.id = castings.movie_id
  WHERE movies.title = 'Top Gun'
  ORDER BY actors.name
SQL
end

# 2. List the films in which 'Harrison Ford' has appeared; order by
# movie title.
def harrison_ford_films
  MovieDatabase.execute(<<-SQL)
  SELECT title
  FROM actors
  JOIN castings ON castings.actor_id = actors.id
  JOIN movies ON movies.id = castings.movie_id
  WHERE name = 'Harrison Ford'
  ORDER BY title
SQL
end

# 3. List the films where 'Harrison Ford' has appeared, but not in the
# star role. Order by movie title.
def harrison_ford_supporting_actor_films
  MovieDatabase.execute(<<-SQL)
  SELECT title
  FROM actors
  JOIN castings ON castings.actor_id = actors.id
  JOIN movies ON movies.id = castings.movie_id
  WHERE name = 'Harrison Ford' AND ord != 1
  ORDER BY title
SQL
end

# 4. List the films together with the leading star for all 1962
# films. Order by movie title.
def leading_star_for_1962_films
  MovieDatabase.execute(<<-SQL)
  SELECT title, name
  FROM actors
  JOIN castings ON castings.actor_id = actors.id
  JOIN movies ON movies.id = castings.movie_id
  WHERE yr = 1962 AND ord = 1
  ORDER BY title
SQL
end

# 5. There is a movie from 1920 in our database for which there is no
#    associated casting information. Give the title of this movie.
def no_casting_info
  MovieDatabase.execute(<<-SQL)
  SELECT title
  FROM movies
  LEFT OUTER JOIN castings ON castings.movie_id = movies.id
  WHERE yr = 1920 AND castings.actor_id IS NULL
SQL
end

# 6. List the movie title and starring actor (ord = 1) for films with 70
#    or more cast members. Order by movie title.
#
#    NB: Make sure you group by movie id
#    and not by movie title (what if there are remakes?).

def big_movie_stars
  MovieDatabase.execute(<<-SQL)
  SELECT title, name
  FROM actors
  JOIN castings ON castings.actor_id = actors.id
  JOIN movies ON movies.id = castings.movie_id
  WHERE movie_id IN
  (
    SELECT movie_id
    FROM actors
    JOIN castings ON castings.actor_id = actors.id
    JOIN movies ON movies.id = castings.movie_id
    GROUP BY movie_id
    HAVING COUNT(*) >= 70
  ) AND ord = 1
SQL
end

# 7. List the movie year, movie title, and supporting actor (ord = 2)
# for all of the films in which Will Smith played the star role
# (ord = 1). Order by the name of the supporting actor.
def will_smith_supporting_actors
  MovieDatabase.execute(<<-SQL)
  SELECT yr, title, name
  FROM actors
  JOIN castings ON castings.actor_id = actors.id
  JOIN movies ON movies.id = castings.movie_id
  WHERE movie_id IN (
    SELECT movie_id
    FROM actors
    JOIN castings ON castings.actor_id = actors.id
    JOIN movies ON movies.id = castings.movie_id
    WHERE actors.name = 'Will Smith' AND ord = 1
  ) AND ord = 2
  ORDER BY name
SQL
end

# 8. There is a movie in which 'Barrie Ingham' plays two roles. Write a
# query that returns the title of this movie.
def barrie_ingham_multiple_roles
  MovieDatabase.execute(<<-SQL)
  SELECT title
  FROM actors
  JOIN castings ON castings.actor_id = actors.id
  JOIN movies ON movies.id = castings.movie_id
  WHERE name = 'Barrie Ingham'
  GROUP BY movie_id
  HAVING COUNT(*) = 2
SQL
end
