# 🛠️ Exercices — scénarios prêts à l'emploi

Chaque script crée **l'état initial** d'un exercice (ou EST l'exercice interactif).
Lance le script, joue le scénario ; les corrections sont dans les cours (blocs dépliables).

## Git — voir [cours Git §23](../git/cours-git.md#23-exercices-et-scénarios-corrigés)

| Script | Thème |
|---|---|
| `setup-exo-1.sh` | Premier cycle : init, add, commit, log |
| `setup-exo-2.sh` | Branche + résolution de conflit |
| `setup-exo-3.sh` | 🚨 Incident de prod : revert d'un commit poussé |
| `setup-exo-4.sh` | 🚑 Sauvetage au reflog après `reset --hard` |
| `setup-exo-5.sh` | Nettoyage d'historique avant PR (`rebase -i`) |

## Réseaux — voir [cours Réseaux §23](../reseaux/cours-reseaux.md#23-exercices-et-scénarios-corrigés)

| Script | Thème |
|---|---|
| `setup-net-1-recon.sh` | Quiz de reconnaissance de sa machine (questions seules) |
| `setup-net-2-subnetting.sh` | 🎯 **Entraîneur interactif** : questions aléatoires de subnetting, correction immédiate |
| `setup-net-3-dns-panne.sh` | Simulation de panne DNS (namespace isolé Linux) |

## Docker — voir [cours Docker §19](../docker/cours-docker.md#19-exercices-et-scénarios-corrigés)

| Script | Thème |
|---|---|
| `setup-docker-1-premiers-pas.sh` | Vérif d'environnement + scénario du premier conteneur |
| `setup-docker-2-dockerfile.sh` | Dockerfile mal ordonné à optimiser (leçon sur le cache) |
| `setup-docker-3-compose.sh` | Compose incomplet à compléter (healthcheck, depends_on, volume) |
| `setup-docker-5-durcissement.sh` | Vérificateur du conteneur durci (score /6) |

Les exercices 1 (nettoyage d'incident disque) et 4 se jouent directement sur app1 — voir le cours §19.

## Usage

```bash
cd exercices
bash setup-exo-2.sh          # git : crée ~/git-exos/exo-2-conflict
bash setup-net-2-subnetting.sh   # réseaux : quiz interactif
```

Scripts **idempotents** : on peut recommencer autant de fois que nécessaire.

> [!TIP]
> Refait chaque exercice **de mémoire** une semaine plus tard : c'est le meilleur test de révision.
