# Movie Database Schema

## ER Diagram

```mermaid
erDiagram
    USERS {
        int user_id PK
        varchar username
        varchar first_name
        varchar last_name
        varchar email
        varchar password
        int avatar_file_id FK
        timestamp created_at
        timestamp updated_at
    }
    FILES {
        int file_id PK
        varchar file_name
        varchar mime_type
        varchar file_key
        varchar url
        timestamp created_at
        timestamp updated_at
    }
    COUNTRIES {
        int country_id PK
        varchar country_name
    }
    MOVIES {
        int movie_id PK
        varchar title
        text description
        bigint budget
        date release_date
        interval duration
        int director_id FK
        int country_id FK
        int poster_file_id FK
        timestamp created_at
        timestamp updated_at
    }
    GENRES {
        int genre_id PK
        varchar name
    }
    MOVIEGENRES {
        int movie_id FK
        int genre_id FK
    }
    CHARACTERS {
        int character_id PK
        varchar name
        text description
        varchar role
        timestamp created_at
        timestamp updated_at
    }
    PERSONS {
        int person_id PK
        varchar first_name
        varchar last_name
        text biography
        date date_of_birth
        varchar gender
        int country_id FK
        int primary_photo_file_id FK
        timestamp created_at
        timestamp updated_at
    }
    MOVIECHARACTERS {
        int movie_id FK
        int character_id FK
    }
    ACTORS {
        int person_id FK
        int character_id FK
    }
    DIRECTORS {
        int person_id FK
        int movie_id FK
    }
    FAVORITEMOVIES {
        int user_id FK
        int movie_id FK
    }

    USERS ||--o{ FILES : "avatar"
    MOVIES ||--o{ FILES : "poster"
    MOVIES ||--o{ COUNTRIES : "country"
    MOVIES ||--o{ PERSONS : "director"
    MOVIES ||--o{ MOVIEGENRES : "movie"
    GENRES ||--o{ MOVIEGENRES : "genre"
    MOVIES ||--o{ MOVIECHARACTERS : "movie"
    CHARACTERS ||--o{ MOVIECHARACTERS : "character"
    PERSONS ||--o{ ACTORS : "person"
    CHARACTERS ||--o{ ACTORS : "character"
    PERSONS ||--o{ DIRECTORS : "person"
    MOVIES ||--o{ DIRECTORS : "movie"
    USERS ||--o{ FAVORITEMOVIES : "user"
    MOVIES ||--o{ FAVORITEMOVIES : "movie"
