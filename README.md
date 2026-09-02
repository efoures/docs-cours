# 📚 docs-cours

![Cours](https://img.shields.io/badge/cours-DevOps-blue) ![Langue](https://img.shields.io/badge/langue-fran%C3%A7ais-green) ![Format](https://img.shields.io/badge/format-markdown_(Mermaid)-purple)

Mes cours en markdown — support d'apprentissage et de révision, construits au fil de mon parcours. Chaque cours est autoporteur : théorie, schémas, scénarios réels, pièges, quiz et exercices **avec scripts de mise en situation prêts à l'emploi**.

## 🗂️ Index des cours

| Cours | Statut | Points clés |
|---|---|---|
| [Git — Le cours complet](git/cours-git.md) | ✅ À jour (sept. 2026) | 24 parties · 14 schémas Mermaid · quiz par section · 5 exercices scriptés · signature GPG/SSH · workflows |
| [Réseaux — Le cours complet](reseaux/cours-reseaux.md) | ✅ À jour (sept. 2026) | 24 parties · 20+ schémas · fil rouge : le lab réel · subnetting · routage · TCP/DNS/NAT · IPv6 · sécurité · méthode de dépannage |
| [Docker — Le cours complet](docker/cours-docker.md) | ✅ À jour (sept. 2026) | 20 parties · layers & images · Dockerfile/BuildKit · volumes · réseau · Compose · sécurité (root, caps, Trivy) · CI/CD · durcissement · fil rouge lab |

### 🛠️ Exercices pratiques

Le dossier [`exercices/`](exercices/) contient un **script de setup par exercice** : il construit l'état initial du scénario (dépôt à conflit, commit fautif, travail « perdu »…), vous n'avez plus qu'à jouer. Idempotents — recommencez autant de fois que besoin.

```bash
cd exercices && bash setup-exo-2.sh
```

## 🗺️ Feuille de route

- [ ] Linux
- [ ] Ansible
- [ ] GIT
- [ ] ELK
- [ ] Terraform

## 📐 Conventions rédactionnelles

- Commandes **modernes** (`git switch` / `git restore`), branche par défaut `main`
- Schémas **Mermaid** (rendus nativement par GitHub), alerts natives (`> [!WARNING]`…)
- **Parcours de lecture** en tête de chaque cours (débutant / praticien / confirmé / révision)
- **Quiz à récupération active** par grande section (réponses en blocs dépliables)
- Exercices **scriptés** dans `exercices/` + corrections dans le cours
- Ancrés dans la pratique : chaque cours relie la théorie au [lab DevOps maison](https://github.com/efoures/labo-devops)
