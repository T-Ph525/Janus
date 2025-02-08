# Use an official Python runtime as a parent image
FROM python:3.9-slim

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install any needed packages specified in requirements.txt
# If there is no requirements.txt, you can manually specify the dependencies
# RUN pip install --no-cache-dir -r requirements.txt

# Install necessary packages
RUN pip install torch transformers

# Copy the inference script into the container
COPY inference.py /app/inference.py

# Make port 80 available to the world outside this container
EXPOSE 80

# Define environment variable
ENV NAME World

# Run inference.py when the container launches
CMD ["python", "inference.py"]
