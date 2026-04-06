# =============================================================================
# DESCRIPTIVE STATISTICS AND AXIOMS OF PROBABILITY EXERCISES
# =============================================================================
# Topics: Descriptive Statistics, Axioms of Probability, Combinatorics
# Difficulty: Simple -> Advanced
# =============================================================================

library(testthat)

# =============================================================================

# PROBLEM SET 1: DESCRIPTIVE STATISTICS (Simple)
# =============================================================================

# Exercise 1.1: Mean, Median, Mode
# Given data: 12, 15, 18, 20, 22, 25, 28, 30

data <- c(12, 15, 18, 20, 22, 25, 28, 30)

mean_data <- mean(data)
median_data <- median(data)
mode_data <- names(table(data))[table(data) == max(table(data))]

cat("Exercise 1.1 - Descriptive Statistics:\n")
cat("Data:", paste(data, collapse = ", "), "\n")
cat("Mean:", mean_data, "\n")
cat("Median:", median_data, "\n")
cat("Mode:", paste(mode_data, collapse = ", "), "\n\n")

# Exercise 1.2: Range, Variance, Standard Deviation
range_data <- max(data) - min(data)
var_data <- var(data)
sd_data <- sd(data)

cat("Exercise 1.2 - Spread Measures:\n")
cat("Range:", range_data, "\n")
cat("Variance:", round(var_data, 4), "\n")
cat("Standard Deviation:", round(sd_data, 4), "\n\n")

# Exercise 1.3: Interquartile Range (IQR)
Q1 <- quantile(data, 0.25)
Q3 <- quantile(data, 0.75)
IQR_val <- Q3 - Q1

cat("Exercise 1.3 - Interquartile Range:\n")
cat("Q1 (25th percentile):", Q1, "\n")
cat("Q3 (75th percentile):", Q3, "\n")
cat("IQR:", IQR_val, "\n\n")

# Exercise 1.4: Boxplot outliers
# Outliers are values < Q1 - 1.5*IQR or > Q3 + 1.5*IQR
lower_bound <- Q1 - 1.5 * IQR_val
upper_bound <- Q3 + 1.5 * IQR_val

cat("Exercise 1.4 - Outlier Detection:\n")
cat("Lower bound (Q1 - 1.5*IQR):", lower_bound, "\n")
cat("Upper bound (Q3 + 1.5*IQR):", upper_bound, "\n")
cat("Outliers:", paste(data[data < lower_bound | data > upper_bound], collapse = ", "), "\n\n")

# =============================================================================

# PROBLEM SET 2: AXIOMS OF PROBABILITY (Simple to Medium)
# =============================================================================

# Exercise 2.1: Basic probability axioms
# Axiom 1: P(A) >= 0 for any event A
# Axiom 2: P(S) = 1 where S is the sample space
# Axiom 3: For mutually exclusive events A1, A2, ..., P(union) = sum(P(Ai))

cat("Exercise 2.1 - Probability Axioms:\n")
cat("1. Non-negativity: P(A) >= 0\n")
cat("2. Unit measure: P(S) = 1\n")
cat("3. Countable additivity: P(union of disjoint events) = sum of probabilities\n\n")

# Exercise 2.2: Complement rule
# P(A^c) = 1 - P(A)

# If P(rain tomorrow) = 0.3, what is P(no rain tomorrow)?
p_rain <- 0.3
p_no_rain <- 1 - p_rain

cat("Exercise 2.2 - Complement Rule:\n")
cat("P(rain) = 0.3\n")
cat("P(no rain) =", p_no_rain, "\n\n")

# Exercise 2.3: Addition rule
# P(A U B) = P(A) + P(B) - P(A n B)

# If P(A) = 0.4, P(B) = 0.5, P(A n B) = 0.2
p_A <- 0.4
p_B <- 0.5
p_A_intersect_B <- 0.2
p_A_union_B <- p_A + p_B - p_A_intersect_B

cat("Exercise 2.3 - Addition Rule:\n")
cat("P(A) =", p_A, ", P(B) =", p_B, ", P(A n B) =", p_A_intersect_B, "\n")
cat("P(A U B) =", p_A_union_B, "\n\n")

# Exercise 2.4: Mutually exclusive events
# If A and B are mutually exclusive, P(A n B) = 0

# If P(A) = 0.3, P(B) = 0.4, and A and B are mutually exclusive
p_A_mut <- 0.3
p_B_mut <- 0.4
p_A_union_mut <- p_A_mut + p_B_mut

cat("Exercise 2.4 - Mutually Exclusive Events:\n")
cat("P(A) =", p_A_mut, ", P(B) =", p_B_mut, "(mutually exclusive)\n")
cat("P(A U B) =", p_A_union_mut, "\n\n")

# =============================================================================

# PROBLEM SET 3: COUNTING PRINCIPLES (Medium)
# =============================================================================

# Exercise 3.1: Permutations
# Number of ways to arrange n distinct objects: n!

# How many ways to arrange 5 books on a shelf?
num_books <- 5
permutations_books <- factorial(num_books)

cat("Exercise 3.1 - Permutations:\n")
cat("Number of ways to arrange", num_books, "books:", permutations_books, "\n\n")

# Exercise 3.2: Combinations
# Number of ways to choose k objects from n: C(n, k) = n! / (k!(n-k)!)

# How many ways to choose 3 people from 10?
n_choose <- 10
k_choose <- 3
combinations <- choose(n_choose, k_choose)

cat("Exercise 3.2 - Combinations:\n")
cat("Number of ways to choose", k_choose, "from", n_choose, ":", combinations, "\n\n")

# Exercise 3.3: Binomial coefficient
# (n choose k) = n! / (k!(n-k)!)

# Calculate (10 choose 3)
n_binom <- 10
k_binom <- 3
binom_coeff <- choose(n_binom, k_binom)

cat("Exercise 3.3 - Binomial Coefficient:\n")
cat("C(", n_binom, ",", k_binom, ") =", binom_coeff, "\n\n")

# Exercise 3.4: Multinomial coefficient
# Number of ways to divide n objects into groups of sizes n1, n2, ..., nk
# = n! / (n1! * n2! * ... * nk!)

# Divide 10 people into groups of 3, 3, and 4
n_total <- 10
n1 <- 3
n2 <- 3
n3 <- 4
multinom_coeff <- factorial(n_total) / (factorial(n1) * factorial(n2) * factorial(n3))

cat("Exercise 3.4 - Multinomial Coefficient:\n")
cat("Ways to divide 10 into groups of 3, 3, 4:", multinom_coeff, "\n\n")

# =============================================================================

# PROBLEM SET 4: PROBABILITY CALCULATIONS (Medium to Advanced)
# =============================================================================

# Exercise 4.1: Dice probability
# Roll two fair dice. What is P(sum = 7)?

# Total outcomes: 36
# Favorable: (1,6), (2,5), (3,4), (4,3), (5,2), (6,1) = 6
p_sum_7 <- 6 / 36

cat("Exercise 4.1 - Dice Probability:\n")
cat("P(sum of two dice = 7):", p_sum_7, "\n\n")

# Exercise 4.2: Card probability
# Draw 2 cards without replacement. What is P(both hearts)?

# 13 hearts in 52 cards
p_first_heart <- 13/52
p_second_heart_given_first <- 12/51
p_both_hearts <- p_first_heart * p_second_heart_given_first

cat("Exercise 4.2 - Card Probability:\n")
cat("P(both cards are hearts):", round(p_both_hearts, 6), "\n\n")

# Exercise 4.3: Birthday problem
# What is P(at least 2 share birthday) for n = 23 people?

birthday_prob <- function(n) {
  p_none <- prod((365:(365-n+1))/365)
  p_atleasttwo <- 1 - p_none
  return(p_atleasttwo)
}

p_birthday_23 <- birthday_prob(23)

cat("Exercise 4.3 - Birthday Problem:\n")
cat("P(at least 2 share birthday | n=23):", round(p_birthday_23, 6), "\n\n")

# Exercise 4.4: Law of total probability
# A factory has 3 machines. Machine 1 produces 50% of items with 1% defect rate.
# Machine 2 produces 30% with 2% defect rate. Machine 3 produces 20% with 5% defect rate.
# What is P(random item is defective)?

p_M1 <- 0.5; p_defect_M1 <- 0.01
p_M2 <- 0.3; p_defect_M2 <- 0.02
p_M3 <- 0.2; p_defect_M3 <- 0.05

p_defect_total <- p_M1 * p_defect_M1 + p_M2 * p_defect_M2 + p_M3 * p_defect_M3

cat("Exercise 4.4 - Law of Total Probability:\n")
cat("P(defective item):", round(p_defect_total, 6), "\n\n")

# Exercise 4.5: Bayes' Theorem
# A disease affects 1% of population. Test is 99% accurate.
# P(test positive | disease) = 0.99, P(test negative | no disease) = 0.99
# What is P(disease | test positive)?

p_disease <- 0.01
p_positive_given_disease <- 0.99
p_negative_given_no_disease <- 0.99
p_positive_given_no_disease <- 1 - p_negative_given_no_disease

# Bayes' Theorem: P(D|+) = P(+|D)P(D) / [P(+|D)P(D) + P(+|not D)P(not D)]
p_disease_given_positive <- (p_positive_given_disease * p_disease) /
                             (p_positive_given_disease * p_disease +
                              p_positive_given_no_disease * (1 - p_disease))

cat("Exercise 4.5 - Bayes' Theorem:\n")
cat("P(disease | test positive):", round(p_disease_given_positive, 6), "\n\n")

# =============================================================================

# PROBLEM SET 5: SIMULATION (Advanced)
# =============================================================================

# Exercise 5.1: Simulate dice rolls
set.seed(100)
n_sim <- 10000

dice1 <- sample(1:6, n_sim, replace = TRUE)
dice2 <- sample(1:6, n_sim, replace = TRUE)
sum_dice <- dice1 + dice2

p_sum_7_sim <- mean(sum_dice == 7)
p_sum_7_theoretical <- 6/36

cat("Exercise 5.1 - Simulate Dice Rolls:\n")
cat("Theoretical P(sum=7):", p_sum_7_theoretical, "\n")
cat("Simulated P(sum=7):", round(p_sum_7_sim, 6), "\n\n")

# Exercise 5.2: Simulate card draws
set.seed(200)
n_sim <- 10000

# Simulate drawing 2 cards without replacement
both_hearts_sim <- replicate(n_sim, {
  deck <- rep(1:4, each = 13)  # 1=hearts, 2=diamonds, 3=clubs, 4=spades
  hand <- sample(deck, 2, replace = FALSE)
  all(hand == 1)
})

p_both_hearts_sim <- mean(both_hearts_sim)

cat("Exercise 5.2 - Simulate Card Draws:\n")
cat("Theoretical P(both hearts):", round(p_both_hearts, 6), "\n")
cat("Simulated P(both hearts):", round(p_both_hearts_sim, 6), "\n\n")

# Exercise 5.3: Simulate birthday problem
birthday_sim <- function(n, n_sim = 10000) {
  count <- 0
  for (i in 1:n_sim) {
    birthdays <- sample(1:365, n, replace = TRUE)
    if (length(unique(birthdays)) < n) {
      count <- count + 1
    }
  }
  return(count / n_sim)
}

p_birthday_sim_23 <- birthday_sim(23, 5000)

cat("Exercise 5.3 - Simulate Birthday Problem:\n")
cat("Theoretical P(n=23):", round(p_birthday_23, 6), "\n")
cat("Simulated P(n=23):", round(p_birthday_sim_23, 6), "\n\n")

cat("=== All exercises completed ===\n")
