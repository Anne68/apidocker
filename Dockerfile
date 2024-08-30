# python base image in the container from Docker Hub
FROM python:3.8.12-buster

# copy files to the /app folder in the container
COPY apiannegit.py /app/apiannegit.py
COPY Pipfile /app/Pipfile
COPY Pipfile.lock /app/Pipfile.lock
#COPY model.py /app/model.py
#COPY iris_model.joblib /app/iris_model.joblib


# set the working directory in the container to be /app
WORKDIR /app


# install the packages from the Pipfile in the container
RUN pip install pipenv
RUN pipenv install --system --deploy --ignore-pipfile

# Expose the port the app runs on
EXPOSE 8000

# Define environment variable
ENV PORT 8000


# execute the command python main.py (in the WORKDIR) to start the app
CMD ["gunicorn", "-w", "4", "-k", "uvicorn.workers.UvicornWorker", "fast:app", "--bind", "0.0.0.0:8000"]
