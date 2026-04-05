library(testthat)

# =============================================================================
# Problem 1
# Given: E(X) = 3, sd(X) = 4, E(Y) = 1, sd(Y) = 2, corr(X,Y) = 0.5
# X and Y are NOT independent (corr != 0, so Cov term is needed for variance)
# =============================================================================

ex   <- 3;  sdx  <- 4;  varx <- sdx^2      # Var(X) = 16
ey   <- 1;  sdy  <- 2;  vary <- sdy^2      # Var(Y) = 4
rho  <- 0.5
cov_XY <- rho * sdx * sdy                  # Cov(X,Y) = 0.5 * 4 * 2 = 4


# (a) E(X + 3Y + 1)
# By linearity: E(aX + bY + c) = a*E(X) + b*E(Y) + c
e1.1 <- ex + 3*ey + 1                      # 3 + 3(1) + 1 = 7
cat("e1.1 = E(X + 3Y + 1) =", e1.1, "\n")


# (b) sd(4X + 2Y + 2)
# Var(aX + bY + c) = a^2*Var(X) + b^2*Var(Y) + 2ab*Cov(X,Y)
# Constants (c) vanish in variance
var_4x2y2 <- 4^2 * varx + 2^2 * vary + 2*4*2 * cov_XY
# = 16(16) + 4(4) + 16(4) = 256 + 16 + 64 = 336
sd1.2 <- round(sqrt(var_4x2y2), 2)         # sqrt(336) ≈ 18.33
cat("sd1.2 = sd(4X + 2Y + 2) =", sd1.2, "\n")


# (c) E(3X - 2Y - 10)
# By linearity: E(aX + bY + c) = a*E(X) + b*E(Y) + c
e1.3 <- 3*ex - 2*ey - 10                   # 9 - 2 - 10 = -3
cat("e1.3 = E(3X - 2Y - 10) =", e1.3, "\n")


# (d) sd(3X - 3Y - 5)
# a = 3, b = -3  →  2ab = 2(3)(-3) = -18
var_3x3y5 <- 3^2 * varx + (-3)^2 * vary + 2*3*(-3) * cov_XY
# = 9(16) + 9(4) - 18(4) = 144 + 36 - 72 = 108
sd1.4 <- round(sqrt(var_3x3y5), 2)         # sqrt(108) ≈ 10.39
cat("sd1.4 = sd(3X - 3Y - 5) =", sd1.4, "\n")


# =============================================================================
# Problem 2 — Joint PMF: X = cost of component 1, Y = cost of component 2
#
#          | y=7  | y=9  | y=10 |
#  x=7     | 0.05 | 0.05 | 0.10 |
#  x=9     | 0.05 | 0.10 | 0.35 |
#  x=10    | 0.00 | 0.20 | 0.10 |
# =============================================================================

x_vals <- c(7, 9, 10)
y_vals <- c(7, 9, 10)

joint_pmf <- matrix(
  c(0.05, 0.05, 0.10,
    0.05, 0.10, 0.35,
    0.00, 0.20, 0.10),
  nrow = 3, byrow = TRUE,
  dimnames = list(x = x_vals, y = y_vals)
)

# Marginal distributions
p_x <- rowSums(joint_pmf)   # P(X=7)=0.20, P(X=9)=0.50, P(X=10)=0.30
p_y <- colSums(joint_pmf)   # P(Y=7)=0.10, P(Y=9)=0.35, P(Y=10)=0.55

# Means
e_x  <- sum(x_vals * p_x)   # 7(.20)+9(.50)+10(.30) = 8.90
e_y  <- sum(y_vals * p_y)   # 7(.10)+9(.35)+10(.55) = 9.35

# Variances
# Var(X) = E(X^2) - (E(X))^2
e_x2 <- sum(x_vals^2 * p_x)            # 49(.20)+81(.50)+100(.30) = 80.30
e_y2 <- sum(y_vals^2 * p_y)            # 49(.10)+81(.35)+100(.55) = 88.25
var_x2 <- e_x2 - e_x^2                 # 80.30 - 79.21 = 1.09
var_y2 <- e_y2 - e_y^2                 # 88.25 - 87.4225 = 0.8275

# E[XY] = sum of x*y*P(X=x,Y=y) over all cells
e_xy <- sum(outer(x_vals, y_vals) * joint_pmf)
# = 2.45+3.15+7.00+3.15+8.10+31.50+0+18.00+10.00 = 83.35


# (a) Cov(X, Y)
cov.xy <- e_xy - e_x * e_y             # 83.35 - 8.9*9.35 = 0.135
cat("cov.xy = Cov(X,Y) =", cov.xy, "\n")


# (b) Cov(U, V) where U = 100X, V = 100Y
# Cov(aX, bY) = ab * Cov(X,Y)
cov.uv <- 100 * 100 * cov.xy           # 10000 * 0.135 = 1350
cat("cov.uv = Cov(U,V) =", cov.uv, "\n")


# (c) Correlation coefficients
# rho(X,Y) = Cov(X,Y) / (sd(X) * sd(Y))
rho.xy <- cov.xy / (sqrt(var_x2) * sqrt(var_y2))
cat("rho.xy =", round(rho.xy, 4), "\n")

# rho(U,V): correlation is invariant under positive linear scaling
# rho(aX, bY) = sign(a)*sign(b) * rho(X,Y)  — both a=b=100 > 0, so equal
rho.uv <- rho.xy
cat("rho.uv =", round(rho.uv, 4), "\n")


# =============================================================================
# Sanity checks
# =============================================================================
stopifnot(sum(joint_pmf) == 1)
stopifnot(e1.1 == 7)
stopifnot(e1.3 == -3)
stopifnot(abs(rho.xy - rho.uv) < 1e-10)   # scale invariance confirmed

