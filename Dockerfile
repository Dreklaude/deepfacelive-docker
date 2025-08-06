FROM nvidia/cuda:11.7.1-cudnn8-runtime-ubuntu20.04

ENV DEBIAN_FRONTEND=noninteractive

# Install basic dependencies
RUN apt-get update && apt-get install -y \
    python3.8 \
    python3-pip \
    git \
    ffmpeg \
    libsm6 \
    libxext6 \
    libgl1-mesa-glx \
    && apt-get clean

RUN ln -s /usr/bin/python3.8 /usr/bin/python

# Set working directory
WORKDIR /app

# Copy all local files
COPY . .

# Install Python dependencies
RUN pip install --upgrade pip
RUN pip install -r build/requirements-colab.txt

# Expose port if needed
EXPOSE 7860

# Default command
CMD ["python", "main.py"]
