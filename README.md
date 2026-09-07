# Documentation Validation Workflow

This repository includes a GitHub Actions workflow that checks documents stored in the `docs/` folder whenever changes are pushed or a pull request is opened.

The workflow requires at least one of each of these files anywhere inside `docs/`:

- A SQL script: `*.sql`
- A PDF document: `*.pdf`

It also checks for these optional files and reports whether they are present, but does not fail when they are absent:

- Markdown: `*.md`
- Image: `*.png`

When a required document is missing, the workflow shows the missing pattern in its error message, such as `docs/**/*.pdf`.

## Add It Through GitHub

1. Open your project repository on GitHub.
2. Select **Add file**, then select **Create new file**.
3. Enter `.github/workflows/validate-docs.yml` as the file name. GitHub creates the folders automatically.
4. Copy the contents of [`.github/workflows/validate-docs.yml`](.github/workflows/validate-docs.yml) into the editor.
5. Enter a commit message, such as `Add documentation validation workflow`.
6. Select **Commit new file**.
7. Open the **Actions** tab to view the workflow after your next push or pull request.

## Add It From Your Local Machine

1. Open a terminal in the root folder of your project.
2. Create the workflow folder:

   ```powershell
   New-Item -ItemType Directory -Force .github/workflows
   ```

3. Create `.github/workflows/validate-docs.yml` and copy the workflow content from [`.github/workflows/validate-docs.yml`](.github/workflows/validate-docs.yml).
4. Add at least one `.sql` file and one `.pdf` file under `docs/`.
5. Commit and push the workflow:

   ```powershell
   git add .github/workflows/validate-docs.yml docs
   git commit -m "Add documentation validation workflow"
   git push origin main
   ```

If your default branch has a different name, replace `main` in the final command with that branch name.

## Check Results

On GitHub, open the **Actions** tab and select **Validate Documentation Files**. A failed run lists every required file pattern that was not found in `docs/`.