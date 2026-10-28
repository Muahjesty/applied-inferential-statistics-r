# ================================================================
# Data 101 HW 4 - Inferential Statistics 
# ================================================================
rm(list = ls()); set.seed(42)

# Ensure the hypothesis testing package is loaded
# library(devtools)
# devtools::install_github("kashish-vaish/Data101", subdir = "hypothesis_testing", force = TRUE)
library(HypothesisTesting)

# Load data
df <- read.csv("2019.csv", stringsAsFactors = FALSE)

# --- Data Prep (Median Splits) ---
med_gdp <- median(df$GDP.per.capita)
df$High_GDP <- ifelse(df$GDP.per.capita > med_gdp, "High", "Low")

med_freedom <- median(df$Freedom.to.make.life.choices)
df$High_Freedom <- ifelse(df$Freedom.to.make.life.choices > med_freedom, "High", "Low")

med_score <- median(df$Score)
df$High_Score <- ifelse(df$Score > med_score, "Yes", "No")

med_social <- median(df$Social.support)
df$High_Social <- ifelse(df$Social.support > med_social, "Yes", "No")

# ==========================================
# 1. Hypothesis Testing
# ==========================================
# Using tapply to calculate the mean Score grouped by High_GDP
group_means <- tapply(df$Score, df$High_GDP, mean)
mean_high <- group_means["High"]
mean_low <- group_means["Low"]

diff_means <- mean_high - mean_low

z_test_from_data(df, "High_GDP", "Score", "High", "Low")
permutation_test(df, "High_GDP", "Score", 10000, "High", "Low")

# ==========================================
# 2. Confidence Intervals
# ==========================================
n <- nrow(df)
xbar <- mean(df$Score)
s <- sd(df$Score)
z_star <- qnorm(0.975)

SEM <- s / sqrt(n)
MOE <- z_star * SEM

CI_lower <- xbar - MOE
CI_upper <- xbar + MOE

# ==========================================
# 3. Chi-Square Test
# ==========================================
cont_table <- table(df$High_GDP, df$High_Freedom)
chisq.test(cont_table)

# ==========================================
# 4. Bayesian Reasoning
# ==========================================
p_b <- mean(df$High_Score == "Yes")
prior_odds <- p_b / (1 - p_b)

happy_countries <- subset(df, High_Score == "Yes")
tpr <- mean(happy_countries$High_Social == "Yes")

unhappy_countries <- subset(df, High_Score == "No")
fpr <- mean(unhappy_countries$High_Social == "Yes")

lr <- tpr / fpr
posterior_odds <- prior_odds * lr

