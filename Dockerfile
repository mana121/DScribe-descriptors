FROM continuumio/miniconda3

# Install mamba
# RUN conda install -n base -c conda-forge mamba

# Copy the environment file
COPY environment.yml /tmp/environment.yml

# Create the environment with a specific name
RUN conda env create -f /tmp/environment.yml

# Set default shell to activate the environment
SHELL ["conda", "run", "-n", "MATERIALS", "/bin/bash", "-c"]

# Install Jupyter (if not in environment.yml)
RUN conda run -n MATERIALS pip install jupyter

# Set working directory
WORKDIR /workspace

# Start Jupyter
CMD ["conda", "run", "-n", "MATERIALS", "jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root", "--NotebookApp.token=''"]
