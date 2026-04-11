package tutorials.monte_carlo

import org.scalatest.funsuite.AnyFunSuite

class MonteCarloIntegrationSpec extends AnyFunSuite {
  test("Pi estimate is close to Math.PI for enough samples") {
    val estimate = MonteCarloIntegration.estimatePi(100000)
    val expected = Math.PI
    val tolerance = 0.02
    assert(Math.abs(estimate - expected) < tolerance)
  }
}