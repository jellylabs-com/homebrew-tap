# JellyLabs Homebrew Tap

Homebrew formulae for JellyLabs tools.

## Installation

```bash
brew tap jellylabs-ltd/tap
brew install mangiafuoco
```

## Available Formulae

### mangiafuoco

Parallel development orchestration toolkit for Claude Code agents.

```bash
brew install jellylabs-ltd/tap/mangiafuoco
```

Short command `mf` is available as an alias:

```bash
mf status       # Show status overview
mf watch        # Live monitoring
mf daemon start # Start background daemon
```

To start the daemon automatically at login:

```bash
brew services start mangiafuoco
```
