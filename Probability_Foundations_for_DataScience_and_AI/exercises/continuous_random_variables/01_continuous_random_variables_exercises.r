# =============================================================================
# CONTINUOUS RANDOM VARIABLES EXERCISES
# =============================================================================
# Topics: Uniform, Exponential, Normal, Gamma, Chi-Square
# Difficulty: Simple -> Advanced
# =============================================================================

library(testthat)

# =============================================================================

# PROBLEM SET 1: UNIFORM RANDOM VARIABLES (Simple)
# =============================================================================

# Exercise 1.1: Uniform(0, 1) probability
a <- 0
b <- 1
lower <- 0.2
upper <- 0.7

p_uniform_1 <- (upper - lower) / (b - a)

set.seed(100)
n_sim <- 10000
uniform_samples <- runif(n_sim, a, b)
p_uniform_1_sim <- mean(uniform_samples > lower & uniform_samples < upper)

cat("Exercise 1.1 - Uniform(0,1):\n")
cat("P(0.2 < X < 0.7):", round(p_uniform_1, 6), "\n")
cat("Simulated:", round(p_uniform_1_sim, 6), "\n\n")

# Exercise 1.2: Meeting problem
set.seed(200)
n_sim <- 100000
x_arrival <- runif(n_sim, 0, 60)
y_arrival <- runif(n_sim, 0, 60)
p_meet_sim <- mean(abs(x_arrival - y_arrival) <= 15)

p_meet <- 1 - ((60 - 15) / 60)^2

cat("Exercise 1.2 - Meeting problem (15 min wait):\n")
cat("Analytical P(meet):", round(p_meet, 6), "\n")
cat("Simulated:", round(p_meet_sim, 6), "\n\n")

# Exercise 1.3: Bus arrival (Uniform(0,10))
a_bus <- 0
b_bus <- 10

p_wait_7_plus <- (b_bus - 7) / (b_bus - a_bus)
p_wait_2_5 <- (5 - 2) / (b_bus - a_bus)

cat("Exercise 1.3 - Bus arrival:\n")
cat("P(wait > 7 min):", round(p_wait_7_plus, 6), "\n")
cat("P(2 < wait < 5):", round(p_wait_2_5, 6), "\n\n")

# =============================================================================

# PROBLEM SET 2: EXPONENTIAL RANDOM VARIABLES (Simple to Medium)
# =============================================================================

# Exercise 2.1: Light bulb lifetime
lambda_light <- 0.01

p_more_100 <- 1 - pexp(100, lambda_light)
p_between_50_150 <- pexp(150, lambda_light) - pexp(50, lambda_light)

cat("Exercise 2.1 - Light bulb (lambda=0.01):\n")
cat("P(life > 100):", round(p_more_100, 6), "\n")
cat("P(50 < life < 150):", round(p_between_50_150, 6), "\n\n")

# Exercise 2.2: Memoryless property
lambda_call <- 0.5
s <- 2
t <- 3

p_more_5_given_2 <- 1 - pexp(t, lambda_call)

cat("Exercise 2.2 - Memoryless property:\n")
cat("P(call > 5 min | already lasted 2 min):", round(p_more_5_given_2, 6), "\n\n")

# Exercise 2.3: Server failure (mean=1000 hrs)
lambda_server <- 1 / 1000

median_lifetime <- log(2) / lambda_server
p_fail_year <- pexp(8760, lambda_server)

cat("Exercise 2.3 - Server failure:\n")
cat("Median lifetime:", round(median_lifetime, 2), "hours\n")
cat("P(fail within 1 year):", round(p_fail_year, 6), "\n\n")

# =============================================================================

# PROBLEM SET 3: NORMAL RANDOM VARIABLES (Simple to Medium)
# =============================================================================

# Exercise 3.1: Standard normal probabilities
p_z_less_196 <- pnorm(1.96)
p_z_more_1645 <- 1 - pnorm(1.645)
p_z_between <- pnorm(1.96) - pnorm(-1.96)

cat("Exercise 3.1 - Standard normal:\n")
cat("P(Z < 1.96):", round(p_z_less_196, 6), "\n")
cat("P(Z > 1.645):", round(p_z_more_1645, 6), "\n")
cat("P(-1.96 < Z < 1.96):", round(p_z_between, 6), "\n\n")

# Exercise 3.2: Exam scores (mu=75, sigma=10)
muExam <- 75
sigmaExam <- 10

p_score_85_plus <- 1 - pnorm(85, muExam, sigmaExam)
p_score_65_85 <- pnorm(85, muExam, sigmaExam) - pnorm(65, muExam, sigmaExam)
top_10_cutoff <- qnorm(0.9, muExam, sigmaExam)

cat("Exercise 3.2 - Exam scores:\n")
cat("P(score > 85):", round(p_score_85_plus, 6), "\n")
cat("P(65 < score < 85):", round(p_score_65_85, 6), "\n")
cat("Top 10% cutoff:", round(top_10_cutoff, 2), "\n\n")

# Exercise 3.3: Manufacturing tolerance (mu=10, sigma=0.2)
mu_length <- 10
sigma_length <- 0.2

p_acceptable <- pnorm(10.5, mu_length, sigma_length) - pnorm(9.5, mu_length, sigma_length)

cat("Exercise 3.3 - Manufacturing tolerance:\n")
cat("P(acceptable):", round(p_acceptable, 6), "\n\n")

# =============================================================================

# PROBLEM SET 4: GAMMA AND CHI-SQUARE (Advanced)
# =============================================================================

# Exercise 4.1: Gamma/Erlang distribution
alpha_event <- 3
beta_rate <- 2

p_gamma_2 <- pgamma(2, shape = alpha_event, rate = beta_rate)

cat("Exercise 4.1 - Erlang distribution:\n")
cat("P(X < 2 hours):", round(p_gamma_2, 6), "\n\n")

# Exercise 4.2: Chi-square distribution
chi_5_less <- pchisq(9.236, df = 5)
chi_5_more <- 1 - pchisq(11.070, df = 5)

cat("Exercise 4.2 - Chi-square(5):\n")
cat("P(X < 9.236):", round(chi_5_less, 6), "(~0.95)\n")
cat("P(X > 11.070):", round(chi_5_more, 6), "(~0.05)\n\n")

# Exercise 4.3: Sum of exponentials
lambda_sum <- 1
alpha_sum <- 3

p_sum_4 <- pgamma(4, shape = alpha_sum, rate = lambda_sum)

cat("Exercise 4.3 - Sum of 3 Exponential(1):\n")
cat("P(S < 4):", round(p_sum_4, 6), "\n\n")

# =============================================================================

# PROBLEM SET 5: NORMAL APPROXIMATIONS (Advanced)
# =============================================================================

# Exercise 5.1: Binomial normal approximation
n_binom <- 100
p_binom <- 0.3

mu_binom <- n_binom * p_binom
sigma_binom <- sqrt(n_binom * p_binom * (1 - p_binom))

p_approx_with_cc <- pnorm(35.5, mu_binom, sigma_binom) - pnorm(24.5, mu_binom, sigma_binom)
p_exact <- pbinom(35, n_binom, p_binom) - pbinom(24, n_binom, p_binom)

cat("Exercise 5.1 - Binomial normal approximation:\n")
cat("Exact P(25 <= X <= 35):", round(p_exact, 6), "\n")
cat("Normal approx (with cc):", round(p_approx_with_cc, 6), "\n\n")

# Exercise 5.2: Poisson normal approximation
lambda_pois <- 100
sigma_pois <- sqrt(lambda_pois)

p_pois_approx <- pnorm(110.5, lambda_pois, sigma_pois) - pnorm(89.5, lambda_pois, sigma_pois)
p_pois_exact <- ppois(110, lambda_pois) - ppois(89, lambda_pois)

cat("Exercise 5.2 - Poisson normal approximation:\n")
cat("Exact P(90 <= X <= 110):", round(p_pois_exact, 6), "\n")
cat("Normal approx:", round(p_pois_approx, 6), "\n\n")

# =============================================================================

# PROBLEM SET 6: TRANSFORMATIONS (Advanced)
# =============================================================================

# Exercise 6.1: Y = -ln(X) where X ~ Uniform(0,1)
set.seed(400)
n_sim <- 10000
x_unif <- runif(n_sim)
y_transform <- -log(x_unif)

sim_mean_y <- mean(y_transform)
sim_var_y <- var(y_transform)

cat("Exercise 6.1 - Y = -ln(X):\n")
cat("E[Y]:", round(sim_mean_y, 6), "(theoretical: 1)\n")
cat("Var[Y]:", round(sim_var_y, 6), "(theoretical: 1)\n\n")

# Exercise 6.2: Ratio of normals (Cauchy)
set.seed(500)
n_sim <- 10000
x_norm <- rnorm(n_sim)
y_norm <- rnorm(n_sim)
z_ratio <- x_norm / y_norm

p_ratio_sim <- mean(abs(z_ratio) < 1)

cat("Exercise 6.2 - Ratio of normals (Cauchy):\n")
cat("P(-1 < Z < 1):", round(p_ratio_sim, 6), "(theoretical: 0.5)\n\n")

# Exercise 6.3: Sum of independent normals
set.seed(600)
n_sim <- 10000
x_sum <- rnorm(n_sim, 5, 2)
y_sum <- rnorm(n_sim, 3, 3)
z_sum <- x_sum + y_sum

sim_mean_z <- mean(z_sum)
sim_var_z <- var(z_sum)

cat("Exercise 6.3 - Sum of normals:\n")
cat("Z ~ Normal(8, 13)\n")
cat("Simulated E[Z]:", round(sim_mean_z, 6), "(theoretical: 8)\n")
cat("Simulated Var[Z]:", round(sim_var_z, 6), "(theoretical: 13)\n\n")

# Exercise 6.4: Sample mean distribution
n_mean <- 25
mu_mean <- 100
sigma_mean <- 5
sigma_xbar <- sigma_mean / sqrt(n_mean)

p_xbar_98_102 <- pnorm(102, mu_mean, sigma_xbar) - pnorm(98, mu_mean, sigma_xbar)

cat("Exercise 6.4 - Sample mean distribution:\n")
cat("X_bar ~ Normal(100, 1)\n")
cat("P(98 < X_bar < 102):", round(p_xbar_98_102, 6), "\n\n")

# Exercise 6.5: Chi-square as sum of squares
set.seed(700)
n_sim <- 10000
chi_sim <- replicate(n_sim, {
  sum(rnorm(5)^2)
})

sim_mean_chi <- mean(chi_sim)
sim_var_chi <- var(chi_sim)

cat("Exercise 6.5 - Chi-square(5) as sum of squares:\n")
cat("Simulated mean:", round(sim_mean_chi, 6), "(theoretical: 5)\n")
cat("Simulated variance:", round(sim_var_chi, 6), "(theoretical: 10)\n\n")

cat("=== All exercises completed ===\n")
