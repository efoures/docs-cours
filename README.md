# 📚 docs-cours

![Cours](https://img.shields.io/badge/cours-DevOps-blue) ![Langue](https://img.shields.io/badge/langue-fran%C3%A7ais-green) ![Format](https://img.shields.io/badge/format-markdown_(Mermaid)-purple)

Mes cours DevOps / DevSecOps en markdown — support d'apprentissage et de révision, construits au fil de mon parcours. Chaque cours est autoporteur : théorie, schémas, scénarios réels, pièges, quiz et exercices **avec scripts de mise en situation prêts à l'emploi**.

## 🗂️ Index des cours

| Cours | Statut | Points clés |
|---|---|---|
| [Git — Le cours complet](git/cours-git.md) | ✅ À jour (sept. 2026) | 24 parties |

### 🛠️ Exercices pratiques

Le dossier [`exercices/`](exercices/) contient un **script de setup par exercice** : il construit l'état initial du scénario (dépôt à conflit, commit fautif, travail « perdu »…), vous n'avez plus qu'à jouer. Idempotents — recommencez autant de fois que besoin.

```bash
cd exercices && bash setup-exo-2.sh
```

## 🗺️ Feuille de route

- [ ] Linux
- [ ] Réseaux
- [ ] Docker
- [ ] Ansible
- [ ] GitLab CI
- [ ] ELK
- [ ] DevSecOps

## 📐 Conventions rédactionnelles

- Commandes **modernes** (`git switch` / `git restore`), branche par défaut `main`
- Schémas **Mermaid** (rendus nativement par GitHub), alerts natives (`> [!WARNING]`…)
- **Parcours de lecture** en tête de chaque cours (débutant / praticien / confirmé / révision)
- **Quiz à récupération active** par grande section (réponses en blocs dépliables)
- Exercices **scriptés** dans `exercices/` + corrections dans le cours
- Ancrés dans la pratique : chaque cours relie la théorie au [lab DevOps maison](https://github.com/efoures/labo-devops)
