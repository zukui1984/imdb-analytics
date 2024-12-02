## IMDB dataset. Source: https://datasets.imdbws.com/ 
Based data March 18, 2024 the datasets on this page are backed by a new data source.
*	https://datasets.imdbws.com/title.basics.tsv.gz
*	https://datasets.imdbws.com/title.ratings.tsv.gz
*	https://datasets.imdbws.com/title.crew.tsv.gz
*	https://datasets.imdbws.com/name.basics.tsv.gz
*	https://datasets.imdbws.com/title.principals.tsv.gz 

### Table Content
1. Google Cloud Platform (GCP): BigQuery & GCS
2. VS Code using GCP 
3. dbt - data build tool

### Installation:
*	pip install google-cloud-storage 
*	pip install dbt-bigquery
*	Terraform sudo apt-get update && sudo apt-get install -y gnupg software-properties-commonGCP

### Process:
1. Download imdb data and extract it
* `wget https://datasets.imdbws.com/title.basics.tsv.gz` (all 5 datas)
...
* `gunzip title.basics.tsv.gz` (all datas)
...   
  
2. Convert into .parquet (code - data.py)

### GCP Process
1. Setup GCP
    - Sign up on GCP platform https://cloud.google.com/
    - Authenticate the SDK with your GCP account `gcloud auth login` then set default of project `gcloud config set project PROJECT_ID`
    - Enable API Library - **Compute Engine, Storage Admin, BigQuery Admin, Owner**
    - Create API Key on Service Accounts (IAM) and this key information will be use on dbt
2. Create GCP Bucket: `gcloud storage buckets create gs://imdb-data-2024 --location=us-central1`
    - Transfer data to Bucket: `gsutil cp *.parquet gs://imdb-data-2024/`
3. Create GCP BigQuery: `bq mk imdb_dataset`
4. Transfer data to BigQuery: `bq load --source_format=PARQUET imdb_dataset.title_basics gs://imdb-data-2024/title.basics.parquet` (same with other data)

### dbt - data build tool
1. Create dbt account by putting JSON key from GCP Service Account
2. Change name of project on "dbt_project.yml"
3. Create "Staging Folder" with files on "Model Folder"
   - `schema.yaml`
   - `movies_with_rating.sql` then run `dbt run --select movies_with_ratings`
   - `top_rated_movies.sql` then run `dbt run --select top_rated_movies`
4. dbt testing
   - Create file on “Macros folder”: `positive_values.sql` then apply `dbt run`
   - Add packages.yml then run `dpt deps` to update the packages
   - Add movies_with_rating.yml & top_rated_movies.yml
   - Run `dbt compile` to generates executable SQL from source model, test, and analysis files.




