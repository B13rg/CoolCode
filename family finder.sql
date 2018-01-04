SELECT family.Guarantor FROM ( 
	SELECT patient.Guarantor, 
		SUM(CASE WHEN patient.EstBalance>0 THEN 1 ELSE 0 END) AS GreaterThan, 
		SUM(CASE WHEN patient.EstBalance<0 THEN 1 ELSE 0 END) AS LessThan 
	FROM patient 
	GROUP BY patient.Guarantor
	HAVING GreaterThan>0 AND lessthanLessThan>0) family