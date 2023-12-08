# Use the official Python image with Alpine Linux as the base image
FROM python:3.8-alpine

# Set the working directory inside the container
WORKDIR /app

# Copy the requirements.txt file to the working directory
COPY requirements.txt .

# Install the Python dependencies from requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Set environment variables
ENV DB_HOST='test.c19gkk3ng7md.ap-south-1.rds.amazonaws.com' \
    DB_USER='root' \
    DB_PASSWORD='Bh101299' \
    DB_NAME='userdata'

# Copy the rest of the application code
COPY . .

# Expose the port that your application will run on
EXPOSE 8000

# Command to run your shell script and then start your Python application
CMD ["python", "app.py"]
