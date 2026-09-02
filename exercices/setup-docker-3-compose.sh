#!/usr/bin/env bash
# Exercice Docker 3 — Socle Compose app + BDD (état initial à compléter)
# Voir cours Docker §19 ex.3. Le compose fourni MANQUE : healthcheck,
# condition service_healthy et volume nommé — à toi de les ajouter (§9).
set -euo pipefail
DIR="$HOME/docker-exos/exo-3-compose"
rm -rf "$DIR" && mkdir -p "$DIR"
cd "$DIR"

cat > compose.yaml <<'EOF'
services:
  db:
    image: postgres:16
    environment:
      POSTGRES_PASSWORD: secret
      POSTGRES_DB: app
    # TODO 1 : ajouter un healthcheck (pg_isready, §9.1)
  web:
    image: python:3.12-slim
    command: python -c "import socket,time
for i in range(30):
    try:
        print('db =', socket.gethostbyname('db'), flush=True); break
    except socket.gaierror:
        time.sleep(1)
else:
    print('ECHEC : db non resolvable', flush=True)
import signal; signal.pause()"
    # TODO 2 : ajouter depends_on avec condition: service_healthy
    # TODO 3 : ajouter un volume nommé pgdata sur /var/lib/postgresql/data (db ET section volumes)
volumes:
  pgdata:
EOF

echo "✅ Environnement prêt : $DIR"
echo "   compose.yaml incomplet (healthcheck + depends_on healthy à ajouter)."
echo "→ Cours Docker §19 ex.3 : complète, puis :"
echo "  docker compose up -d && docker compose logs web   # 'db = 172.x.x.x' attendu"
