create database BANK;

use BANK;

select * from account_fact;
select * from customer_dim;

#SQL Questions
     
#Q1. Show all customers with their country and balance. 
SELECT c.customer_id, c.country, a.balance
FROM Customer_Dim c
JOIN Account_Fact a ON c.customer_id = a.customer_id;

#Q2. Display customers who have a credit card. 
SELECT c.customer_id, c.country, a.credit_card
FROM Customer_Dim c
JOIN Account_Fact a ON c.customer_id = a.customer_id
WHERE a.credit_card = 1;

#Q3. Count total number of customers. 
SELECT COUNT(customer_id) AS total_customers 
FROM Customer_Dim;

#Q4. Find the average balance by country, but only include countries 
#having more than 50 customers. 
SELECT c.country, AVG(a.balance) AS avg_balance
FROM Customer_Dim c
JOIN Account_Fact a ON c.customer_id = a.customer_id
GROUP BY c.country
HAVING COUNT(c.customer_id) > 50;

#Q5. Find gender-wise average credit score, but only for active members. 
SELECT c.gender, AVG(a.credit_score) AS avg_credit_score
FROM Customer_Dim c
JOIN Account_Fact a ON c.customer_id = a.customer_id
WHERE a.active_member = 1
GROUP BY c.gender;

#Q6. Find number of churned customers. 
SELECT COUNT(customer_id) AS churned_customers 
FROM Account_Fact 
WHERE churn = 1;

#Q7. Find average credit score of active members. 
SELECT AVG(credit_score) AS avg_credit_score 
FROM Account_Fact 
WHERE active_member = 1;

#Q8. Find customers whose balance is higher than average balance. 
SELECT c.customer_id, c.country, a.balance
FROM Customer_Dim c
JOIN Account_Fact a ON c.customer_id = a.customer_id
WHERE a.balance > (SELECT AVG(balance) FROM Account_Fact);

#Q9. Find country-wise churn count and average balance, but show only 
#those countries where churn count is greater than 10. 
SELECT c.country, COUNT(a.customer_id) AS churn_count, AVG(a.balance) AS avg_balance
FROM Customer_Dim c
JOIN Account_Fact a ON c.customer_id = a.customer_id
WHERE a.churn = 1
GROUP BY c.country
HAVING COUNT(a.customer_id) > 10;

#Q10. Find the country-wise average balance, but show only those 
#countries whose average balance is greater than the overall average 
#balance of all customers.
SELECT c.country, AVG(a.balance) AS avg_balance
FROM Customer_Dim c
JOIN Account_Fact a ON c.customer_id = a.customer_id
GROUP BY c.country
HAVING AVG(a.balance) > (SELECT AVG(balance) FROM Account_Fact);
