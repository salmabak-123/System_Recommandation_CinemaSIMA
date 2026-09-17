# CinemaSIMA - Système Expert de Recommandation de Films et Séries

##  Description du Projet

CinemaSIMA est un système expert développé en Prolog pour recommander des films et séries basé sur les préférences utilisateur. Le système utilise une approche symbolique avec des règles explicites pour générer des recommandations personnalisées et explicables.


##  Objectifs

- Modéliser un raisonnement explicable pour la recommandation de contenu
- Implémenter un système expert en Prolog avec une base de connaissances de 30+ contenus
- Créer une interface web professionnelle pour interagir avec le système
- Fournir des explications détaillées pour chaque recommandation

##  Structure du Projet

```
CinemaSIMA/
├── cinemasima.pl          # Code Prolog (système expert)
├── index.html             # Interface web
├── README.md              # Ce fichier
└── Rapport.pdf            # Rapport détaillé (à générer)
```

##  Installation et Utilisation

### Prérequis

- **SWI-Prolog** (version 8.0 ou supérieure)
  - Installation : https://www.swi-prolog.org/Download.html
  - Commande pour vérifier : `swipl --version`

- **Navigateur web moderne** (Chrome, Firefox, Safari, Edge)

### Utilisation du Système Prolog

1. **Ouvrir SWI-Prolog:**
   ```bash
   swipl
   ```

2. **Charger le fichier:**
   ```prolog
   ?- [cinemasima].
   ```

3. **Tester le système:**

   **Test 1: Films Science-Fiction**
   ```prolog
   ?- test_scifi.
   ```

   **Test 2: Séries Comédie**
   ```prolog
   ?- test_comedy_series.
   ```

4. **Utilisation interactive:**

   ```prolog
   % Initialiser les préférences
   ?- init_preferences.
   
   % Ajouter des genres préférés
   ?- add_genre_preference(sci_fi).
   ?- add_genre_preference(action).
   
   % Définir les contraintes
   ?- set_max_duration(180).
   ?- set_min_year(2000).
   ?- set_content_type(film).
   
   % Ajouter des acteurs à éviter (optionnel)
   ?- add_banned_actor('Nicolas Cage').
   
   % Générer les recommandations
   ?- generate_recommendations(Recs).
   ```

### Utilisation de l'Interface Web

1. **Ouvrir le fichier index.html** dans un navigateur web
2. **Sélectionner vos préférences:**
   - Choisir entre Films ou Séries
   - Sélectionner au moins un genre (obligatoire)
   - Définir la durée maximale et l'année minimale
   - Optionnellement: ajouter acteurs/réalisateurs préférés ou bannis

3. **Cliquer sur "Générer"** pour obtenir les recommandations
4. **Consulter les résultats:**
   - Top 5 recommandations classées par score
   - Explications détaillées pour chaque recommandation
   - Avertissements si contraintes non respectées

##  Fonctionnalités

### Système Expert (Prolog)

-  Base de connaissances: 20 films + 10 séries
-  Règles de recommandation basées sur:
  - Genres communs (×40 points)
  - Note du film/série (×4 points)
  - Respect des contraintes (+10 points chacune)
-  Exclusion automatique des contenus bannis
-  Génération d'explications détaillées
-  Scoring transparent et explicable

### Interface Web

-  Design professionnel et sobre
-  Responsive (Desktop, Tablet, Mobile)
-  Formulaire de préférences complet
-  Statistiques des recommandations
-  Explications système expert (affichage optionnel)
-  Animation et transitions fluides
-  Aucun élément visuel "IA générique"

##  Algorithme de Scoring

```
Score = (Genres communs × 40) + (Note × 4) + Bonus contraintes

Bonus contraintes:
  +10 si durée ≤ durée maximale
  +10 si année ≥ année minimale

Exclusion:
  Contenu exclu si acteur ou réalisateur banni présent
```

**Exemple:**
- Film avec 2 genres communs: 80 points
- Note de 8.5/10: 34 points
- Durée respectée: +10 points
- Année respectée: +10 points
- **Score total: 134/100**

##  Base de Connaissances

### Films (20)
- Inception, Matrix, Interstellar, Mad Max: Fury Road
- Blade Runner 2049, Shawshank Redemption, Forrest Gump
- Grand Budapest Hotel, Parasite, La La Land, Get Out
- Silence of the Lambs, Hereditary, A Quiet Place
- Superbad, Big Lebowski, Knives Out
- Spider-Man: Spider-Verse, Coco, Your Name

### Séries (10)
- Breaking Bad, Stranger Things, The Crown, Black Mirror
- The Office, Game of Thrones, The Mandalorian
- Fleabag, True Detective, Succession

##  Architecture Technique

### Fichier Prolog (cinemasima.pl)

**Prédicats principaux:**
- `film/8` et `serie/9`: Base de faits
- `calculate_base_score/3`: Calcul du score de base
- `check_constraints_*/4`: Vérification des contraintes
- `generate_explanation_*/5`: Génération d'explications
- `recommend_films/4` et `recommend_series/4`: Génération de recommandations
- `generate_recommendations/1`: Prédicat principal

**Prédicats utilitaires:**
- `init_preferences/0`: Initialisation
- `add_genre_preference/1`: Ajout de genres
- `add_banned_actor/1`, `add_banned_director/1`: Gestion des exclusions
- `set_max_duration/1`, `set_min_year/1`: Contraintes

### Interface HTML

**Technologies:**
- HTML5 sémantique
- CSS3 avec variables CSS
- JavaScript Vanilla (pas de frameworks)

**Structure:**
- Header: Titre et sous-titre
- Colonne gauche: Formulaire de préférences
- Colonne droite: Informations système
- Section résultats: Statistiques + Recommandations

**Fonctionnalités JS:**
- Génération dynamique de l'interface
- Calcul du scoring côté client (simulation Prolog)
- Animations et transitions
- Responsive design

##  Aspects Pédagogiques

Ce projet démontre:

1. **Représentation des connaissances:** Faits et règles Prolog
2. **Moteur d'inférence:** Chaînage avant pour le scoring
3. **Système expert explicable:** Génération d'explications naturelles
4. **Interface utilisateur:** Interaction humain-machine
5. **Architecture logicielle:** Séparation logique/présentation

##  Notes Importantes

- **Contrainte de genre:** Au moins 1 genre doit être sélectionné
- **Limite de résultats:** Top 5 recommandations maximum
- **Score minimal:** Seuls les contenus avec score > 20 sont affichés
- **Tri:** Recommandations triées par score décroissant

##  Tests Unitaires

Le fichier Prolog inclut des prédicats de test:

```prolog
% Test 1: Films Science-Fiction
?- test_scifi.

% Test 2: Séries Comédie  
?- test_comedy_series.
```

Ces tests permettent de vérifier le bon fonctionnement du système.

##  Livrables

1.  Code Prolog complet (`cinemasima.pl`)
2.  Interface web (`index.html`)
3.  Rapport PDF détaillé (à compléter)

##  Contribution

**Auteur(s):** [Votre nom]  
**Binôme:** [Nom du binôme si applicable]

##  Calendrier

- **Date limite:** Dimanche 18 Janvier 2026 à Minuit
- **Soumission:** Google Drive (lien fourni par le professeur)

##  Améliorations Possibles

- Intégration de plus de films/séries
- Ajout de critères de filtrage (langue, pays)
- Machine learning pour affiner les recommandations
- API REST pour communication web-Prolog
- Base de données persistante
- Système de notation utilisateur

##  Support

Pour toute question sur le projet, contacter le professeur via les canaux officiels du cours.

---

**CinemaSIMA** - Un système expert pour des recommandations intelligentes et explicables 
