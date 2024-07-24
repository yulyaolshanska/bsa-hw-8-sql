SELECT
    m.movie_id AS ID,
    m.title,
    COUNT(DISTINCT all_actors.actor_id) AS actors_count
FROM
    Movies m
LEFT JOIN
    (
        SELECT a.person_id AS actor_id, mc.movie_id
        FROM MovieCharacters mc
        JOIN Actors a ON mc.character_id = a.character_id
        UNION
        SELECT ma.person_id AS actor_id, ma.movie_id
        FROM MovieActors ma
    ) AS all_actors
ON m.movie_id = all_actors.movie_id
WHERE
    m.release_date >= NOW() - INTERVAL '5 years'
GROUP BY
    m.movie_id, m.title
ORDER BY
    m.title;
