# =============================================================================
# JOINT DISTRIBUTIONS AND COVARIANCE EXERCISES
# =============================================================================
# Topics: Joint PMF/PDF, Marginal Distributions, Conditional Distributions
#         Covariance, Independence
# Difficulty: Simple -> Advanced
# =============================================================================

library(testthat)

# =============================================================================

# PROBLEM SET 1: DISCRETE JOINT DISTRIBUTIONS (Simple)
# =============================================================================

# Exercise 1.1: Two dice rolls
p_x2_y3 <- (1/6) * (1/6)
p_sum_7 <- 6/36

cat("Exercise 1.1 - Two dice rolls:\n")
cat("P(X=2, Y=3):", p_x2_y3, "\n")
cat("P(X+Y=7):", p_sum_7, "\n\n")

# Exercise 1.2: Joint PMF from table
joint_pmf <- matrix(c(0.1, 0.2, 0.0,
                      0.1, 0.2, 0.1,
                      0.1, 0.1, 0.1), nrow = 3, byrow = TRUE)

p_x1_y1 <- joint_pmf[2, 2]
p_x1_marginal <- sum(joint_pmf[2, ])
p_y2_marginal <- sum(joint_pmf[, 3])
p_sum_2 <- joint_pmf[1, 3] + joint_pmf[2, 2] + joint_pmf[3, 1]

cat("Exercise 1.2 - Joint PMF from table:\n")
cat("P(X=1, Y=1):", p_x1_y1, "\n")
cat("Marginal P(X=1):", p_x1_marginal, "\n")
cat("Marginal P(Y=2):", p_y2_marginal, "\n")
cat("P(X+Y=2):", p_sum_2, "\n\n")

# Exercise 1.3: Urn problem (3 red, 2 blue, 1 green)
total_ways <- choose(6, 2)
joint_table <- matrix(c(0, 2/15, 1/15,
                        3/15, 6/15, 0,
                        3/15, 0, 0), nrow = 3, byrow = TRUE)

p_x_marginal <- rowSums(joint_table)
p_y_marginal <- colSums(joint_table)

cat("Exercise 1.3 - Urn problem:\n")
cat("Marginal P(X):", p_x_marginal, "\n")
cat("Marginal P(Y):", p_y_marginal, "\n\n")

# =============================================================================

# PROBLEM SET 2: CONTINUOUS JOINT DISTRIBUTIONS (Simple to Medium)
# =============================================================================

# Exercise 2.1: Uniform over rectangle (0<x<2, 0<y<3)
p_rect_1_2 <- (1 * 2) / 6
p_x_plus_y_3 <- 1 - (1/2) * 2 * 1 / 6

cat("Exercise 2.1 - Uniform over rectangle:\n")
cat("P(X<1, Y<2):", p_rect_1_2, "\n")
cat("P(X+Y<3):", round(p_x_plus_y_3, 6), "\n\n")

# Exercise 2.2: Joint PDF f(x,y) = 2e^(-x-2y)
p_x1_y1_joint <- (1 - exp(-1)) * (1 - exp(-2))

cat("Exercise 2.2 - Joint PDF f(x,y) = 2e^(-x-2y):\n")
cat("P(X<1, Y<1):", round(p_x1_y1_joint, 6), "\n")
cat("Marginal of X is Exponential(1)\n\n")

# Exercise 2.3: Joint PDF f(x,y) = 6xy on unit square
p_x_greater_y <- 0.5

cat("Exercise 2.3 - Joint PDF f(x,y) = 6xy:\n")
cat("P(X > Y):", p_x_greater_y, "(by symmetry)\n\n")

# =============================================================================

# PROBLEM SET 3: MARGINAL AND CONDITIONAL DISTRIBUTIONS (Medium)
# =============================================================================

# Exercise 3.1: Joint PDF f(x,y) = 8xy for 0 < x < y < 1
cat("Exercise 3.1 - Joint PDF f(x,y) = 8xy for 0 < x < y < 1:\n")
cat("Marginal f_X(x) = 4x(1 - x^2) for 0 < x < 1\n")
cat("Marginal f_Y(y) = 4y^3 for 0 < y < 1\n")
cat("Conditional f_Y|X(y|x) = 2y/(1-x^2) for x < y < 1\n\n")

# Verify marginals integrate to 1
int_f_x <- integrate(function(x) 4 * x * (1 - x^2), 0, 1)$value
int_f_y <- integrate(function(y) 4 * y^3, 0, 1)$value

cat("Verification:\n")
cat("Integral of f_X(x):", round(int_f_x, 6), "\n")
cat("Integral of f_Y(y):", round(int_f_y, 6), "\n\n")

# Exercise 3.2: Conditional probability
p_y_gt_75_given_x5 <- (1 - 0.75^2) / (1 - 0.5^2)

cat("Exercise 3.2 - Conditional probability:\n")
cat("P(Y > 0.75 | X = 0.5):", round(p_y_gt_75_given_x5, 6), "\n\n")

# Exercise 3.3: Discrete conditional distribution
conditional_pmf <- matrix(c(0.2, 0.1,
                            0.3, 0.4), nrow = 2, byrow = TRUE)

p_y1 <- sum(conditional_pmf[, 2])
p_x0_given_y1 <- conditional_pmf[1, 2] / p_y1

cat("Exercise 3.3 - Conditional distribution:\n")
cat("P(X=0 | Y=1):", round(p_x0_given_y1, 6), "\n\n")

# =============================================================================

# PROBLEM SET 4: INDEPENDENCE (Medium)
# =============================================================================

# Exercise 4.1: Independence check
cat("Exercise 4.1 - Independence:\n")
cat("f(x,y) = 2e^(-x-2y) = e^(-x) * 2e^(-2y)\n")
cat("Therefore, X and Y are independent.\n\n")

# Exercise 4.2: Not independent
cat("Exercise 4.2 - Not independent:\n")
cat("f(x,y) = 2 for 0 < x < y < 1\n")
cat("f_X(x) = 2(1-x), f_Y(y) = 2y\n")
cat("f_X(x) * f_Y(y) = 4y(1-x) != 2, so NOT independent.\n\n")

# Exercise 4.3: Uncorrelated but not independent
set.seed(300)
n_sim <- 10000
x_uncorrelated <- runif(n_sim, -1, 1)
y_uncorrelated <- x_uncorrelated^2

cov_sim <- cov(x_uncorrelated, y_uncorrelated)
cor_sim <- cor(x_uncorrelated, y_uncorrelated)

cat("Exercise 4.3 - Uncorrelated but not independent:\n")
cat("X ~ Uniform(-1,1), Y = X^2\n")
cat("Simulated Cov(X,Y):", round(cov_sim, 6), "(theoretical: 0)\n")
cat("Simulated Corr(X,Y):", round(cor_sim, 6), "\n")
cat("But clearly dependent since Y = X^2.\n\n")

# =============================================================================

# PROBLEM SET 5: COVARIANCE AND CORRELATION (Advanced)
# =============================================================================

# Exercise 5.1: Covariance from joint PMF
cov_pmf <- matrix(c(0.1, 0.3,
                    0.2, 0.4), nrow = 2, byrow = TRUE)

x_vals <- c(0, 1)
y_vals <- c(0, 1)

p_x <- rowSums(cov_pmf)
p_y <- colSums(cov_pmf)

ex <- sum(x_vals * p_x)
ey <- sum(y_vals * p_y)
exy <- sum(outer(x_vals, y_vals) * cov_pmf)
cov_xy <- exy - ex * ey

var_x <- sum(x_vals^2 * p_x) - ex^2
var_y <- sum(y_vals^2 * p_y) - ey^2
cor_xy <- cov_xy / sqrt(var_x * var_y)

cat("Exercise 5.1 - Covariance from joint PMF:\n")
cat("Cov(X,Y):", round(cov_xy, 6), "\n")
cat("Corr(X,Y):", round(cor_xy, 6), "\n\n")

# Exercise 5.2: Covariance properties
cat("Exercise 5.2 - Covariance properties:\n")
cat("Cov(X, X) = Var(X)\n")
cat("Cov(aX + b, cY + d) = ac * Cov(X, Y)\n\n")

# Exercise 5.3: Variance of sum
cat("Exercise 5.3 - Variance of sum:\n")
cat("Var(X + Y) = Var(X) + Var(Y) + 2Cov(X, Y)\n\n")

# Exercise 5.4: Covariance of linear combinations
cat("Exercise 5.4 - Covariance of linear combinations:\n")
cat("U = 2X + 3Y, V = X - Y\n")
cat("Cov(U, V) = 2Var(X) + Cov(X,Y) - 3Var(Y)\n\n")

# =============================================================================

# PROBLEM SET 6: MULTIVARIATE (Advanced)
# =============================================================================

# Exercise 6.1: Multinomial distribution
n_mult <- 10
p_vals <- c(0.2, 0.3, 0.5)

cat("Exercise 6.1 - Multinomial distribution:\n")
cat("E[X1] =", n_mult * p_vals[1], "\n")
cat("Cov(X1, X2) =", -n_mult * p_vals[1] * p_vals[2], "\n\n")

# Exercise 6.2: Bivariate normal
cat("Exercise 6.2 - Bivariate normal:\n")
cat("Marginal X ~ N(mu_x, sigma_x^2)\n")
cat("Conditional X|Y=y ~ N(mu_x + rho*sigma_x/sigma_y*(y-mu_y), sigma_x^2*(1-rho^2))\n\n")

# Exercise 6.3: Simulating correlated normals
set.seed(300)
n_sim <- 10000
x_bvn <- rnorm(n_sim)
z_bvn <- rnorm(n_sim)
rho_bvn <- 0.6
y_bvn <- rho_bvn * x_bvn + sqrt(1 - rho_bvn^2) * z_bvn

sim_cor_bvn <- cor(x_bvn, y_bvn)

cat("Exercise 6.3 - Simulating correlated normals:\n")
cat("Target correlation:", rho_bvn, "\n")
cat("Simulated correlation:", round(sim_cor_bvn, 6), "\n\n")

# Exercise 6.4: Law of total expectation
set.seed(400)
n_sim <- 10000
y_total <- rpois(n_sim, 3)
x_total <- rbinom(n_sim, y_total, 0.5)
sim_ex <- mean(x_total)

cat("Exercise 6.4 - Law of total expectation:\n")
cat("X|Y=y ~ Binomial(y, 0.5), Y ~ Poisson(3)\n")
cat("E[X] = E[E[X|Y]] = E[0.5*Y] = 0.5 * 3 = 1.5\n")
cat("Simulated E[X]:", round(sim_ex, 6), "\n\n")

# Exercise 6.5: Law of total variance
sim_var_x <- var(x_total)

cat("Exercise 6.5 - Law of total variance:\n")
cat("Var(X) = E[Var(X|Y)] + Var(E[X|Y]) = 0.75 + 0.75 = 1.5\n")
cat("Simulated Var[X]:", round(sim_var_x, 6), "\n\n")

cat("=== All exercises completed ===\n")
