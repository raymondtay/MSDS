# Consider a standard, well-shuffled deck of cards. What is the probability that the 4 Aces are all adjacent?
# Here, define 'adjacent' as taking four consecutive positions; i.e., the 1st, 2nd, 3rd and 4th cards in the deck.
# The definition is not circular: the first and last cards in the deck are

arrange_4aces_in_1_block <- factorial(4)
total_positions_with_aceblock <- 49
arrange_nonaces_in_pack <- factorial(48)

total_perms <- factorial(52)

P1.1 = arrange_nonaces_in_pack*total_positions_with_aceblock*arrange_4aces_in_1_block/total_perms
cat("P(4 aces adjacent):", P1.1, "\n")

# There are eight schools in the Ivy League (Harvard's athletic conference): Harvard,
# Yale, Princeton, Brown, Columbia, Dartmouth, Cornell and Penn. The academic rankings
# of these schools is often a topic of interest and controversy.
# How many different ways are there to rank these schools?

P1.2a <- factorial(8)
cat("School Ranking:", P1.2a, "\n")

# Sometimes, Harvard, Yale and Princeton are referred to as the 'Big 3,' and are often
# grouped together as schools because of their extensive similarities. If indeed these
# three schools were identical - that is, the ordering 'Harvard Yale Princeton' is taken
# as identical to the ordering 'Yale Princeton Harvard' - how many ways would there now
# be to rank the Ivies?

# Approach is to treat the 'Harvard,Yale and Princeton' as 1 group, and apply the
# same treatment to the previous problem.

big3_positions  <- choose(8, 3)   # 56 - choose which 3 of 8 slots go to Big 3
big3_perm       <- 1               # Big 3 are identical, only 1 arrangement
non_big3_perm   <- factorial(5)    # 120 - arrange the 5 distinct remaining schools

P1.2b <- big3_positions * big3_perm * non_big3_perm
cat("School Rankings:", P1.2b, "\n")  # 6720
