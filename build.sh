#!/bin/bash
# This script builds the wheels for the models
#
# This script will invoke Python with the value of the PYTHON environment
# variable (if set), or fall back to "python3".

cd "$(dirname "$0")"
VIRTUALENV="$(pwd -P)/venv"
PYTHON="${PYTHON:-python3}"

# Validate the minimum required Python version
COMMAND="${PYTHON} -c 'import sys; exit(1 if sys.version_info < (3, 8) else 0)'"
PYTHON_VERSION=$(eval "${PYTHON} -V")
eval $COMMAND || {
  echo "--------------------------------------------------------------------"
  echo "ERROR: Unsupported Python version: ${PYTHON_VERSION}. ngUML requires"
  echo "Python 3.8 or later. To specify an alternate Python executable, set"
  echo "the PYTHON environment variable. For example:"
  echo ""
  echo "  sudo PYTHON=/usr/bin/python3.8 ./upgrade.sh"
  echo ""
  echo "To show your current Python version: ${PYTHON} -V"
  echo "--------------------------------------------------------------------"
  exit 1
}
echo "Using ${PYTHON_VERSION}"

# Remove the existing virtual environment (if any)
if [ -d "$VIRTUALENV" ]; then
  COMMAND="rm -rf ${VIRTUALENV}"
  echo "Removing old virtual environment..."
  eval $COMMAND
else
  WARN_MISSING_VENV=1
fi

# Create a new virtual environment
COMMAND="${PYTHON} -m venv ${VIRTUALENV}"
echo "Creating a new virtual environment at ${VIRTUALENV}..."
eval $COMMAND || {
  echo "--------------------------------------------------------------------"
  echo "ERROR: Failed to create the virtual environment. Check that you have"
  echo "the required system packages installed and the following path is"
  echo "writable: ${VIRTUALENV}"
  echo "--------------------------------------------------------------------"
  exit 1
}

# Activate the virtual environment
source "${VIRTUALENV}/bin/activate"

# Upgrade pip
COMMAND="pip install --upgrade pip"
echo "Updating pip ($COMMAND)..."
eval $COMMAND || exit 1
pip -V

# Install necessary system packages
COMMAND="pip install wheel"
echo "Installing Python system packages ($COMMAND)..."
eval $COMMAND || exit 1

# Install required Python packages
COMMAND="pip install -r requirements.txt"
echo "Installing core dependencies ($COMMAND)..."
eval $COMMAND || exit 1

COMMAND="python -m spacy \
    package \
    ./models/nguml_nlp_usecase_ner \
    ./packages \
    --build wheel"
echo "Building NER-model ($COMMAND)..."
eval $COMMAND || exit 1

COMMAND="python -m spacy \
    package \
    ./models/nguml_nlp_usecase_rel \
    --code ./libs/rel_model.py,./libs/rel_pipe.py \
    ./packages \
    --build wheel"
echo "Building REL-model ($COMMAND)..."
eval $COMMAND || exit 1


if [ -v WARN_MISSING_VENV ]; then
  echo "--------------------------------------------------------------------"
  echo "WARNING: No existing virtual environment was detected. A new one has"
  echo "been created.                                                       "
  echo "--------------------------------------------------------------------"
fi

echo "Build complete! Push the wheels to the release!"