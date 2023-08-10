# data1202-project
view the fact and dimension table
```sql
SELECT * FROM airports.`dimensiontable`;
SELECT * FROM airports.`facttable`;
```

No data cleaning required

Tables combined with common key and displayed
```sql
CREATE VIEW combined_table AS
SELECT
	facttable.*,
    dimensiontable.`type`,
    dimensiontable.`name`,
    dimensiontable.`iso_country`,
    dimensiontable.`iso_region`,
    dimensiontable.`municipality`
FROM facttable
JOIN dimensiontable ON facttable.airport_ident = dimensiontable.airport_ident;


SELECT * FROM  combined_table;
```

what is the average elevation of airports of each municipality
```sql
SELECT municipality, AVG(elevation_ft) AS average_elevation
FROM combined_table
GROUP BY municipality;
```