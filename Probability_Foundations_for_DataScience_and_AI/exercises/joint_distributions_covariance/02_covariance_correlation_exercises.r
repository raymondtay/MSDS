# =============================================================================
# COVARIANCE AND CORRELATION EXERCISES
# =============================================================================
# Topics: Covariance, Correlation, Properties, Applications
# Difficulty: Simple -> Advanced
# =============================================================================

library(testthat)

# =============================================================================

# PROBLEM SET 1: BASIC COVARIANCE (Simple)
# =============================================================================

# Exercise 1.1: Covariance of linear functions
cov_xy <- 5
cov_u_v <- 2 * 4 * cov_xy

cat("Exercise 1.1 - Covariance of linear functions:\n")
cat("Cov(2X+3, 4Y-1) =", cov_u_v, "\n\n")

# Exercise 1.2: Covariance with itself
var_x <- 4
cov_xx <- var_x

cat("Exercise 1.2 - Covariance with itself:\n")
cat("Cov(X, X) =", cov_xx, "\n\n")

# Exercise 1.3: Covariance of independent variables
cat("Exercise 1.3 - Independent variables:\n")
cat("If X and Y are independent, then Cov(X, Y) = 0\n\n")

# Exercise 1.4: Variance of sum
var_x <- 9
var_y <- 4
cov_xy <- 3
var_sum <- var_x + var_y + 2 * cov_xy

cat("Exercise 1.4 - Variance of sum:\n")
cat("Var(X + Y) =", var_sum, "\n\n")

# =============================================================================

# PROBLEM SET 2: CORRELATION (Simple)
# =============================================================================

# Exercise 2.1: Correlation coefficient
cov_xy <- 6
sigma_x <- 3
sigma_y <- 4
rho_xy <- cov_xy / (sigma_x * sigma_y)

cat("Exercise 2.1 - Correlation coefficient:\n")
cat("rho(X,Y) =", round(rho_xy, 6), "\n\n")

# Exercise 2.2: Correlation of linear functions
rho_xy <- 0.8
rho_u_v <- sign(-2 * 3) * rho_xy

cat("Exercise 2.2 - Correlation of linear functions:\n")
cat("rho(-2X+5, 3Y-1) =", rho_u_v, "\n\n")

# Exercise 2.3: Correlation bounds
cat("Exercise 2.3 - Correlation bounds:\n")
cat("-1 <= rho(X, Y) <= 1\n\n")

# Exercise 2.4: Correlation of X and -X
cat("Exercise 2.4 - Correlation of X and -X:\n")
cat("rho(X, -X) = -1\n\n")

# =============================================================================

# PROBLEM SET 3: COMPUTING FROM DATA (Medium)
# =============================================================================

# Exercise 3.1: Sample covariance
x_vals <- c(1, 2, 3, 4, 5)
y_vals <- c(2, 4, 5, 4, 5)

cov_manual <- cov(x_vals, y_vals)
cor_manual <- cor(x_vals, y_vals)

cat("Exercise 3.1 - Sample covariance:\n")
cat("cov(x,y) =", round(cov_manual, 6), "\n")
cat("cor(x,y) =", round(cor_manual, 6), "\n\n")

# Exercise 3.2: Interpret correlation
cat("Exercise 3.2 - Interpret correlation:\n")
cat("Correlation of", round(cor_manual, 4), "indicates a\n")
cat("moderate positive linear relationship.\n\n")

# Exercise 3.3: Correlation is unitless
x_m <- c(1, 2, 3, 4, 5)
x_cm <- x_m * 100
y_units <- c(10, 20, 30, 40, 50)

cor_m <- cor(x_m, y_units)
cor_cm <- cor(x_cm, y_units)

cat("Exercise 3.3 - Correlation is unitless:\n")
cat("Cor(X in meters, Y):", round(cor_m, 6), "\n")
cat("Cor(X in cm, Y):", round(cor_cm, 6), "\n\n")

# =============================================================================

# PROBLEM SET 4: IN PROBABILITY (Medium)
# =============================================================================

# Exercise 4.1: Bernoulli variables
p <- 0.4
q <- 0.6

cat("Exercise 4.1 - Bernoulli variables:\n")
cat("X ~ Bernoulli(0.4), Y ~ Bernoulli(0.6) independent\n")
cat("Cov(X,Y) = 0 (independent)\n\n")

# Exercise 4.2: Binomial variables
cat("Exercise 4.2 - Binomial variables:\n")
cat("X ~ Binomial(10, 0.3), Y ~ Binomial(15, 0.3)\n")
cat("Cov(X,Y) = 0 (independent)\n\n")

# Exercise 4.3: Bivariate normal
mu_x <- 0
sigma_x <- 2
sigma_y <- 3
rho_bvn <- 0.5

cov_bvn <- rho_bvn * sigma_x * sigma_y

cat("Exercise 4.3 - Bivariate normal:\n")
cat("Cov(X,Y) =", cov_bvn, "\n\n")

# Exercise 4.4: Correlation of sum and difference
cat("Exercise 4.4 - Correlation of sum and difference:\n")
cat("U = X + Y, V = X - Y\n")
cat("Cov(U,V) = Var(X) - Var(Y)\n\n")

# Exercise 4.5: Correlation of X and X^2
set.seed(100)
n_sim <- 10000
x_sym <- rnorm(n_sim)
x_sq <- x_sym^2

cor_x_x2 <- cor(x_sym, x_sq)

cat("Exercise 4.5 - Correlation of X and X^2:\n")
cat("X ~ Normal(0,1), Y = X^2\n")
cat("Corr(X, X^2):", round(cor_x_x2, 6), "(near 0 but dependent)\n\n")

# =============================================================================

# PROBLEM SET 5: APPLICATIONS (Advanced)
# =============================================================================

# Exercise 5.1: Zero correlation but dependent
set.seed(200)
n_sim <- 1000
x_circle <- runif(n_sim, -1, 1)
y_circle <- sqrt(1 - x_circle^2) * sample(c(-1, 1), n_sim, replace = TRUE)

cor_circle <- cor(x_circle, y_circle)

cat("Exercise 5.1 - Zero correlation but dependent:\n")
cat("Points on unit circle: x^2 + y^2 = 1\n")
cat("Corr(X,Y):", round(cor_circle, 6), "\n\n")

# Exercise 5.2: Spurious correlation
cat("Exercise 5.2 - Spurious correlation:\n")
cat("Ice cream sales and drowning deaths are positively correlated\n")
cat("due to temperature (hot weather -> more ice cream, more swimming)\n\n")

# Exercise 5.3: Partial correlation
cat("Exercise 5.3 - Partial correlation:\n")
cat("Corr(X, Y | Z) = Corr(X - E[X|Z], Y - E[Y|Z])\n\n")

# Exercise 5.4: Coefficient of determination
cat("Exercise 5.4 - Coefficient of determination:\n")
cat("R^2 = Corr(Y, Y_pred)^2\n")
cat("R^2 = proportion of variance in Y explained by X\n\n")

# =============================================================================

# PROBLEM SET 6: SIMULATION (Advanced)
# =============================================================================

# Exercise 6.1: Simulating correlated normals
set.seed(300)
n_sim <- 10000
rho_target <- 0.7
x_sim <- rnorm(n_sim)
z_sim <- rnorm(n_sim)
y_sim <- rho_target * x_sim + sqrt(1 - rho_target^2) * z_sim

cor_simulated <- cor(x_sim, y_sim)

cat("Exercise 6.1 - Simulating correlated normals:\n")
cat("Target correlation:", rho_target, "\n")
cat("Simulated correlation:", round(cor_simulated, 6), "\n\n")

# Exercise 6.2: Covariance of sample mean and deviation
set.seed(400)
n <- 10
n_sim <- 1000

cov_results <- replicate(n_sim, {
  x <- rnorm(n, 0, 2)
  x_bar <- mean(x)
  cov(x_bar, x[1] - x_bar)
})

cat("Exercise 6.2 - Covariance of sample mean and deviation:\n")
cat("Cov(X_bar, X_i - X_bar) should be 0\n")
cat("Simulated:", round(mean(cov_results), 8), "\n\n")

# Exercise 6.3: Variance of sample mean
set.seed(500)
n <- 25
sigma <- 3
var_results <- replicate(n_sim, {
  x <- rnorm(n, 0, sigma)
  var(x)
})

var_sample_mean_theoretical <- sigma^2 / n

cat("Exercise 6.3 - Variance of sample mean:\n")
cat("Var(X_bar) =", sigma^2, "/", n, "=", var_sample_mean_theoretical, "\n")
cat("Simulated average:", round(mean(var_results), 6), "\n\n")

# Exercise 6.4: Law of covariance
set.seed(700)
n_sim <- 10000
x_cov <- runif(n_sim)
y_cov <- x_cov^2

cov_sim <- cov(x_cov, y_cov)
cov_theoretical <- 1/4 - (1/2) * (1/3)

cat("Exercise 6.4 - Law of covariance:\n")
cat("X ~ Uniform(0,1), Y = X^2\n")
cat("Theoretical Cov(X,Y):", round(cov_theoretical, 6), "\n")
cat("Simulated Cov(X,Y):", round(cov_sim, 6), "\n\n")

cat("=== All exercises completed ===\n")
