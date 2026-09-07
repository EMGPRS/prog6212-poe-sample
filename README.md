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

1. Open your project folder in VS Code.
2. In the **Explorer** panel, right-click the project root, select **New Folder**, and create a folder named `.github`.
3. Right-click `.github`, select **New Folder**, and create a folder named `workflows`.
4. Right-click `workflows`, select **New File**, and create `validate-docs.yml`.
5. Copy the contents of [`.github/workflows/validate-docs.yml`](.github/workflows/validate-docs.yml) into the new file and save it.
6. In the VS Code Explorer panel, add at least one `.sql` file and one `.pdf` file inside the `docs` folder.
7. Open **GitHub Desktop** and select your project repository. The new and changed files appear in the **Changes** tab.
8. Enter a summary such as `Add documentation validation workflow`, then select **Commit to main**. If your branch has a different name, GitHub Desktop shows that name instead.
9. Select **Push origin** to upload the commit to GitHub.

## Check Results

On GitHub, open the **Actions** tab and select **Validate Documentation Files**. A failed run lists every required file pattern that was not found in `docs/`.