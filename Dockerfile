# Use the official Python image with version 3.10
FROM python:3.9.13

# Set the working directory in the container
WORKDIR /app

# Copy the requirements.txt file into the container at /app
COPY requirements.txt /app/

# Install any dependencies specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

RUN pip install gunicorn

# Copy the current directory contents into the container at /app
COPY . /app/

# Run your Python script
CMD ["sh", "-c", "celery -A gavel:celery worker & python initialize.py && python runserver.py"]
