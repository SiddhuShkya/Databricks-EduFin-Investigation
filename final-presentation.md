# EduFin Portfolio Risk Analysis — Final Presentation

### 🎬 Opening — The Crisis 

---

> "Good afternoon everyone. I'm Siddhartha, and today I'll walk you through a crisis investigation I conducted for EduFin Capital — an education loan company.
>
> Here's the situation: EduFin discovered a **₹12 Crore discrepancy** in loan disbursements affecting over **15,000 student accounts** in just 6 months. A federal compliance audit is approaching, and the CEO needed board-ready answers within **48 hours**.
>
> I was assigned as the Data Analyst to investigate the portfolio data and deliver actionable insights. I did this across **four sequential phases**, each building on the previous — starting from the macro portfolio health, all the way down to individual customer and institutional accountability.
>
> Let me walk you through what I found."

### 📊 Phase 1 — Portfolio Health Check 

---

> Portfolio Health Check Dashboard

```text
════════════════════════════════════════════
══> PORTFOLIO HEALTH CHECK DASHBOARD <══════
════════════════════════════════════════════

+----------------------------+-------------+
| Metric                     | Value       |
+----------------------------+-------------+
| Total Loans                | 5,000       |
| Active Loans               | 3,965       |
| Active Loan %              | 79.3%       |
| Active Portfolio Value     | ₹162.41 Cr  |
| Closed Loans               | 172         |
| Closed Loan %              | 3.4%        |
| Closed Portfolio Value     | ₹7.24 Cr    |
| Defaulted Loans            | 590         |
| Defaulted Loan %           | 11.8%       |
| Defaulted Portfolio Value  | ₹24.24 Cr   |
| Overdue Loans              | 273         |
| Overdue Loan %             | 5.5%        |
| Overdue Portfolio Value    | ₹10.94 Cr   |
| Total Customers            | 3,000       |
| Total Portfolio Value      | ₹204.82 Cr  |
| Average Loan Amount        | ₹4.1 L      |
| Portfolio at Risk %        | 17.26%      |
| Total at Risk Value        | ₹35.18 Cr   |
| Portfolio Health Status    | HIGH RISK   |
+----------------------------+-------------+
```

> Phase 1 answered the CEO's first question: *How big is our portfolio, and how much have we lost?*

Here are the numbers:
- EduFin has **5,000 loans** disbursed across **3,000 customers**, with a total portfolio value of **₹204.82 Crores** and an average loan size of **₹4.1 Lakhs**.

Now, the crisis:
- **590 loans** have defaulted — that's **11.80%** of the portfolio. The industry benchmark for education loans is **5–8%**. We are nearly **double** the upper limit.
- In financial terms, **₹24.24 Crores** is already lost to defaults.
- Another **273 loans** worth **₹10.94 Crores** are overdue and at imminent risk of defaulting.
- Combined, **₹35.18 Crores — 17.26% of the entire portfolio** — is at risk.

*I classified the portfolio health as **HIGH RISK**, just **0.20 percentage points** away from the crisis threshold of 12%. This is not a temporary market shock — the 3.4% loan closure rate tells us it's a **systemic origination failure**. My recommendation was to activate crisis protocols immediately."*

### 🗺️ Phase 2 — Geographic Risk Analysis 

---

> Geographic Risk Analysis Dashboard

```text
════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════
══> GEOGRAPHIC RISK ANALYSIS DASHBOARD <════════════════════════════════════════════════════════════════════════════════
════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════

+---------+-----+---------+---------------+---------------+-----------------+--------------+-------------+-------------+
|     City|Loans|Customers|Portfolio Value|Defaulted Value|Default Rates (%)|Exposure Score|Exposure Rank|Risk Quartile|
+---------+-----+---------+---------------+---------------+-----------------+--------------+-------------+-------------+
|   Ranchi|  168|      103|        6.71 Cr|         1.4 Cr|           17.86%|         24.97|            1|     Critical|
|     Pune|  149|       94|        5.87 Cr|        1.14 Cr|           20.13%|         22.95|            2|     Critical|
|  Lucknow|  179|      101|        7.51 Cr|        1.13 Cr|           13.97%|         15.85|            5|     Critical|
|   Mumbai|  168|      106|        6.59 Cr|        1.06 Cr|           13.10%|         13.94|           10|     Critical|
|Ahmedabad|  160|       97|        7.07 Cr|        1.05 Cr|           15.00%|         15.71|            6|     Critical|
|   Indore|  170|      104|        6.73 Cr|        1.04 Cr|           16.47%|         17.07|            3|     Critical|
|   Jaipur|  160|       90|        6.58 Cr|        1.03 Cr|           16.25%|         16.71|            4|     Critical|
|    Kochi|  165|      105|        6.67 Cr|         1.0 Cr|           15.15%|         15.17|            8|     Critical|
|    Jammu|  159|       94|        6.52 Cr|        98.62 L|           14.47%|         14.27|            9|         High|
|   Rajkot|  166|      106|        6.32 Cr|        97.93 L|           15.66%|         15.34|            7|         High|
|   Bhopal|  204|      118|        8.53 Cr|        84.25 L|           10.78%|          9.08|           14|         High|
|   Nashik|  135|       86|        5.62 Cr|        83.66 L|           14.07%|         11.77|           11|         High|
|    Patna|  183|      114|        7.77 Cr|        83.61 L|            9.29%|          7.77|           19|         High|
|    Delhi|  209|      115|        8.22 Cr|        83.12 L|           10.53%|          8.75|           15|         High|
|   Nagpur|  176|      110|        7.06 Cr|        82.25 L|           12.50%|         10.28|           12|         High|
+---------+-----+---------+---------------+---------------+-----------------+--------------+-------------+-------------+
```

> Phase 2 drilled down geographically. The CEO asked: *Which cities are bleeding money?*

I joined the loans data with geographic tables and ranked every city by an **Exposure Score** — a composite of default rate multiplied by portfolio size — to identify where EduFin is losing the most capital.

The worst-hit cities:
- **Pune** — highest default rate at **20.13%**, with **₹1.14 Crores** in losses.
- **Ranchi** — highest exposure score overall, **17.86%** default rate, **₹1.40 Crores** lost.
- **Lucknow** — the largest portfolio at risk with **₹7.51 Crores** deployed and a **13.97%** default rate.

In total, **8 out of 15 cities** were classified as **Critical** — meaning default rates above 15%.

My recommendation was a **tiered halt strategy**:
- **Tier 1** — Halt lending immediately in Ranchi, Pune, and Lucknow.
- **Tier 2** — Halt within 30 days in Indore, Jaipur, Ahmedabad, and Kochi, pending investigation.
- **Tier 3** — Enhanced monitoring for the remaining high-risk cities like Delhi and Nagpur.

*This isn't a one-size-fits-all crisis — it requires a **region-specific strategy**.*

---

### 👤 Phase 3 — Customer Risk Segmentation 

---

> Customer Risk Segmnentation Dashboard

```text
═════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════
══> CUSTOMER RISK SEGMENTATION DASHBOARD <═══════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════
═════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════

+-----------+-----------------+------------+--------------------------------+----------------+-------------+----------------+-----------+--------------+------------+-------------------------------------------+
|Customer ID|Name             |Contact     |Email                           |Defaulted Amount|Default Count|Default Rate (%)|CIBIL Score|Priority Score|Risk Segment|Recommend Action                           |
+-----------+-----------------+------------+--------------------------------+----------------+-------------+----------------+-----------+--------------+------------+-------------------------------------------+
|1047       |Raghav Dubey     |918494902096|raghav.dubey194@yahoo.com       |15.07 L         |3            |100.00%         |486        |27.57         |Critical    |Escalate to Recovery Agency + Legal        |
|4620       |Pushti Doctor    |918092197558|pushti.doctor209@outlook.com    |10.28 L         |3            |100.00%         |637        |22.03         |High        |Aggressive Collections Calls + Payment Plan|
|4724       |Ishani Joshi     |917231771111|ishani.joshi420@outlook.com     |9.68 L          |3            |100.00%         |583        |21.43         |High        |Aggressive Collections Calls + Payment Plan|
|2935       |Mohammed Mammen  |918820058128|mohammed.mammen602@outlook.com  |11.40 L         |2            |100.00%         |557        |20.65         |High        |Aggressive Collections Calls + Payment Plan|
|3102       |Balveer Swamy    |918071485656|balveer.swamy341@gmail.com      |11.06 L         |2            |100.00%         |560        |20.31         |High        |Aggressive Collections Calls + Payment Plan|
|2463       |Hamsini Wadhwa   |917596992261|hamsini.wadhwa608@outlook.com   |9.93 L          |2            |100.00%         |541        |19.93         |High        |Aggressive Collections Calls + Payment Plan|
|4347       |Max Pillay       |919575772783|max.pillay122@hotmail.com       |11.70 L         |2            |100.00%         |730        |19.70         |High        |Aggressive Collections Calls + Payment Plan|
|1666       |Saumya Sarraf    |918731863798|saumya.sarraf606@yahoo.com      |11.51 L         |2            |100.00%         |711        |19.51         |High        |Aggressive Collections Calls + Payment Plan|
|1128       |Ronith Anne      |918875996993|ronith.anne920@outlook.com      |10.18 L         |2            |100.00%         |582        |19.43         |High        |Aggressive Collections Calls + Payment Plan|
|960        |Faqid Doshi      |919099636955|faqid.doshi222@gmail.com        |9.40 L          |2            |100.00%         |534        |19.40         |High        |Aggressive Collections Calls + Payment Plan|
|992        |Jeet Randhawa    |919140933057|jeet.randhawa655@yahoo.com      |9.85 L          |2            |100.00%         |580        |19.10         |High        |Aggressive Collections Calls + Payment Plan|
|2998       |Peter Sarma      |919799532101|peter.sarma835@hotmail.com      |10.37 L         |2            |100.00%         |669        |18.87         |High        |Aggressive Collections Calls + Payment Plan|
|3030       |Yashvi Kuruvilla |919798989829|yashvi.kuruvilla313@outlook.com |10.07 L         |2            |100.00%         |714        |18.07         |High        |Aggressive Collections Calls + Payment Plan|
|4431       |Amol Nayak       |917476703358|amol.nayak830@yahoo.com         |8.74 L          |2            |100.00%         |630        |17.99         |Medium      |Standard Collections Calls                 |
|3298       |Yashasvi Sundaram|917611212814|yashasvi.sundaram746@outlook.com|12.97 L         |2            |66.67%          |598        |17.90         |Medium      |Standard Collections Calls                 |
|3728       |Jai Tailor       |917563087040|jai.tailor912@gmail.com         |12.91 L         |2            |66.67%          |582        |17.86         |Medium      |Standard Collections Calls                 |
|3821       |Dakshesh Purohit |919054366215|dakshesh.purohit663@hotmail.com |13.63 L         |2            |66.67%          |685        |17.59         |Medium      |Standard Collections Calls                 |
|3041       |Bishakha Tella   |919976412724|bishakha.tella605@hotmail.com   |8.13 L          |2            |100.00%         |627        |17.38         |Medium      |Standard Collections Calls                 |
|2587       |Yagnesh Luthra   |917691857946|yagnesh.luthra998@yahoo.com     |7.88 L          |2            |100.00%         |644        |17.13         |Medium      |Standard Collections Calls                 |
|29         |Ganga Kala       |917123786248|ganga.kala668@hotmail.com       |7.68 L          |2            |100.00%         |605        |16.93         |Medium      |Standard Collections Calls                 |
+-----------+-----------------+------------+--------------------------------+----------------+-------------+----------------+-----------+--------------+------------+-------------------------------------------+
only showing top 20 rows
```

> Phase 3 moved from *where* the problem is to *who* is causing it. The Collections Manager needed a prioritized target list.

I built a **Priority Score** for every defaulting customer by combining three factors: **defaulted amount**, **number of defaults**, and **CIBIL score**. I then segmented borrowers into **Critical**, **High**, and **Medium** risk.

- The top finding: **1 Critical customer** — Raghav Dubey — with **3 defaults**, **₹15.07 Lakhs** in losses, and a CIBIL score of just **486**. This is a serial defaulter requiring immediate legal escalation.

- Below him, **12 High-risk customers** collectively owe over **₹1.16 Crores**, each with 2–3 defaults and 100% default rates.

- I also profiled the **'Ideal High-Risk Borrower'** — typically someone with recurring defaults, exposure between ₹10–15 Lakhs, and weak repayment discipline regardless of income level.

Each customer in my output was mapped to a specific **collection action** — from aggressive daily calls and payment plans for High-risk, to recovery agency escalation for Critical. This gave the collections team a **daily call list**, not just a report."

### 🏛️ Phase 4 — Institutional Partnership Risk 

---

> Institutional Partnership Risk Dashboard

```text
════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════
══> INSTITUTIONAL PARTNERSHIP RISK DASHBOARD <══════════════════════════════════════════════════════════════════════════════════════════════
════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════

+--------------+--------------------------------+----------------+-----+---------+--------------+----------------+------------+------------+
|Institution ID|Institution Name                |Institution Type|Loans|Customers|Default Amount|Default Rate (%)|Health Score|Partner Flag|
+--------------+--------------------------------+----------------+-----+---------+--------------+----------------+------------+------------+
|29            |State Commerce Institute        |Institute       |10005|9501     |83.96 Cr      |20.87%          |118.70      |Blacklist   |
|33            |Central Engineering Institute   |Institute       |9878 |9420     |83.5 Cr       |20.75%          |118.88      |Blacklist   |
|34            |Modern Management Institute     |Institute       |10165|9660     |88.54 Cr      |20.57%          |119.15      |Blacklist   |
|31            |Regional Commerce University    |University      |9915 |9433     |85.99 Cr      |20.56%          |119.16      |Blacklist   |
|30            |National Engineering Institute  |Institute       |9889 |9466     |85.15 Cr      |20.40%          |119.40      |Blacklist   |
|32            |National Commerce Institute     |Institute       |9947 |9489     |82.81 Cr      |20.39%          |119.42      |Blacklist   |
|50            |Government Medical College      |College         |9780 |9326     |79.94 Cr      |20.11%          |119.84      |Blacklist   |
|28            |Regional Medical University     |University      |10134|9617     |68.86 Cr      |17.14%          |124.29      |Blacklist   |
|25            |Central Commerce College        |College         |10009|9527     |66.67 Cr      |16.86%          |124.71      |Blacklist   |
|26            |State Arts & Science University |University      |10108|9640     |68.38 Cr      |16.69%          |124.97      |Blacklist   |
|24            |Modern Law College              |College         |10151|9642     |64.85 Cr      |16.57%          |125.15      |Blacklist   |
|27            |Central Management College      |College         |9984 |9497     |64.64 Cr      |16.44%          |125.34      |Blacklist   |
|23            |Advanced Technology University  |University      |10121|9602     |63.76 Cr      |16.32%          |125.52      |Blacklist   |
|36            |Indian Arts & Science University|University      |9897 |9443     |50.59 Cr      |13.38%          |129.93      |Monitor     |
|49            |Advanced Commerce University    |University      |9926 |9436     |48.64 Cr      |13.21%          |130.19      |Monitor     |
|8             |State Engineering Institute     |Institute       |9860 |9387     |47.59 Cr      |13.18%          |130.23      |Monitor     |
|13            |State Medical University        |University      |10259|9725     |51.87 Cr      |12.96%          |130.56      |Monitor     |
|38            |Central Management College      |College         |10039|9525     |50.51 Cr      |12.88%          |130.68      |Monitor     |
|12            |Central Commerce University     |University      |10082|9592     |51.42 Cr      |12.80%          |130.80      |Monitor     |
|21            |Central Law University          |University      |9956 |9487     |49.09 Cr      |12.79%          |130.82      |Monitor     |
|46            |Regional Law College            |College         |9886 |9385     |47.21 Cr      |12.68%          |130.98      |Monitor     |
|7             |Indian Law University           |University      |10024|9549     |49.63 Cr      |12.67%          |131.00      |Monitor     |
|48            |Central Commerce University     |University      |9916 |9443     |48.51 Cr      |12.65%          |131.03      |Monitor     |
|4             |Advanced Arts & Science College |College         |10166|9654     |49.19 Cr      |12.61%          |131.09      |Monitor     |
|2             |Central Law University          |University      |10107|9593     |48.92 Cr      |12.61%          |131.09      |Monitor     |
+--------------+--------------------------------+----------------+-----+---------+--------------+----------------+------------+------------+
only showing top 25 rows
```

> Finally, Phase 4 asked the hardest question: *Which partner institutions are sending EduFin students who default?*

I scored every institution using a **Health Score** and classified them as **Blacklist**, **Monitor**, **Retain**, or **Reward** based on their default rates.

The results were striking:
- **13 institutions** were flagged for **Blacklist** — all with default rates above **15%**.
- The worst performer was **State Commerce Institute** — **20.87%** default rate with **₹83.96 Crores** in defaulted exposure. That alone is grounds for immediate contract suspension.
- 5 of the top 7 blacklist candidates were **Institutes**, suggesting a systemic quality issue with that institution type.

But there was also a positive outlier: **National Law Institute** had **0% defaults** despite processing over **10,000 loans**. My recommendation to the Partnership Director was — before suspending 13 bad partners, **study what National Law Institute is doing differently** in student screening and replicate it across the portfolio.

> I prepared a legal-grade suspension justification for the top institution, including the threshold exceeded, total exposure, and post-suspension monitoring requirements."

### 🎯 Closing — Synthesis

---

> "To summarize — across four phases, I went from a **macro-level health check** showing an 11.80% default rate, to **geographic hotspots** bleeding ₹1+ Crore each, to **individual borrower targeting** with actionable priority scores, and finally to **institutional accountability** identifying 13 partners for blacklisting.
>
> Every phase built on the previous. Phase 1 told us *how bad it is*. Phase 2 told us *where*. Phase 3 told us *who*. And Phase 4 told us *why*.

### 📋 Quick Reference — Key Numbers

---

| Metric | Value |
|--------|-------|
| Total Portfolio | ₹204.82 Cr |
| Default Rate | 11.80% |
| Total At Risk | ₹35.18 Cr (17.26%) |
| Crisis Cities | 8 Critical (Ranchi, Pune, Lucknow worst) |
| Top Defaulter | Raghav Dubey — ₹15.07 L, 3 defaults, CIBIL 486 |
| Blacklisted Institutions | 13 (worst: State Commerce Institute, 20.87%) |
| Best Institution | National Law Institute — 0% defaults |
