#!/usr/bin/env bash
# Exercice Docker 1 — Vérification d'environnement + le cycle de vie guidé
# Vérifie que Docker est prêt sur la machine, puis rappelle le scénario ex.1.
set -euo pipefail
if ! command -v docker >/dev/null 2>&1; then
  echo "❌ Docker absent — installe-le d'abord (cours §3.1)."
  exit 1
fi
if ! docker info >/dev/null 2>&1; then
  echo "❌ Le daemon ne répond pas (sudo usermod -aG docker \$USER + reconnexion ?)."
  exit 1
fi
echo "✅ Docker opérationnel : $(docker --version)"
echo
echo "=== EXERCICE 1 — Cycle de vie (scénario §19 ex.1) ==="
echo " 1. docker run -d --name web -p 8080:80 nginx:1.27"
echo " 2. curl -sI http://localhost:8080 | head -1"
echo " 3. docker exec -it web sh   → ls /usr/share/nginx/html"
echo " 4. docker logs --tail 5 web → ta requête curl doit y figurer"
echo " 5. docker rm -f web"
echo
echo "Astuce diagnostic permanent : docker ps -a puis docker logs en cas d'arrêt inattendu (§17.2)."
