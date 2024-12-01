import pandas as pd

# List of IMDb files to convert
files = [
    "title.basics.tsv",
    "title.ratings.tsv",
    "title.crew.tsv",
    "name.basics.tsv",
    "title.principals.tsv"
]

# Convert each file to Parquet
for file in files:
    print(f"Processing {file}...")
    df = pd.read_csv(file, sep='\t', dtype=str, na_values='\\N')  # Read TSV
    parquet_file = file.replace('.tsv', '.parquet')  # Change extension
    df.to_parquet(parquet_file, engine='pyarrow', index=False)  # Save as Parquet
    print(f"Saved {parquet_file}")
