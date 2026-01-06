# Robot Framework Juice Shop

Automated testing suite for OWASP Juice Shop.

## Project Architecture

This project follows a **Layered Keyword-Driven Design** combined with the **Page Object Pattern (POM)**. This ensures high maintainability, reusability, and clean separation of concerns.

### Strategic Layers
1. Test Layer (tests/): Contains only business logic. No selectors or low-level implementation details allowed here.

2. Abstraction Layer (resources/): * Pages: Encapsulates UI elements. If a button ID changes, update only the Page Object.
    - Services: Encapsulates API endpoints. If the API version changes, update only the Service file.

3. Core Layer (base.resource): Manages the lifecycle of the browser and API sessions, acting as the single entry point for all tests.

### Project Blueprint
A guided overview of the repository structure to maintain architectural consistency:

```bash
├── data/               # Test data (JSON/YAML) and environment variables
├── resources/          # The core of the automation logic
│   ├── pages/          # Page Objects: Selectors and UI actions (E2E)
│   ├── services/       # API Services: Request definitions (API)
│   ├── data/           # Resource-specific data
│   └── base.resource   # Global setup, teardown, and library imports
├── tests/              # Test suites (The "What" is being tested)
│   ├── api/            # Pure API test cases
│   └── e2e/            # Full journey UI test cases
├── results/            # Execution logs and reports (ignored by Git)
├── Makefile            # Task automation (shortcuts for running tests)
└── Pipfile             # Dependency management (Pipenv)
```
## Tech Stack
- **Framework:** [Robot Framework](https://robotframework.org/)
- **Libraries:** 
    - [Browser (Playwright)](https://marketsquare.github.io/robotframework-browser/) for E2E/UI.
    - [Requests](https://marketsquare.github.io/robotframework-requests/) for API testing.
- **Language:** Python 3.x
- **Infrastructure:** Docker (SUT)

## Quick Start

1. **Prerequisites:** Ensure you have `python`, `node.js`, and `pipenv` installed.
2. **Setup:** Install dependencies and browser binaries:
   ```bash
   make setup
   ```
3. **Run Tests**: Execute the API smoke tests:
   ```bash
   make test-api
   ```

links(temporary): 
- http://localhost:3000/
- http://localhost:3000/api-docs/
- https://github.com/juice-shop/juice-shop/blob/master/server.ts