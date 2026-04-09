# 1. Suppose 30 numbers are selected at random from interval [0,1].
# That is X ~ U[0, 1] for i = 1..30. 
# Given Sample Mean = (1/30) sum over i = 1..30 X_i,
# estimate P(0.5 <= Sample Mean <= 0.6)
#
mu    <- 0.5
sigma <- sqrt(1/12)
n     <- 30
se    <- sigma / sqrt(n)   # standard error = 1/sqrt(360)

# --- CLT (analytical) ---
p_clt <- pnorm(0.6, mean = mu, sd = se) - 
         pnorm(0.5, mean = mu, sd = se)
cat("CLT approximation:  P =", round(p_clt, 4), "\n")

# --- Monte Carlo verification ---
set.seed(42)
m            <- 100000
sample_means <- replicate(m, mean(runif(n, 0, 1)))
p_mc         <- mean(sample_means >= 0.5 & sample_means <= 0.6)
cat("Monte Carlo approx: P =", round(p_mc, 4), "\n")

# 2. 
# Parameters
mu_X <- 20;  mu_Y <- 18

# Analytical
E_W <- mu_X - mu_Y
cat("E[W] (analytical) =", E_W, "\n")

# Monte Carlo verification
set.seed(42)
m <- 100000

X1 <- rnorm(m, mean = 20, sd = 2)   # Var = 4  => sd = 2
X2 <- rnorm(m, mean = 20, sd = 2)
Y1 <- rnorm(m, mean = 18, sd = 3)   # Var = 9  => sd = 3
Y2 <- rnorm(m, mean = 18, sd = 3)
Y3 <- rnorm(m, mean = 18, sd = 3)

W  <- (X1 + X2)/2 - (Y1 + Y2 + Y3)/3
cat("E[W] (Monte Carlo) =", round(mean(W), 4), "\n")

# 3. The Var(X) is ? 
#
# Analytical
Var_W <- (1/4)*(4 + 4) + (1/9)*(9 + 9 + 9)
cat("Var(W) (analytical) =", Var_W, "\n")

# Monte Carlo (reusing simulated W from before)
cat("Var(W) (Monte Carlo) =", round(var(W), 4), "\n")


# 4. 
mu_W  <- 2
var_W <- 5

# Analytical
p_analytical <- pnorm(0, mean = mu_W, sd = sqrt(var_W), lower.tail = FALSE)
cat("P(W >= 0) (analytical) =", round(p_analytical, 4), "\n")

# Monte Carlo (reusing simulated W from before)
p_mc <- mean(W >= 0)
cat("P(W >= 0) (Monte Carlo) =", round(p_mc, 4), "\n")

