# FORD docker action

This action builds documentation for a Fortran project using
[FORD](https://github.com/Fortran-FOSS-Programmers/ford). The documentation can
then be deployed using another action such as to [GitHub
Page](https://github.com/marketplace/actions/github-pages).

## Inputs

### `project_file`

**Required** Name of the FORD project file (default project-file.md)

## Outputs

### `output_dir`

Path to the directory where documentation is written. This is useful for a
subsequent deployment step.

## Example usage

```yaml
name: Docs

on: push

jobs:
  publish:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout
        uses: actions/checkout@v1
      - name: Build
        id: build
        uses: ResearchSoftwareActions/ford-build@v1
      - name: Deploy
        if: success()
        uses: crazy-max/ghaction-github-pages@v1
        with:
          target_branch: gh-pages
          build_dir: ${{ steps.build.outputs.output_dir }}
        env:
          GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
```
