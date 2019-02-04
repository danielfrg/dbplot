# Release process

- Tag new version: `git tag 1.0.0`
- Change version on `pyproject.toml`
- Push tags: `git push --tags`
- Build: `make build`
- Test upload to [test.pypi.org](https://test.pypi.org): `make upload-testpypi`
- Upload to Pypi: `make upload-pypi`

