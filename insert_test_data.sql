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
('Jurassic Park', 'A theme park with genetically engineered dinosaurs turns dangerous.', 63000000, '1993-06-11', '02:07:00', 1, 1, 2), -- Directed by Steven Spielberg
('Black Swan', 'A ballet dancer wins the lead role in a new production of "Swan Lake".', 13000000, '2010-12-03', '01:48:00', 2, 2, 2), -- Directed by Natalie Portman
('Inception', 'A thief who steals corporate secrets through the use of dream-sharing technology.', 160000000, '2010-07-16', '02:28:00', 3, 1, 3), -- Directed by Quentin Tarantino
('Mad Max: Fury Road', 'In a post-apocalyptic wasteland, a drifter helps a group of rebels escape from a tyrannical ruler.', 150000000, '2015-05-15', '02:00:00', 3, 1, 4), -- Directed by Quentin Tarantino
('The Grand Budapest Hotel', 'The adventures of a hotel concierge and his protégé.', 20000000, '2014-03-28', '01:39:00', 3, 2, 4), -- Directed by Quentin Tarantino
('New Movie 1', 'Description for New Movie 1.', 50000000, '2022-06-15', '01:45:00', 3, 1, 3), -- Directed by Quentin Tarantino
('New Movie 2', 'Description for New Movie 2.', 70000000, '2023-05-20', '02:10:00', 3, 2, 4), -- Directed by Quentin Tarantino
('Epic Adventure', 'An epic journey through mystical lands and ancient civilizations.', 75000000, '2023-08-15', '02:30:00', 3, 1, 4), -- Directed by Quentin Tarantino
('Epic Journey', 'A thrilling adventure of a team venturing into unknown lands.', 120000000, '2023-09-01', '02:16:00', 3, 1, 5), -- Directed by Quentin Tarantino
('Silent Film', 'A movie with no characters.', 10000000, '2022-07-15', '01:20:00', 3, 1, 5), -- Directed by Quentin Tarantino
('Documentary', 'A fascinating documentary.', 2000000, '2023-01-01', '01:15:00', 1, 1, 5), -- Directed by Steven Spielberg
('Mystery Film', 'A suspenseful film with an unknown plot.', 20000000, '2024-01-01', '01:50:00', 3, 1, 2), -- Directed by Quentin Tarantino
('Experimental Film', 'A film with experimental techniques.', 15000000, '2024-02-01', '02:50:00', 3, 1, 3), -- Directed by Quentin Tarantino
('No Character Movie', 'A movie with no characters.', 5000000, '2024-03-01', '01:30:00', 3, 1, 3); -- Directed by Quentin Tarantino
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

-- Expanded insertions for MovieActors
INSERT INTO MovieActors (movie_id, person_id, character_id, role_description, role_type) VALUES 
(1, 7, NULL, 'Actor with no specific character', 'background'), 
(8, 4, 6, NULL, NULL), 
(7, 5, NULL, 'Another actor with no specific character', 'background'),  
(1, 1, 1, NULL, NULL), 
(2, 2, 2, NULL, NULL), 
(3, 3, 3, NULL, NULL), 
(4, 4, 4, NULL, NULL), 
(5, 5, 5, NULL, NULL), 
(6, 1, 3, NULL, NULL), 
(6, NULL, 2,NULL, NULL), 
(7, NULL, 3,NULL, NULL), 
(6, 3, 1, NULL, NULL), 
(7, 2, 2, NULL, NULL), 
(9, NULL, 5, NULL,NULL), 
(8, 6, 7, NULL, NULL), 
(12, NULL, 11, NULL, NULL); 


-- Insert data into Directors
INSERT INTO Directors (person_id, movie_id) VALUES 
(1, 1), -- Steven Spielberg directing Jurassic Park
(2, 2), -- Natalie Portman directing Black Swan
(3, 3), -- Quentin Tarantino directing Inception
(3, 4), -- Quentin Tarantino directing Mad Max: Fury Road
(3, 5), -- Quentin Tarantino directing The Grand Budapest Hotel
(3, 6), -- Quentin Tarantino directing New Movie 1
(3, 7), -- Quentin Tarantino directing New Movie 2
(3, 8), -- Quentin Tarantino directing Epic Adventure
(3, 9), -- Quentin Tarantino directing Epic Journey
(3, 10), -- Quentin Tarantino directing Silent Film
(1, 11), -- Steven Spielberg directing Documentary
(3, 12), -- Quentin Tarantino directing Mystery Film
(3, 13), -- Quentin Tarantino directing Experimental Film
(3, 14); -- Quentin Tarantino directing No Character Movie

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
(3, 9), 
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