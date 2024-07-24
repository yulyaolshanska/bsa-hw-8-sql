-- Insert data into Countries
INSERT INTO Countries (country_name) VALUES 
('United States'),
('United Kingdom'),
('Canada'),
('France'),
('Germany'),
('Italy'),
('Spain'),
('Japan'),
('Australia'),
('South Korea');

-- Insert data into Genres
INSERT INTO Genres (name) VALUES 
('Action'),
('Drama'),
('Comedy'),
('Horror'),
('Sci-Fi'),
('Romance'),
('Thriller'),
('Adventure'),
('Fantasy'),
('Documentary');

-- Insert data into Files
INSERT INTO Files (file_name, mime_type, file_key, url) VALUES 
('avatar1.png', 'image/png', 'avatars/avatar1.png', 'https://example.com/avatars/avatar1.png'),
('poster1.jpg', 'image/jpeg', 'posters/poster1.jpg', 'https://example.com/posters/poster1.jpg'),
('avatar2.png', 'image/png', 'avatars/avatar2.png', 'https://example.com/avatars/avatar2.png'),
('poster2.jpg', 'image/jpeg', 'posters/poster2.jpg', 'https://example.com/posters/poster2.jpg'),
('avatar3.png', 'image/png', 'avatars/avatar3.png', 'https://example.com/avatars/avatar3.png'),
('poster3.jpg', 'image/jpeg', 'posters/poster3.jpg', 'https://example.com/posters/poster3.jpg');

-- Insert data into Persons
INSERT INTO Persons (first_name, last_name, biography, date_of_birth, gender, country_id, primary_photo_file_id) VALUES 
('Steven', 'Spielberg', 'Famous director and producer.', '1946-12-18', '1', 1, 1),
('Natalie', 'Portman', 'Actress and filmmaker.', '1981-06-09', '2', 2, 1),
('Leonardo', 'DiCaprio', 'Actor known for his roles in various critically acclaimed films.', '1974-11-11', '1', 3, 2),
('Charlize', 'Theron', 'South African-American actress and producer.', '1975-08-07', '2', 5, 2),
('Quentin', 'Tarantino', 'Famous filmmaker known for his unique style.', '1963-03-27', '1', 1, 3),
('Actor 1', 'Last Name 1', 'Bio 1', '1980-01-01', '1', 1, 1),
('Actor 2', 'Last Name 2', 'Bio 2', '1985-01-01', '2', 2, 2),
('Unused', 'Actor', 'Unused Actor Bio', '1990-01-01', '1', 1, 5);

-- Insert data into Movies
INSERT INTO Movies (title, description, budget, release_date, duration, director_id, country_id, poster_file_id) VALUES 
('Jurassic Park', 'A theme park with genetically engineered dinosaurs turns dangerous.', 63000000, '1993-06-11', '02:07:00', 1, 1, 2),
('Black Swan', 'A ballet dancer wins the lead role in a new production of "Swan Lake".', 13000000, '2010-12-03', '01:48:00', 2, 2, 2),
('Inception', 'A thief who steals corporate secrets through the use of dream-sharing technology.', 160000000, '2010-07-16', '02:28:00', 3, 1, 3),
('Mad Max: Fury Road', 'In a post-apocalyptic wasteland, a drifter helps a group of rebels escape from a tyrannical ruler.', 150000000, '2015-05-15', '02:00:00', 3, 1, 4),
('The Grand Budapest Hotel', 'The adventures of a hotel concierge and his protégé.', 20000000, '2014-03-28', '01:39:00', 3, 2, 4),
('New Movie 1', 'Description for New Movie 1.', 50000000, '2022-06-15', '01:45:00', 3, 1, 3),
('New Movie 2', 'Description for New Movie 2.', 70000000, '2023-05-20', '02:10:00', 3, 2, 4),
('Epic Adventure', 'An epic journey through mystical lands and ancient civilizations.', 75000000, '2023-08-15', '02:30:00', 3, 1, 4),
('Epic Journey', 'A thrilling adventure of a team venturing into unknown lands.', 120000000, '2023-09-01', '02:16:00', 3, 1, 5),
('Silent Film', 'A movie with no characters.', 10000000, '2022-07-15', '01:20:00', 3, 1, 5),
('Documentary', 'A fascinating documentary.', 2000000, '2023-01-01', '01:15:00', 1, 1, 5),
('Mystery Film', 'A suspenseful film with an unknown plot.', 20000000, '2024-01-01', '01:50:00', 3, 1, 2),
('Experimental Film', 'A film with experimental techniques.', 15000000, '2024-02-01', '02:50:00', 3, 1, 3),
('No Character Movie', 'A movie with no characters.', 5000000, '2024-03-01', '01:30:00', 3, 1, 3);

-- Insert data into Characters
INSERT INTO Characters (name, description, role) VALUES 
('Dr. Alan Grant', 'Paleontologist and main protagonist of Jurassic Park.', 'leading'),
('Nina Sayers', 'A ballerina who gets the lead role in a new production.', 'leading'),
('Dom Cobb', 'A skilled thief who steals secrets from within the subconscious during the dream state.', 'leading'),
('Max Rockatansky', 'A lone wanderer in a post-apocalyptic world.', 'leading'),
('Gustave H.', 'A renowned concierge at the Grand Budapest Hotel.', 'leading'),
('New Character 1', 'Description for New Character 1', 'leading'),
('New Character 2', 'Description for New Character 2', 'supporting'),
('Character 3', 'Description for Character 3', 'leading'),
('Character 4', 'Description for Character 4', 'supporting'),
('Character 5', 'Description for Character 5', 'background'),
('Character 6', 'Description for Character 6', 'background'),
('Unspecified', 'Role without a specific character.', 'background');

-- Insert data into MovieCharacters
INSERT INTO MovieCharacters (movie_id, character_id) VALUES 
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 1),
(6, 3),
(6, 4),
(7, 3),
(7, 5),
(7, 2),
(5, 8),
(8, 6),  -- Adding background character to Epic Adventure
(9, 5); -- Adding background character to Epic Journey

INSERT INTO MovieActors (movie_id, person_id) VALUES 
(1, 7),  -- Actor with no specific character
(8, 4),
(7, 5); -- Another actor with no specific character

-- Insert data into Actors
INSERT INTO Actors (person_id, character_id) VALUES 
(6, 1),
(2, 2),
(1, 4),
(3, 3),
(4, 5),
(1, 3),
(2, 4),
(6, 8);

-- Insert data into Directors
INSERT INTO Directors (person_id, movie_id) VALUES 
(1, 1),
(2, 2),
(3, 3),
(3, 4),
(3, 5),
(3, 8),
(4, 9);

-- Insert data into Users
INSERT INTO Users (username, first_name, last_name, email, password, avatar_file_id) VALUES 
('johndoe', 'John', 'Doe', 'john.doe@example.com', 'password123', 1),
('janedoe', 'Jane', 'Doe', 'jane.doe@example.com', 'password456', 2),
('samsmith', 'Sam', 'Smith', 'sam.smith@example.com', 'password789', 3),
('michael', 'Michael', 'Jordan', 'michael.jordan@example.com', 'securepass', 1),
('lebron', 'LeBron', 'James', 'lebron.james@example.com', 'anotherpass', 2);

-- Insert data into FavoriteMovies
INSERT INTO FavoriteMovies (user_id, movie_id) VALUES 
(1, 1),
(1, 2),
(2, 3),
(3, 1),
(2, 4),
(1, 8),
(3, 2), 
(3, 9); 
(4, 2),  -- Michael likes Black Swan
(4, 9);  -- Michael likes Epic Adventure

-- Insert data into MovieGenres
INSERT INTO MovieGenres (movie_id, genre_id) VALUES 
(1, 1),  -- Example genre, e.g., Action
(1, 7),  -- Example genre, e.g., Thriller
(8, 1),  -- Action
(8, 2),  -- Drama
(9, 1),  -- Action
(10, 10),  -- Documentary
(7, 2),  -- Drama
(2, 6),  -- Comedy for Black Swan
(3, 5),  -- Sci-Fi for Inception
(4, 7),  -- Thriller for Mad Max: Fury Road
(5, 9); -- Fantasy for The Grand Budapest Hotel