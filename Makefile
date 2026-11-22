.PHONY: setup test lint demo trace report clean

PYTHON ?= python3
CASE ?= accept

setup:
	$(PYTHON) -m pip install -e ".[dev]"

test:
	PYTHONPATH=. $(PYTHON) -m pytest -v

lint:
	ruff check .
	black --check .

demo:
	PYTHONPATH=. $(PYTHON) -m demo.cli --case $(CASE)

trace:
	PYTHONPATH=. $(PYTHON) -m demo.cli --case $(CASE) --trace

report:
	cd report && pdflatex -interaction=nonstopmode main.tex && pdflatex -interaction=nonstopmode main.tex

clean:
	rm -rf .pytest_cache .ruff_cache __pycache__ */__pycache__ */*/__pycache__
