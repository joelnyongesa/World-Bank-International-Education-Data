--Analyzing World Bank International Education Data.
--From: Bigquery public datasets.

--Joining the tables based on common coumn: country_code.
SELECT
  education.country_name,
  summary.country_code,
  education.value
FROM
  `bigquery-public-data.world_bank_intl_education.international_education` education
INNER JOIN `bigquery-public-data.world_bank_intl_education.country_summary` summary
  ON education.country_code = summary.country_code;


--Next step: Calculate average education per region, return top 5
--Heads up: The region column has null values.
SELECT
  summary.region,
  AVG(education.value) average_education_value
FROM
  `bigquery-public-data.world_bank_intl_education.international_education` education
INNER JOIN
  `bigquery-public-data.world_bank_intl_education.country_summary` summary
  ON education.country_code = summary.country_code
WHERE
  summary.region IS NOT NULL
GROUP BY
  summary.region
ORDER BY
  average_education_value DESC;
