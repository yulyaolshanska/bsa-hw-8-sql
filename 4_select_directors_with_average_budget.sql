SELECT
    p.person_id AS director_id,
    CONCAT(p.first_name, ' ', p.last_name) AS director_name,
    AVG(m.budget) AS average_budget
FROM
    Persons p
JOIN
    Directors d ON p.person_id = d.person_id
JOIN
    Movies m ON d.movie_id = m.movie_id
GROUP BY
    p.person_id, p.first_name, p.last_name;
