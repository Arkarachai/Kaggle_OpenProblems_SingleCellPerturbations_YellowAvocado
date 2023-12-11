# Use an official Python runtime as a parent image
FROM python:3.8

# Set the working directory in the container
WORKDIR /app

# Copy the local requirements.txt file to the container
COPY requirements-dev.txt /app/

# Install any needed packages specified in requirements.txt
RUN pip install --upgrade pip && \
    pip install -r requirements-dev.txt

# Copy the local Python script into the container
COPY yellow_avocado.ipynb /app/

# Expose the port that Jupyter Notebook will run on
EXPOSE 8888

# Command to run Jupyter Notebook (change the notebook name if needed)
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--no-browser", "--allow-root", "--NotebookApp.token="]
