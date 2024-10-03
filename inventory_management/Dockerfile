# Dockerfile for inventory-management microservice
FROM --platform=linux/amd64 python:3.8-slim

WORKDIR /app

# Copy the current directory contents into the container at /app
COPY ./app /app

# Explicitly copy requirements.txt if it's not in ./app
COPY ./app/requirements.txt /app/

RUN pip install -r requirements.txt

EXPOSE 8000

ENV DATABASE_URL postgresql://db_abdulmueez_user:tRs0ebLvEbmhUza2y1u0WKB9g0zh0yLL@dpg-crv5snlds78s73a8vjpg-a.oregon-postgres.render.com/db_abdulmueez

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
