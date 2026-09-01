#!/usr/bin/env bash
# Exercice 3 — Incident de prod : un commit poussé a supprimé config/production.yml
# Voir cours Git §23, exercice 3.
set -euo pipefail
DIR="$HOME/git-exos/exo-3-incident"
rm -rf "$DIR" && mkdir -p "$DIR"
cd "$DIR"
git init -q -b main
mkdir config
cat > config/production.yml <<'EOF'
app:
  host: 0.0.0.0
  port: 8080
db:
  url: postgres://app:***@db-prod:5432/app
EOF
echo "# Mon app" > README.md
git add . && git commit -qm "feat: configuration de production"
echo "# changelog" > CHANGELOG.md && git add . && git commit -qm "docs: ajout du changelog"
git rm -q config/production.yml
git commit -qm "chore: nettoyage"   # ← le commit FAUTIF (déjà "poussé" dans le scénario)
echo "✅ Environnement prêt : $DIR"
echo "   Le commit fautif est le dernier (suppression de config/production.yml)."
echo "→ Ouvrez le cours §23 exercice 3 : annulez SANS réécrire l'historique."
