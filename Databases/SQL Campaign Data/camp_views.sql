/* Include at least five SELECT queries as views in your database.
- These queries (views) should not make use of the wildcard character (*) unless it is
unavoidable given the nature of the query. If that is the case, and you use the wildcard
character (*), you need to include in your report an explanation about the need for such use in
that query.
- At least four of your queries (saved as views) should involve multiple (two or more) tables, and
thus involve JOIN clauses. (Requirement A)
- At least three of your queries should involve some form of filtering (WHERE, HAVING, etc.)
(Requirement B)
- At least two of your queries should involve some form of aggregation over records (SUM,
COUNT, AVERAGE, GROUP BY, etc.) These cannot be queries that simply count the number of
rows in a given table, such as SELECT COUNT(invoice_id) FROM invoices. (Requirement C)
- At least one of your queries should use a subquery. (Requirement E)
- No two queries should be simple variations of each other. For example, avoid having two
queries that display the same result set, but ordered in two different ways; or avoid having two
queries that count the same set of rows using two different columns. */

-- VIEW 1 
/*Passes 
Uses Join
Uses Aggregation*/
USE camp_data; 
CREATE VIEW Entity_Summaries AS
SELECT payee_type AS "Payee Type", CONCAT('$',FORMAT(AVG(payment_amount),2)) AS "Average Spent", 
 CONCAT('$',SUM(payment_amount)) AS "Total Spent", CONCAT('$',MAX(payment_amount)) AS "Highest Spent"
FROM payee
	JOIN payee_type USING (type_id)
    JOIN transactions USING (payee_id)
GROUP BY payee_type;




-- View 2 
/*Passes 
Uses Join 
Involves Linking table and both of its sources
Uses Subquery
Uses Filtering
*/
USE camp_data; 
CREATE VIEW Non_Political_Transactions AS
SELECT payer_name AS "Payer Name", CONCAT('$',payment_amount) AS "Amount Paid", payee_name AS "Payee", 
	ex_type AS "Expense Type", description AS "Description", payment_date AS "Date Paid"
FROM (SELECT ex_type, description, ex_type_id, description_id
    FROM expenditures
		JOIN ex_type USING (ex_type_id)
        JOIN ex_description USING (description_id)
WHERE ex_type_id = 1) AS ex_info
	JOIN transactions USING (ex_type_id, description_id)
    JOIN payee USING (payee_id)
    JOIN payer USING (payer_id)
ORDER BY payment_amount DESC;


-- View 3 
/*PASSES 
Uses Join 
Uses Filtering*/
USE camp_data; 
CREATE VIEW Transactions_More_Than_100Days AS
SELECT payer_name AS Payer, payee_name AS Payee,
	payment_date AS "Date of Payment", date_reported AS "Date Reported",
    DATEDIFF(date_reported, payment_date) AS "Time taken to report (Days)", description AS "Reason for Transaction"
FROM transactions
	JOIN payer USING (payer_id)
	JOIN payee USING (payee_id)
	JOIN ex_description USING (description_id)
WHERE DATEDIFF(date_reported, payment_date) > 100
ORDER BY DATEDIFF(date_reported, payment_date) DESC, Payer, Payee;


-- View 4 
/*
PASSES 
Aggregation
SubQuery*/
USE camp_data; 
CREATE VIEW Averge_Report_Time AS
SELECT AVG(time_diff) AS "Average Time Taken to Report Transaction In Days"
FROM (SELECT DATEDIFF(date_reported, payment_date) AS time_diff
	FROM transactions) AS time_taken;
    
    
-- VIEW 5 
/*
PASSES 
Aggregation
Join
*/
USE camp_data; 
CREATE VIEW Number_Of_Transactions_Made AS
SELECT payer_name AS Payer, COUNT(payer_id) AS "Number Of Transactions", CONCAT('$',MAX(payment_amount)) AS "Max Paid"
FROM transactions
	JOIN payer USING (payer_id)
GROUP BY Payer
ORDER BY COUNT(payer_id) DESC, Payer; 


-- VIEW 6 
/*PASSES 
JOIN 
FILTERING*/
CREATE VIEW Office_Holder_Transactions AS
SELECT payer_name AS Payer, payee_name AS Payee, payment_amount AS "Amount Paid", 
	description, pol_obligation AS "Political Obligation"
FROM transactions
	JOIN payer USING (payer_id)
    JOIN payee USING (payee_id)
    JOIN ex_description USING (description_id)
WHERE report_id = 1
ORDER BY Payer, Payee, payment_amount DESC; 


