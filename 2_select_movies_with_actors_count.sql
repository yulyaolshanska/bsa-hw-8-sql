SELECT
    m.movie_id AS ID,
    m.title,
    COUNT(DISTINCT ma.person_id) AS actors_count
FROM
    Movies m
LEFT JOIN
    MovieActors ma ON m.movie_id = ma.movie_id
WHERE
    m.release_date >= NOW() - INTERVAL '5 years'
GROUP BY
    m.movie_id, m.title
ORDER BY
    m.title;
