# Markov Chains Tutorial

## Introduction

A **Markov chain** is a stochastic process that moves between a set of states, where the probability of transitioning depends only on the current state. This tutorial introduces a simple two‑state chain (sunny / rainy) and shows how to simulate it.

## 1. Two‑State Markov Chain

### Transition matrix
| From \ To | Sunny (0) | Rainy (1) |
|-----------|-----------|-----------|
| Sunny (0) | 0.8       | 0.2       |
| Rainy (1) | 0.6       | 0.4       |

### Implementation
```scala
package tutorials.markov_chains

object SimpleMarkovChain {
  // Returns next state given current state and a Random instance
  def nextState(current: Int, rand: scala.util.Random): Int = {
    val row = if (current == 0) Array(0.8, 0.2) else Array(0.6, 0.4)
    if (rand.nextDouble() < row(0)) 0 else 1
  }

  // Simulate `steps` transitions starting from `initial`
  def simulate(initial: Int, steps: Int): Int = {
    var state = initial
    val rand = new scala.util.Random(123) // deterministic seed
    for (_ <- 0 until steps) {
      state = nextState(state, rand)
    }
    state
  }
}
```

### Usage
```scala
// Start sunny, simulate 10 days
val finalState = SimpleMarkovChain.simulate(initial = 0, steps = 10)
println(s"Final state after 10 days: ${if (finalState == 0) "Sunny" else "Rainy"}")
```

## 2. Expected Number of Steps to Return

The expected return time to a state can be derived from the stationary distribution. For this chain, the stationary distribution π satisfies:
π₀ = 0.8π₀ + 0.6π₁
π₁ = 0.2π₀ + 0.4π₁
π₀ + π₁ = 1
Solving yields π₀ = 0.75, π₁ = 0.25. Thus the expected return time to Sunny is 1/π₀ ≈ 1.33 days.

## 3. Visualization

Plot the probability of being sunny after n days. (Not implemented here, but you can use `scala.plot` to generate a plot.)

## How to run

Each example has a corresponding test in `src/test/scala/`. Run:

```bash
sbt test
```

## Further Reading

- "Markov Chains: From Theory to Implementation and Simulation" – online lecture notes.
- "Introduction to Probability Models" by Sheldon Ross.
