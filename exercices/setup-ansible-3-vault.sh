#!/usr/bin/env bash
# Exercice Ansible 3 — Les secrets sous Vault (cours §20.2 ex.3)
# Fournit le playbook qui utilise un secret : le lecteur le chiffre avec
# ansible-vault encrypt_string, crée le vault.yml, exécute avec --ask-vault-pass.
# Idempotent : rm -rf + recreate.
set -euo pipefail

DIR="$HOME/ansible-exos/exo-3"
rm -rf "$DIR"
mkdir -p "$DIR/group_vars/all"
cd "$DIR"

cat > hosts.ini <<'EOF'
localhost ansible_connection=local
EOF

cat > site.yml <<'EOF'
---
- name: Création d'un utilisateur applicatif
  hosts: localhost
  gather_facts: false
  tasks:
    - name: Utilisateur applicatif créé
      ansible.builtin.user:
        name: appuser-exo3
        password: "{{ db_password | password_hash('sha512') }}"
        state: present
      become: true
      no_log: true
EOF

mkdir -p group_vars/all
cat > group_vars/all/README.md <<'EOF'
# À faire : créer le secret chiffré ici

```bash
ansible-vault encrypt_string 'MonMotDePasseExo3' --name 'db_password' >> group_vars/all/vault.yml
ansible-playbook -i hosts.ini site.yml --ask-vault-pass
```

Puis vérifiez avec `ansible-playbook -i hosts.ini site.yml -v --ask-vault-pass`
que le mot de passe n'apparaît PAS dans la sortie (effet de no_log).
Voir cours : ansible/cours-ansible.md §20.2 (ex. 3).
EOF

echo "✅ Environnement prêt : $DIR"
echo "   Sur WSL/Linux :"
echo "   cd $DIR"
echo "   ansible-vault encrypt_string 'MonMotDePasseExo3' --name 'db_password' > group_vars/all/vault.yml"
echo "   ansible-playbook -i hosts.ini site.yml --ask-vault-pass"
