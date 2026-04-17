# Use SageMath (force amd64 so it also works on Apple Silicon Macs)
FROM --platform=linux/amd64 sagemath/sagemath:latest

# Work inside /app in the container - creates folder inside container
WORKDIR /app

# Copy the repository contents into the container - copy repo contents into container
COPY . /app

# Install Python packages needed in notebooks 
RUN sage -python -m pip install --no-cache-dir \
    numpy \
    scipy \
    matplotlib \
    notebook

# Expose the Jupyter port - required for browser access to jupyter notebooks
EXPOSE 8888

# Start Jupyter Notebook with the Sage kernel
CMD ["sage", "-n", "jupyter", "--ip=0.0.0.0", "--no-browser", "--NotebookApp.token="]