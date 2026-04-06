# =============================================================================
# CENTRAL LIMIT THEOREM EXERCISES
# =============================================================================
# Topics: CLT, Normal Approximation, Sampling Distributions
# Difficulty: Simple -> Advanced
# =============================================================================

library(testthat)

# =============================================================================

# PROBLEM SET 1: INTRODUCTION TO CLT (Simple)
# =============================================================================

# Exercise 1.1: CLT statement
cat("Exercise 1.1 - Central Limit Theorem:\n")
cat("(sum(X_i) - n*mu) / (sigma * sqrt(n)) -> N(0, 1)\n")
cat("(X_bar - mu) / (sigma / sqrt(n)) -> N(0, 1)\n\n")

# Exercise 1.2: Sample mean distribution
n_clt <- 100
p_clt <- 0.5
mu_clt <- p_clt
sigma_clt <- sqrt(p_clt * (1 - p_clt) / n_clt)

cat("Exercise 1.2 - Sample mean distribution:\n")
cat("X_bar ~ N(", mu_clt, ", ", round(sigma_clt^2, 6), ")\n\n")

# Exercise 1.3: Rules of thumb for CLT
cat("Exercise 1.3 - Rules of thumb:\n")
cat("Approximately normal    | n >= 5\n")
cat("Symmetric, light tails  | n >= 15\n")
cat("Moderately skewed       | n >= 30\n")
cat("Highly skewed           | n >= 50-100\n\n")

# Exercise 1.4: Standard error
cat("Exercise 1.4 - Standard error:\n")
cat("SE(X_bar) = sigma / sqrt(n)\n\n")

# =============================================================================

# PROBLEM SET 2: CLT WITH SPECIFIC DISTRIBUTIONS (Simple to Medium)
# =============================================================================

# Exercise 2.1: CLT with uniform distribution
set.seed(100)
n_unif <- 25
n_sim <- 10000

sim_sums <- replicate(n_sim, {
  sum(runif(n_unif))
})

sim_mean <- mean(sim_sums)
sim_var <- var(sim_sums)

theo_mean <- n_unif * 0.5
theo_var <- n_unif / 12

cat("Exercise 2.1 - Uniform(0,1):\n")
cat("Theoretical: mean =", theo_mean, ", var =", round(theo_var, 6), "\n")
cat("Simulated: mean =", round(sim_mean, 6), ", var =", round(sim_var, 6), "\n\n")

# Exercise 2.2: CLT with exponential distribution
set.seed(200)
n_exp <- 30
n_sim <- 10000

sim_means <- replicate(n_sim, {
  mean(rexp(n_exp))
})

sim_mean_exp <- mean(sim_means)
sim_var_exp <- var(sim_means)

cat("Exercise 2.2 - Exponential(1):\n")
cat("Theoretical: mean = 1, var =", round(1/n_exp, 6), "\n")
cat("Simulated: mean =", round(sim_mean_exp, 6), ", var =", round(sim_var_exp, 6), "\n\n")

# Exercise 2.3: Binomial normal approximation
n_binom <- 100
p_binom <- 0.3
mu_binom <- n_binom * p_binom
sigma_binom <- sqrt(n_binom * p_binom * (1 - p_binom))

p_25_35_norm <- pnorm(35.5, mu_binom, sigma_binom) - pnorm(24.5, mu_binom, sigma_binom)
p_25_35_exact <- pbinom(35, n_binom, p_binom) - pbinom(24, n_binom, p_binom)

cat("Exercise 2.3 - Binomial approximation:\n")
cat("Normal approx:", round(p_25_35_norm, 6), "\n")
cat("Exact binomial:", round(p_25_35_exact, 6), "\n\n")

# Exercise 2.4: Poisson normal approximation
lambda_pois <- 100
mu_pois <- lambda_pois
sigma_pois <- sqrt(lambda_pois)

p_pois_approx <- pnorm(110.5, mu_pois, sigma_pois) - pnorm(89.5, mu_pois, sigma_pois)
p_pois_exact <- ppois(110, lambda_pois) - ppois(89, lambda_pois)

cat("Exercise 2.4 - Poisson approximation:\n")
cat("Normal approx:", round(p_pois_approx, 6), "\n")
cat("Exact Poisson:", round(p_pois_exact, 6), "\n\n")

# =============================================================================

# PROBLEM SET 3: CONFIDENCE INTERVALS (Medium)
# =============================================================================

# Exercise 3.1: Confidence interval
n_ci <- 100
x_bar <- 50
sigma_ci <- 10
margin <- 1.96 * sigma_ci / sqrt(n_ci)
ci_lower <- x_bar - margin
ci_upper <- x_bar + margin

cat("Exercise 3.1 - Confidence interval:\n")
cat("95% CI: [", round(ci_lower, 2), ", ", round(ci_upper, 2), "]\n\n")

# Exercise 3.2: Hypothesis test
n_test <- 50
x_bar_test <- 102
sigma_test <- 15
mu0 <- 100
z_stat <- (x_bar_test - mu0) / (sigma_test / sqrt(n_test))
p_value <- 2 * (1 - pnorm(abs(z_stat)))

cat("Exercise 3.2 - Hypothesis test:\n")
cat("Z =", round(z_stat, 4), "\n")
cat("p-value =", round(p_value, 6), "\n")
cat("Reject H0 at alpha=0.05?", ifelse(p_value < 0.05, "Yes", "No"), "\n\n")

# Exercise 3.3: Sample size calculation
sigma_n <- 10
E <- 2
z_95 <- 1.96
n_required <- ceiling((z_95 * sigma_n / E)^2)

cat("Exercise 3.3 - Sample size calculation:\n")
cat("n =", n_required, "\n\n")

# =============================================================================

# PROBLEM SET 4: CONTINUITY CORRECTION (Medium)
# =============================================================================

# Exercise 4.1: Binomial with continuity correction
n_cc <- 50
p_cc <- 0.4
mu_cc <- n_cc * p_cc
sigma_cc <- sqrt(n_cc * p_cc * (1 - p_cc))

p_no_cc <- pnorm(22, mu_cc, sigma_cc) - pnorm(18, mu_cc, sigma_cc)
p_with_cc <- pnorm(22.5, mu_cc, sigma_cc) - pnorm(17.5, mu_cc, sigma_cc)
p_exact <- pbinom(22, n_cc, p_cc) - pbinom(17, n_cc, p_cc)

cat("Exercise 4.1 - Binomial continuity correction:\n")
cat("Without correction:", round(p_no_cc, 6), "\n")
cat("With correction:", round(p_with_cc, 6), "\n")
cat("Exact:", round(p_exact, 6), "\n\n")

# Exercise 4.2: Poisson with continuity correction
lambda_cc <- 25
mu_pois_cc <- lambda_cc
sigma_pois_cc <- sqrt(lambda_cc)

p_pois_no_cc <- pnorm(30, mu_pois_cc, sigma_pois_cc) - pnorm(20, mu_pois_cc, sigma_pois_cc)
p_pois_with_cc <- pnorm(30.5, mu_pois_cc, sigma_pois_cc) - pnorm(19.5, mu_pois_cc, sigma_pois_cc)
p_pois_exact <- ppois(30, lambda_cc) - ppois(19, lambda_cc)

cat("Exercise 4.2 - Poisson continuity correction:\n")
cat("Without correction:", round(p_pois_no_cc, 6), "\n")
cat("With correction:", round(p_pois_with_cc, 6), "\n")
cat("Exact:", round(p_pois_exact, 6), "\n\n")

# =============================================================================

# PROBLEM SET 5: SIMULATION (Advanced)
# =============================================================================

# Exercise 5.1: CLT convergence simulation
set.seed(500)
n_sim <- 10000
lambda_sim <- 2

cat("Exercise 5.1 - CLT convergence:\n")
cat("X_i ~ Exponential(lambda =", lambda_sim, ")\n\n")

for (n in c(1, 5, 10, 30)) {
  sim_means <- replicate(n_sim, mean(rexp(n, lambda_sim)))
  sim_mean <- mean(sim_means)
  sim_var <- var(sim_means)

  cat("n =", n, ":\n")
  cat("  Mean:", round(sim_mean, 6), "(theoretical:", 1/lambda_sim, ")\n")
  cat("  Var:", round(sim_var, 6), "(theoretical:", round(1/(n * lambda_sim^2), 6), ")\n\n")
}

# Exercise 5.2: Skewness reduction
set.seed(600)
n_sim <- 10000

cat("Exercise 5.2 - Skewness reduction:\n")
cat("Skewness of Exponential(1) = 2\n\n")

for (n in c(1, 5, 10, 30)) {
  sim_means <- replicate(n_sim, mean(rexp(n)))
  sim_skew <- mean((sim_means - mean(sim_means))^3) / (var(sim_means)^(3/2))

  cat("n =", n, ":\n")
  cat("  Skewness:", round(sim_skew, 6), "\n")
}
cat("Skewness decreases as n increases, approaching 0\n\n")

# Exercise 5.3: Monte Carlo integration
set.seed(700)
n_sim <- 10000

estimates <- replicate(100, {
  x <- runif(n_sim)
  mean(x^2)
})

mean_estimate <- mean(estimates)
se_estimate <- sd(estimates) / sqrt(100)

cat("Exercise 5.3 - Monte Carlo integration:\n")
cat("Integral of x^2 from 0 to 1:\n")
cat("True value:", round(1/3, 6), "\n")
cat("Monte Carlo estimate:", round(mean_estimate, 6), "\n\n")

# =============================================================================

# PROBLEM SET 6: APPLICATIONS (Advanced)
# =============================================================================

# Exercise 6.1: Multivariate CLT
cat("Exercise 6.1 - Multivariate CLT:\n")
cat("sqrt(n)(X_bar - mu) -> N(0, Sigma)\n\n")

# Exercise 6.2: Delta method
cat("Exercise 6.2 - Delta method:\n")
cat("sqrt(n)(g(X_bar) - g(mu)) -> N(0, g'(mu)^2 * sigma^2)\n\n")

# Exercise 6.3: Stable distributions
cat("Exercise 6.3 - Stable distributions:\n")
cat("Some distributions (e.g., Cauchy) have non-normal limits\n\n")

cat("=== All exercises completed ===\n")
