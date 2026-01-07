.PHONY: setup setup-deps check-reqs test-api clean help lint-check lint-format

# Variables
ROBOT_REPORT_DIR = results

## @help Show help
help:
	@echo "Available commands:"
	@echo "  make setup       - Install Python and Node dependencies"
	@echo "  make setup-deps  - Install system dependencies (Linux/WSL)"
	@echo "  make test-api    - Run API smoke tests"
	@echo "  make clean       - Remove reports and temporary files"

# Install system dependencies (Linux) - Requires sudo
setup-deps:
	sudo $$(which node) $$(which npx) playwright install-deps

## @setup Install dependencies and initialize Browser Library
setup: check-reqs
	pipenv install
	pipenv run rfbrowser init

## @check-reqs Validate if Node and Pipenv are installed
check-reqs:
	@node -v > /dev/null 2>&1 || (echo "Error: Node.js not found. Please install via NVM."; exit 1)
	@pipenv --version > /dev/null 2>&1 || (echo "Error: Pipenv not found. Run: pipx install pipenv"; exit 1)
	@echo "Prerequisites verified successfully!"

# Code Quality
lint-check:
	pipenv run robocop check

lint-format:
	pipenv run robocop format

## @test-api Run the API test suite
test-api:
	pipenv run robot -d $(ROBOT_REPORT_DIR)/api tests/api/products.robot 

## @clean Clean up result directories
clean:
	rm -rf $(ROBOT_REPORT_DIR)
	rm -rf browser/