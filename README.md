# SS-QOL
Using R for analysis of SS-QOL
# Stroke-Specific Quality of Life (SS-QOL) Analysis

![R](https://img.shields.io/badge/Language-R-276DC3?style=flat&logo=r&logoColor=white)
![License](https://img.shields.io/badge/License-MIT-green.svg)
![Status](https://img.shields.io/badge/Status-Complete-brightgreen)
![Participants](https://img.shields.io/badge/Sample%20Size-n%20%3D%2082-blue)

A statistical analysis of post-stroke health-related quality of life using the **Stroke-Specific Quality of Life Scale (SS-QOL)** in a sample of 82 stroke survivors. The analysis covers descriptive statistics, non-parametric pairwise comparisons, and inter-domain correlation analysis across all 12 SS-QOL domains.

 

## Background

Stroke is a leading cause of long-term disability worldwide. Assessing health-related quality of life (HRQoL) in stroke survivors is critical for understanding patient-centered outcomes and guiding rehabilitation. This project applies a robust statistical workflow in R to identify which functional domains are most impaired following stroke and how those domains relate to one another.

---

## Instrument

**Stroke-Specific Quality of Life Scale (SS-QOL)**
Developed by Williams et al. (1999), the SS-QOL is a validated patient-reported outcome measure designed specifically for stroke survivors.

- **Items:** 49 items across 12 domains
- **Response format:** 5-point Likert scale (higher score = better functioning)
- **Domains covered:**

| # | Domain |
|---|--------|
| 1 | Energy |
| 2 | Family Role |
| 3 | Language |
| 4 | Mobility |
| 5 | Mood |
| 6 | Personality |
| 7 | Self-Care |
| 8 | Social Role |
| 9 | Thinking |
| 10 | Upper Extremity Function |
| 11 | Vision |
| 12 | Work Productivity |

The scale was developed through patient interviews and has demonstrated strong psychometric properties including good internal consistency, test-retest reliability, and construct validity.

---

## Dataset

- **Sample size:** 82 stroke patients
- **Outcome measure:** SS-QOL total score and 12 domain subscores
- **Total score range:** 4.17 – 20.42 (Mean = 9.55, Median = 8.17)
- **Distribution:** Right-skewed, with most participants clustering at lower-to-moderate scores, indicating relatively high functional impairment

---

## Analyses Performed

### 1. Descriptive Statistics
Computed for all 12 SS-QOL domains:
- Mean, Standard Deviation (SD)
- Median, Minimum, Maximum, Range
- Interquartile Range (IQR)

### 2. Pairwise Domain Comparisons
- **Test:** Wilcoxon Signed-Rank Test
- **Correction:** Bonferroni correction for multiple comparisons
- **Purpose:** Identify which domain pairs show statistically significant differences in impairment level

### 3. Inter-Domain Correlation Analysis
- **Method:** Spearman rank correlation matrix (non-parametric)
- **Scope:** All 12 × 12 domain pairings (n = 82)
- **Purpose:** Assess the degree to which impairments co-occur across functional areas

---

## Key Findings

### Most Impaired Domains
- **Work Productivity** (Mean = 5.65) and **Energy** (Mean = 6.33) were the lowest-scoring domains, indicating persistent fatigue and significant difficulty returning to productive activities.
- **Mobility** and **Upper Extremity Function** showed the largest mean–median gaps, reflecting a skewed distribution where a small subset of higher-functioning survivors pulled the average upward.

### Pairwise Comparisons (Wilcoxon + Bonferroni)
- Work Productivity, Energy, Mobility, and Mood showed the most consistent and significant differences relative to other domains.
- Non-significant pairs included Energy vs. Thinking, Mood vs. Upper Extremity Function, Mood vs. Vision, and Personality vs. Self-Care, suggesting more comparable impairment levels within these pairs.

### Inter-Domain Correlations (Spearman)
- **All 12 domains were significantly correlated** with one another (all *p* < .05), indicating that post-stroke impairments do not occur in isolation.
- The strongest associations (*p* < .001) appeared among physically and functionally related domains: Self-Care, Upper Extremity Function, Social Role, Work Productivity, and Mobility.
- Mood and Thinking also showed strong cross-domain associations, reflecting the pervasive impact of emotional and cognitive impairment on overall quality of life.
- Personality and Vision demonstrated the weakest (though still significant) inter-domain correlations.

 
