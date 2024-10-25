# Start with the official Python image
FROM python:3.13

# Set the working directory
WORKDIR /data

# Copy all project files into the container
COPY . .

# Install any missing dependencies
RUN apt-get update && apt-get install -y python3-distutils

# Install project dependencies
RUN pip install -r requirements.txt

# Run migrations
RUN python manage.py migrate

# Expose the port the app will run on
EXPOSE 8000
