# Dockerfile

# Use official python runtime as the parent image
FROM python:3.12

# Allows docker to cache installed dependencies between builds
COPY requirements.txt requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Mount application code to the image, Make sure you slashes match which OS you are using.
COPY . code
WORKDIR /code 

EXPOSE 8000

# Run the production server
ENTRYPOINT [ "python", "manage.py" ]
CMD [ "runserver", "0.0.0.0:8000" ]
