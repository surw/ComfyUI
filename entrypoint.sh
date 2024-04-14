#!/bin/bash
venv_dir="./venvx"

if [ ! -d "$venv_dir" ]; then
    python3 -m venv venvx
fi

export PATH=/app/venvx/bin:$PATH
python -m pip install --upgrade pip
pip install -r requirements.txt --extra-index-url https://download.pytorch.org/whl/cu118

# Check if the first argument is provided and if it is "bash"
if [ "$1" == "bash" ]; then
    # If "bash" is provided, run bash in interactive mode
    exec bash
else
    # Otherwise, execute the provided command with any arguments
    exec python main.py "$@"
fi