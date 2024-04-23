-- employee audit log
USE emp_branch_mgmt;

SELECT al.log_id, e.employee_id, CONCAT(e.first_name, ' ',e.last_name) AS name, e.position, e.department,
	   al.action_performed,al.time_stamp
FROM employees e
JOIN transcomp.audit_log al
	USING (employee_id)