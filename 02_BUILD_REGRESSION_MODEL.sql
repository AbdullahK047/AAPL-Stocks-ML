CREATE OR REPLACE MODEL `ai4f.aapl_model`
OPTIONS
  ( model_type='linear_reg',
    input_label_cols=['close'],
    data_split_method='seq',
    data_split_eval_fraction=0.3,
    data_split_col='date') AS
SELECT
  date,
  close,
  day_prev_close,
  trend_3_day
FROM
  `ai4f.model_data`
