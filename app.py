from flask import Flask
app = Flask(__name__)

@app.route("/")
def home():
    # Vous pouvez changer ce texte pour personnaliser votre TP
    return "Version 2 - Déploiement automatique avec Poll SCM!"


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
