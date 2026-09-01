#!/usr/bin/env bash
# Exercice 2 — Branche et conflit (état initial : dépôt + config.txt avec prix=100)
# Voir cours Git §23, exercice 2.
set -euo pipefail
DIR="$HOME/git-exos/exo-2-conflict"
rm -rf "$DIR" && mkdir -p "$DIR"
cd "$DIR"
git init -q -b main
echo "prix = 100" > config.txt
echo "# Projet boutique" > README.md
git add . && git commit -qm "chore: initialisation du projet"
echo "✅ Environnement prêt : $DIR (dépôt initialisé, config.txt : prix = 100)"
echo "→ Ouvrez le cours §23 exercice 2 : créez feature/tva et provoquez le conflit."
