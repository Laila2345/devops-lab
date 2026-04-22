# Utiliser une image Python légère
FROM python:3.10-slim

# Définir le dossier de travail dans le conteneur
WORKDIR /app

# Copier le fichier des dépendances et les installer
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copier le code de l'application
COPY app.py .

# Exposer le port 5000 (celui utilisé par Flask)
EXPOSE 5000

# Lancer l'application
CMD ["python", "app.py"] 