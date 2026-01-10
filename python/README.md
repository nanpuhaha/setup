# Python Environment Setup

Scripts for setting up Python development environments.

## Scripts

### `poetry.sh`

Configures Poetry with specific preferences:
- `virtualenvs.prefer-active-python`: `true` (Uses currently activated Python version)
- `virtualenvs.in-project`: `true` (Creates virtualenv inside the project root)

**Usage:**
```bash
./poetry.sh
```

Includes commands to install Python 3.12 via `pyenv` and run `poetry install`.
