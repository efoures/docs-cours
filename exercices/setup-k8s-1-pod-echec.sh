#!/usr/bin/env bash
# Exercice Kubernetes 1 — 🚨 Le manifest qui ne veut pas se déployer (cours §20.2 ex.1)
# Construit un manifest volontairement cassé : tag d'image inexistant + référence
# à un Secret absent. Le lecteur diagnostique avec kubectl describe.
# Idempotent : rm -rf + recreate.
set -euo pipefail

DIR="$HOME/k8s-exos/exo-1"
rm -rf "$DIR"
mkdir -p "$DIR"
cd "$DIR"

cat > pod-casse.yaml <<'EOF'
apiVersion: v1
kind: Pod
metadata:
  name: pod-casse
  labels:
    app: casse
spec:
  containers:
    - name: web
      image: nginx:1.9999            # ❌ tag inexistant
      env:
        - name: DB_PASSWORD
          valueFrom:
            secretKeyRef:
              name: db-secret        # ❌ Secret non créé
              key: password
EOF

cat > README.md <<'EOF'
# Exercice 1 — Le manifest qui ne veut pas se déployer

```bash
cd ~/k8s-exos/exo-1
kubectl apply -f pod-casse.yaml
kubectl get pod pod-casse           # Pas Ready…
kubectl describe pod pod-casse      # ← LES EVENTS racontent tout
```

Deux problèmes à trouver dans les Events :
1. côté image (tag inexistant) → ImagePullBackOff
2. côté config (Secret absent) → CreateContainerConfigError

Corrigez le manifest + créez le Secret, re-apply jusqu'à Running :

```bash
kubectl create secret generic db-secret --from-literal=password=demo
# corriger le tag dans pod-casse.yaml puis :
kubectl apply -f pod-casse.yaml
```

Voir cours : kubernetes/cours-kubernetes.md §20.2 (ex. 1).
EOF

echo "✅ Environnement prêt : $DIR"
echo "   Sur un cluster (k3s/kind/minikube) : cd $DIR && kubectl apply -f pod-casse.yaml"
