SELECT
    p.person_id AS ID,
    p.first_name,
    p.last_name,
    COALESCE(SUM(m.budget), 0) AS total_movies_budget
FROM
    Persons p
LEFT JOIN
    MovieActors ma ON p.person_id = ma.person_id
LEFT JOIN
    Movies m ON ma.movie_id = m.movie_id
GROUP BY
    p.person_id, p.first_name, p.last_name;
