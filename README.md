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
* wget https://datasets.imdbws.com/title.basics.tsv.gz (all 5 datas)
...
* gunzip title.basics.tsv.gz (all datas)
...   
  
2. Convert into .parquet (code - data.py)
3. Setup GCP
    - Sign up on GCP platform https://cloud.google.com/
    - Authenticate the SDK with your GCP account `gcloud auth login` then set default of project `gcloud config set project PROJECT_ID`
    - Enable API Library - **Compute Engine, Storage Admin, BigQuery Admin, Owner**
    - Create API Key on Service Accounts (IAM) and this key information will be use on dbt
4. Create GCP Bucket: `gcloud storage buckets create gs://imdb-data-2024 --location=us-central1`
    - Transfer data to Bucket: `gsutil cp *.parquet gs://imdb-data-2024/`
5. Create GCP BigQuery: `bq mk imdb_dataset`
 -     


