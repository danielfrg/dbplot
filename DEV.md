## Environment

This project uses [poetry](https://poetry.eustace.io/).
Create the development environment:

```
make dev
```

## Test

The project includes a docker based test environment, build it and run it with:

```
make docker-images
make postgres-data
```

Then you should be able to run examples and develop easier.
