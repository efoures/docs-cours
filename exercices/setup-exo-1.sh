#!/usr/bin/env bash
# Exercice 1 — Le premier cycle (init, add, commit, log)
# Voir cours Git §23, exercice 1. Ce script ne fait que créer le dossier vide.
set -euo pipefail
DIR="$HOME/git-exos/exo-1-premier-cycle"
rm -rf "$DIR" && mkdir -p "$DIR"
cd "$DIR"
echo "✅ Environnement prêt : $DIR"
echo "→ Ouvrez le cours §23 exercice 1 et jouez le scénario (git init, add, commit, log)."
