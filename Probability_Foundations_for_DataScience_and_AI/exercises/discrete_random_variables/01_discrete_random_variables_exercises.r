# =============================================================================
# DISCRETE RANDOM VARIABLES EXERCISES
# =============================================================================
# Topics: Bernoulli, Binomial, Geometric, Negative Binomial, Poisson
# Difficulty: Simple -> Advanced
# =============================================================================

library(testthat)

# =============================================================================

# PROBLEM SET 1: BERNOULLI RANDOM VARIABLES (Simple)
# =============================================================================

# A fair coin is flipped once. Let X = 1 if heads, X = 0 if tails.
# This is a Bernoulli random variable with p = 0.5

set.seed(100)

# Exercise 1.1: Simulate 1000 Bernoulli trials (fair coin flips)
n_sim <- 1000
coin_flips <- sample(c(0, 1), n_sim, replace = TRUE, prob = c(0.5, 0.5))

# What is the expected value of X? E(X) = p = 0.5
# What is the variance of X? Var(X) = p(1-p) = 0.25

sim_mean <- mean(coin_flips)
sim_var <- var(coin_flips)

cat("Exercise 1.1:\n")
cat("Simulated mean:", round(sim_mean, 4), "(theoretical: 0.5)\n")
cat("Simulated variance:", round(sim_var, 4), "(theoretical: 0.25)\n\n")

# Exercise 1.2: Biased coin with P(heads) = 0.7
biased_flips <- sample(c(0, 1), n_sim, replace = TRUE, prob = c(0.3, 0.7))
biased_mean <- mean(biased_flips)

cat("Exercise 1.2:\n")
cat("Biased coin mean:", round(biased_mean, 4), "(theoretical: 0.7)\n\n")

# Exercise 1.3: Product quality control
defect_prob <- 0.05
n_inspected <- 500
defectives <- sample(c(0, 1), n_inspected, replace = TRUE, prob = c(0.95, 0.05))

expected_defectives <- n_inspected * defect_prob
actual_defectives <- sum(defectives)

cat("Exercise 1.3:\n")
cat("Expected defective bulbs:", expected_defectives, "\n")
cat("Actual defective bulbs in simulation:", actual_defectives, "\n\n")

# =============================================================================

# PROBLEM SET 2: BINOMIAL RANDOM VARIABLES (Simple to Medium)
# =============================================================================

# Exercise 2.1: Rolling a fair die 10 times
n_rolls <- 10
p_six <- 1/6
target_successes <- 3

theoretical_prob <- dbinom(target_successes, n_rolls, p_six)

set.seed(200)
n_sim <- 10000
six_counts <- replicate(n_sim, {
  sum(sample(1:6, n_rolls, replace = TRUE) == 6)
})
simulated_prob <- mean(six_counts == 3)

cat("Exercise 2.1 - Rolling a 6 exactly 3 times in 10 rolls:\n")
cat("Theoretical P(X=3):", round(theoretical_prob, 6), "\n")
cat("Simulated probability:", round(simulated_prob, 6), "\n\n")

# Exercise 2.2: Multiple choice test
n_questions <- 20
p_correct <- 0.25

expected_correct <- n_questions * p_correct
p_exactly_5 <- dbinom(5, n_questions, p_correct)
p_at_least_5 <- 1 - pbinom(4, n_questions, p_correct)

cat("Exercise 2.2 - Multiple choice test:\n")
cat("Expected correct answers:", expected_correct, "\n")
cat("P(exactly 5 correct):", round(p_exactly_5, 6), "\n")
cat("P(5 or more correct):", round(p_at_least_5, 6), "\n\n")

# Exercise 2.3: Airline overbooking
n_tickets <- 55
p_showup <- 0.95
seats <- 50

p_overbooked <- 1 - pbinom(seats, n_tickets, p_showup)

cat("Exercise 2.3 - Airline overbooking:\n")
cat("P(overbooking occurs):", round(p_overbooked, 6), "\n\n")

# =============================================================================

# PROBLEM SET 3: GEOMETRIC RANDOM VARIABLES (Medium)
# =============================================================================

# Exercise 3.1: First defective on 5th inspection
p_defect <- 0.05
trial_number <- 5

p_first_defect_5 <- (1 - p_defect)^(trial_number - 1) * p_defect

cat("Exercise 3.1 - First defective on 5th inspection:\n")
cat("P(X=5):", round(p_first_defect_5, 6), "\n\n")

# Exercise 3.2: Expected number of trials
p_success <- 0.2
expected_trials <- 1 / p_success

cat("Exercise 3.2 - Expected trials until first success:\n")
cat("p =", p_success, ", E(X) = 1/p =", expected_trials, "\n\n")

# Exercise 3.3: Memoryless property verification
set.seed(300)
p_geo <- 0.3
m <- 5
n <- 3
n_sim <- 100000

geometric_samples <- replicate(n_sim, {
  count <- 0
  repeat {
    count <- count + 1
    if (runif(1) < p_geo) break
  }
  count
})

conditional_prob <- mean(geometric_samples > m + n) / mean(geometric_samples > m)
theoretical_conditional <- (1 - p_geo)^n

cat("Exercise 3.3 - Memoryless property:\n")
cat("Simulated P(X > 8 | X > 5):", round(conditional_prob, 6), "\n")
cat("Theoretical P(X > 3):", round(theoretical_conditional, 6), "\n\n")

# =============================================================================

# PROBLEM SET 4: NEGATIVE BINOMIAL RANDOM VARIABLES (Advanced)
# =============================================================================

# Exercise 4.1: 3rd defective on 10th inspection
p_defect <- 0.05
r_successes <- 3
trial_number <- 10

p_3rd_defect_10 <- choose(trial_number - 1, r_successes - 1) *
                   p_defect^r_successes * (1 - p_defect)^(trial_number - r_successes)

cat("Exercise 4.1 - 3rd defective on 10th inspection:\n")
cat("P(X=10):", round(p_3rd_defect_10, 6), "\n\n")

# Exercise 4.2: Basketball free throws
p_make <- 0.70
r_makes <- 5
trial_number <- 7

p_5th_make_7 <- choose(trial_number - 1, r_makes - 1) *
                p_make^r_makes * (1 - p_make)^(trial_number - r_makes)

cat("Exercise 4.2 - 5th make on 7th free throw:\n")
cat("P(X=7):", round(p_5th_make_7, 6), "\n\n")

# Exercise 4.3: Expected trials for r successes
r <- 4
p <- 0.25
expected_trials_r <- r / p

cat("Exercise 4.3 - Expected trials for 4 successes:\n")
cat("E(X) = r/p =", expected_trials_r, "\n\n")

# =============================================================================

# PROBLEM SET 5: POISSON RANDOM VARIABLES (Advanced)
# =============================================================================

# Exercise 5.1: Help desk calls
lambda <- 3
k_calls <- 5

p_exact_5 <- dpois(k_calls, lambda)

cat("Exercise 5.1 - Help desk calls (lambda=3):\n")
cat("P(X=5):", round(p_exact_5, 6), "\n\n")

# Exercise 5.2: Typographical errors
lambda_50_pages <- 5

p_no_errors <- dpois(0, lambda_50_pages)
p_3_or_more <- 1 - ppois(2, lambda_50_pages)

cat("Exercise 5.2 - Typographical errors in 50 pages:\n")
cat("P(no errors):", round(p_no_errors, 6), "\n")
cat("P(3 or more errors):", round(p_3_or_more, 6), "\n\n")

# Exercise 5.3: Poisson approximation to binomial
n <- 100
p <- 0.02
lambda_approx <- n * p

p_bin_0 <- dbinom(0, n, p)
p_pois_0 <- dpois(0, lambda_approx)

cat("Exercise 5.3 - Poisson approximation (n=100, p=0.02):\n")
cat("Binomial P(X=0):", round(p_bin_0, 6), "\n")
cat("Poisson P(X=0):", round(p_pois_0, 6), "\n\n")

# =============================================================================

# PROBLEM SET 6: COMBINED CHALLENGES (Advanced)
# =============================================================================

# Exercise 6.1: Mixed distributions
set.seed(400)
n_sim <- 100000

sim_results <- replicate(n_sim, {
  roll <- sample(1:6, 1)

  if (roll <= 3) {
    sample(c(0, 1), 1, prob = c(0.7, 0.3))
  } else if (roll <= 5) {
    sum(sample(c(0, 1), 5, replace = TRUE, prob = c(0.6, 0.4)))
  } else {
    rpois(1, 2)
  }
})

p_x_0_sim <- mean(sim_results == 0)
theoretical_p_x_0 <- (3/6) * 0.7 + (2/6) * (0.6)^5 + (1/6) * exp(-2)

cat("Exercise 6.1 - Mixed distribution:\n")
cat("Simulated P(X=0):", round(p_x_0_sim, 6), "\n")
cat("Theoretical P(X=0):", round(theoretical_p_x_0, 6), "\n\n")

# Exercise 6.2: Expected value of linear combination
# E[2X + 3Y - 5] = 2*E[X] + 3*E[Y] - 5
expected_2x_3y_minus_5 <- 2 * 10 * 0.3 + 3 * 5 - 5

cat("Exercise 6.2 - Expected value:\n")
cat("E[2X + 3Y - 5] =", expected_2x_3y_minus_5, "\n\n")

# Exercise 6.3: Variance of linear combination
var_x <- 10 * 0.3 * 0.7
var_y <- 5
var_2x_minus_y <- 4 * var_x + var_y

cat("Exercise 6.3 - Variance:\n")
cat("Var(2X - Y + 7) =", var_2x_minus_y, "\n\n")

cat("=== All exercises completed ===\n")
