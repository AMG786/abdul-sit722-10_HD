# Dockerfile for book-catalog microservice
# Use an official Python runtime as a parent image
FROM --platform=linux/amd64 python:3.8-slim

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY ./app /app

# Install any needed packages specified in requirements.txt
RUN pip install -r requirements.txt

# Make port 8000 available to the world outside this container
EXPOSE 8000

# Define environment variable
ENV DATABASE_URL postgresql://db_abdulmueez_user:tRs0ebLvEbmhUza2y1u0WKB9g0zh0yLL@dpg-crv5snlds78s73a8vjpg-a.oregon-postgres.render.com/db_abdulmueez

# Run the application
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]