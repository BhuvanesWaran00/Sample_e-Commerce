# Use the official Python image with Alpine Linux as the base image
FROM python:3.8.12-alpine3.14

# Set the working directory inside the container
WORKDIR /app

# Copy the requirements.txt file to the working directory
COPY requirements.txt .

# Install the Python dependencies from requirements.txt
RUN pip install --no-cache-dir -r requirements.txt && \
    rm requirements.txt

# Create a non-root user
RUN adduser -D myuser

# Switch to the non-root user
USER myuser

# Set environment variables
ENV DB_HOST='test.c19gkk3ng7md.ap-south-1.rds.amazonaws.com' \
    DB_USER='root' \
    DB_PASSWORD='Bh101299' \
    DB_NAME='userdata'

# Copy the rest of the application code
COPY . .

# Expose the port that your application will run on
EXPOSE 8000

# Healthcheck
HEALTHCHECK --interval=5s --timeout=3s \
  CMD curl -f http://localhost:8000/ || exit 1

# Metadata
LABEL maintainer="Your Name <your.email@example.com>" \
      version="1.0" \
      description="Your application description"

# Command to run your shell script and then start your Python application
CMD ["python", "app.py"]
