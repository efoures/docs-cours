#!/usr/bin/env bash
# Exercice Docker 5 — Durcissement : rappel du scénario + commande de test prête
# Voir cours Docker §19 ex.5. Le but : produire SOI-MÊME le docker run durci
# (§12) ; ce script vérifie ensuite ton conteneur 'nginx-hard' s'il existe.
set -euo pipefail
if ! docker ps --format '{{.Names}}' 2>/dev/null | grep -qx nginx-hard; then
  cat <<'EOF'
=== EXERCICE 5 — Durcir un conteneur (§19 ex.5) ===
Lance nginx:1.27 avec TOUTES les protections du §12 :
  user non-root (101), cap-drop ALL, read-only, tmpfs /run et /var/cache/nginx,
  limite 256m / 1 cpu, port publié sur 127.0.0.1 uniquement.
Nom obligatoire du conteneur : nginx-hard (pour que ce script puisse vérifier).

Puis relance : bash setup-docker-5-durcissement.sh
EOF
  exit 0
fi

echo "=== VÉRIFICATION de nginx-hard ==="
ok=0
docker inspect -f '{{.Config.User}}' nginx-hard | grep -qv '^0$\|^$' && { echo "✅ non-root"; ok=$((ok+1)); } || echo "❌ user root ou vide"
docker inspect -f '{{.HostConfig.CapDrop}}' nginx-hard | grep -q ALL && { echo "✅ caps droppées"; ok=$((ok+1)); } || echo "❌ caps non droppées"
docker inspect -f '{{.HostConfig.ReadonlyRootfs}}' nginx-hard | grep -q true && { echo "✅ read-only"; ok=$((ok+1)); } || echo "❌ FS inscriptible"
docker inspect -f '{{.HostConfig.Memory}}' nginx-hard | grep -qv '^0$' && { echo "✅ limite mémoire"; ok=$((ok+1)); } || echo "❌ pas de limite mémoire"
docker port nginx-hard 2>/dev/null | grep -q '127.0.0.1' && { echo "✅ port loopback"; ok=$((ok+1)); } || echo "❌ port publié sur 0.0.0.0"
curl -sI http://127.0.0.1:8080 2>/dev/null | head -1 | grep -q 200 && { echo "✅ nginx répond"; ok=$((ok+1)); } || echo "❌ nginx ne répond pas"
echo "Score : $ok/6"
