-- Files Table
CREATE TABLE Files (
    file_id SERIAL PRIMARY KEY,
    file_name VARCHAR(255) NOT NULL,
    mime_type VARCHAR(50) NOT NULL,
    file_key VARCHAR(255) UNIQUE NOT NULL,
    url TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Countries Table
CREATE TABLE Countries (
    country_id SERIAL PRIMARY KEY,
    country_name VARCHAR(100) UNIQUE NOT NULL
);

-- Genres Table
CREATE TABLE Genres (
    genre_id SERIAL PRIMARY KEY,
    name VARCHAR(50) UNIQUE NOT NULL
);

-- Persons Table
CREATE TABLE Persons (
    person_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    biography TEXT,
    date_of_birth DATE,
    gender VARCHAR(10) CHECK (gender IN ('0', '1', '2', '9')), -- ISO/IEC 5218 codes
    country_id INTEGER,
    primary_photo_file_id INTEGER,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (country_id) REFERENCES Countries(country_id),
    FOREIGN KEY (primary_photo_file_id) REFERENCES Files(file_id) ON DELETE SET NULL ON UPDATE CASCADE
);

-- Movies Table
CREATE TABLE Movies (
    movie_id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    budget BIGINT,
    release_date DATE,
    duration INTERVAL,
    director_id INTEGER,
    country_id INTEGER,
    poster_file_id INTEGER,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (director_id) REFERENCES Persons(person_id),
    FOREIGN KEY (country_id) REFERENCES Countries(country_id),
    FOREIGN KEY (poster_file_id) REFERENCES Files(file_id) ON DELETE SET NULL ON UPDATE CASCADE
);

-- MovieGenres Table (Many-to-Many relationship between Movies and Genres)
CREATE TABLE MovieGenres (
    movie_id INTEGER NOT NULL,
    genre_id INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (movie_id, genre_id),
    FOREIGN KEY (movie_id) REFERENCES Movies(movie_id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (genre_id) REFERENCES Genres(genre_id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Characters Table
CREATE TABLE Characters (
    character_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    role VARCHAR(50) CHECK (role IN ('leading', 'supporting', 'background')),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- MovieCharacters Table (Many-to-Many relationship between Movies and Characters)
CREATE TABLE MovieCharacters (
    movie_id INTEGER NOT NULL,
    character_id INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (movie_id, character_id),
    FOREIGN KEY (movie_id) REFERENCES Movies(movie_id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (character_id) REFERENCES Characters(character_id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Actors Table (Relationship between Persons and Characters)
CREATE TABLE Actors (
    person_id INTEGER NOT NULL,
    character_id INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (person_id, character_id),
    FOREIGN KEY (person_id) REFERENCES Persons(person_id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (character_id) REFERENCES Characters(character_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE MovieActors (
    movie_id INTEGER NOT NULL,
    person_id INTEGER NOT NULL,
    role_description TEXT, 
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (movie_id, person_id),
    FOREIGN KEY (movie_id) REFERENCES Movies(movie_id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (person_id) REFERENCES Persons(person_id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Directors Table (Relationship between Persons and Movies)
CREATE TABLE Directors (
    person_id INTEGER NOT NULL,
    movie_id INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (person_id, movie_id),
    FOREIGN KEY (person_id) REFERENCES Persons(person_id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (movie_id) REFERENCES Movies(movie_id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Users Table
CREATE TABLE Users (
    user_id SERIAL PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    avatar_file_id INTEGER,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (avatar_file_id) REFERENCES Files(file_id) ON DELETE SET NULL ON UPDATE CASCADE
);

-- FavoriteMovies Table (Many-to-Many relationship between Users and Movies)
CREATE TABLE FavoriteMovies (
    user_id INTEGER NOT NULL,
    movie_id INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (user_id, movie_id),
    FOREIGN KEY (user_id) REFERENCES Users(user_id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (movie_id) REFERENCES Movies(movie_id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Function to update updated_at column
CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = NOW();
    RETURN NEW;
END;
$$ LANGUAGE 'plpgsql';


-- Files
CREATE TRIGGER update_files_updated_at
BEFORE UPDATE ON Files
FOR EACH ROW
EXECUTE FUNCTION update_updated_at_column();

-- Countries
CREATE TRIGGER update_countries_updated_at
BEFORE UPDATE ON Countries
FOR EACH ROW
EXECUTE FUNCTION update_updated_at_column();

-- Genres
CREATE TRIGGER update_genres_updated_at
BEFORE UPDATE ON Genres
FOR EACH ROW
EXECUTE FUNCTION update_updated_at_column();

-- Persons
CREATE TRIGGER update_persons_updated_at
BEFORE UPDATE ON Persons
FOR EACH ROW
EXECUTE FUNCTION update_updated_at_column();

-- Movies
CREATE TRIGGER update_movies_updated_at
BEFORE UPDATE ON Movies
FOR EACH ROW
EXECUTE FUNCTION update_updated_at_column();

-- MovieGenres
CREATE TRIGGER update_moviegenres_updated_at
BEFORE UPDATE ON MovieGenres
FOR EACH ROW
EXECUTE FUNCTION update_updated_at_column();

-- Characters
CREATE TRIGGER update_characters_updated_at
BEFORE UPDATE ON Characters
FOR EACH ROW
EXECUTE FUNCTION update_updated_at_column();

-- MovieCharacters
CREATE TRIGGER update_moviecharacters_updated_at
BEFORE UPDATE ON MovieCharacters
FOR EACH ROW
EXECUTE FUNCTION update_updated_at_column();

-- Actors
CREATE TRIGGER update_actors_updated_at
BEFORE UPDATE ON Actors
FOR EACH ROW
EXECUTE FUNCTION update_updated_at_column();

-- Directors
CREATE TRIGGER update_directors_updated_at
BEFORE UPDATE ON Directors
FOR EACH ROW
EXECUTE FUNCTION update_updated_at_column();

-- Users
CREATE TRIGGER update_users_updated_at
BEFORE UPDATE ON Users
FOR EACH ROW
EXECUTE FUNCTION update_updated_at_column();

-- FavoriteMovies
CREATE TRIGGER update_favoritemovies_updated_at
BEFORE UPDATE ON FavoriteMovies
FOR EACH ROW
EXECUTE FUNCTION update_updated_at_column();
