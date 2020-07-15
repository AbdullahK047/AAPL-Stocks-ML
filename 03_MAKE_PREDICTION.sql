SELECT
  *
FROM
  ml.PREDICT(MODEL `ai4f.aapl_model`,
    (
    SELECT
      *
    FROM
      `ai4f.model_data`
    WHERE
      date >= '2019-01-01') )
