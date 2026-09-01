#!/usr/bin/env bash
# Exercice Réseaux 1 — Reconnaissance de sa machine : affiche le quiz, pas les réponses
# Voir cours §23 ex.1. Ce script affiche les questions ; les commandes de la
# correction sont dans le cours (bloc dépliable).
set -euo pipefail
cat <<'EOF'
=== EXERCICE — Reconnaissance de ta machine ===
Sur ta VM (app1 conseillée), réponds à ces questions AVEC la commande qui le prouve :

 1. Combien d'interfaces ai-je ? Leurs états ?                    (couches 1-2)
 2. Quelles sont mes adresses MAC ? À quel fabricant appartiennent-elles ?
 3. Mes adresses IP et leurs réseaux ? Masques ?
 4. Quelle est ma passerelle ? Sur quelle interface ?
 5. Quelle route prendrais-je vers 192.168.56.11 ? Vers 8.8.8.8 ?
 6. Quels voisins ARP ai-je en cache ?
 7. Quels services écoutent sur ma machine ?

Correction : cours Réseaux §23, exercice 1 (bloc dépliable).
Indice : tout se fait avec `ip` et `ss` — quatre commandes suffisent.
EOF
