package tutorials.markov_chains

import org.scalatest.funsuite.AnyFunSuite

class SimpleMarkovChainSpec extends AnyFunSuite {
  test("Simulate steps does not throw") {
    val result = SimpleMarkovChain.simulateSteps(initial = 0, steps = 10)
    // just ensure it's either 0 or 1
    assert(result == 0 || result == 1)
  }
}