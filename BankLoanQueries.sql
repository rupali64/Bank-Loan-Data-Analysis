Select * from bank_loan_data

Select COUNT(id) as Total_Loan_Applications from bank_loan_data

Select COUNT(id) as MTD_Total_Loan_Applications from bank_loan_data 
where MONTH(issue_date)= 12 AND YEAR(issue_date)=2021

Select COUNT(id) as PMTD_Total_Loan_Applications from bank_loan_data 
where MONTH(issue_date)= 11 AND YEAR(issue_date)=2021


Select SUM(loan_amount) as Total_funded_amount from bank_loan_data


Select SUM(loan_amount) as MTD_Total_funded_amount from bank_loan_data
where MONTH(issue_date)=12 AND YEAR(issue_date)=2021

Select SUM(loan_amount) as PMTD_Total_funded_amount from bank_loan_data
where MONTH(issue_date)=11 AND YEAR(issue_date)=2021

Select SUM(total_payment) as Total_amount_received from bank_loan_data


Select SUM(total_payment) as MTD_Total_amount_received from bank_loan_data
where MONTH(issue_date)=12 AND YEAR(issue_date)=2021

Select SUM(total_payment) as MTD_Total_amount_received from bank_loan_data
where MONTH(issue_date)=11 AND YEAR(issue_date)=2021

Select AVG(int_rate)*100 as Avg_Interest_rate from bank_loan_data

Select ROUND(AVG(int_rate),4)*100 as MTD_AVG_Interest_rate from bank_loan_data 
where MONTH(issue_date)=12 AND YEAR(issue_date)=2021


Select ROUND(AVG(int_rate),4)*100 as PMTD_AVG_Interest_rate from bank_loan_data 
where MONTH(issue_date)=11 AND YEAR(issue_date)=2021

Select ROUND(AVG(dti),4)*100 as AVG_DTI from bank_loan_data

Select ROUND(AVG(dti),4)*100 as MTD_AVG_DTI from bank_loan_data
where MONTH(issue_date)=12 AND YEAR(issue_date)=2021


Select ROUND(AVG(dti),4)*100 as PMTD_AVG_DTI from bank_loan_data
where MONTH(issue_date)=11 AND YEAR(issue_date)=2021

--GOOD LOAN / BAD LOAN
Select 
   (COUNT(CASE WHEN loan_status = 'Fully Paid' OR loan_status='Current'  THEN id END)*100)
   /
   COUNT(id) AS Good_loan_percentage
from bank_loan_data

Select COUNT(id) AS Good_Loan_Applications from bank_loan_data where loan_status='Fully Paid' or loan_status='Current'

Select SUM(loan_amount) AS Good_Loan_Funded_Amount from bank_loan_data where loan_status='Fully Paid' or loan_status='Current'

Select SUM(total_payment) AS Good_Loan_Payment_Amount from bank_loan_data where loan_status='Fully Paid' or loan_status='Current'

--BAD AMOUNT
Select 
   (COUNT(CASE WHEN loan_status = 'Charged Off' THEN id END)*100)
   /
   COUNT(id) AS Bad_loan_percentage
from bank_loan_data

Select COUNT(id) AS Bad_Loan_Applications from bank_loan_data where loan_status='Charged Off'

Select SUM(loan_amount) AS Bad_Loan_Funded_Amount from bank_loan_data where loan_status='Charged Off'

Select SUM(total_payment) AS Bad_Loan_Payment_Amount from bank_loan_data where loan_status='Charged Off'

--SECONDARY KPI
Select 
    MONTH(issue_date) AS Month_Number,
    DATENAME(MONTH,issue_date) AS Month_Name,
	COUNT(id) as Total_loan_Applications,
	SUM(loan_amount) as Total_Funded_Amount,
	SUM(total_payment) as Total_Received_Amount
	from bank_loan_data
	group by MONTH(issue_date),DATENAME(MONTH,issue_date)
	ORDER BY MONTH(issue_date)

Select 
    address_state,
	COUNT(id) as Total_loan_Applications,
	SUM(loan_amount) as Total_Funded_Amount,
	SUM(total_payment) as Total_Received_Amount
	from bank_loan_data
	group by address_state
	ORDER BY address_state

Select 
    term,
	COUNT(id) as Total_loan_Applications,
	SUM(loan_amount) as Total_Funded_Amount,
	SUM(total_payment) as Total_Received_Amount
	from bank_loan_data
	group by term
	ORDER BY term

Select 
    emp_length,
	COUNT(id) as Total_loan_Applications,
	SUM(loan_amount) as Total_Funded_Amount,
	SUM(total_payment) as Total_Received_Amount
	from bank_loan_data
	group by emp_length
	ORDER BY emp_length


Select 
    home_ownership,
	COUNT(id) as Total_loan_Applications,
	SUM(loan_amount) as Total_Funded_Amount,
	SUM(total_payment) as Total_Received_Amount
	from bank_loan_data
	group by home_ownership
	ORDER BY COUNT(id)