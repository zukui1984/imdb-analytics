# IMDB dataset. Source: https://datasets.imdbws.com/ 
Based data March 18, 2024 the datasets on this page are backed by a new data source.
*	https://datasets.imdbws.com/title.basics.tsv.gz
*	https://datasets.imdbws.com/title.ratings.tsv.gz
*	https://datasets.imdbws.com/title.crew.tsv.gz
*	https://datasets.imdbws.com/name.basics.tsv.gz
*	https://datasets.imdbws.com/title.principals.tsv.gz 

## Table Content
1. Google Cloud Platform (GCP): BigQuery & GCS
2. Terraform - Infrastructure as Code (IaC) 
3. VS Code using GCP 
4. dbt - data build tool

## Installation:
*	pip install google-cloud-storage 
*	pip install dbt-bigquery
*	Terraform sudo apt-get update && sudo apt-get install -y gnupg software-properties-commonGCP

## Process:
1. Download imdb data and extract it
* wget https://datasets.imdbws.com/title.basics.tsv.gz (all 5 datas)
...
* gunzip title.basics.tsv.gz (all datas)
...   
  
2.  


