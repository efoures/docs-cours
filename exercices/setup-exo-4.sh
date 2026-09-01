#!/usr/bin/env bash
# Exercice 4 — Sauvetage au reflog (le script commette, puis "perd" le travail)
# Voir cours Git §23, exercice 4. Le script fait déjà les étapes 1 et 2 :
# à vous de faire l'étape 3 (le sauvetage).
set -euo pipefail
DIR="$HOME/git-exos/exo-4-reflog"
rm -rf "$DIR" && mkdir -p "$DIR"
cd "$DIR"
git init -q -b main
echo "base" > base.txt && git add . && git commit -qm "chore: base"
echo "mon travail de 3 heures" > tresor.txt
git add tresor.txt && git commit -qm "feat: travail de 3 heures"
git reset -q --hard HEAD~1     # 💥 le travail "disparaît"
echo "✅ Environnement prêt : $DIR"
echo "   Le commit contenant tresor.txt vient d'être 'perdu' (reset --hard)."
echo "→ Ouvrez le cours §23 exercice 4 : retrouvez-le avec git reflog et restaurez-le."
