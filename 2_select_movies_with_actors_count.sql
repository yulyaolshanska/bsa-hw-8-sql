SELECT
    m.movie_id AS ID,
    m.title,
    COUNT(mc.character_id) AS actors_count
FROM
    Movies m
JOIN
    MovieCharacters mc ON m.movie_id = mc.movie_id
WHERE
    m.release_date >= NOW() - INTERVAL '5 years'
GROUP BY
    m.movie_id, m.title;