# Release process

- Change version on `pyproject.toml`
- Commit change
- Tag new version: `git tag <version>`
- Push tags: `git push --tags`
- Build: `make build`
- Test upload to [test.pypi.org](https://test.pypi.org): `make upload-testpypi`
- Upload to [pypi.org](https://pypi.org)): `make upload-pypi`
