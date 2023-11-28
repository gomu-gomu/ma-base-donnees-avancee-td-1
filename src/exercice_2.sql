-- Exercice 2 - Memoire SGA

-- 1 - Écrire l'instruction qui permet d'afficher le contenu de la SGA.
SELECT * FROM V$SGA;

-- 2 - Changer la taille de la SGA å 900M.
ALTER SYSTEM SET SGA_TARGET = 900M SCOPE=MEMORY;

-- 3 - Quelle est la vue qui permet d'accéder aux données du dictionary cache.
-- V$ROWCACHE.
SELECT * FROM V$ROWCACHE;

-- 4 - Donner Ia requéte SQL qui permet de vérifier s'il faut, ou pas, optimiser le dictionary cache.
Select SUM(GETS) "Somme des gets", SUM(GETMISSES) "Somme des getmisses" FROM V$rowcache;

-- 5 - Calculer le rapport R, est ce que cette mémoire est insuffisante dans ce cas.
Select SUM(GETMISSES) / (SUM(GETS) + Sum(getmisses)) * 100 "R" FROM V$rowcache;
-- Si le résultat est <= 10% ou 15%, le cache est bien optimisé.
-- Sinon, cela signifie qu'il faut augmenter la taille du SPA.

-- 6 - Ecrire la requéte SQL qui permet de modifier SPA = 80M.
ALTER SYSTEM SET SHARED_POOL_SIZE = 80M;

-- 7 - Donner la requéte SQL qui permet de vérifier s'il faut augmenter Ia taille du Library cache.
Select SUM(RELOADS) / (SUM(RELOADS) + Sum(PINS)) * 100 "R" FROM V$librarycache;
-- Reloads: Nombre de demandes infructueuses
-- Pins : Nombre d’exécutions sans défaut de cache
-- il faut augmenter la taille si le résultant est >= 1%

-- 8 - Sachant que : somme des pins = 45640 et somme des reloads = 270, trouver la valeur de R, que faut-il conclure ?
Select 45640 / (270 + 45640) * 100 "R" FROM V$librarycache WHERE ROWNUM = 1;