#!/usr/bin/env bash
# Exercice 5 — Nettoyage avant PR : 4 commits à sculpter avec rebase -i
# Voir cours Git §23, exercice 5.
set -euo pipefail
DIR="$HOME/git-exos/exo-5-rebase"
rm -rf "$DIR" && mkdir -p "$DIR"
cd "$DIR"
git init -q -b main
echo "# Projet API" > README.md && git add . && git commit -qm "chore: initialisation"
git switch -qc feature/api
echo "def get_clients(): ..." > api.py
git add . && git commit -qm "feat: API clients"                        # A (bon)
echo "# TODO lisser" >> api.py
git add . && git commit -qam "fix typo"                                # B (à absorber)
echo "debug tmp" > tmp.txt
git add . && git commit -qm "wip"                                      # C (à jeter)
echo "def get_clients(page=1): ..." > api.py && git rm -q --cached tmp.txt >/dev/null
rm -f tmp.txt
git add . && git commit -qm "feat: pagination + cleanup"               # D (fini)
echo "✅ Environnement prêt : $DIR (branche feature/api, 4 commits à retravailler)"
echo "→ git log --oneline pour voir A, B, C, D — puis cours §23 exercice 5."
