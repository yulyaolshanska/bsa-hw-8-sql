SELECT
    u.user_id AS ID,
    u.username,
    ARRAY_AGG(fm.movie_id) AS favorite_movie_ids
FROM
    Users u
LEFT JOIN
    FavoriteMovies fm ON u.user_id = fm.user_id
GROUP BY
    u.user_id, u.username;
