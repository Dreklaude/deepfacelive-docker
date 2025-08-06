FROM nvidia/cuda:12.1.0-cudnn8-runtime-ubuntu20.04

# Variables d'environnement
ENV DEBIAN_FRONTEND=noninteractive
ENV PYTHONUNBUFFERED=1

# Mise à jour et installation de dépendances système
RUN apt-get update && apt-get install -y \
    python3.8 \
    python3-pip \
    git \
    wget \
    unzip \
    libgl1-mesa-glx \
    libglib2.0-0 \
    ffmpeg && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Définir python par défaut
RUN ln -s /usr/bin/python3.8 /usr/bin/python

# Création du dossier de travail
WORKDIR /workspace

# Copier les fichiers du projet
COPY . .

# Installer les dépendances Python
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# Commande par défaut (à ajuster si besoin)
CMD ["python", "main.py"]
