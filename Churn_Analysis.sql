SELECT * FROM churn_db.clean_churn_data;

SELECT * FROM churn_db.clean_churn_data;

SELECT * FROM churn_db.clean_churn_data;

show databases;

use churn_db;

show tables;

describe clean_churn_data;

select * from clean_churn_data limit 10;

select count(*) as total_customers from clean_churn_data;

select count(*) from clean_churn_data where Churn = 'Yes';

select Churn, count(*) as customer_count from clean_churn_data group by Churn;

select avg(Monthly_Charges) as avg_monthly_Charges from clean_churn_data;

select * from clean_churn_data order by Monthly_Charges desc limit 10;

select Contract_Type, count(*) as total_customers from clean_churn_data group by Contract_Type;

select count(*) as total_rows,
sum(Customer_ID is NULL) as missing_Customer_ID,
sum(Monthly_Charges is NULL) as missing_Monthly_Charges,
sum(Total_Charges is NULL) as missing_Total_Charges,
sum(churn is NULL) as missing_churn
from clean_churn_data;

update clean_churn_data
set Subscription_Type = 'Unknown'
where Subscription_Type is null
or trim(Subscription_Type) = '';

update clean_churn_data
set Internet_Service = 'Unknown'
where Internet_Service is null
or trim(Internet_Service) = '';

select count(*) as total_rows from clean_churn_data;

select count(*) as total_rows,
count(distinct Customer_ID)
as unique_customers
from clean_churn_data;

select Contract_Type, count(*) as total_customers
from clean_churn_data group by Contract_Type
order by total_customers desc;

select Internet_Service, Churn, count(*) as total_customers
from clean_churn_data
group by Internet_Service, Churn order by Internet_Service;

select Contract_Type, avg(Monthly_Charges) as avg_monthly_charges from clean_churn_data
group by Contract_Type having avg(Monthly_Charges) >60;

select Contract_Type, count(*) as total_customers from clean_churn_data
group by Contract_Type having count(*) > 900;

select Customer_ID, Monthly_Charges,
case
    when Monthly_Charges >=100
Then 'High'
          When Monthly_Charges >= 60
Then 'Medium'
            else 'Low'
         end as charge_category
         from clean_churn_data;
         
select Customer_ID, Churn,
case
    when Churn = 'Yes' then
    'Churned'
            when Churn = 'No' then
		'Retained' 
                 else 'Unknown'
              end as customer_state
       from clean_churn_data;
       
Select Customer_ID, Monthly_Charges
from clean_churn_data
where Monthly_Charges > (select avg(Monthly_Charges)
from clean_churn_data);

Select Customer_ID, Monthly_Charges
from clean_churn_data
where Monthly_Charges = (select max(Monthly_Charges)
from clean_churn_data);

select Contract_Type, count(*) as total_customers,
sum(case when Churn = 'Yes'
then 1 else 0 end)
       as churned_customers,
         round(
                100.0 * sum(case when Churn = 'Yes' then 1 else 0 end)/ count(*), 2)
                as churn_rate_percentage
from clean_churn_data
group by  Contract_Type
order by churn_rate_percentage
desc;

select Senior_Citizen,
Churn,
count(*) as total_customers  
from clean_churn_data
group by Senior_Citizen, Churn
order  by Senior_Citizen, Churn;

select Payment_Method,
count(*) as total_customers,
sum(case when Churn = 'Yes'
then 1 else 0 end)
as churned_customers
from clean_churn_data
group by Payment_Method
order by Payment_Method desc;

select Customer_ID, Contract_Type, Monthly_Charges,
avg(Monthly_Charges) over(partition by Contract_Type)
as avg_contract_charges
from clean_churn_data;

select Customer_Id, Monthly_Charges,
Rank() over(order by Monthly_Charges desc)
as charge_rank
from clean_churn_data;

select Customer_ID, count(*) as occurrences from clean_churn_data
group by Customer_ID
having count(*) > 1; 

