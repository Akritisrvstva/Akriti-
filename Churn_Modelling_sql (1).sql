#SQL QUERIES 
#DATASET USED- CHURN_MODELLING 
SELECT * FROM churn_modelling.`churn_modelling (1)`;
#List of all the customer that are staying in France. 
Select * from churn_modelling.`churn_modelling (1)`where Geography = 'France';
#Find the total counts of cistomer that are staying in France. 
Select count(CustomerID) from churn_modelling.`churn_modelling (1)`where Geography = 'France';
#Find the list of employees whose name starts with 'M'
select * from churn_modelling.`churn_modelling (1)`where Surname like 'M%'
#Find all the customers that are staying in France and has age greater than 30. 
Select Surname from churn_modelling.`churn_modelling (1)` where Geography = 'France' and Age>30 
#Find ll the list of customers whose surname contains 'ar'
select * from churn_modelling.`churn_modelling (1)` where surname like '%ar%'
#Find all the list of customers where name starts with M or J 
select * from churn_modelling.`churn_modelling (1)` where Surname like 'M%' or Surname like 'J%'
#Updating the table record according to our need 
SET SQL_SAFE_UPDATES = 1
Update churn_modelling.`churn_modelling (1)` set Age= 25 where Surname = 'Mitchell'
#Find the sum of Total Estimated Salary per Geography
select Geography, sum(EstimatedSalary) from churn_modelling.`churn_modelling (1)` group by Geography
#Find the average salary as per he gender
select Gender, avg(EstimatedSalary) from churn_modelling.`churn_modelling (1)` group by Gender
#sort the records by minimum estimated salary as per the geography and the gender. 
select Geography, Gender, min(EstimatedSalary) as minsal from churn_modelling.`churn_modelling (1)` group by Geography, Gender order by minsal desc 
#Sorting the records using Hvaing Clause 
select Geography, Gender , min(EstimatedSalary) as minsal from churn_modelling.`churn_modelling (1)` group by Geography, Gender Having minsal> 
#Find the surname of the customer who has the highest estimated salary
select surname, EstimatedSalary from churn_modelling.`churn_modelling (1)` order by EstimatedSalary desc limit 1 
#Find the second highest estimatd salaried person
select surname, EstimatedSalary from churn_modelling.`churn_modelling (1)` order by EstimatedSalary desc limit 1,1
#Write the query for concatenating strings in the record
select concat(Geography, Gender) as geogen from churn_modelling.`churn_modelling (1)` 
#Write the query using substr function 
select Geography,substr(Geography,2,4) from churn_modelling.`churn_modelling (1)`
#Find the average salary 
Select avg(EstimatedSalary) from churn_modelling.`churn_modelling (1)`
#NESTED QUERRIES 
#List all the customer's name having salary greater than the average salary 
select Surname from churn_modelling.`churn_modelling (1)` where EstimatedSalary > (Select avg(EstimatedSalary) from churn_modelling.`churn_modelling (1)`)
#What is the total count of the above querry result
select count(Surname) from churn_modelling.`churn_modelling (1)` where EstimatedSalary > (Select avg(EstimatedSalary) from churn_modelling.`churn_modelling (1)`)
#List the customer that are having salary greater than customerid = 15738191
select Surname from churn_modelling.`churn_modelling (1)` where EstimatedSalary > (select EstimatedSalary from churn_modelling.`churn_modelling (1)` where CustomerID = 15738191)
#Find the second highest salaried person
select CustomerID FROM churn_modelling.`churn_modelling (1)` where EstimatedSalary < (Select max(EstimatedSalary) from churn_modelling.`churn_modelling (1)`) order by EstimatedSalary desc limit 1
