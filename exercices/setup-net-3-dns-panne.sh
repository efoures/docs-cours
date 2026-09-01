#!/usr/bin/env bash
# Exercice Réseaux 3 — Simulation de diagnostic DNS (sans casser sa VM)
# Lance ce script : il détecte ta résolution actuelle et simule la panne du
# scénario §23 ex.3 dans un namespace réseau isolé (nécessite unshare, Linux).
# Sur macOS/Windows : lis simplement le scénario dans le cours et joue-le dans une VM jetable.
set -euo pipefail
if ! command -v unshare >/dev/null 2>&1; then
  echo "unshare indisponible ici — joue le scénario §23 ex.3 dans une VM jetable."
  echo "(Le principe : casser /etc/resolv.conf et suivre la cascade du §21.)"
  exit 0
fi
cat <<'EOF'
=== PANNE SIMULÉE (namespace isolé — ta machine n'est pas touchée) ===
Dans le namespace lancé ci-dessous :
  - le réseau fonctionne (ping 1.1.1.1 OK)
  - mais le DNS pointe vers un serveur mort (192.0.2.99)

À toi : diagnostique avec la cascade (§21) et répare DANS le namespace.

Commandes de départ :
  unshare -n bash       # puis, DANS le namespace :
  ip link set lo up
  ip link set eth0 up 2>/dev/null || true
  echo "nameserver 192.0.2.99" > /etc/resolv.conf
  ping -c1 1.1.1.1       # ✅ passe
  dig +short debian.org  # ❌ timeout — pourquoi ? (§21.3)
EOF
