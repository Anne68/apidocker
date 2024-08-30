# Use an official Python runtime as a parent image
FROM python:3.10.6-buster

# Set the working directory in the container
WORKDIR /app

# Copy the Pipfile and Pipfile.lock to the container
COPY Pipfile Pipfile.lock /app/

# Install pipenv and the dependencies from the Pipfile
RUN pip install pipenv
RUN pipenv install --system --deploy --ignore-pipfile

# Copy the rest of the application code to the container
COPY apiannegit.py /app/apiannegit.py
#COPY model.py /app/model.py
#COPY iris_model.joblib /app/iris_model.joblib

# Expose the port the app runs on
EXPOSE 8000

# Define environment variable
ENV PORT 8000

# Run the application using uvicorn
CMD ["uvicorn", "apiannegit:app", "--host", "0.0.0.0", "--port", "8000"]
