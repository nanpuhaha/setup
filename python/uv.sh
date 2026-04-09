# Install uv
# https://docs.astral.sh/uv/getting-started/installation/
brew install uv

# ------------------------------------
# Global Python version management

# Install Python versions
uv python install 3.14 3.13 3.12 3.11

# Set global default Python version
uv python pin 3.14

# List available/installed Python versions
# uv python list

# ------------------------------------
# Project workflow (replaces poetry)

# Create a new project
# uv init my-project

# Add a dependency
# uv add requests

# Remove a dependency
# uv remove requests

# Install dependencies (from pyproject.toml / uv.lock)
# uv sync

# Run a command inside the project's virtual environment
# uv run python main.py

# ------------------------------------
# Tool management (replaces pipx)

# Linting / Formatting
uv tool install ruff          # linter + formatter (replaces flake8, black, isort)

# Type checking
uv tool install pyright        # Microsoft static type checker
uv tool install ty             # Astral's new type checker (ruff team)

# Debugging / reverse engineering
uv tool install frida-tools==12.4.3 # frida 16.7.19; compatible with iOS frida 16.4.3

# Testing
# uv tool install pytest

# Interactive shell
# uv tool install ipython

# HTTP client
# uv tool install httpie         # http command

# Dev workflow
# uv tool install pre-commit
# uv tool install cookiecutter

# Notebooks (modern alternative to Jupyter)
# uv tool install marimo

# Database CLI
# uv tool install pgcli          # PostgreSQL
# uv tool install litecli        # SQLite

# Data / inspection
# uv tool install datasette      # explore & publish SQLite data

# Upgrade all tools
# uv tool upgrade --all
