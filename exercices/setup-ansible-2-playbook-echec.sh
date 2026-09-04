#!/usr/bin/env bash
# Exercice Ansible 2 — 🚨 Incident : le playbook qui échoue à moitié (cours §20.2 ex.2)
# Construit un playbook avec un paquet inexistant + un inventaire localhost ;
# le lecteur exécute, observe le comportement d'échec partiel, puis répare.
# Idempotent : rm -rf + recreate.
set -euo pipefail

DIR="$HOME/ansible-exos/exo-2"
rm -rf "$DIR"
mkdir -p "$DIR"
cd "$DIR"

cat > hosts.ini <<'EOF'
[web]
web-01 ansible_host=127.0.0.1 ansible_connection=local
web-02 ansible_host=127.0.0.1 ansible_connection=local

[db]
db-01 ansible_host=127.0.0.1 ansible_connection=local
EOF

cat > site.yml <<'EOF'
---
- name: Déploiement applicatif
  hosts: web
  gather_facts: false
  tasks:
    - name: Paquet de base installé
      ansible.builtin.apt:
        name: curl
        state: present
      become: true

    - name: Paquet tiers installé
      ansible.builtin.apt:
        name: paquet-fantome-exo-2
        state: present
      become: true

    - name: Config applicative déployée
      ansible.builtin.copy:
        content: "env=production\n"
        dest: /tmp/exo-2-app.conf
        mode: "0644"
EOF

cat > README.md <<'EOF'
# Exercice 2 — Incident : playbook en échec partiel

Sur un nœud de contrôle Linux/WSL avec ansible-core installé (lancez le setup
et le playbook dans le même environnement) :

```bash
cd ~/ansible-exos/exo-2
ansible-playbook -i hosts.ini site.yml
```

Observations attendues :
- `paquet-fantome-exo-2` échoue (n'existe pas) → l'hôte est retiré du play ;
- les tâches suivantes passent en `skipping` pour cet hôte ;
- le PLAY RECAP montre `failed=1`.

Réparez proprement (cours §20.2 ex.2 : 3 solutions, de la pire à la meilleure) :
1. ignore_errors — pourquoi est-ce le pire ?
2. when — conditionner
3. block/rescue — gérer l'erreur avec trace
Comparez avec la correction du cours.
EOF

echo "✅ Environnement prêt : $DIR"
echo "   Sur WSL/Linux : cd $DIR && ansible-playbook -i hosts.ini site.yml"
