#!/usr/bin/env bash
# Exercice Réseaux 2 — Entraîneur de subnetting (le script EST l'exercice)
# Génère des questions aléatoires : tu réponds, il corrige. Voir cours §23 ex.2.
set -euo pipefail

RAND=$(( (RANDOM % 256) ))
CASES=(24 25 26 27 28 29 30)
MASK=${CASES[$((RANDOM % ${#CASES[@]}))]}
STEP=$(( 256 >> (MASK - 24) ))
NET=$(( (RAND / STEP) * STEP ))
BCAST=$(( NET + STEP - 1 ))
HOSTS=$(( STEP - 2 ))

echo "=== ENTRAÎNEUR SUBNETTING ==="
echo
echo "Question : où tombe 192.168.56.${RAND}/${MASK} ?"
echo "  1) Adresse du sous-réseau ?"
echo "  2) Adresse de broadcast ?"
echo "  3) Nombre d'hôtes utiles ?"
echo
read -rp "Tes réponses (réseau broadcast hôtes) : " R_NET R_BC R_H
echo
ok=0
[ "$R_NET" = "$NET" ]     && { echo "✅ sous-réseau : $NET"; ok=$((ok+1)); } || echo "❌ sous-réseau : $NET"
[ "$R_BC" = "$BCAST" ]    && { echo "✅ broadcast : $BCAST"; ok=$((ok+1)); } || echo "❌ broadcast : $BCAST"
[ "$R_H" = "$HOSTS" ]     && { echo "✅ hôtes : $HOSTS"; ok=$((ok+1)); } || echo "❌ hôtes : $HOSTS"
echo
echo "Méthode : pas de $STEP → multiples $((MASK)) : $NET est le plus grand multiple ≤ $RAND"
echo "Score : $ok/3 — relance le script pour une nouvelle question (Ctrl+C pour quitter)."
