# Monte Carlo Methods Tutorial

## Introduction

Monte Carlo methods use random sampling to approximate mathematical results. This tutorial covers three classic examples implemented in Scala 3.

## 1. Monte Carlo Integration – Estimating π

The value of π can be estimated by randomly sampling points in the unit square and checking how many fall inside the quarter‑circle of radius 1.

```scala
// File: tutorials/monte-carlo/src/main/scala/monte_carlo_integration.scala
package tutorials.monte_carlo

object MonteCarloIntegration {
  def estimatePi(samples: Int): Double = {
    val rand = new scala.util.Random(42) // deterministic seed for reproducibility
    var inside = 0
    for (_ <- 0 until samples) {
      val x = rand.nextDouble()
      val y = rand.nextDouble()
      if (x * x + y * y <= 1.0) inside += 1
    }
    (inside.toDouble / samples) * 4
  }
}

println(s"Estimate of π: ${MonteCarloIntegration.estimatePi(1000000)}")
```

**Explanation**
- Generate `samples` random points (x, y) uniformly in [0,1]×[0,1].
- Count how many satisfy x² + y² ≤ 1 (inside the quarter‑circle).
- Ratio * 4 ≈ π.

## 2. Simple Random Walk

A 1‑D random walk updates a position by +1 or -1 each step.

```scala
package tutorials.monte_carlo

object RandomWalk {
  def simulate(steps: Int, start: Int = 0): Int = {
    val rand = new scala.util.Random(123)
    var pos = start
    for (_ <- 0 until steps) {
      if (rand.nextBoolean()) pos += 1 else pos -= 1
    }
    pos
  }
}

println(s"Walk after 100 steps: ${RandomWalk.simulate(100)}")
```

## 3. Estimating π with Random Points

Combine the integration idea with a Monte Carlo simulation to visualize convergence.

## How to run

Each example has its own test in `src/test/scala/`. Run the full test suite:

```bash
sbt test
```

Individual tests can be executed via:

```bash
sbt test monte_carlo_integration
```

## Further Reading

- "Monte Carlo Methods in Financial Engineering" by Paul Glasserman.
- "Introduction to Probability" by Dimitri P. Bertsekas and John N. Tsitsiklis.
