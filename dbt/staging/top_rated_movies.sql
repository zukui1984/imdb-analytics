{{ config(materialized='view') }}

SELECT
    movie_title,
    release_year,
    genres,
    averageRating
FROM {{ ref('movies_with_ratings') }}
WHERE averageRating >= 8.0  -- This will now work because averageRating is FLOAT64
ORDER BY averageRating DESC, numVotes DESC
