# 🧭 Inferential Statistics & Data Fluency: World Happiness Analysis

An end-to-end inferential statistics portfolio applying **z-tests**, **permutation testing**, **confidence intervals**, **Chi-Square independence testing**, and **Bayesian posterior odds** in base R.

---

## 💡 Overview & Data Storytelling

This project proves data fluency by evaluating the **World Happiness Report (2019)** dataset through four core statistical frameworks. Every test translates raw calculations into data-journalism-style headlines backed by empirical statistics.

---

## 🔬 Four Inferential Frameworks

### 1. Hypothesis Testing (z-Test & Permutation Resampling)
* **Headline**: *"Wealthy Nations Smile 1.49 Points Brighter: High-GDP Countries Blow Past Baseline Happiness ($z = 11.23, p < 0.0001$)!"*
* **Results**: $\text{Mean}_{\text{HighGDP}} = 6.1615$ vs. $\text{Mean}_{\text{LowGDP}} = 4.6718$ ($\Delta = +1.4896$).
* **Test Statistics**: $z = 11.2312, p < 0.0001$. Permutation testing ($10,000$ iterations) yielded $p < 0.0001$.

### 2. Confidence Intervals
* **Headline**: *"Global Happiness Baseline Nailed Down: Standardized Score Pins World Baseline to $5.41 \pm 0.17$ at 95% Confidence!"*
* **Results**: $N = 156, \bar{X} = 5.4071, s = 1.1131, \text{SEM} = 0.0891$.
* **95% CI**: **[5.2324, 5.5818]** (Margin of Error: $\pm 0.1747$). Demonstrates high estimation stability.

### 3. Hypothesis of Independence (Chi-Square Test)
* **Headline**: *"Freedom and Wealth Are Deeply Intertwined: Chi-Square Test Exposes Structural Dependence ($\chi^2 = 6.56, p = 0.0105$)!"*
* **Results**: Evaluated `High_GDP` vs `High_Freedom` split across 156 countries.
* **Test Statistics**: $\chi^2 = 6.5557, df = 1, p = 0.0105$. Wealthy nations display significantly higher rates of personal freedom ($59.7\%$ vs $39.2\%$).

### 4. Bayesian Reasoning (Posterior Odds)
* **Headline**: *"Strong Social Safety Nets Quintuple the Odds of National Happiness: Bayes' Rule Shifts Posterior Odds from $1.0$ to $5.0$!"*
* **Calculations**:
  * **Prior Belief ($H$)**: Country is happy (`High_Score` = Yes) $\implies \text{Prior Odds} = 1.0$ ($50\%$ prior probability).
  * **Evidence ($E$)**: Country has high social support (`High_Social` = Yes).
  * **Likelihood Ratio ($\text{LR}$)**:
    $$\text{LR} = \frac{P(E \mid H)}{P(E \mid \neg H)} = \frac{0.8333}{0.1667} = 5.0000$$
  * **Posterior Odds**: $\text{Prior Odds} \times \text{LR} = 1.0 \times 5.0 = \mathbf{5.0}$ (Translates to an $83.33\%$ posterior probability).

---

## 🛠️ Tech Stack & Methods

* **Language**: Base R (`R101`)
* **Statistical Methods**: Two-sample $z$-tests, permutation resampling, Chi-Square test of independence ($\chi^2$), parametric confidence intervals, Bayesian probability updating ($\text{Odds}_{\text{posterior}} = \text{Odds}_{\text{prior}} \times \text{LR}$).

---

## 📁 Repository Structure

```text
.
├── 2019.csv             # World Happiness 2019 dataset
├── hw4.R                # Primary R script containing all 4 inferential frameworks
```
