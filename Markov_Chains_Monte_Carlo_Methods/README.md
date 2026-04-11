# Markov Chains and Monte Carlo Tutorials

This repository includes educational tutorials on Monte Carlo methods and Markov chains implemented in Scala 3.

## Tutorials

- **Monte Carlo Methods**: Learn how to use random sampling to approximate mathematical results. Includes code for estimating π via Monte Carlo integration.
- **Markov Chains**: Explore discrete-time Markov chains, transition matrices, and expected state visitation counts.

## Running the Examples

Each tutorial contains Scala source files in `tutorials/monte-carlo/src/main/scala/` and `tutorials/markov-chains/src/main/scala/`. To run them, you can use the `scala-cli` tool:

```bash
# Monte Carlo example
scala-cli "tutorials/monte-carlo/src/main/scala/monte_carlo_integration.scala"

# Markov chain example
scala-cli "tutorials/markov-chains/src/main/scala/simple_markov_chain.scala"
```

Note: The repository does not have an `sbt` configuration (no `build.sbt`), so running with `sbt` is not currently possible. If you prefer to use `sbt`, you can set one up, but it is not required for these tutorials.

## Testing

The tutorials include corresponding ScalaTest suites in `src/test/scala/`. To run the tests, you can use the `scala-cli` tool with the `-t` flag:
```bash
scala-cli test tutorials/monte-carlo/src/test/scala/monte_carlo_integration_spec.scala
scala-cli test tutorials/markov-chains/src/test/scala/simple_markov_chain_spec.scala
```

Note: The repository does not have an `sbt` configuration (no `build.sbt`), so running with `sbt` is not currently possible. If you prefer to use `sbt`, you can set one up, but it is not required for these tutorials.

## Contributing

Feel free to expand these tutorials with new examples or improve existing ones. Ensure any new Scala code compiles and passes existing tests.
