SELECT * FROM airports.`dimensiontable`;
SELECT * FROM airports.`facttable`;


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


-- what is the average elevation of airports of each municipality
SELECT municipality, AVG(elevation_ft) AS average_elevation
FROM combined_table
GROUP BY municipality;


