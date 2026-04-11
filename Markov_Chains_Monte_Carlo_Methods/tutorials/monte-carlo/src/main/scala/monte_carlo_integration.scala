package tutorials.monte_carlo

object MonteCarloIntegration {
  // Estimate π using Monte Carlo integration
  def estimatePi(samples: Int): Double = {
    val rand = new scala.util.Random(42) // deterministic seed
    var inside = 0
    for (_ <- 0 until samples) {
      val x = rand.nextDouble()
      val y = rand.nextDouble()
      if (x * x + y * y <= 1.0) inside += 1
    }
    (inside.toDouble / samples) * 4
  }

  def main(args: Array[String]): Unit = {
    val estimate = estimatePi(1000000)
    println(s"Estimate of π: $estimate")
  }
}