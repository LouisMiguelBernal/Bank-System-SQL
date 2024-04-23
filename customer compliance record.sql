-- customer compliance record
USE customer_mgmt;

SELECT  cr.record_id, c.customer_id, CONCAT(c.first_name,' ',c.last_name) AS name,
		cr.description, cr.compliance_status, cr.submission_date
FROM customer c
LEFT JOIN transcomp.compliance_rec cr
	USING (customer_id)