bronze_bucket:yt-data-pipeline-bronze-us-east-1a-dev
silver_bucket:yt-data-pipeline-silver-us-east-1a-dev
gold_bucket:yt-data-pipeline-gold-us-east-1a-dev
script_bucket:yt-data-pipeline-script-us-east-1a-dev

SNS Topic ARN: arn:aws:sns:us-east-1:071195298597:yt-data-pipeline-alerts-dev


Glue bronze: yt_pipeline_bronze_dev
Glue silver: yt_pipeline_silver_dev
Glue gold: yt_pipeline_gold_dev

# glue parameters (bronze_to_silver_statistics.py)

--bronze_database yt_pipeline_bronze_dev
--bronze_table raw_statistics
--silver_bucket yt-data-pipeline-silver-us-east-1a-dev
--silver_database yt_pipeline_silver_dev
--silver_table clean_statistics

# glue parameters (silver_to_gold_analytics)

--silver_database yt_pipeline_silver_dev
--gold_bucket yt-data-pipeline-gold-us-east-1a-dev
--gold_database yt_pipeline_gold_dev



