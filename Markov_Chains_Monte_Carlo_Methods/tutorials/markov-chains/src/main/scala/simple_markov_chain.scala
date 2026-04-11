package tutorials.markov_chains

object SimpleMarkovChain {
  // Two-state chain: state 0 = sunny, state 1 = rainy
  // Transition matrix: [[0.8, 0.2], [0.6, 0.4]]
  def nextState(current: Int, rand: scala.util.Random): Int = {
    val row = if (current == 0) Array(0.8, 0.2) else Array(0.6, 0.4)
    val r = rand.nextDouble()
    if (r < row(0)) 0 else 1
  }

  def simulateSteps(initial: Int, steps: Int): Int = {
    var state = initial
    val rand = new scala.util.Random(123)
    for (_ <- 0 until steps) {
      state = nextState(state, rand)
    }
    state
  }

  def main(args: Array[String]): Unit = {
    val finalState = simulateSteps(initial = 0, steps = 10)
    val label = if (finalState == 0) "Sunny" else "Rainy"
    println(s"Final state after 10 days: $label")
  }
}