# Your Solution
FROM python:3.10-slim

WORKDIR /app

# Copy the entire project directory
COPY . .

# Install the dependencies
RUN pip install --no-cache-dir -r inventory_management/requirements.txt

# Set the Python path to include the book_catalog directory
ENV PYTHONPATH=/app/inventory_management

# Expose port 8000
EXPOSE 9000

ENV DATABASE_URL postgresql://db_abdulmueez_user:tRs0ebLvEbmhUza2y1u0WKB9g0zh0yLL@dpg-crv5snlds78s73a8vjpg-a.oregon-postgres.render.com/db_abdulmueez

# Run the FastAPI app with uvicorn
CMD ["uvicorn", "inventory_management.main:app", "--host", "0.0.0.0", "--port","9000"]


