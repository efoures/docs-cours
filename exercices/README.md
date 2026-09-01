# 🛠️ Exercices Git — scénarios prêts à l'emploi

Chaque script crée **l'état initial** d'un exercice du [cours Git](../git/cours-git.md#23-exercices-et-scénarios-corrigés).
Lancez le script, ouvrez le cours à l'exercice correspondant, et jouez le scénario. Les corrections sont dans le cours (blocs dépliables).

| Script | Exercice | Thème |
|---|---|---|
| `setup-exo-1.sh` | Exercice 1 | Premier cycle : init, add, commit, log |
| `setup-exo-2.sh` | Exercice 2 | Branche + résolution de conflit |
| `setup-exo-3.sh` | Exercice 3 🚨 | Incident de prod : revert d'un commit poussé |
| `setup-exo-4.sh` | Exercice 4 🚑 | Sauvetage au reflog après `reset --hard` |
| `setup-exo-5.sh` | Exercice 5 | Nettoyage d'historique avant PR (`rebase -i`) |

## Usage

```bash
cd exercices
bash setup-exo-2.sh       # crée le dossier ~/git-exos/exo-2-conflict et s'y place
# ... jouer l'exercice (voir cours §23) ...
```

Chaque script est **idempotent** : il supprime et recrée son dossier d'exercice à chaque exécution, donc on peut recommencer autant de fois que nécessaire.

> [!TIP]
> Refait chaque exercice **de mémoire** une semaine plus tard : c'est le meilleur test de révision.
