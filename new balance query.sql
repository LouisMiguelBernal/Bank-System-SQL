-- new account balance
SELECT 
	a.customer_id,
    a.balance,
    t.transaction,
    t.amount,
    t.transaction_date,
    a.balance - t.amount AS new_balance
    
FROM transactions t
LEFT JOIN accounts a
USING (account_id)
WHERE t.transaction = 'withdraw'
ORDER BY t.transaction_date
