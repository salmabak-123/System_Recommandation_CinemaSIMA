# Guide de Test Rapide - CinemaSIMA

## 🚀 Démarrage Rapide

### Test 1: Interface Web (Plus Simple)

1. **Ouvrir** le fichier `index.html` dans votre navigateur
2. **Sélectionner** "Films" 
3. **Cocher** au moins 2 genres (ex: Science-Fiction, Action)
4. **Cliquer** sur "Générer"
5. **Observer** les recommandations avec scores et explications

### Test 2: Prolog Console

1. **Lancer** SWI-Prolog:
   ```bash
   swipl
   ```

2. **Charger** le fichier:
   ```prolog
   ?- [cinemasima].
   ```

3. **Exécuter** le test pré-configuré:
   ```prolog
   ?- test_scifi.
   ```

4. **Observer** les résultats dans la console

---

## 📝 Scénarios de Test Détaillés

### Scénario 1: Amateur de Science-Fiction

**Interface Web:**
1. Sélectionner "Films"
2. Cocher: Sci-Fi, Action, Thriller
3. Durée max: 180 minutes
4. Année min: 2000
5. Cliquer "Générer"

**Résultats attendus:**
- Inception (#1, score ~134)
- Matrix (#2, score ~131)
- Interstellar (#3, score ~124)
- Mad Max: Fury Road (#4)
- Blade Runner 2049 (#5)

**Prolog:**
```prolog
?- test_scifi.
```

---

### Scénario 2: Fan de Comédie (Séries)

**Interface Web:**
1. Sélectionner "Séries"
2. Cocher: Comédie
3. Durée max: 30 minutes
4. Année min: 2000
5. Cliquer "Générer"

**Résultats attendus:**
- The Office (score élevé)
- Fleabag (score élevé)

**Prolog:**
```prolog
?- test_comedy_series.
```

---

### Scénario 3: Exclusion d'Acteurs

**Interface Web:**
1. Sélectionner "Films"
2. Cocher: Action
3. Dans "Acteurs à éviter", taper:
   ```
   Tom Hardy
   ```
4. Cliquer "Générer"

**Résultat attendu:**
- Inception NE doit PAS apparaître
- Mad Max NE doit PAS apparaître
- Matrix doit apparaître

**Prolog:**
```prolog
?- init_preferences,
   add_genre_preference(action),
   add_banned_actor('Tom Hardy'),
   set_content_type(film),
   generate_recommendations(Recs).
```

---

### Scénario 4: Animation Familiale

**Interface Web:**
1. Sélectionner "Films"
2. Cocher: Animation, Familial
3. Durée max: 120 minutes
4. Année min: 2015
5. Cliquer "Générer"

**Résultats attendus:**
- Coco
- Spider-Man: Into the Spider-Verse
- Your Name

**Prolog:**
```prolog
?- init_preferences,
   add_genre_preference(animation),
   add_genre_preference(family),
   set_max_duration(120),
   set_min_year(2015),
   set_content_type(film),
   generate_recommendations(Recs).
```

---

### Scénario 5: Drama avec Contraintes Strictes

**Interface Web:**
1. Sélectionner "Séries"
2. Cocher: Drama, Crime
3. Durée max: 60 minutes
4. Année min: 2010
5. Cliquer "Générer"

**Résultats attendus:**
- Breaking Bad
- True Detective
- Succession

---

### Scénario 6: Aucun Résultat (Test Négatif)

**Interface Web:**
1. Sélectionner "Films"
2. Cocher: Musical
3. Durée max: 50 minutes (très court)
4. Année min: 2020 (très récent)
5. Dans "Réalisateurs à éviter", taper:
   ```
   Damien Chazelle
   ```
6. Cliquer "Générer"

**Résultat attendu:**
- Message: "Aucune recommandation trouvée"
- Suggestion de modifier les critères

---

## 🔍 Points à Vérifier

### Interface Web

✅ **Visuel:**
- [ ] Design professionnel (vert émeraude)
- [ ] Animations fluides
- [ ] Hover effects sur les éléments
- [ ] Responsive sur mobile

✅ **Fonctionnel:**
- [ ] Validation (au moins 1 genre requis)
- [ ] Bouton "Réinitialiser" fonctionne
- [ ] Toggle "Voir le système expert" fonctionne
- [ ] Statistiques s'affichent correctement
- [ ] Scores calculés correctement

✅ **Explications:**
- [ ] Chaque recommandation a une explication
- [ ] Genres communs mentionnés
- [ ] Note mentionnée
- [ ] Réalisateur mentionné
- [ ] Avertissements affichés si contraintes non respectées

### Prolog

✅ **Base de connaissances:**
- [ ] 20 films chargés
- [ ] 10 séries chargées
- [ ] Tous les attributs présents

✅ **Règles:**
- [ ] Scoring fonctionne
- [ ] Exclusions fonctionnent
- [ ] Contraintes appliquées
- [ ] Tri par score décroissant
- [ ] Limite à 5 résultats

✅ **Explications:**
- [ ] Génération automatique
- [ ] Format cohérent
- [ ] Avertissements inclus

---

## 🐛 Tests de Robustesse

### Test 1: Aucun Genre Sélectionné
**Action:** Cliquer "Générer" sans sélectionner de genre  
**Résultat attendu:** Alert "Veuillez sélectionner au moins un genre"

### Test 2: Durée Invalide
**Action:** Entrer une durée négative ou très grande  
**Résultat attendu:** Le système doit gérer sans crash

### Test 3: Texte Multiligne dans Textareas
**Action:** Entrer plusieurs acteurs avec des sauts de ligne  
**Résultat attendu:** Parsing correct, exclusion fonctionne

### Test 4: Changement de Type (Film/Série)
**Action:** Générer pour films, puis changer pour séries et régénérer  
**Résultat attendu:** Base de données change, résultats cohérents

---

## 📊 Validation des Scores

### Formule de Scoring

```
Score = (Genres communs × 40) + (Note × 4) + Bonus
Bonus = +10 (durée) + +10 (année)
```

### Exemple de Calcul: Inception

**Données:**
- Genres: action, sci_fi, thriller
- Note: 8.8
- Durée: 148 min
- Année: 2010

**Préférences utilisateur:**
- Genres: sci_fi, action
- Durée max: 180 min
- Année min: 2000

**Calcul:**
1. Genres communs: 2 (sci_fi, action) → 2 × 40 = 80
2. Note: 8.8 × 4 = 35.2 → 35
3. Durée OK (148 ≤ 180): +10
4. Année OK (2010 ≥ 2000): +10
5. **Score total: 80 + 35 + 10 + 10 = 135**

**À vérifier dans l'interface:**
- [ ] Score affiché ≈ 135
- [ ] Explication mentionne "2 genre(s) en commun"
- [ ] Explication mentionne "Note élevée de 8.8/10"
- [ ] Pas d'avertissement (contraintes respectées)

---

## 🎯 Checklist Finale

Avant de soumettre le projet, vérifier:

### Fichiers
- [ ] `cinemasima.pl` - Code Prolog complet
- [ ] `index.html` - Interface web fonctionnelle
- [ ] `README.md` - Documentation complète
- [ ] `Rapport_Template.md` - Template de rapport (à compléter)
- [ ] `Guide_Test.md` - Ce fichier

### Tests Prolog
- [ ] `test_scifi` fonctionne
- [ ] `test_comedy_series` fonctionne
- [ ] Tests personnalisés fonctionnent
- [ ] Explications générées correctement

### Tests Interface
- [ ] Fonctionne sur Chrome
- [ ] Fonctionne sur Firefox
- [ ] Responsive sur mobile
- [ ] Tous les scénarios testés
- [ ] Aucune erreur console JavaScript

### Documentation
- [ ] README complet
- [ ] Rapport rédigé (basé sur template)
- [ ] Code commenté
- [ ] Instructions claires

---

## 💡 Conseils

1. **Tester progressivement:** Ne pas tout tester d'un coup
2. **Noter les résultats:** Garder une trace pour le rapport
3. **Capturer des écrans:** Pour le rapport
4. **Chronométrer:** Noter les temps de traitement
5. **Varier les profils:** Tester différentes combinaisons

---

## 🆘 Dépannage

### Problème: Prolog ne charge pas le fichier

**Solution:**
```prolog
?- working_directory(CWD, CWD).
% Vérifier le répertoire courant

?- cd('/chemin/vers/le/fichier').
% Changer de répertoire

?- [cinemasima].
% Recharger
```

### Problème: Interface web ne montre rien

**Solution:**
1. Ouvrir la console développeur (F12)
2. Vérifier les erreurs JavaScript
3. Vérifier que le fichier est en UTF-8
4. Essayer un autre navigateur

### Problème: Scores incorrects

**Solution:**
1. Vérifier la formule dans le code
2. Tester avec des valeurs simples
3. Comparer Prolog vs JavaScript
4. Vérifier les arrondis

---

## 📞 Contact

Pour toute question, contacter:
- Professeur: PR. ELALAOUI Hasna
- Via les canaux officiels du cours

---

**Bon testing! 🎬📺**
