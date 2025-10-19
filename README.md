# Application of Retail Analytics for Strategic Promotion in the Vietnamese Coffee Market  
### Case Study: Highlands Coffee  
**University of Economics and Law – Faculty of Information Systems**  
**Course:** Data Analytics in Business  
**Instructor:** Assoc. Prof. Hồ Trung Thành, Ph.D.  
**Group 02 | Ho Chi Minh City, October 2025**

---

## Overview  
This project applies **retail analytics and machine learning** to optimize **marketing strategies** in Vietnam’s competitive coffee market, focusing on **Highlands Coffee**.  

By combining customer segmentation, churn prediction, and interactive dashboards, the study demonstrates how **data-driven insights** can enhance customer retention, increase sales efficiency, and guide strategic promotions.  

The analytical framework is implemented on a **Medallion Architecture**, integrating multiple survey datasets (2017–2019) into a structured data warehouse for modeling and visualization.

---

## Business Objectives  
1. Build a **centralized data warehouse** to support strategic decision-making and reusable analytics.  
2. Identify **customer segments** based on demographics, visit behavior, and brand perception.  
3. Predict **customer churn** and identify key behavioral and demographic factors.  
4. Assess **Highlands Coffee’s competitive positioning** in the Vietnamese coffee market.  
5. Propose **data-driven promotional strategies** to improve loyalty and profitability.

---

## Business Questions  
- What are the demographic and behavioral patterns of Highlands Coffee customers?  
- What are the typical behavioural patterns of high loyal customer versus high churn risk ones within customer segments?
- How does Highlands Coffee sustain its leading position in Vietnam’s competitive coffee chain market?
- How can customer segmentation and churn prediction insights be applied to optimize Highlands Coffee’s retention and loyalty strategies?
- How can Highlands define promotional strategies and in-store experience to counter the specific competitive pressures in oversaturated markets? 

---

## Project Scope  
- **Time Frame:** 2017–2019  
- **Geographic Coverage:** Six major cities in Vietnam (Hanoi, Ho Chi Minh City, Da Nang, Nha Trang, Hai Phong, Can Tho)  
- **Focus:** Highlands Coffee’s customers, competitors, and retail performance  

---

## Methodology  
The project follows a structured data analytics process:

1. **Data Integration (ETL)**  
   - Collected multi-source survey data.  
   - Built a Medallion-based data warehouse (Bronze → Silver → Gold) using SQL Server.  

2. **Data Cleaning & Transformation**  
   - Standardized variable formats, corrected brand names, handled nulls, normalized spending and PPA metrics.  

3. **Exploratory Data Analysis (EDA)**  
   - Conducted descriptive and outlier analysis.  
   - Visualized frequency distributions and behavioral trends.  

4. **Customer Segmentation**  
   - Applied **K-Means** and **K-Prototypes** clustering for mixed-type data.  
   - Defined customer profiles by spending, visit frequency, and income level.  

5. **Churn Prediction**  
   - Developed models using **Logistic Regression**, **Random Forest**, **XGBoost**, and **SVM**.  
   - Used **SMOTE** to address class imbalance.  
   - Evaluated using accuracy, precision, recall, and F1-score.  

6. **Visualization & Insight Generation**  
   - Built **Power BI dashboards** for interactive business analysis and executive reporting.

---

## Tools and Technologies  
| Tool / Platform | Purpose |
|------------------|----------|
| SQL Server | Data storage and ETL processing |
| Python (Google Colab) | Data preprocessing, machine learning, model evaluation |
| Power BI | Dashboard visualization and business reporting |
| Excel | Data review and validation |
| GitHub | Version control and documentation |

---

## Entity Relationship Diagram (ERD)

The ERD below illustrates the logical structure of the data warehouse


## Visualizations
1. **Brand Health Overview**
- Market Metrics: 12K respondents, average NPS of 7.97, and average spending of 155K VND.
- Top Performers: Highlands Coffee (8.5) and Cộng Cà Phê (8.3) lead in customer satisfaction and loyalty.
- Store Growth (2017–2019):
    + Highlands Coffee: 118 → 150 → 162 stores
    + The Coffee House: 60 → 93 → 101 stores
    + Growth pace slowed after 2018, signaling a transition to sustainable expansion.
- Brand Awareness: Street Coffee (10.7K), Trung Nguyên (10K), Highlands Coffee (8.5K).
- Highlands shows strong spontaneous awareness, confirming top-of-mind brand recognition.
- Customer Funnel (Highlands Coffee): 8.5K aware → 6.0K tried → 4.2K used in 3 months → 2.7K used in 1 month.
**Key Insight**: Highlands Coffee maintains strong brand awareness and satisfaction but must improve retention and repeat visits to strengthen long-term loyalty.

2. **Customer Portrait**
- Super Premium (5.9K) dominates, followed by Premium (2.4K) and Mass Aspiring (2.4K) – indicating higher-income representation.
- Spending Patterns:
    + Self-Employed/Company Owners: 198K average spending, peaking at 293K (age 30–34).
    + White-Collar and Blue-Collar: Moderate spenders (159K–157K).
    + Highest purchasing power: Ages 25–39.
- Brand Preference by Age:
    + Highlands Coffee: 43.0% (ages 16–19), 36.9% (20–24) – strong appeal among Gen Z and young adults.
    + Trung Nguyên: Gains popularity in older age groups (10.9% for 45+).
**Key Insight**: Highlands Coffee’s brand identity resonates with younger, urban consumers and professionals. Sustaining engagement among older demographics could balance its customer base and stabilize long-term revenue.

3. **Overview of Brand Coffee Market and Brand Image**
- Survey Base: 11,760 respondents, 56% female, 44% male, majority Blue Collar.
- Store Growth (2017–2019):
    + Highlands Coffee: 115 → 150 → 162 (+44)
    + The Coffee House: 60 → 93 → 101 (+41)
    + Cộng Cà Phê: 12 → 16 → 19 (+7)
- Industry peak expansion: 2018, signaling the F&B boom.
- Market Share by Stores:
    + Highlands: >40% (market leader)
    + The Coffee House: 24%
    + Trung Nguyên, Phúc Long, Starbucks: 13%, 10%, 8% respectively
- Brand Attributes: Clean, Popular Brand, Trusted Brand, Friendly Staff, Good Place for Relaxing.
- Geographic Distribution: Ho Chi Minh City holds the largest concentration (772 stores total), confirming its role as Vietnam’s F&B capital.
**Key Insight**: Highlands Coffee leads in both store count and positive brand attributes. However, it faces saturation in HCMC, suggesting expansion opportunities in Tier-2 cities like Đà Nẵng, Nha Trang, and Hải Phòng.

4. **Needstate DayPart Overview**
- Respondent Metrics: 12K respondents, 127K total visits, averaging 10.23 visits/person.
- Visit Timing:
    + Morning (Before 9 AM): ~50% of visits, showing peak early-day engagement.
    + Evening (5–9 PM): Second-highest traffic.
- Day-of-Week Behavior:
    + Weekends dominate: Sunday (28%), Saturday (26%).
    + Weekdays show stable but lower activity.
- Needstate Groups:
    + Drinking Beverages and Socializing are primary motivations.
    + Studying/Working and Meals/Snacks represent smaller shares.
- Geography: Highest visit counts in Hanoi and HCMC, while Tier-2 cities show potential for development.
**Key Insight**: Highlands Coffee thrives as a social and beverage-driven brand, with peak engagement during morning hours and weekends. Marketing should emphasize time-based offers and localized campaigns to maintain engagement across all regions.

---

## Machine Learning Models  

This project integrates **machine learning techniques** to support strategic marketing and retention efforts. Two primary modeling workflows were implemented: **Customer Segmentation** and **Churn Prediction**.

---

### 1. Customer Segmentation Model  
**Objective:** Identify distinct customer groups based on spending, demographics, and visit frequency to support targeted marketing and personalized promotions.  

**Approach:**  
- **Algorithms Used:** *K-Prototypes*.  
- **Feature Variables:** Gender, Age, Occupation, CityID, Spending, SpendingRange, GroupSize, VisitFreq_dayofweek, DayOfWeek, DayPart, NeedstateGroup, CompanionGroup
**Results:**  
Five customer clusters were identified:  

| Cluster | Cluster Name | Key Characteristics |
|----------|---------------|--------------------|
| 0 | Stable Core Customer | Accounts for **11.8%**, representing a solid revenue base, with **high average spending (429,960 VND)** and **stable frequency (4.30 times/week)**. |
| 1 | Low-Value Majority Customer | Accounts for **54.1%**, the largest segment but with the **lowest average spending (84,729 VND)** and **lowest frequency (2.95 times/week)**. |
| 2 | Super VIP Customer | Smallest segment (**0.9%**) but the **highest average spending (1,484,660 VND)** and **high visit frequency (4.96 times/week)**. |
| 3 | Revenue Base Customer | Accounts for **28.4%**, a **large, stable source of customer traffic**, with **regular frequency (3.87 times/week)** but **medium-low spending (240,033 VND)**. |
| 4 | Loyal Customer | Accounts for **4.9%**, showing the **highest engagement**, with **visit frequency (5.16 times/week)** and **very high spending (752,463 VND)**. |

## Strategy Proposal  

### Cluster 0 – Stable Core Customer   
  - Implement **personalized upsell and cross-sell recommendations** to increase transaction value.  
  - Provide **periodic promotions** and **personalized customer service** such as birthday offers or product consultations.  
  - Integrate these customers into **loyalty programs** to reinforce engagement and motivate spending toward higher tiers.

### Cluster 1 – Low-Value Majority Customer  
  - Apply **selective activation campaigns** using low-cost channels (email/SMS) to re-engage likely responders.  
  - Enhance **digital self-service and app-based transactions** to reduce operational costs.  
  - Offer **short-term discounts or limited-time deals** to attract infrequent buyers without compromising margins.

### Cluster 2 – Super VIP Customer  
  - Deliver **exclusive VIP services** such as early product access, private events, and premium gifts.  
  - Maintain **personalized communication channels** and exceptional service quality to ensure satisfaction.  
  - Promote **premium upsell opportunities** through curated experiences and personalized recommendations.

### Cluster 3 – Revenue Base Customer  
  - Increase **average order value (AOV)** through combo or bundling promotions.  
  - Focus on **fast and convenient service experiences**, catering to blue-collar or time-sensitive customers.  
  - Use **reactivation and trust-building campaigns** to strengthen loyalty and encourage gradual spending growth.

### Cluster 4 – Loyal Customer  
  - Reinforce loyalty using **frequency-based reward programs** and tier upgrades.  
  - Encourage **brand advocacy** through referral incentives and early access to new products.  
  - Build emotional connection with **community events** or exclusive member gatherings.


---

### 2. Customer Churn Prediction Model  
**Objective:** Predict the likelihood of customer churn and identify behavioral and demographic drivers behind attrition.  

**Dataset:** Combined customer behavioral data, visit history, and engagement metrics.  

**Model Pipeline:**  
1. **Feature Variables:**: Age, Gender, OccupationGroup, MPI, GroupSize, CompanionGroup, DayOfWeek_mode, DayPart_mode, VisitFreq_mean, Spending, Attribute, is_churn

2. **Preprocessing:**  
   - Missing value handling and categorical encoding.  
   - Addressed data imbalance using **SMOTE (Synthetic Minority Over-sampling Technique)**.  
   - Performed feature selection using correlation and importance ranking.  

3. **Algorithms Tested:**  
   - **Logistic Regression**  
   - **Random Forest Classifier**  
   - **XGBoost Classifier**  
   - **Support Vector Machine** 

4. **Evaluation Metrics:**: Accuracy, Precision, Recall, F1-Score, and ROC-AUC.
   
5. **Results of best model**:

| **Metric** | **Before Fine-Tuning** | **After Fine-Tuning** | **Change** |
|-------------|------------------------|------------------------|-------------|
| Accuracy    | 67.93%                 | 66.12%                 | −1.81%      |
| Precision   | 62.16%                 | 55.49%                 | −6.67%      |
| Recall      | 34.98%                 | 44.70%                 | +9.72%      |
| F1-score    | 44.74%                 | 49.49%                 | +4.75%      |
| ROC-AUC     | 70.14%                 | 68.72%                 | −1.42%      |



**Key Predictors of Churn:**  
- Attributes
- Ages 
- OccupationGroup
- CompanionGroup


## Team Members – Group 02  
| No | Full Name | Student ID |
|----|------------|------------|
| 1 | Bùi Thị Ngọc Châu | K224111443 |
| 2 | Bùi Thị Hồng Thi | K224111463 |
| 3 | Thái Anh Thư | K224111468 |
| 4 | Hồ Song Tín | K224111469 |
| 5 | Lê Huyền Trân | K224111472 |

## Project Structure  
Project
```
├── README.md
├── structure.txt
│
├── Code
│   ├── Data Understanding
│   ├── EDA and Clustering Result
│   ├── ETL - SQL Scripts
│   │   ├── Data Profiling
│   │   ├── Initializing Data Warehouse
│   │   ├── Load Data
│   │   └── Validating Silver
│   │
│   └── Machine Learning Models
│       ├── Classification Models
│       └── Clustering
│
├── Dashboards
│
├── Data
│   ├── Processed Data
│   └── Unprocessed Data
│
└── Docs
```
