# Say that you are rolling a fair, six-sided die.
# You win $10 if the die roll is 5 or greater, 
# $0 if the die roll is 2, 3 or 4, and lose  $ 5 if the roll is 1.

set.seed(110)
simulations = 1000

# generate winnings
winnings = sample(c(10,0,-5), simulations, replace=TRUE, prob = c(2/6,3/6,1/6))

# the mean and variance should match the theoretical calculations of 2.5 and
# 31.25 respectively.

cat("E(X): ", mean(winnings), "\n")
cat("Var(X): ", var(winnings), "\n")
