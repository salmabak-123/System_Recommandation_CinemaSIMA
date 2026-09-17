% ============================================================================
% CinemaSIMA - Système Expert de Recommandation de Films et Séries
% Module: Fondements avancés de l'IA
% PR. ELALAOUI Hasna
% ============================================================================

:- dynamic preference/2.
:- dynamic banned_actor/1.
:- dynamic banned_director/1.
:- dynamic max_duration/1.
:- dynamic min_year/1.
:- dynamic content_type/1.

% ============================================================================
% BASE DE CONNAISSANCES - FILMS (20 films)
% Format: film(ID, Titre, Genres, Réalisateur, Acteurs, Année, Durée, Note)
% ============================================================================

film(1, 'Inception', [action, sci_fi, thriller], 'Christopher Nolan', 
     ['Leonardo DiCaprio', 'Tom Hardy', 'Ellen Page'], 2010, 148, 8.8).

film(2, 'The Matrix', [action, sci_fi], 'Wachowski Brothers', 
     ['Keanu Reeves', 'Laurence Fishburne', 'Carrie-Anne Moss'], 1999, 136, 8.7).

film(3, 'Interstellar', [sci_fi, drama, adventure], 'Christopher Nolan', 
     ['Matthew McConaughey', 'Anne Hathaway', 'Jessica Chastain'], 2014, 169, 8.6).

film(4, 'Mad Max: Fury Road', [action, adventure, sci_fi], 'George Miller', 
     ['Tom Hardy', 'Charlize Theron', 'Nicholas Hoult'], 2015, 120, 8.1).

film(5, 'Blade Runner 2049', [sci_fi, thriller, mystery], 'Denis Villeneuve', 
     ['Ryan Gosling', 'Harrison Ford', 'Ana de Armas'], 2017, 164, 8.0).

film(6, 'The Shawshank Redemption', [drama], 'Frank Darabont', 
     ['Tim Robbins', 'Morgan Freeman'], 1994, 142, 9.3).

film(7, 'Forrest Gump', [drama, romance], 'Robert Zemeckis', 
     ['Tom Hanks', 'Robin Wright', 'Gary Sinise'], 1994, 142, 8.8).

film(8, 'The Grand Budapest Hotel', [comedy, drama, adventure], 'Wes Anderson', 
     ['Ralph Fiennes', 'Tony Revolori', 'Saoirse Ronan'], 2014, 99, 8.1).

film(9, 'Parasite', [thriller, drama, comedy], 'Bong Joon-ho', 
     ['Song Kang-ho', 'Lee Sun-kyun', 'Cho Yeo-jeong'], 2019, 132, 8.6).

film(10, 'La La Land', [romance, drama, musical], 'Damien Chazelle', 
     ['Ryan Gosling', 'Emma Stone', 'John Legend'], 2016, 128, 8.0).

film(11, 'Get Out', [horror, thriller, mystery], 'Jordan Peele', 
     ['Daniel Kaluuya', 'Allison Williams', 'Bradley Whitford'], 2017, 104, 7.7).

film(12, 'The Silence of the Lambs', [thriller, crime, horror], 'Jonathan Demme', 
     ['Jodie Foster', 'Anthony Hopkins', 'Scott Glenn'], 1991, 118, 8.6).

film(13, 'Hereditary', [horror, drama, mystery], 'Ari Aster', 
     ['Toni Collette', 'Alex Wolff', 'Milly Shapiro'], 2018, 127, 7.3).

film(14, 'A Quiet Place', [horror, sci_fi, thriller], 'John Krasinski', 
     ['Emily Blunt', 'John Krasinski', 'Millicent Simmonds'], 2018, 90, 7.5).

film(15, 'Superbad', [comedy], 'Greg Mottola', 
     ['Jonah Hill', 'Michael Cera', 'Christopher Mintz-Plasse'], 2007, 113, 7.6).

film(16, 'The Big Lebowski', [comedy, crime], 'Joel Coen', 
     ['Jeff Bridges', 'John Goodman', 'Julianne Moore'], 1998, 117, 8.1).

film(17, 'Knives Out', [mystery, comedy, crime], 'Rian Johnson', 
     ['Daniel Craig', 'Ana de Armas', 'Chris Evans'], 2019, 130, 7.9).

film(18, 'Spider-Man: Into the Spider-Verse', [animation, action, adventure], 'Bob Persichetti', 
     ['Shameik Moore', 'Jake Johnson', 'Hailee Steinfeld'], 2018, 117, 8.4).

film(19, 'Coco', [animation, family, fantasy], 'Lee Unkrich', 
     ['Anthony Gonzalez', 'Gael García Bernal', 'Benjamin Bratt'], 2017, 105, 8.4).

film(20, 'Your Name', [animation, romance, fantasy], 'Makoto Shinkai', 
     ['Ryunosuke Kamiki', 'Mone Kamishiraishi'], 2016, 106, 8.4).

% ============================================================================
% BASE DE CONNAISSANCES - SÉRIES (10 séries)
% Format: serie(ID, Titre, Genres, Réalisateur, Acteurs, Année, Durée_épisode, Note, Saisons)
% ============================================================================

serie(1, 'Breaking Bad', [crime, drama, thriller], 'Vince Gilligan', 
      ['Bryan Cranston', 'Aaron Paul', 'Anna Gunn'], 2008, 47, 9.5, 5).

serie(2, 'Stranger Things', [sci_fi, horror, drama], 'Duffer Brothers', 
      ['Millie Bobby Brown', 'Finn Wolfhard', 'Winona Ryder'], 2016, 51, 8.7, 4).

serie(3, 'The Crown', [drama, history], 'Peter Morgan', 
      ['Claire Foy', 'Olivia Colman', 'Imelda Staunton'], 2016, 58, 8.6, 6).

serie(4, 'Black Mirror', [sci_fi, thriller, drama], 'Charlie Brooker', 
      ['Various'], 2011, 60, 8.7, 5).

serie(5, 'The Office', [comedy], 'Greg Daniels', 
      ['Steve Carell', 'Rainn Wilson', 'John Krasinski'], 2005, 22, 9.0, 9).

serie(6, 'Game of Thrones', [fantasy, drama, adventure], 'David Benioff', 
      ['Emilia Clarke', 'Kit Harington', 'Peter Dinklage'], 2011, 57, 9.2, 8).

serie(7, 'The Mandalorian', [sci_fi, action, adventure], 'Jon Favreau', 
      ['Pedro Pascal', 'Carl Weathers', 'Gina Carano'], 2019, 40, 8.7, 3).

serie(8, 'Fleabag', [comedy, drama], 'Phoebe Waller-Bridge', 
      ['Phoebe Waller-Bridge', 'Sian Clifford', 'Olivia Colman'], 2016, 27, 8.7, 2).

serie(9, 'True Detective', [crime, drama, mystery], 'Nic Pizzolatto', 
      ['Matthew McConaughey', 'Woody Harrelson', 'Colin Farrell'], 2014, 55, 8.9, 3).

serie(10, 'Succession', [drama], 'Jesse Armstrong', 
       ['Brian Cox', 'Jeremy Strong', 'Sarah Snook'], 2018, 60, 8.9, 4).

% ============================================================================
% PRÉDICATS UTILITAIRES
% ============================================================================

% Récupérer tous les genres disponibles
all_genres([action, adventure, animation, comedy, crime, drama, 
            family, fantasy, history, horror, musical, mystery, 
            romance, sci_fi, thriller]).

% Vérifier si un contenu est un film
is_film(ID) :- film(ID, _, _, _, _, _, _, _).

% Vérifier si un contenu est une série
is_serie(ID) :- serie(ID, _, _, _, _, _, _, _, _).

% Obtenir les informations d'un film
get_film_info(ID, Title, Genres, Director, Actors, Year, Duration, Rating) :-
    film(ID, Title, Genres, Director, Actors, Year, Duration, Rating).

% Obtenir les informations d'une série
get_serie_info(ID, Title, Genres, Director, Actors, Year, Duration, Rating, Seasons) :-
    serie(ID, Title, Genres, Director, Actors, Year, Duration, Rating, Seasons).

% Compter les genres communs entre deux listes
count_common_genres([], _, 0).
count_common_genres([H|T], UserGenres, Count) :-
    (member(H, UserGenres) ->
        count_common_genres(T, UserGenres, RestCount),
        Count is RestCount + 1
    ;
        count_common_genres(T, UserGenres, Count)
    ).

% Vérifier si un acteur est dans une liste
actor_in_list(Actor, Actors) :-
    member(Actor, Actors).

% Vérifier si un acteur banni est dans le film
has_banned_actor(Actors) :-
    banned_actor(BannedActor),
    member(BannedActor, Actors).

% Vérifier si le réalisateur est banni
is_banned_director(Director) :-
    banned_director(Director).

% ============================================================================
% RÈGLES DE RECOMMANDATION
% ============================================================================

% Calculer le score de base pour un film
calculate_base_score(ID, UserGenres, BaseScore) :-
    is_film(ID),
    get_film_info(ID, _, Genres, _, _, _, _, Rating),
    count_common_genres(Genres, UserGenres, CommonCount),
    GenreScore is CommonCount * 40,
    RatingScore is Rating * 4,
    BaseScore is GenreScore + RatingScore.

% Calculer le score de base pour une série
calculate_base_score(ID, UserGenres, BaseScore) :-
    is_serie(ID),
    get_serie_info(ID, _, Genres, _, _, _, _, Rating, _),
    count_common_genres(Genres, UserGenres, CommonCount),
    GenreScore is CommonCount * 40,
    RatingScore is Rating * 4,
    BaseScore is GenreScore + RatingScore.

% Vérifier les contraintes et ajouter des bonus pour un film
check_constraints_film(ID, Duration, Year, Bonus, Warnings) :-
    get_film_info(ID, _, _, _, _, FilmYear, FilmDuration, _),
    (Duration >= FilmDuration -> DurationBonus = 10, W1 = [] ; 
        DurationBonus = 0, W1 = ['Durée dépasse votre préférence']),
    (Year =< FilmYear -> YearBonus = 10, W2 = [] ; 
        YearBonus = 0, W2 = ['Année antérieure à votre préférence']),
    Bonus is DurationBonus + YearBonus,
    append(W1, W2, Warnings).

% Vérifier les contraintes et ajouter des bonus pour une série
check_constraints_serie(ID, Duration, Year, Bonus, Warnings) :-
    get_serie_info(ID, _, _, _, _, SerieYear, EpisodeDuration, _, _),
    (Duration >= EpisodeDuration -> DurationBonus = 10, W1 = [] ; 
        DurationBonus = 0, W1 = ['Durée des épisodes dépasse votre préférence']),
    (Year =< SerieYear -> YearBonus = 10, W2 = [] ; 
        YearBonus = 0, W2 = ['Année antérieure à votre préférence']),
    Bonus is DurationBonus + YearBonus,
    append(W1, W2, Warnings).

% Calculer le score total pour un film
calculate_total_score_film(ID, UserGenres, Duration, Year, TotalScore, Warnings) :-
    calculate_base_score(ID, UserGenres, BaseScore),
    check_constraints_film(ID, Duration, Year, Bonus, Warnings),
    TotalScore is BaseScore + Bonus.

% Calculer le score total pour une série
calculate_total_score_serie(ID, UserGenres, Duration, Year, TotalScore, Warnings) :-
    calculate_base_score(ID, UserGenres, BaseScore),
    check_constraints_serie(ID, Duration, Year, Bonus, Warnings),
    TotalScore is BaseScore + Bonus.

% Vérifier si un film doit être exclu
should_exclude_film(ID) :-
    get_film_info(ID, _, _, Director, Actors, _, _, _),
    (is_banned_director(Director) ; has_banned_actor(Actors)).

% Vérifier si une série doit être exclue
should_exclude_serie(ID) :-
    get_serie_info(ID, _, _, Director, Actors, _, _, _, _),
    (is_banned_director(Director) ; has_banned_actor(Actors)).

% Générer une explication pour un film
generate_explanation_film(ID, UserGenres, Score, Warnings, Explanation) :-
    get_film_info(ID, Title, Genres, Director, _, Year, Duration, Rating),
    count_common_genres(Genres, UserGenres, CommonCount),
    format(atom(GenreText), 'Vous avez ~w genre(s) en commun', [CommonCount]),
    format(atom(RatingText), 'Note élevée de ~w/10', [Rating]),
    format(atom(DirectorText), 'Réalisé par ~w', [Director]),
    format(atom(BaseExpl), 'Recommandé car : ~w, ~w, ~w', 
           [GenreText, RatingText, DirectorText]),
    (Warnings = [] -> 
        Explanation = BaseExpl
    ;
        atomic_list_concat(Warnings, ', ', WarningText),
        format(atom(Explanation), '~w. Attention : ~w', [BaseExpl, WarningText])
    ).

% Générer une explication pour une série
generate_explanation_serie(ID, UserGenres, Score, Warnings, Explanation) :-
    get_serie_info(ID, Title, Genres, Director, _, Year, Duration, Rating, Seasons),
    count_common_genres(Genres, UserGenres, CommonCount),
    format(atom(GenreText), 'Vous avez ~w genre(s) en commun', [CommonCount]),
    format(atom(RatingText), 'Note élevée de ~w/10', [Rating]),
    format(atom(DirectorText), 'Créé par ~w', [Director]),
    format(atom(SeasonsText), '~w saison(s) disponible(s)', [Seasons]),
    format(atom(BaseExpl), 'Recommandé car : ~w, ~w, ~w, ~w', 
           [GenreText, RatingText, DirectorText, SeasonsText]),
    (Warnings = [] -> 
        Explanation = BaseExpl
    ;
        atomic_list_concat(Warnings, ', ', WarningText),
        format(atom(Explanation), '~w. Attention : ~w', [BaseExpl, WarningText])
    ).

% ============================================================================
% PRÉDICATS PRINCIPAUX DE RECOMMANDATION
% ============================================================================

% Recommander des films
recommend_films(UserGenres, Duration, Year, Recommendations) :-
    findall(
        rec(ID, Title, Score, Type, Explanation),
        (
            film(ID, Title, _, _, _, _, _, _),
            \+ should_exclude_film(ID),
            calculate_total_score_film(ID, UserGenres, Duration, Year, Score, Warnings),
            Score > 20,
            generate_explanation_film(ID, UserGenres, Score, Warnings, Explanation),
            Type = 'Film'
        ),
        UnsortedRecs
    ),
    sort(3, @>=, UnsortedRecs, SortedRecs),
    length(SortedRecs, Len),
    (Len > 5 -> 
        length(Top5, 5),
        append(Top5, _, SortedRecs),
        Recommendations = Top5
    ;
        Recommendations = SortedRecs
    ).

% Recommander des séries
recommend_series(UserGenres, Duration, Year, Recommendations) :-
    findall(
        rec(ID, Title, Score, Type, Explanation),
        (
            serie(ID, Title, _, _, _, _, _, _, _),
            \+ should_exclude_serie(ID),
            calculate_total_score_serie(ID, UserGenres, Duration, Year, Score, Warnings),
            Score > 20,
            generate_explanation_serie(ID, UserGenres, Score, Warnings, Explanation),
            Type = 'Série'
        ),
        UnsortedRecs
    ),
    sort(3, @>=, UnsortedRecs, SortedRecs),
    length(SortedRecs, Len),
    (Len > 5 -> 
        length(Top5, 5),
        append(Top5, _, SortedRecs),
        Recommendations = Top5
    ;
        Recommendations = SortedRecs
    ).

% ============================================================================
% PRÉDICATS D'INITIALISATION ET DE GESTION DES PRÉFÉRENCES
% ============================================================================

% Initialiser les préférences utilisateur
init_preferences :-
    retractall(preference(_, _)),
    retractall(banned_actor(_)),
    retractall(banned_director(_)),
    retractall(max_duration(_)),
    retractall(min_year(_)),
    retractall(content_type(_)).

% Ajouter une préférence de genre
add_genre_preference(Genre) :-
    assertz(preference(genre, Genre)).

% Ajouter un acteur banni
add_banned_actor(Actor) :-
    assertz(banned_actor(Actor)).

% Ajouter un réalisateur banni
add_banned_director(Director) :-
    assertz(banned_director(Director)).

% Définir la durée maximale
set_max_duration(Duration) :-
    retractall(max_duration(_)),
    assertz(max_duration(Duration)).

% Définir l'année minimale
set_min_year(Year) :-
    retractall(min_year(_)),
    assertz(min_year(Year)).

% Définir le type de contenu
set_content_type(Type) :-
    retractall(content_type(_)),
    assertz(content_type(Type)).

% Récupérer les genres préférés
get_user_genres(Genres) :-
    findall(G, preference(genre, G), Genres).

% Récupérer la durée maximale
get_max_duration(Duration) :-
    (max_duration(D) -> Duration = D ; Duration = 300).

% Récupérer l'année minimale
get_min_year(Year) :-
    (min_year(Y) -> Year = Y ; Year = 1900).

% Récupérer le type de contenu
get_content_type(Type) :-
    (content_type(T) -> Type = T ; Type = film).

% ============================================================================
% PRÉDICAT PRINCIPAL DE GÉNÉRATION DE RECOMMANDATIONS
% ============================================================================

generate_recommendations(Recommendations) :-
    get_user_genres(UserGenres),
    get_max_duration(Duration),
    get_min_year(Year),
    get_content_type(Type),
    (Type = film ->
        recommend_films(UserGenres, Duration, Year, Recommendations)
    ;
        recommend_series(UserGenres, Duration, Year, Recommendations)
    ).

% ============================================================================
% PRÉDICATS POUR L'INTERFACE WEB (FORMAT JSON)
% ============================================================================

% Convertir une recommandation en format JSON
rec_to_json(rec(ID, Title, Score, Type, Explanation), JSONString) :-
    format(atom(JSONString), 
           '{"id": ~w, "title": "~w", "score": ~w, "type": "~w", "explanation": "~w"}',
           [ID, Title, Score, Type, Explanation]).

% Convertir toutes les recommandations en JSON
recs_to_json([], '[]').
recs_to_json([Rec|Rest], JSONString) :-
    rec_to_json(Rec, RecJSON),
    recs_to_json(Rest, RestJSON),
    (RestJSON = '[]' ->
        format(atom(JSONString), '[~w]', [RecJSON])
    ;
        sub_atom(RestJSON, 1, _, 1, RestContent),
        format(atom(JSONString), '[~w, ~w]', [RecJSON, RestContent])
    ).

% ============================================================================
% TESTS ET EXEMPLES
% ============================================================================

% Test 1: Recommandations pour les amateurs de Science-Fiction
test_scifi :-
    init_preferences,
    add_genre_preference(sci_fi),
    add_genre_preference(action),
    set_max_duration(180),
    set_min_year(2000),
    set_content_type(film),
    generate_recommendations(Recs),
    format('~nRecommandations Science-Fiction:~n'),
    print_recommendations(Recs).

% Test 2: Recommandations pour les séries de comédie
test_comedy_series :-
    init_preferences,
    add_genre_preference(comedy),
    set_max_duration(30),
    set_min_year(2000),
    set_content_type(serie),
    generate_recommendations(Recs),
    format('~nRecommandations Séries Comédie:~n'),
    print_recommendations(Recs).

% Afficher les recommandations
print_recommendations([]).
print_recommendations([rec(ID, Title, Score, Type, Explanation)|Rest]) :-
    format('~n~w. ~w (~w) - Score: ~w/100~n', [ID, Title, Type, Score]),
    format('   ~w~n', [Explanation]),
    print_recommendations(Rest).

% ============================================================================
% MESSAGE DE BIENVENUE
% ============================================================================

:- format('~n============================================~n').
:- format('  CinemaSIMA - Système Expert chargé~n').
:- format('  Système de Recommandation de Films et Séries~n').
:- format('============================================~n~n').
:- format('Exemples de commandes:~n').
:- format('  - test_scifi.         % Test films Science-Fiction~n').
:- format('  - test_comedy_series. % Test séries comédie~n~n').
