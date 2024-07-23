SELECT
    p.person_id AS ID,
    p.first_name,
    p.last_name,
    SUM(m.budget) AS total_movies_budget
FROM
    Persons p
JOIN
    Actors a ON p.person_id = a.person_id
JOIN
    MovieCharacters mc ON a.character_id = mc.character_id
JOIN
    Movies m ON mc.movie_id = m.movie_id
GROUP BY
    p.person_id, p.first_name, p.last_name;
