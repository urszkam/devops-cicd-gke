## Git hooks

This project uses Git hooks managed by pre-commit to validate code and configuration before commits and pushes.

- **Ruff**: runs Python linting and formatting checks.
- **isort**: sorts and groups Python imports.
- **mypy**: checks Python types for common errors.
- **terraform fmt**: formats Terraform files to canonical HCL style.
- **check-yaml**: validates YAML syntax.
- **end-of-file-fixer**: fixes trailing whitespace and newline issues.
- **detect-private-key**: detects private keys in staged files.
- **detect-secrets**: flags likely secrets and tokens.
- **Conventional Commits**: enforces a consistent commit message format.

## Local setup

1. Clone the repository:
   ```sh
   git clone <URL_REPO>
   cd projekt
   ```
2. Install Python dependencies:
   ```sh
   python -m pip install -r requirements.txt
   ```
3. Install the Git hooks:
   ```sh
   pre-commit install
   pre-commit install --hook-type pre-push
   pre-commit install --hook-type commit-msg
   ```
