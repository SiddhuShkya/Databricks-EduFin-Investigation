# Databricks EduFin Investigation

A hands-on, execution-based data analysis project simulating a **real-world financial crisis investigation** at EduFin — an education loan company facing a ₹12 Crore discrepancy across 15,000+ student accounts. Built and run on **Databricks** using **PySpark SQL**.

---

## About Author 

<table>
  <tr>
    <td width="180">
      <img src="images/viresh.png" alt="Viresh Gendle" width="160"/>
    </td>
    <td>
      <strong>Viresh Gendle</strong> is a data engineer with 8+ years of experience building production data systems. He specializes in solving real-world data problems—from debugging complex data pipelines to designing systems that handle changing requirements and messy data. His teaching focuses on practical, production-grade thinking rather than theory.
    </td>
  </tr>
</table>

---

## 🏦 Business Context

EduFin has flagged a critical anomaly in its loan portfolio. A federal compliance audit is approaching, and the CEO needs board-ready answers within 48 hours. As the assigned Data Analyst, the task is to investigate the portfolio using SQL across **5 sequential analysis phases**, each building on the previous.

> **Recent System Note:** EduFin migrated from legacy Oracle CRM to Salesforce in January 2024. Potential timestamp inconsistencies may require validation during analysis.

---

## 📂 Repository Structure

```
├── datasets/          # Raw CSV data files (loans, customers, institutions, etc.)
├── notebooks/         # Databricks notebooks for each phase of analysis
├── submissions/       # Final query outputs and executive summaries per phase
├── notes/             # Personal notes and learning reflections
├── issues/            # Documented bugs, blockers, and resolutions
├── workbooks/         # Reference workbooks and solution guides
├── resources/         # Business Requirements Document (BRD) and other docs
├── screenshots/       # Captured outputs and dashboard screenshots
└── requirements.txt   # Python dependencies
```

---

## 🗄️ Dataset Overview

| Table | Description |
|---|---|
| `loans.csv` | Core transactional table — loan status, amounts, dates, tenure |
| `customers.csv` | Borrower demographics — income, CIBIL score, employment, location |
| `institutions.csv` | Partner universities/colleges — type and tier |
| `geographic_demographics.csv` / `dim_city.csv` | City and state-level geographic data |
| `defaults_collections.csv` / `payments.csv` | Payment history and collection activity |

---

## 📋 The 5-Phase Analysis

### Phase 1 — Portfolio Health Check *(Monday)*
> *"How big is our loan book? How much have we lost to defaults?"*

Establishes the full scale of the portfolio — total loans, customers, financial exposure, and overall default rate. Produces an executive dashboard with automated **Health Classification**:

| Classification | Default Rate |
|---|---|
| ✅ Healthy | ≤ 5.00% |
| 🟠 Moderate Risk | 5.01% – 10.00% |
| 🟡 High Risk | 10.01% – 15.00% |
| 🔴 Critical | > 15.00% |

---

### Phase 2 — Geographic Risk Analysis *(Tuesday)*
> *"Which cities are causing this crisis?"*

Identifies high-default cities, financial exposure by location, and classifies geographic markets as **Critical / High Risk / Monitor / Safe**. Culminates in a regional crisis dashboard recommending cities to halt lending in immediately.

---

### Phase 3 — Customer Risk Segmentation *(Wednesday)*
> *"Who are our riskiest customers?"*

Segments borrowers by default behaviour, outstanding exposure, and demographic risk factors (income bracket, employment type, CIBIL score). Outputs a **prioritised collections target list** following RBI 90+ days past due guidelines.

---

### Phase 4 — Institutional Partnership Risk *(Thursday)*
> *"Which partner institutions are sending us students who default?"*

Scores universities and colleges by default rate and financial loss attributed. Categorises partners as **Preferred / Probation / Blacklist Candidate** (>15% default rate). Regulatory definition: 180+ days past due or write-off flag.

---

### Phase 5 — Crisis Timeline & Time Intelligence *(Friday)*
> *"When did this crisis start? Was it sudden or gradual?"*

Uses time-series SQL (LAG, cohort analysis, month-over-month trends) to pinpoint the exact month defaults spiked. Includes a **capstone synthesis question** combining Phase 1 financial totals with Phase 5 crisis onset date.

---

## 📐 Formatting Standards

- **Currency:** Amounts ≥ ₹1 Cr displayed as `₹X.XX Cr`; amounts < ₹1 Cr displayed as `₹X.XX L`
- **Percentages:** Default rates to 2 decimal places; distributions to 1 decimal place
- **Column names:** Business-friendly aliases (e.g. "Default Rate %" not `default_rate`)

---

## 🛠️ Tech Stack

- **Platform:** Databricks (Community / Workspace)
- **Language:** PySpark SQL / Python
- **Data Format:** CSV (loaded as Spark DataFrames / Delta tables)

---

## 📌 Submission Standard

Each phase submission includes three parts:
1. **SQL queries** — answering the business questions
2. **Custom column** — at least one analyst-defined derived column with threshold justification
3. **Business recommendation** — 3-sentence max, written to the phase's stakeholder

---

## 📄 License

Licensed for educational and internal business use. Attribution required when sharing. Commercial redistribution prohibited.

*BRD authored by Viresh Gendle — © 2025 Skill AI Path. All Rights Reserved.*