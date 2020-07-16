# AAPL-Stocks-ML
predicting future prices of AAPL Stock based on historical data

- Navigate to BiqQuery from the Navigation menu in the Google Cloud Console
- After selecting project, create a New Dataset and give it a Dataset ID. I named it 'ai4f'
- Click the dataset and then Create Table. We will be using data publicly available from Google Cloud Storage
  - Create table from: Google Cloud Storage
  - Select file from GCS bucket: cloud-training/ai4f/AAPL10Y.csv
  - Table name: AAPL10Y
  - Auto detect: Schema and input parameters

- Now we will create a simple linear regression model in BigQuery to predict the closing price of AAPL stock on any given day. The features we'll use as input into the model are the previous day's closing price and a three day trend value. The trend value can only take on two values, either -1 or +1. If the AAPL stock price has increased over any two of the previous three days then the trend will be +1. Otherwise, the trend value will be -1.
  - First, generating a table that contains the features to create our regression model. Copy the query from [01_GENERATE_DATA.sql](https://github.com/AbdullahK047/AAPL-Stocks-ML/blob/master/Linear_Regression_Model/01_GENERATE_DATA.sql) and paste it into the Query Editor. Before clicking Run, More -> Query settings -> Set a destination table for query results -> Table name: model_data -> Save -> finally, Run.
  
  - Now let's build the regression model on the data stored in the table `model_data`. Click on Compose New Query, copy the query from [02_BUILD_REGRESSION_MODEL.sql](https://github.com/AbdullahK047/AAPL-Stocks-ML/blob/master/Linear_Regression_Model/02_BUILD_REGRESSION_MODEL.sql) into the Query Editor and execute it. This query saves the model into the dataset ai4f. The model will be listed along with the tables as aapl_model. To evaluate the performance of the model, a sequential split was used in this case, as is common for data with a time element. The split fraction is .3 and split uses the date column as the basis for the split.
  
## Evaluate Regression Model Performance

- Click on COMPOSE NEW QUERY, and execute the following code:
``` SELECT * FROM ML.EVALUATE(MODEL `ai4f.aapl_model`)```
the split evaluation data is used to compute the evaluation metrics.

## Make Predictions Using Model

- Click on COMPOSE NEW QUERY, and copy the query from [03_MAKE_PREDICTION.sql](https://github.com/AbdullahK047/AAPL-Stocks-ML/blob/master/Linear_Regression_Model/03_MAKE_PREDICTION.sql) and execute it in the Query Editor. This query will generate a new column called predicted_close containing the model's predictions for the closing price for all entries in the year 2019.
- Click on Run to see your results.
  
Congratulations, we're all done!
