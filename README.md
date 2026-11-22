🏦 Bank Customer Churn Analysis & Prediction

An end-to-end data analytics, business intelligence, and machine learning project designed to identify the key drivers of customer attrition in retail banking, build an executive-level Tableau dashboard, and deploy predictive classification models to flag high-risk accounts.

📌 Project Overview
Retaining existing customers is significantly more cost-effective than acquiring new ones. Using a dataset of 10,000 retail banking customers across 12 demographic, financial, and behavioral attributes, this project establishes a 20.37% baseline churn rate and delivers both descriptive business intelligence (via SQL & Tableau) and predictive risk scoring (via Python & Scikit-Learn).

Key Objectives
•	Data Wrangling & Relational Modeling: Clean raw customer records and normalize data into a star-schema structure (Customer_Dim and Account_Fact) for scalable SQL querying and BI integration.
•	Exploratory Data Analysis (EDA): Uncover demographic and financial patterns distinguishing retained customers from churned accounts.
•	Executive Tableau Dashboard: Build an interactive, leadership-ready BI dashboard tracking KPIs, regional attrition, balance exposure, and customer engagement.
•	Predictive Modeling: Train and compare classification algorithms (Support Vector Machine vs. Random Forest) to maximize churner detection.

🛠️ Tech Stack
•	Business Intelligence & Visualization: Tableau Desktop / Tableau Public
•	Database & Querying: SQL (Relational schema design, Aggregations)
•	Programming & Machine Learning: Python (pandas, numpy, scikit-learn, matplotlib, seaborn)
•	Environment: Jupyter Notebook

📂 Repository Structure
├── data/
│   ├── Bank_Customer_Churn_(U).csv      # Raw dataset with missing values
│   ├── Customer_Dim.csv                 # Cleaned customer dimension table
│   └── Account_Fact.csv                 # Cleaned account metrics & churn fact table
├── notebooks/
│   ├── 01_Data_Cleaning.ipynb           # Missing value imputation & schema preparation
│   └── 02_EDA_and_ML_Modeling.ipynb     # Visualization, preprocessing, SVM & Random Forest
├── dashboard/
│   └── Bank_Customer_Churn_Dashboard.twbx # Interactive Tableau Executive Workbook
├── reports/
│   └── BankCustomerChurnReport_2.pdf    # Executive summary & strategic recommendations
└── README.md

🔄 End-to-End Methodology
1. Data Cleaning & Imputation (01_Data_Cleaning.ipynb)
•	Audited 10,000 records across 12 features (customer_id, credit_score, country, gender, age, tenure, balance, products_number, credit_card, active_member, estimated_salary, churn).
•	Handled missing values systematically:
o	Categorical fields: Mode imputation (country $\rightarrow$ "India", gender $\rightarrow$ "Male").
o	Numerical fields: Mean/median imputation (age $\rightarrow$ rounded mean of 39, credit_score, balance, estimated_salary).
2. SQL Relational Modeling
•	Split the cleaned dataset into a normalized star-schema model (Customer_Dim and Account_Fact) joined on customer_id.
•	Executed SQL queries using GROUP BY aggregations, CTEs, and window functions to calculate segment-level churn rates, customer lifetime tenure tiers, and deposit exposure before feeding the curated tables into Tableau.

📊 Tableau Executive Dashboard 
An interactive Executive Customer Churn Dashboard was designed in Tableau to give banking leadership a real-time view of customer attrition and financial risk.
Key Dashboard Components
1.	Executive KPI Banner:
o	Total Customers: 10,000
o	Retained Customers: 7,963 (79.63%)
o	Churned Customers: 2,037 (20.37% Overall Churn Rate)
o	Total Balance & Deposit at Risk: Highlights the exact capital held by churned accounts.
2.	Geographic Churn Breakdown (Map & Bar Charts):
o	Visualizes customer distribution and churn rates across countries, highlighting regional attrition hotspots (such as elevated churn in Germany compared to France and Spain).
3.	Demographic & Age-Group Risk Analysis:
o	Compares churn across age brackets and gender, clearly illustrating the 40–55 age spike where attrition peaks.
4.	Product Adoption & Engagement Matrix:
o	Tracks churn by number of bank products (1 vs. 2 vs. 3+) and Active vs. Inactive Member status, revealing how inactive members and single-product or over-bundled (3+ product) users churn at significantly higher rates.
5.	Interactive Slicers & Drill-Down Filters:
o	Allows stakeholders to dynamically filter all visuals by Country, Gender, Age Group, Credit Card Ownership, and Active Member Status.

🔍 Exploratory Data Analysis 
•	Age Concentration: Churned customers skew significantly older, with an interquartile range (IQR) concentrated between 40 and 55 years old (compared to ~31–41 for retained customers).
•	High-Balance Attrition: Churned accounts maintain a higher median balance (~$100k–$130k), representing substantial deposit outflow risk.
•	Engagement & Geography: Inactive members and customers in specific regional markets exhibit disproportionately high attrition rates, whereas credit card ownership and estimated salary show minimal direct correlation with churn.

🤖 Machine Learning Pipeline & Model Comparison
Preprocessing
1.	Encoding: One-hot encoded categorical variables (country, gender) using pd.get_dummies(..., drop_first=True) to prevent multicollinearity.
2.	Train-Test Split: Partitioned data into 80% training (8,000 records) and 20% testing (2,000 records) (random_state=42).
3.	Feature Scaling: Applied StandardScaler on training features and transformed test features to ensure distance-based optimization performed properly.
Evaluation Results (Test Set: $N = 2,000$)

Metric	Support Vector Machine (SVM)	Random Forest Classifier
Overall Accuracy	85.20%	85.40%

Precision (Churn = 1)	0.77	0.73

Recall (Churn = 1)	0.35	0.43

F1-Score (Churn = 1)	0.48	0.54

True Positives Caught	142 / 407	176 / 407

Model Selection: Random Forest was selected as the production model. In a churn-prevention setting, false negatives (missed churners) carry a much higher financial cost than false positives. Random Forest improved minority-class recall from 35% to 43%, successfully identifying 34 additional at-risk customers on the test set alone.

💡 Strategic Business Recommendations
1.	High-Value Mid-Life Retention Program: Launch dedicated relationship-manager outreach and preferential savings tiers for customers aged 40–55 holding balances above $100,000.
2.	Re-Engagement Campaigns for Inactive Users: Trigger automated behavioral nudges, cashback incentives, and fee waivers when account activity drops over a 60-day window.
3.	Regional Root-Cause Audit: Conduct targeted service and fee benchmarking in high-churn regions (such as Germany) to address localized friction points.
4.	Threshold Tuning for Marketing Outreach: Lower the Random Forest classification probability threshold (e.g., from 0.50 to 0.35) when running low-cost digital retention campaigns to capture an even larger share of potential churners.











