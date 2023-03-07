FROM python:3.10-slim-buster as python

ARG POETRY_VERSION=1.3.2

ENV \
    PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    PYTHONFAULTHANDLER=1
WORKDIR /app

FROM python as poetry
# Configure Poetry
ENV \
    POETRY_VERSION=$POETRY_VERSION \
    POETRY_HOME="/opt/poetry" \
    POETRY_VIRTUALENVS_IN_PROJECT=true \
    POETRY_NO_INTERACTION=1 \
    POETRY_CACHE_DIR=/opt/.cache

# RUN mkdir $POETRY_HOME
RUN pip3 install poetry

# Install dependencies
COPY poetry.lock pyproject.toml /app/
COPY . /app/

RUN poetry config virtualenvs.create false && poetry install --no-interaction --no-ansi -vvv

#FROM python as runtime
### copy the app over
#COPY --from=poetry /app /app

EXPOSE 8000
# runs the production server
ENTRYPOINT ["poetry", "run"]
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
