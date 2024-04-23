-- all loan transactions
USE emp_branch_mgmt;

SELECT l.loan_id,l.customer_id,l.loan_amount,l.interest_rate, l.start_date,l.end_date,l.status,
	   b.branch_name AS bank, CONCAT(e.first_name ,' ', e.last_name) as head
FROM loans l
LEFT JOIN branches b
	USING (branch_id)
JOIN employees e
	USING (manager_id)
ORDER BY loan_id


	/*select count(loan_id) as number_of_rows
	from loans 8*/ 