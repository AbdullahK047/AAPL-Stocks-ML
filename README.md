# AAPL-Stocks-ML
predicting future prices of AAPL Stock based on historical data

- Navigate to BiqQuery from the Navigation menu in the Google Cloud Console
- After selecting project, create a New Dataset and give it a Dataset ID. I named it 'ai4f'
- Click the dataset and then Create Table. We will be using data publicly available from Google Cloud Storage
-- Create table from: Google Cloud Storage
-- Select file from GCS bucket: cloud-training/ai4f/AAPL10Y.csv
-- Table name: AAPL10Y
-- Auto detect: Schema and input parameters
