# Dynamic website example

## Installation

```
poetry install
```

##  Launch

```
poetry run uvicorn api.main:app --reload
```

By default, the application wil now be running at http://localhost:8000.

If, for some reason, the port `8000` is already in use then you can choose your own port with, for example:

```
poetry run uvicorn api.main:app --reload --port=8001
```