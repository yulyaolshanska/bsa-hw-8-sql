SELECT
    m.movie_id AS ID,
    m.title,
    m.release_date,
    m.duration,
    m.description,
    json_build_object(
        'file_id', f.file_id,
        'file_name', f.file_name,
        'mime_type', f.mime_type,
        'file_key', f.file_key,
        'url', f.url
    ) AS poster,
    json_build_object(
        'id', p.person_id,
        'first_name', p.first_name,
        'last_name', p.last_name
    ) AS director
FROM
    Movies m
LEFT JOIN
    Files f ON m.poster_file_id = f.file_id
JOIN
    Directors d ON m.movie_id = d.movie_id
JOIN
    Persons p ON d.person_id = p.person_id
JOIN
    MovieGenres mg ON m.movie_id = mg.movie_id
JOIN
    Genres g ON mg.genre_id = g.genre_id
WHERE
    m.country_id = 1
    AND m.release_date >= '2022-01-01'
    AND m.duration > '02:15:00'
    AND g.name IN ('Action', 'Drama')
GROUP BY
    m.movie_id, m.title, m.release_date, m.duration, m.description, f.file_id, p.person_id;

