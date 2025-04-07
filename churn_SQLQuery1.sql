CREATE DATABASE db_churn
USE db_churn
SELECT * FROM stg_churn

SELECT Gender,COUNT(Gender) as TotalCount
FROM stg_churn
GROUP BY Gender 

--data exploration and checking how much weightage individual column has wrt entire data

select Gender, Count(Gender) as TotalCount,
Count(Gender)*100.0/(select Count(*) from stg_churn) as Percentage
from stg_churn
group by Gender

select Contract, Count(Contract) as TotalCount,
Count(Contract)*100.0/(select Count(*) from stg_churn) as Percentage
from stg_churn
group by Contract

select Customer_Status, Count(Customer_Status) as TotalCount,
Count(Customer_Status)*100.0/(select Count(*) from stg_churn) as Percentage
from stg_churn
group by Customer_Status

select State, Count(State) as TotalCount,
Count(State)*100.0/(select Count(*) from stg_churn) as Percentage
from stg_churn
group by State
order by Percentage desc

select distinct Internet_Type from stg_churn


--checking null values and counting for Customer_Id column

select
sum(case when Customer_ID is null then 1 else 0 end) as Customer_ID_Null_Count
from stg_churn

--performing for all the columns
select
sum(case when Customer_ID is null then 1 else 0 end) as Customer_ID_Null_Count,
sum(case when Gender is null then 1 else 0 end) as Gender_Null_Count,
sum(case when Age is null then 1 else 0 end) as age_Null_Count,
sum(case when Married is null then 1 else 0 end) as Married_Null_Count,
sum(case when State is null then 1 else 0 end) as State_Null_Count,
sum(case when Tenure_in_Months is null then 1 else 0 end) as Tenure_Null_Count,
sum(case when Phone_Service is null then 1 else 0 end) as Phoneservice_Null_Count,
sum(case when Multiple_Lines is null then 1 else 0 end) as Multiplelines_Null_Count,
sum(case when Internet_Service is null then 1 else 0 end) as internetservice_Null_Count,
sum(case when Internet_Type is null then 1 else 0 end) as internettype_Null_Count,
sum(case when Online_Security is null then 1 else 0 end) as onlinesecurity_Null_Count,
sum(case when Online_Backup is null then 1 else 0 end) as onlinebackup_Null_Count,
sum(case when Device_Protection_Plan is null then 1 else 0 end) as deviceplan_Null_Count,
sum(case when Premium_Support is null then 1 else 0 end) as premiumsupp_Null_Count,
sum(case when Streaming_TV is null then 1 else 0 end) as streamingtv_Null_Count,
sum(case when Streaming_Movies is null then 1 else 0 end) as streamingmovies_Null_Count,
sum(case when Streaming_Music is null then 1 else 0 end) as streamingmusic_Null_Count,
sum(case when Unlimited_Data is null then 1 else 0 end) as unlimiteddat_Null_Count,
sum(case when Contract is null then 1 else 0 end) as contrat_Null_Count,
sum(case when Paperless_Billing is null then 1 else 0 end) as paerlessbilling_Null_Count,
sum(case when Payment_Method is null then 1 else 0 end) as paymentmethod_Null_Count,
sum(case when Monthly_Charge is null then 1 else 0 end) as Monthlycharge_Null_Count,
sum(case when Total_Charges is null then 1 else 0 end) as totalcharges_Null_Count,
sum(case when Total_Refunds is null then 1 else 0 end) as totalrefunds_Null_Count,
sum(case when Total_Extra_Data_Charges is null then 1 else 0 end) as extradatacharge_Null_Count,
sum(case when Total_Long_Distance_Charges is null then 1 else 0 end) as longdistcharges_Null_Count,
sum(case when Total_Revenue is null then 1 else 0 end) as totalrevenue_Null_Count,
sum(case when Churn_Category is null then 1 else 0 end) as churncategory_Null_Count,
sum(case when Customer_Status is null then 1 else 0 end) as cust,
sum(case when Churn_Reason is null then 1 else 0 end) as churnreason_Null_Count
from stg_churn


--replacing null values and creating new database

select
Customer_ID,
Gender,
Age,
Married,
State,
Tenure_in_Months,
Phone_Service,
Internet_Service,
isnull(Multiple_Lines,'No') as Multiple_Lines,
isnull(Internet_Type,'None') as Internet_Type,
isnull(Online_Security,'No') as Online_Security,
isnull(Online_Backup,'No') as Online_Backup,
isnull(Device_Protection_Plan,'No') as Device_Protection_Plan,
isnull(Premium_Support,'No') as Premium_Support,
isnull(Streaming_TV,'No') as Streaming_TV,
isnull(Streaming_Movies,'No') as Streaming_Movies,
isnull(Streaming_Music,'No') as Streaming_Music,
isnull(Unlimited_Data,'No') as Unlimited_Data,
isnull(Churn_Category,'Others') as Churn_Category,
isnull(Churn_Reason,'Others') as Churn_Reason,
Contract,
Customer_Status,
Paperless_Billing,
Payment_Method,
Monthly_Charge,
Total_Charges,
Total_Refunds,
Total_Revenue


into [db_churn].[dbo].[prod_churn_edited]
from [db_churn].[dbo].[stg_churn]


--succesfully replace the null values and put it into a  new table (i.e prod_churn)

select * from prod_churn

--checking weather there is any null values in new table

select
sum(case when Customer_ID is null then 1 else 0 end) as Customer_ID_Null_Count,
sum(case when Gender is null then 1 else 0 end) as Gender_Null_Count,
sum(case when Age is null then 1 else 0 end) as age_Null_Count,
sum(case when Married is null then 1 else 0 end) as Married_Null_Count,
sum(case when State is null then 1 else 0 end) as State_Null_Count,
sum(case when Tenure_in_Months is null then 1 else 0 end) as Tenure_Null_Count,
sum(case when Phone_Service is null then 1 else 0 end) as Phoneservice_Null_Count,
sum(case when Multiple_Lines is null then 1 else 0 end) as Multiplelines_Null_Count,
sum(case when Internet_Service is null then 1 else 0 end) as internetservice_Null_Count,
sum(case when Internet_Type is null then 1 else 0 end) as internettype_Null_Count,
sum(case when Online_Security is null then 1 else 0 end) as onlinesecurity_Null_Count,
sum(case when Online_Backup is null then 1 else 0 end) as onlinebackup_Null_Count,
sum(case when Device_Protection_Plan is null then 1 else 0 end) as deviceplan_Null_Count,
sum(case when Premium_Support is null then 1 else 0 end) as premiumsupp_Null_Count,
sum(case when Streaming_TV is null then 1 else 0 end) as streamingtv_Null_Count,
sum(case when Streaming_Movies is null then 1 else 0 end) as streamingmovies_Null_Count,
sum(case when Streaming_Music is null then 1 else 0 end) as streamingmusic_Null_Count,
sum(case when Unlimited_Data is null then 1 else 0 end) as unlimiteddat_Null_Count,
sum(case when Contract is null then 1 else 0 end) as contrat_Null_Count,
sum(case when Paperless_Billing is null then 1 else 0 end) as paerlessbilling_Null_Count,
sum(case when Payment_Method is null then 1 else 0 end) as paymentmethod_Null_Count,
sum(case when Monthly_Charge is null then 1 else 0 end) as Monthlycharge_Null_Count,
sum(case when Total_Charges is null then 1 else 0 end) as totalcharges_Null_Count,
sum(case when Total_Refunds is null then 1 else 0 end) as totalrefunds_Null_Count,
sum(case when Total_Revenue is null then 1 else 0 end) as totalrevenue_Null_Count,
sum(case when Churn_Category is null then 1 else 0 end) as churncategory_Null_Count,
sum(case when Churn_Reason is null then 1 else 0 end) as churnreason_Null_Count
from prod_churn_edited

--no null values found