# Monad Foundry Starter Kit

"Built for Speed. Engineered for Trust."

Welcome to the Monad Foundry Starter Kit: a foundational development environment designed for builders who demand excellence.

Monad brings parallel execution and 10,000 TPS. This kit brings the reliability and thoughtfulness needed to harness that power safely. It is not just a template; it is a standard for secure, efficient, and maintainable onchain systems.

## ⚡ Core Philosophy

Speed requires stability.

As we build on the most performant EVM layer, every line of code we write must communicate trust. This starter kit adheres to three guiding principles:

- **Reliable**: Configurations are hardened. The Makefile is robust. Dependencies are pinned. You can trust this environment to behave consistently.
- **Thoughtful**: We use `via_ir` optimization by default because Monad's execution environment thrives on it. We include negative tests because knowing why code fails is as important as knowing why it succeeds.
- **Excellent**: From the directory structure to the CI pipeline, every detail is crafted to turn code into craftsmanship.

## 🛠 Features

- **Monad-Optimized Config**: foundry.toml pre-configured with `via_ir` and Cancun EVM settings for maximum gas efficiency on Monad.
- **Robust Makefile**: A complete command suite to abstract complex Forge commands into simple, reliable actions.
- **Best-Practice Testing**: Includes patterns for Unit, Fuzz, and Integration testing.
- **CI/CD Ready**: A GitHub Actions workflow (ci.yml) that enforces formatting and passes tests before you merge.
- **Security First**: Pre-configured remappings and dependency management to keep your foundation secure.

## 🚀 Getting Started

Build with clarity. Follow these steps to set up your environment.

### 1. Clone & Install

Initialize your repository and install the dependencies. We use a dedicated make command to handle git submodules cleanly.

```bash
git clone https://github.com/obinnafranklinduru/monad-foundry-kit.git
cd monad-foundry-kit
make install
```

### 2. Configure Environment

Reliability starts with security. Copy the example environment file and populate your private keys.

```bash
cp .env.example .env
```

> **Note**: Never commit your .env file. This kit includes a .gitignore that thoughtfully excludes it to protect your assets.

### 3. Build & Verify

Ensure everything is correctly configured by running a build.

```bash
make build
```

## 💻 Usage

We have simplified the developer experience without sacrificing power. Use these commands to maintain your flow.

| Command         | Description                                                  |
| --------------- | ------------------------------------------------------------ |
| `make build`    | Compiles your contracts with Monad-specific optimizations.   |
| `make test`     | Runs the full test suite (Unit + Integration).               |
| `make test-gas` | Runs tests and generates a gas report to track efficiency.   |
| `make fuzz`     | Runs property-based tests (10,000 runs) to catch edge cases. |
| `make clean`    | Removes artifacts to ensure a fresh, reliable build.         |
| `make fmt`      | Formats your code to standard Solidity style guidelines.     |

### Testing Strategy

We believe testing is the bridge between code and trust.

- **Unit Tests**: Validate individual functions (MonadGreeterTest.t.sol).
- **Integration Tests**: Verify workflows (MonadIntegrationTest.t.sol).
- **Fuzz Tests**: Ensure robustness against random inputs (MonadGreeterFuzz.t.sol).

Run them all with:

```bash
make test
```

## 🌍 Deployment

Deploying to Monad should be precise. We support both local (Anvil) and network deployments.

### Local Development (Anvil)

```bash
# Terminal 1: Start the node
make anvil

# Terminal 2: Deploy
make deploy-anvil
```

### Monad Testnet

Ensure your `MONAD_TESTNET_RPC` and `MONAD_TESTNET_PRIVATE_KEY` are set in `.env`.

```bash
make deploy-testnet
```

### Verification

Verify your contract on the explorer immediately after deployment.

```bash
make verify-testnet
```

## 📚 Resources

- [Monad Documentation](https://docs.monad.xyz/) - The official guide to the network.
- [Foundry Book](https://book.getfoundry.sh/) - The bible for Foundry development.
- [OpenZeppelin Contracts](https://docs.openzeppelin.com/contracts) - The standard for secure contract libraries.

## 🛡️ License

This project is licensed under the MIT License - built for the community, free to use, and open for innovation.

---

### About the Author

**Obinna Franklin Duru (BinnaDev)**

_"Let's build something you can trust with clarity, purpose, and excellence."_

[Twitter/X](https://x.com/BinnaDev)
[GitHub](https://github.com/obinnafranklinduru)
[LinkedIn](https://linkedin.com/in/obinna-franklin-duru)
