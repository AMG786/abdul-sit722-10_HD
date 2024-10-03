# Dockerfile for inventory-management microservice
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
ENV DATABASE_URL postgresql://tamim_shahriar_sit722_part5_user:uHoCv6IsSXNapYodbDBnIxo6wA6rNLh3@dpg-crjoaqd2ng1s73fis4c0-a.oregon-postgres.render.com/tamim_shahriar_sit722_part5

# Run the application
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]