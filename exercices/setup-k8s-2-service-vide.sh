#!/usr/bin/env bash
# Exercice Kubernetes 2 — 🚨 Le Service muet (cours §20.2 ex.2)
# Construit un Deployment sain + un Service dont le selector ne matche PAS
# les labels des Pods : la chaîne Service→Pods est cassée.
# Idempotent : rm -rf + recreate.
set -euo pipefail

DIR="$HOME/k8s-exos/exo-2"
rm -rf "$DIR"
mkdir -p "$DIR"
cd "$DIR"

cat > deploy.yaml <<'EOF'
apiVersion: apps/v1
kind: Deployment
metadata:
  name: web
spec:
  replicas: 1
  selector:
    matchLabels:
      app: webapp
  template:
    metadata:
      labels:
        app: webapp          # ← les Pods portent CE label
    spec:
      containers:
        - name: nginx
          image: nginx:1.27
          ports:
            - containerPort: 80
EOF

cat > svc.yaml <<'EOF'
apiVersion: v1
kind: Service
metadata:
  name: web-svc
spec:
  selector:
    app: web                 # ❌ ne matche PAS les Pods (webapp)
  ports:
    - port: 80
      targetPort: 80
EOF

cat > README.md <<'EOF'
# Exercice 2 — Le Service muet

```bash
cd ~/k8s-exos/exo-2
kubectl apply -f .
kubectl get pod                        # le Pod est 1/1 Running
kubectl get endpoints web-svc          # <none> ← LE symptôme
kubectl run tmp --rm -it --image=curlimages/curl -- curl -m 3 http://web-svc
```

Le maillon cassé est entre le Service et les Pods : comparez
`kubectl get pod --show-labels` et le selector de svc.yaml.

Corrigez svc.yaml, re-apply, et revérifiez endpoints + curl.

Voir cours : kubernetes/cours-kubernetes.md §20.2 (ex. 2) et §6.3.
EOF

echo "✅ Environnement prêt : $DIR"
echo "   Sur un cluster (k3s/kind/minikube) : cd $DIR && kubectl apply -f ."
