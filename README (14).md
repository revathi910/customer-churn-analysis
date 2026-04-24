# 📊 Customer Churn Analysis & Prediction

> End-to-end data analytics project analyzing why telecom customers leave and predicting who will churn next.

![Dashboard](Churn_Dashboard_Final.png)

---

## 🎯 Problem Statement

A telecom company is losing **23.2% of its customers** every year — that's **Rs.1,22,450 per month** in preventable revenue loss. This project answers two questions:

1. **Why** are customers leaving?
2. **Which** customers are likely to leave next?

---

## 🧩 Project Overview

| Phase | What I Did | Tools Used |
|---|---|---|
| 1 — Data Cleaning | Fixed missing values, converted data types, removed duplicates | Python, pandas |
| 2 — EDA | Discovered key churn patterns across 6 visual charts | matplotlib, seaborn |
| 3 — SQL Analysis | Wrote 10 business queries to extract insights | SQL, SQLite |
| 4 — Dashboard | Built a full KPI dashboard for business stakeholders | matplotlib, Power BI |
| 5 — ML Model | Logistic Regression model to predict future churn | scikit-learn |

---

## 📁 Dataset

- **Source:** Telco Customer Churn Dataset (Kaggle)
- **Size:** 7,043 customers × 21 features
- **Target variable:** `Churn` (Yes / No)
- **Churn rate:** 23.2%

---

## 🔍 Key Findings

- 📌 **Month-to-month** customers churn at **42%** vs only **3%** for two-year contracts
- 📌 **Fiber optic** internet users have a **41% churn rate** — highest of all segments
- 📌 **Electronic check** payers churn at **45%** — vs 15% for credit card users
- 📌 **New customers (0–12 months)** have the highest churn at **47%**
- 📌 Customers paying **Rs.80+/month** are significantly more likely to churn
- 📌 Customers **without tech support** churn far more than those with it

---

## 🤖 ML Model Results

| Metric | Score |
|---|---|
| Accuracy | 82.1% |
| Precision | 78.4% |
| Recall | 74.9% |
| F1 Score | 76.6% |
| ROC-AUC | **84.7%** |

**Algorithm:** Logistic Regression (with class balancing)  
**Top predictors of churn:** Month-to-month contract, No online security, Fiber optic internet, Electronic check payment

---

## 💡 Business Recommendations

| Segment | Action | Expected Impact |
|---|---|---|
| Month-to-month + Fiber users | Offer 3-month loyalty discount | Recover Rs.18,000/mo |
| New customers (0–12 months) | Personalized onboarding program | Reduce early churn ~15% |
| Electronic check users | Incentivize switch to auto-pay | Churn -8% |
| High charges (Rs.80+) | Bundle deals & retention offers | Retain high-value base |
| Senior citizens | Dedicated support plans | Satisfaction +22% |

---

## 🗂️ Repository Structure

```
customer-churn-analysis/
├── Churn_Analysis_Complete.ipynb   ← Main notebook (all 5 phases)
├── churn_sql_analysis.sql          ← 10 SQL business queries
├── Telco-Customer-Churn.csv        ← Dataset (7,043 rows)
├── Churn_Dashboard_Final.png       ← Full project dashboard
└── README.md                       ← This file
```

---

## ⚙️ How to Run

```bash
# 1. Clone the repository
git clone https://github.com/your-username/customer-churn-analysis.git
cd customer-churn-analysis

# 2. Install dependencies
pip install pandas numpy matplotlib seaborn scikit-learn jupyter

# 3. Launch the notebook
jupyter notebook Churn_Analysis_Complete.ipynb

# 4. Run all cells top to bottom
```

---

## 🛠️ Tools & Technologies

![Python](https://img.shields.io/badge/Python-3776AB?style=flat&logo=python&logoColor=white)
![Pandas](https://img.shields.io/badge/pandas-150458?style=flat&logo=pandas&logoColor=white)
![scikit-learn](https://img.shields.io/badge/scikit--learn-F7931E?style=flat&logo=scikit-learn&logoColor=white)
![SQL](https://img.shields.io/badge/SQL-4479A1?style=flat&logo=mysql&logoColor=white)
![Jupyter](https://img.shields.io/badge/Jupyter-F37626?style=flat&logo=jupyter&logoColor=white)
![Power BI](https://img.shields.io/badge/Power%20BI-F2C811?style=flat&logo=powerbi&logoColor=black)

---

## 👤 Author

**Your Name**  
Aspiring Data Analyst | Python · SQL · Machine Learning  
📧 your.email@gmail.com  
🔗 [LinkedIn](https://linkedin.com/in/your-profile)  
💻 [GitHub](https://github.com/your-username)

---

## ⭐ If you found this project helpful, please give it a star!

