
# Use currently activated Python version to create a new virtual environment. If set to false, Python version used during Poetry installation is used.
# https://python-poetry.org/docs/configuration/#virtualenvsprefer-active-python-experimental
poetry config virtualenvs.prefer-active-python true

# Create the virtualenv inside the project’s root directory.
# https://python-poetry.org/docs/configuration/#virtualenvsin-project
poetry config virtualenvs.in-project true

# Listing the current configuration
# https://python-poetry.org/docs/configuration/#listing-the-current-configuration
poetry config --list

# ------------------------------------

pyenv install 3.12
pyenv local 3.12
poetry install

