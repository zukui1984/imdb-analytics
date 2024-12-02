{{ config(materialized='table') }}

SELECT
    b.tconst,
    b.primaryTitle AS movie_title,
    b.startYear AS release_year,
    b.genres,
    CAST(r.averageRating AS FLOAT64) AS averageRating,  -- Cast to FLOAT64
    CAST(r.numVotes AS INT64) AS numVotes              -- Cast to INT64
FROM {{ source('imdb_dataset', 'title_basics') }} b
LEFT JOIN {{ source('imdb_dataset', 'title_ratings') }} r
ON b.tconst = r.tconst
WHERE b.titleType = 'movie'
  AND b.startYear IS NOT NULL
  AND r.averageRating IS NOT NULL
