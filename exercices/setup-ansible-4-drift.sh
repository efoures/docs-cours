#!/usr/bin/env bash
# Exercice Ansible 4 — 🚨 La dérive de configuration (cours §20.2 ex.4)
# Construit l'état dérivé : un playbook gère /etc/motd (fichier sandbox ici),
# mais quelqu'un l'a modifié à la main. Le lecteur détecte, converge, rejoue.
# Idempotent : rm -rf + recreate.
set -euo pipefail

DIR="$HOME/ansible-exos/exo-4"
rm -rf "$DIR"
mkdir -p "$DIR"
cd "$DIR"

# « /etc/motd » simulé : un fichier sandbox, pour ne toucher au système que via localhost
TARGET="$DIR/motd-simulation"
echo "Welcome to prod-server-01" > "$TARGET"
echo "Managed by Ansible - DO NOT EDIT" >> "$TARGET"

# La « dérive » : quelqu'un a modifié le fichier à la main
echo "# modif faite a la main en urgence le vendredi soir" >> "$TARGET"
echo "alias ll='ls -la'   # hack pour debug" >> "$TARGET"

cat > hosts.ini <<'EOF'
localhost ansible_connection=local
EOF

cat > site.yml <<'EOF'
---
- name: Convergence du banner
  hosts: localhost
  gather_facts: false
  tasks:
    - name: Banner géré par Ansible
      ansible.builtin.copy:
        content: |
          Welcome to prod-server-01
          Managed by Ansible - DO NOT EDIT
        dest: %s
        mode: "0644"
EOF
# Injection du chemin réel (variable, pas de heredoc dans le YAML)
sed -i "s|%s|$(printf '%s' "$TARGET" | sed 's/[&/\]/\\&/g')|" site.yml

cat > README.md <<'EOF'
# Exercice 4 — La dérive de configuration

Le fichier `motd-simulation` a été modifié à la main (« en urgence, le vendredi soir »).

> [!IMPORTANT]
> Lancez le **setup et le playbook dans le même environnement** (WSL ou Linux) : le chemin du fichier géré est inscrit en dur dans `site.yml` au moment du setup.

```bash
cd ~/ansible-exos/exo-4
ansible-playbook -i hosts.ini site.yml --check --diff   # 1. détecter la dérive
ansible-playbook -i hosts.ini site.yml                  # 2. converger
ansible-playbook -i hosts.ini site.yml --check --diff   # 3. vérifier : 0 changed
```

Questions :
1. Que montre le --diff exactement ?
2. Pourquoi la 3e commande affiche-t-elle changed=0 ?
3. Quelle parade structurelle empêcherait la dérive de s'installer ?

Voir cours : ansible/cours-ansible.md §20.2 (ex. 4).
EOF

echo "✅ Environnement prêt : $DIR"
echo "   Sur WSL/Linux : cd $DIR && ansible-playbook -i hosts.ini site.yml --check --diff"
