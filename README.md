# Movie Database Schema

## ER Diagram

```mermaid

erDiagram
    USERS {
        int user_id
        varchar username
        varchar first_name
        varchar last_name
        varchar email
        varchar password
        int avatar_file_id
        timestamp created_at
        timestamp updated_at
    }
    FILES {
        int file_id
        varchar file_name
        varchar mime_type
        varchar file_key
        varchar url
        timestamp created_at
        timestamp updated_at
    }
    COUNTRIES {
        int country_id
        varchar country_name
    }
    MOVIES {
        int movie_id
        varchar title
        text description
        bigint budget
        date release_date
        interval duration
        int director_id
        int country_id
        int poster_file_id
        timestamp created_at
        timestamp updated_at
    }
    GENRES {
        int genre_id
        varchar name
    }
    MOVIEGENRES {
        int movie_id
        int genre_id
        timestamp created_at
        timestamp updated_at
    }
    CHARACTERS {
        int character_id
        varchar name
        text description
        varchar role
        timestamp created_at
        timestamp updated_at
    }
    PERSONS {
        int person_id
        varchar first_name
        varchar last_name
        text biography
        date date_of_birth
        varchar gender
        int country_id
        int primary_photo_file_id
        timestamp created_at
        timestamp updated_at
    }
    MOVIEACTORS {
        int movie_id
        int person_id
        int character_id
        text role_description
        varchar role_type
        timestamp created_at
        timestamp updated_at
    }
    DIRECTORS {
        int person_id
        int movie_id
    }
    FAVORITEMOVIES {
        int user_id
        int movie_id
    }

    USERS ||--o{ FILES : "avatar_file_id"
    MOVIES ||--o{ FILES : "poster_file_id"
    MOVIES ||--o{ COUNTRIES : "country_id"
    MOVIES ||--o{ PERSONS : "director_id"
    MOVIES ||--o{ MOVIEGENRES : "movie_id"
    GENRES ||--o{ MOVIEGENRES : "genre_id"
    MOVIES ||--o{ MOVIEACTORS : "movie_id"
    CHARACTERS ||--o{ MOVIEACTORS : "character_id"
    PERSONS ||--o{ MOVIEACTORS : "person_id"
    PERSONS ||--o{ DIRECTORS : "person_id"
    MOVIES ||--o{ DIRECTORS : "movie_id"
    USERS ||--o{ FAVORITEMOVIES : "user_id"
    MOVIES ||--o{ FAVORITEMOVIES : "movie_id"
