# Dynamic website example

## Installation

```sh
poetry install
```

## Launch

```sh
poetry run uvicorn api.main:app --reload --port=8000
```

The application wil now be running at
[`http://localhost:8000`](http://localhost:8000).

Note that you should _not_ try to open `index.html`, which will not work.
