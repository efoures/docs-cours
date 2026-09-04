#!/usr/bin/env bash
# Exercice Ansible 1 — L'inventaire et les groupes (cours §20.2 ex.1)
# Construit un squelette d'inventaire à compléter : groupes web, db, prod.
# Idempotent : rm -rf + recreate.
set -euo pipefail

DIR="$HOME/ansible-exos/exo-1"
rm -rf "$DIR"
mkdir -p "$DIR"
cd "$DIR"

cat > inventory.ini <<'EOF'
# ============================================
# À COMPLÉTER : groupes web, db, prod
# ============================================
# web : web-01 (192.168.56.21), web-02 (192.168.56.22)
# db  : db-01 (192.168.56.31)
# prod : groupe parent de web + db
#
# Aide (format INI) :
#   [groupe]
#   hote ansible_host=IP
#   [parent:children]
#   sous_groupe
EOF

cat > README.md <<'EOF'
# Exercice 1 — L'inventaire et les groupes

Complétez `inventory.ini` (groupes web / db / prod), puis vérifiez :

```bash
ansible-inventory -i inventory.ini --graph
ansible prod -i inventory.ini -m ping   # 3 hôtes si vos VMs existent
ansible web-02 -i inventory.ini -m ping # pattern d'hôte unique
```

Sans VMs réelles, `--graph` suffit à valider la structure.
Voir cours : ansible/cours-ansible.md §20.2 (ex. 1) — correction dépliable.
EOF

echo "✅ Environnement prêt : $DIR"
echo "   Ouvrez inventory.ini et complétez les 3 groupes, puis :"
echo "   ansible-inventory -i inventory.ini --graph"
