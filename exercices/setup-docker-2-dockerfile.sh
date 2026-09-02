#!/usr/bin/env bash
# Exercice Docker 2 — Environnement du Dockerfile à optimiser (état initial)
# Voir cours Docker §19 ex.2. Le script crée l'app et le Dockerfile VOLONTAIREMENT
# mal ordonné : à toi de le réordonner (§6.3) et de prouver le gain de cache.
set -euo pipefail
DIR="$HOME/docker-exos/exo-2-dockerfile"
rm -rf "$DIR" && mkdir -p "$DIR"
cd "$DIR"

printf 'flask\n' > requirements.txt
cat > app.py <<'EOF'
from flask import Flask
app = Flask(__name__)

@app.route("/")
def home():
    return "Lab Docker OK\n"

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8000)
EOF

# ❌ Dockerfile volontairement MAL ordonné (COPY tout d'abord)
cat > Dockerfile <<'EOF'
FROM python:3.12-slim
COPY . /app
WORKDIR /app
RUN pip install --no-cache-dir -r requirements.txt
CMD ["python", "app.py"]
EOF

echo "✅ Environnement prêt : $DIR"
echo "   Dockerfile mal ordonné : le build réinstalle pip à CHAQUE changement de app.py."
echo "→ Cours Docker §19 ex.2 : réordonne (stable → changeant), build 2x, prouve le cache."
echo "  docker build -t exo2:1.0 . && touch app.py && docker build -t exo2:1.1 ."
