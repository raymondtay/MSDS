# Monte Carlo Methods Tutorial

This tutorial introduces Monte Carlo simulation techniques with Scala 3 examples.

## Topics
1. Monte Carlo integration (approximating π).
2. Simple random walk simulation.
3. Estimating π using random points.

## Running the Examples

This project does not include an sbt configuration, so you can run the examples directly with the Scala CLI tool.

### Monte Carlo Integration Example
```bash
scala-cli "tutorials/monte-carlo/src/main/scala/monte_carlo_integration.scala"
```

**Expected output:**
```
Compiling project (Scala 3.8.2, JVM (17))
Compiled project (Scala 3.8.2, JVM (17))
Estimate of π: 3.138632
```

### Simple Random Walk
```bash
scala-cli "tutorials/monte-carlo/src/main/scala/RandomWalk.scala"
```
*(Note: The RandomWalk example is not included in this README but can be found in the source files.)*

## How the Monte Carlo Integration Works

**Explanation**
- Generate `samples` random points (x, y) uniformly in [0,1]×[0,1].
- Count how many satisfy x² + y² ≤ 1 (inside the quarter‑circle).
- Ratio * 4 ≈ π.

## Further Reading

- "Monte Carlo Methods in Financial Engineering" by Paul Glasserman.
- "Introduction to Probability" by Dimitri P. Bertsekas and John N. Tsitsiklis.