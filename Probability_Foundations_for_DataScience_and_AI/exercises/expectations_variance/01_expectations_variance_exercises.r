# =============================================================================
# EXPECTATIONS AND VARIANCE EXERCISES
# =============================================================================
# Topics: Linearity of Expectation, Variance Properties, Conditional Expectation
# Difficulty: Simple -> Advanced
# =============================================================================

library(testthat)

# =============================================================================

# PROBLEM SET 1: LINEARITY OF EXPECTATION (Simple)
# =============================================================================

# Exercise 1.1: Linear transformation
expected_x <- 5
expected_transform <- 2 * expected_x + 5

cat("Exercise 1.1 - Linear transformation:\n")
cat("E[2X + 5] =", expected_transform, "\n\n")

# Exercise 1.2: Sum of dice rolls
expected_die <- 3.5
expected_sum <- 2 * expected_die

cat("Exercise 1.2 - Sum of dice:\n")
cat("E[sum] =", expected_sum, "\n\n")

# Exercise 1.3: Indicator variables
n_flips <- 10
p_head <- 0.5
expected_heads <- n_flips * p_head

cat("Exercise 1.3 - Indicator variables:\n")
cat("E[number of heads] =", expected_heads, "\n\n")

# Exercise 1.4: Expected value of product (independent)
expected_x <- 1
expected_y <- 1.5
expected_product <- expected_x * expected_y

cat("Exercise 1.4 - Independent product:\n")
cat("E[XY] =", expected_product, "\n\n")

# Exercise 1.5: Expected value of product (dependent)
expected_x_dep <- 0.5
expected_xy_dep <- 1/4

cat("Exercise 1.5 - Dependent product:\n")
cat("E[XY] =", expected_xy_dep, "!= E[X]E[Y] =", expected_x_dep * (1/3), "\n\n")

# =============================================================================

# PROBLEM SET 2: VARIANCE PROPERTIES (Simple to Medium)
# =============================================================================

# Exercise 2.1: Variance of linear transformation
var_x <- 4
var_transform <- 3^2 * var_x

cat("Exercise 2.1 - Variance of linear transformation:\n")
cat("Var(3X - 2) =", var_transform, "\n\n")

# Exercise 2.2: Variance of sum (independent)
var_x <- 9
var_y <- 4
var_sum_indep <- var_x + var_y

cat("Exercise 2.2 - Variance of sum (independent):\n")
cat("Var(X + Y) =", var_sum_indep, "\n\n")

# Exercise 2.3: Variance of sum (dependent)
var_x <- 9
var_y <- 4
cov_xy <- 3
var_sum_dep <- var_x + var_y + 2 * cov_xy

cat("Exercise 2.3 - Variance of sum (dependent):\n")
cat("Var(X + Y) =", var_sum_dep, "\n\n")

# Exercise 2.4: Standard deviation of linear transformation
sd_x <- 5
sd_transform <- abs(-2) * sd_x

cat("Exercise 2.4 - Standard deviation:\n")
cat("SD(-2X + 7) =", sd_transform, "\n\n")

# =============================================================================

# PROBLEM SET 3: COMPUTING FROM PMF/PDF (Medium)
# =============================================================================

# Exercise 3.1: Discrete expectation
x_vals <- c(1, 2, 3)
p_vals <- c(0.2, 0.3, 0.5)
expected_discrete <- sum(x_vals * p_vals)

cat("Exercise 3.1 - Discrete expectation:\n")
cat("E[X] =", expected_discrete, "\n\n")

# Exercise 3.2: Discrete variance
expected_x2 <- sum(x_vals^2 * p_vals)
var_discrete <- expected_x2 - expected_discrete^2

cat("Exercise 3.2 - Discrete variance:\n")
cat("Var(X) =", var_discrete, "\n\n")

# Exercise 3.3: Continuous expectation (Exponential)
lambda_exp <- 2
expected_exp <- 1 / lambda_exp

cat("Exercise 3.3 - Exponential expectation:\n")
cat("E[X] =", expected_exp, "\n\n")

# Exercise 3.4: Continuous variance (Normal)
sigma_norm <- 2
var_norm <- sigma_norm^2

cat("Exercise 3.4 - Normal variance:\n")
cat("Var(X) =", var_norm, "\n\n")

# Exercise 3.5: Function of a random variable
expected_x2_uniform <- 1/3

cat("Exercise 3.5 - Function of random variable:\n")
cat("X ~ Uniform(0,1), Y = X^2, E[Y] =", expected_x2_uniform, "\n\n")

# =============================================================================

# PROBLEM SET 4: CONDITIONAL EXPECTATION (Medium to Advanced)
# =============================================================================

# Exercise 4.1: Law of total expectation
cat("Exercise 4.1 - Law of total expectation:\n")
cat("E[X] = E[E[X|Y]]\n\n")

# Exercise 4.2: Conditional expectation example
expected_even <- (2 + 4 + 6) / 3

cat("Exercise 4.2 - Conditional expectation:\n")
cat("E[X|Y=1] =", expected_even, "\n\n")

# Exercise 4.3: Conditional variance
cat("Exercise 4.3 - Law of total variance:\n")
cat("Var(X) = E[Var(X|Y)] + Var(E[X|Y])\n\n")

# =============================================================================

# PROBLEM SET 5: APPLICATIONS (Advanced)
# =============================================================================

# Exercise 5.1: Variance of sample mean
cat("Exercise 5.1 - Variance of sample mean:\n")
cat("Var(X_bar) = sigma^2 / n\n\n")

# Exercise 5.2: Fixed points in permutation
cat("Exercise 5.2 - Fixed points in permutation:\n")
cat("E[X] = 1 for any n >= 1\n\n")

# Exercise 5.3: Coupon collector problem
cat("Exercise 5.3 - Coupon collector:\n")
cat("E[X] = n * H_n\n")
cat("For n = 10: E[X] =", round(10 * sum(1/1:10), 2), "\n\n")

# Exercise 5.4: Geometric distribution
p_geo <- 0.2
expected_geo <- 1 / p_geo

cat("Exercise 5.4 - Geometric distribution:\n")
cat("E[X] =", expected_geo, "\n\n")

# Exercise 5.5: Variance of geometric
var_geo <- (1 - p_geo) / p_geo^2

cat("Exercise 5.5 - Geometric variance:\n")
cat("Var(X) =", var_geo, "\n\n")

# =============================================================================

# PROBLEM SET 6: SIMULATION (Advanced)
# =============================================================================

# Exercise 6.1: Simulate linearity of expectation
set.seed(100)
n_sim <- 10000
x_sim <- runif(n_sim, 0, 10)
y_sim <- 3 * x_sim + 7

sim_mean_y <- mean(y_sim)
theoretical_mean_y <- 3 * 5 + 7

cat("Exercise 6.1 - Simulate linearity:\n")
cat("Theoretical E[Y] =", theoretical_mean_y, "\n")
cat("Simulated E[Y] =", round(sim_mean_y, 6), "\n\n")

# Exercise 6.2: Simulate variance of sum
set.seed(200)
n_sim <- 10000
x1_sim <- rnorm(n_sim, 0, 2)
x2_sim <- rnorm(n_sim, 0, 3)
sum_sim <- x1_sim + x2_sim

sim_var_sum <- var(sum_sim)
theoretical_var_sum <- 4 + 9

cat("Exercise 6.2 - Simulate variance of sum:\n")
cat("Theoretical Var(X1+X2) =", theoretical_var_sum, "\n")
cat("Simulated Var(X1+X2) =", round(sim_var_sum, 6), "\n\n")

# Exercise 6.3: Simulate law of total expectation
set.seed(300)
n_sim <- 10000
y_sim <- rexp(n_sim, 1)
x_sim <- rpois(n_sim, y_sim)

sim_mean_x <- mean(x_sim)
theoretical_mean_x <- 1

cat("Exercise 6.3 - Simulate law of total expectation:\n")
cat("Theoretical E[X] =", theoretical_mean_x, "\n")
cat("Simulated E[X] =", round(sim_mean_x, 6), "\n\n")

# Exercise 6.4: Simulate variance decomposition
set.seed(400)
n_sim <- 10000
y_sim <- runif(n_sim, 0, 2)
x_sim <- rnorm(n_sim, y_sim, 1)

total_var_sim <- var(x_sim)

cat("Exercise 6.4 - Simulate variance decomposition:\n")
cat("Total Var(X):", round(total_var_sim, 6), "\n")
cat("Expected ~ 4/3 = 1.333\n\n")

# Exercise 6.5: Expected maximum of uniforms
set.seed(500)
n <- 3
n_sim <- 10000

max_sim <- replicate(n_sim, {
  max(runif(n))
})

sim_mean_max <- mean(max_sim)
theoretical_mean_max <- n / (n + 1)

cat("Exercise 6.5 - Expected maximum:\n")
cat("Theoretical E[max] =", theoretical_mean_max, "\n")
cat("Simulated E[max] =", round(sim_mean_max, 6), "\n\n")

cat("=== All exercises completed ===\n")
