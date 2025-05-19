# Data Analytics Assessment

## 1. Identifying High-Value Customers

To determine high-value customers, the criteria are as follows:

They must have at least one funded savings account (i.e., an account with a positive balance or deposit).

They must also have at least one funded investment plan.

The goal is to return the total deposits across these qualifying accounts.


Assumptions (based on typical database schema):

users_customuser table:

id — Customer ID

name — Customer Name


savings_savingsaccount table:

user_id — Foreign key referencing users_customuser.id

balance or deposit_amount — Used to determine if the account is funded


plans_plan table:

user_id — Foreign key referencing users_customuser.id

plan_type — Distinguishes investment plans if applicable

balance or deposit_amount — Used to determine if the plan is funded



A SQL query can be constructed to meet these criteria and sum the relevant deposits.



## 2. Transaction Frequency Categorization

To calculate the average number of transactions per customer per month and assign them to frequency categories, the following approach is used:

Assumptions:

savings_savingsaccount stores transaction records.

It contains:

user_id — Links to users_customuser.id

created_at — Timestamp of the transaction



###Steps:

1. Count total transactions per customer.


2. Determine each customer's active period (first to last transaction).


3. Calculate the average monthly transactions.


4. Categorize customers into frequency buckets based on this average.


5. Group by category and count the number of customers in each.




## 3. Identifying Dormant Active Accounts

To find active accounts with no inflow transactions in the past year, the following logic is applied:

Assumptions:

plans_plan contains all savings and investment accounts:

id — Plan ID

owner_id — Customer ID

type — Plan type (e.g., "Savings", "Investment")


savings_savingsaccount (potentially a transactions table) contains:

plan_id — Links to plans_plan.id

transaction_type — To identify inflows (e.g., 'inflow')

amount — Transaction amount

created_at — Transaction timestamp



The logic involves checking for accounts without any inflow transactions in the last 12 months.


## 4. Estimating Customer Lifetime Value (CLV)

To estimate CLV using a simplified model, the process involves:

Assumptions:

users_customuser table:

id — Customer ID

name

date_joined — Used to calculate tenure


savings_savingsaccount table:

user_id — FK to users_customuser.id

amount — Transaction amount

created_at — Timestamp



## LV Calculation:

Profit per transaction = 0.1% of amount → amount * 0.001

Tenure is measured in months

CLV Formula:


\text{CLV} = \left( \frac{\text{total transactions}}{\text{tenure in months}} \right) \times 12 \times \text{average profit per transaction}

Notes:

Use GREATEST(tenure_months, 1) to avoid division by zero.

Apply filters such as "active users only" where relevant.

Use CAST(AVG(...)) for improved numeric precision. 
ataAnalytics-Assessment

Data Analytics Assessment

## 1. Identifying High-Value Customers

To determine high-value customers, the criteria are as follows:

They must have at least one funded savings account (i.e., an account with a positive balance or deposit).

They must also have at least one funded investment plan.

The goal is to return the total deposits across these qualifying accounts.


Assumptions (based on typical database schema):

users_customuser table:

id — Customer ID

name — Customer Name


savings_savingsaccount table:

user_id — Foreign key referencing users_customuser.id

balance or deposit_amount — Used to determine if the account is funded


plans_plan table:

user_id — Foreign key referencing users_customuser.id

plan_type — Distinguishes investment plans if applicable

balance or deposit_amount — Used to determine if the plan is funded



A SQL query can be constructed to meet these criteria and sum the relevant deposits.



## 2. Transaction Frequency Categorization

To calculate the average number of transactions per customer per month and assign them to frequency categories, the following approach is used:

Assumptions:

savings_savingsaccount stores transaction records.

It contains:

user_id — Links to users_customuser.id

created_at — Timestamp of the transaction



###Steps:

1. Count total transactions per customer.


2. Determine each customer's active period (first to last transaction).


3. Calculate the average monthly transactions.


4. Categorize customers into frequency buckets based on this average.


5. Group by category and count the number of customers in each.




## 3. Identifying Dormant Active Accounts

To find active accounts with no inflow transactions in the past year, the following logic is applied:

Assumptions:

plans_plan contains all savings and investment accounts:

id — Plan ID

owner_id — Customer ID

type — Plan type (e.g., "Savings", "Investment")


savings_savingsaccount (potentially a transactions table) contains:

plan_id — Links to plans_plan.id

transaction_type — To identify inflows (e.g., 'inflow')

amount — Transaction amount

created_at — Transaction timestamp



The logic involves checking for accounts without any inflow transactions in the last 12 months.


## 4. Estimating Customer Lifetime Value (CLV)

To estimate CLV using a simplified model, the process involves:

Assumptions:

users_customuser table:

id — Customer ID

name

date_joined — Used to calculate tenure


savings_savingsaccount table:

user_id — FK to users_customuser.id

amount — Transaction amount

created_at — Timestamp



## LV Calculation:

Profit per transaction = 0.1% of amount → amount * 0.001

Tenure is measured in months

CLV Formula:


\text{CLV} = \left( \frac{\text{total transactions}}{\text{tenure in months}} \right) \times 12 \times \text{average profit per transaction}

Notes:

Use GREATEST(tenure_months, 1) to avoid division by zero.

Apply filters such as "active users only" where relevant.

Use CAST(AVG(...)) for improved numeric precision. 

Use GREATEST(tenure_months, 1) to avoid division by zero.

Apply filters such as "active users only" where relevant.

Use CAST(AVG(...)) for improved numeric precision. 
