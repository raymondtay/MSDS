#!/usr/bin/env python3

import numpy as np
import random

# What is a Markov Chain?
# A Markov Chain is a ssytem that moves between states where the next state
# depends only on the current state (not the past). This is called the Markov Property.

# There are 2 states: Sunny or Rainy and their transition probabilities are
# | From\To | Sunny | Rainy |
# | ------- | ------| ------|
# | Sunny   | 0.8   | 0.2   |
# | Rainy   | 0.4   | 0.6   |
#

# 1. Representing a Markov Chain in python
#
# Transition matrix
P = np.array(
    [
        [0.8, 0.2],  # Sunny
        [0.4, 0.6],  # Rainy
    ]
)

states = ["Sunny", "Rainy"]

# 2. Simulating the Chain


def next_state(current_state, P):
    return np.random.choice([0, 1], p=P[current_state])


# Simulate 10 days
current = 0  # start Sunny
for day in range(10):
    print(states[current])
    current = next_state(current, P)


# 3. State Distribution after n-steps

# Initial: 100% Sunny
pi = np.array([1.0, 0.0])

# After 1 step
pi_1 = pi @ P

# After 2 steps
pi_2 = pi @ P @ P

print(pi_1, pi_2)


# 4. General n-step Transition
def n_step_distribution(pi, P, n):
    return pi @ np.linalg.matrix_power(P, n)


print(n_step_distribution(pi, P, 10))
