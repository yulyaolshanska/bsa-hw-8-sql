WITH actor_details AS (
    SELECT
        m.movie_id,
        pa.person_id,
        pa.first_name,
        pa.last_name,
        json_build_object(
            'file_id', af.file_id,
            'file_name', af.file_name,
            'mime_type', af.mime_type,
            'file_key', af.file_key,
            'url', af.url
        ) AS photo
    FROM Movies m
    LEFT JOIN MovieActors ma ON m.movie_id = ma.movie_id
    LEFT JOIN Persons pa ON ma.person_id = pa.person_id
    LEFT JOIN Files af ON pa.primary_photo_file_id = af.file_id
)SELECT
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
        'last_name', p.last_name,
        'photo', json_build_object(
            'file_id', pf.file_id,
            'file_name', pf.file_name,
            'mime_type', pf.mime_type,
            'file_key', pf.file_key,
            'url', pf.url
        )
    ) AS director,
      json_agg(
       json_build_object(
            'id', ad.person_id,
            'first_name', ad.first_name,
            'last_name', ad.last_name,
            'photo', ad.photo
        )
    ) AS actors,
    json_agg(
        json_build_object(
            'id', g.genre_id,
            'name', g.name
        )
    ) AS genres

FROM Movies m
LEFT JOIN Files f ON m.poster_file_id = f.file_id
LEFT JOIN MovieGenres mg ON m.movie_id = mg.movie_id
LEFT JOIN Genres g ON mg.genre_id = g.genre_id
JOIN Directors d ON m.movie_id = d.movie_id
JOIN Persons p ON d.person_id = p.person_id
LEFT JOIN Files pf ON p.primary_photo_file_id = pf.file_id  
LEFT JOIN actor_details ad ON m.movie_id = ad.movie_id
WHERE m.movie_id = 1
GROUP BY m.movie_id, f.file_id, p.person_id, pf.file_id;





-- FROM Movies m
-- LEFT JOIN Files f ON m.poster_file_id = f.file_id
-- JOIN Directors d ON m.movie_id = d.movie_id
-- JOIN Persons p ON d.person_id = p.person_id
-- LEFT JOIN Files pf ON p.primary_photo_file_id = pf.file_id
-- LEFT JOIN MovieCharacters mc ON m.movie_id = mc.movie_id
-- LEFT JOIN Actors a ON mc.character_id = a.character_id
-- LEFT JOIN Persons pa ON a.person_id = pa.person_id
-- LEFT JOIN Files af ON pa.primary_photo_file_id = af.file_id
-- LEFT JOIN MovieGenres mg ON m.movie_id = mg.movie_id
-- LEFT JOIN Genres g ON mg.genre_id = g.genre_id
-- WHERE m.movie_id = 1
-- GROUP BY m.movie_id, f.file_id, p.person_id, pf.file_id;
