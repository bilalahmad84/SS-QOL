
# Load necessary libraries
install.packages("psych") 
library(psych)
library(dplyr)
library(tidyr)


# Internal Consistency of the Multi-Domain Functional Assessment Scale

alpha(data_ssqol[, grep("^total", names(data_ssqol))])


describe(data_ssqol)

# Summary statistics of total scores for each variable

data_ssqol_totals <- data_ssqol[, grep("^total", names(data_ssqol))]

summary_table <- data.frame(
  Mean = sapply(data_ssqol_totals, mean, na.rm = TRUE),
  SD = sapply(data_ssqol_totals, sd, na.rm = TRUE),
  Median = sapply(data_ssqol_totals, median, na.rm = TRUE),
  Min = sapply(data_ssqol_totals, min, na.rm = TRUE),
  Max = sapply(data_ssqol_totals, max, na.rm = TRUE),
  Range = sapply(data_ssqol_totals, function(x) max(x, na.rm=TRUE) - min(x, na.rm=TRUE))
)

summary_table
 
# paired comparison of domain means
colMeans(data_ssqol[, grep("^total", names(data_ssqol))], na.rm = TRUE)



 # selcting domain scores
domains <- data_ssqol[, grep("^total", names(data_ssqol))]
# Friedman test
friedman.test(as.matrix(domains))


long_data <- data_ssqol %>%
  select(starts_with("total")) %>%
  pivot_longer(cols = everything(),
               names_to = "domain",
               values_to = "score")
pairwise.wilcox.test(
  x = long_data$score,
  g = long_data$domain,
  p.adjust.method = "bonferroni"
)

# Overall SS-QOL Total Score

data_ssqol$ssqol_total <- rowMeans(
  data_ssqol[, grep("^total", names(data_ssqol))],
  na.rm = TRUE
)

# Spearman Correlation

 

# Select domain variables
domains <- data_ssqol[, grep("^total", names(data_ssqol))]

# Ensure numeric
domains <- as.data.frame(lapply(domains, as.numeric))

# Correlation matrix (Spearman)
cor_matrix <- cor(domains, method = "spearman", use = "pairwise.complete.obs")

# Print rounded matrix
round(cor_matrix, 2)

# ---- P-values function ----
cor_pmat <- function(mat) {
  n <- ncol(mat)
  p.mat <- matrix(NA, n, n)
  colnames(p.mat) <- colnames(mat)
  rownames(p.mat) <- colnames(mat)
  
  for (i in 1:(n-1)) {
    for (j in (i+1):n) {
      test <- cor.test(mat[, i], mat[, j], method = "spearman")
      p.mat[i, j] <- test$p.value
      p.mat[j, i] <- test$p.value
    }
  }
  diag(p.mat) <- 0
  return(p.mat)
}

p_matrix <- cor_pmat(domains)

# View p-values
p_matrix