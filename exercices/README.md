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

Les exercices 4 et 5 du cours réseau (captures tcpdump, DMZ dans le lab) se jouent directement sur tes VMs — voir le cours.

## Usage

```bash
cd exercices
bash setup-exo-2.sh          # git : crée ~/git-exos/exo-2-conflict
bash setup-net-2-subnetting.sh   # réseaux : quiz interactif
```

Scripts **idempotents** : on peut recommencer autant de fois que nécessaire.

> [!TIP]
> Refait chaque exercice **de mémoire** une semaine plus tard : c'est le meilleur test de révision.
