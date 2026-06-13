## Git hooks

This project uses Git hooks managed by pre-commit to validate code and configuration before commits and pushes.

- **Ruff**: runs Python linting and formatting checks.
- **isort**: sorts and groups Python imports.
- **mypy**: checks Python types for common errors.
- **terraform fmt**: formats Terraform files to canonical HCL style.
- **check-yaml**: validates YAML syntax.
- **detect-private-key**: detects private keys in staged files.
- **detect-secrets**: flags likely secrets and tokens.
- **Conventional Commits**: enforces a consistent commit message format.

## CI/CD

GitHub Actions is used for pull request validation. It runs separate checks for Python and Terraform, including formatting, linting, validation, TFLint, Checkov, and Snyk scans. Each check is exposed as its own status in the PR view, which makes failures easier to identify.

Cloud Build is used for the deployment pipeline in Google Cloud. It is triggered after changes are merged into the main branch and handles the build and deployment flow for the application and infrastructure defined in the project.

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
