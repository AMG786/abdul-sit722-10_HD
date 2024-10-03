FROM python:3.10-slim

WORKDIR /app

# Copy all contents to /app directory in the container
COPY . .

# Install dependencies
RUN pip install --no-cache-dir -r app/requirements.txt

# Set the PYTHONPATH to the book_catalog directory
ENV PYTHONPATH=/app/book_catalog

# Expose the port for the FastAPI app
EXPOSE 8000

# PostgreSQL environment variable
ENV DATABASE_URL postgresql://db_abdulmueez_user:tRs0ebLvEbmhUza2y1u0WKB9g0zh0yLL@dpg-crv5snlds78s73a8vjpg-a.oregon-postgres.render.com/db_abdulmueez

# Run the FastAPI app with uvicorn
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]
