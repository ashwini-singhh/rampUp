#!/bin/bash

echo "🚀 Setting up local Python environment..."

# Detect Python version
if command -v python3.12 &> /dev/null; then
    PYTHON_CMD="python3.12"
elif command -v python3 &> /dev/null; then
    PYTHON_CMD="python3"
else
    echo "❌ Python not found. Please install Python 3."
    exit 1
fi

echo "📦 Using $PYTHON_CMD..."

# Create venv if it doesn't exist
if [ ! -d "venv" ]; then
    $PYTHON_CMD -m venv venv
    echo "✅ Virtual environment created."
fi

# Activate and install
source venv/bin/activate
pip install --upgrade pip
pip install -r requirements.txt

echo "📡 Starting FastAPI server on port 8001..."
python main.py
