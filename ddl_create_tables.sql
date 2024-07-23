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
    FOREIGN KEY (avatar_file_id) REFERENCES Files(file_id)
);

-- Files Table
CREATE TABLE Files (
    file_id SERIAL PRIMARY KEY,
    file_name VARCHAR(255) NOT NULL,
    mime_type VARCHAR(50) NOT NULL,
    file_key VARCHAR(255) NOT NULL UNIQUE,
    url VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Countries Table
CREATE TABLE Countries (
    country_id SERIAL PRIMARY KEY,
    country_name VARCHAR(100) NOT NULL UNIQUE
);

-- Movies Table
CREATE TABLE Movies (
    movie_id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    budget BIGINT,
    release_date DATE,
    duration INTERVAL HOUR TO MINUTE,
    director_id INTEGER,
    country_id INTEGER,
    poster_file_id INTEGER,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (director_id) REFERENCES Persons(person_id),
    FOREIGN KEY (country_id) REFERENCES Countries(country_id),
    FOREIGN KEY (poster_file_id) REFERENCES Files(file_id)
);

-- Genres Table
CREATE TABLE Genres (
    genre_id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE
);

-- MovieGenres Table (Many-to-Many relationship between Movies and Genres)
CREATE TABLE MovieGenres (
    movie_id INTEGER NOT NULL,
    genre_id INTEGER NOT NULL,
    PRIMARY KEY (movie_id, genre_id),
    FOREIGN KEY (movie_id) REFERENCES Movies(movie_id),
    FOREIGN KEY (genre_id) REFERENCES Genres(genre_id)
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

-- Persons Table
CREATE TABLE Persons (
    person_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    biography TEXT,
    date_of_birth DATE,
    gender VARCHAR(10),
    country_id INTEGER,
    primary_photo_file_id INTEGER,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (country_id) REFERENCES Countries(country_id),
    FOREIGN KEY (primary_photo_file_id) REFERENCES Files(file_id)
);

-- MovieCharacters Table (Many-to-Many relationship between Movies and Characters)
CREATE TABLE MovieCharacters (
    movie_id INTEGER NOT NULL,
    character_id INTEGER NOT NULL,
    PRIMARY KEY (movie_id, character_id),
    FOREIGN KEY (movie_id) REFERENCES Movies(movie_id),
    FOREIGN KEY (character_id) REFERENCES Characters(character_id)
);

-- Actors Table (Relationship between Persons and Characters)
CREATE TABLE Actors (
    person_id INTEGER NOT NULL,
    character_id INTEGER NOT NULL,
    PRIMARY KEY (person_id, character_id),
    FOREIGN KEY (person_id) REFERENCES Persons(person_id),
    FOREIGN KEY (character_id) REFERENCES Characters(character_id)
);

-- Directors Table (Relationship between Persons and Movies)
CREATE TABLE Directors (
    person_id INTEGER NOT NULL,
    movie_id INTEGER NOT NULL,
    PRIMARY KEY (person_id, movie_id),
    FOREIGN KEY (person_id) REFERENCES Persons(person_id),
    FOREIGN KEY (movie_id) REFERENCES Movies(movie_id)
);

-- FavoriteMovies Table (Many-to-Many relationship between Users and Movies)
CREATE TABLE FavoriteMovies (
    user_id INTEGER NOT NULL,
    movie_id INTEGER NOT NULL,
    PRIMARY KEY (user_id, movie_id),
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (movie_id) REFERENCES Movies(movie_id)
);
