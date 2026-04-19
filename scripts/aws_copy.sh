#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")/.."

data_dir="/Users/anandahariharashivamurthy/ananda_projects/youtube-data-pipeline-2026/data"
bucket_csv="s3://yt-data-pipeline-bronze-us-east-1a-dev/youtube/raw_statistics"
bucket_json="s3://yt-data-pipeline-bronze-us-east-1a-dev/youtube/raw_statistics_reference_data"

for file in "$data_dir"/*.{csv,json}; do
  [ -e "$file" ] || continue
  filename=$(basename "$file")
  region=${filename:0:2}
  region=$(printf '%s' "$region" | tr '[:upper:]' '[:lower:]')
  if [[ "$file" == *.csv ]]; then
    aws s3 cp "$file" "$bucket_csv/region=$region/"
  elif [[ "$file" == *.json ]]; then
    aws s3 cp "$file" "$bucket_json/region=$region/"
  fi
done