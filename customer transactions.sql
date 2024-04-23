--  customer transactions
USE customer_mgmt;

SELECT 
	t.transaction_id,c.customer_id, a.account_id, c.first_name, c.last_name,
    c.address, c.phone_number,
    a.account_type, a.open_date ,a.status, a.balance, t.transaction, t.amount,t.transaction_date
FROM transactions t
LEFT JOIN accounts a
	USING(account_id)
LEFT JOIN customer c
	USING (customer_id)
ORDER BY transaction_date


