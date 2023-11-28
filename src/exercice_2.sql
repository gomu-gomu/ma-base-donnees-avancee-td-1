-- Exercice 2 - Memoire SGA

-- 1 - Écrire l'instruction qui permet d'afficher le contenu de la SGA.
SELECT * FROM V$SGA;

-- 2 - Changer la taille de la SGA å 900M.
ALTER SYSTEM SET SGA_TARGET = 900M SCOPE=MEMORY;

-- 3 - Quelle est la vue qui permet d'accéder aux données du dictionary cache.
-- V$ROWCACHE.
SELECT * FROM V$ROWCACHE;

-- 4 - Donner la requéte SQL qui permet de vérifier s'il faut, ou pas, optimiser le dictionary cache.
Select SUM(GETS) "Somme des gets", SUM(GETMISSES) "Somme des getmisses" FROM V$rowcache;

-- 5 - Calculer le rapport R, est ce que cette mémoire est insuffisante dans ce cas.
Select SUM(GETMISSES) / (SUM(GETS) + Sum(getmisses)) * 100 "R" FROM V$rowcache;
-- Si le résultat est <= 10% ou 15%, le cache est bien optimisé.
-- Sinon, cela signifie qu'il faut augmenter la taille du SPA.

-- 6 - Ecrire la requéte SQL qui permet de modifier SPA = 80M.
ALTER SYSTEM SET SHARED_POOL_SIZE = 80M;

-- 7 - Donner la requéte SQL qui permet de vérifier s'il faut augmenter la taille du Library cache.
Select SUM(RELOADS) / (SUM(RELOADS) + Sum(PINS)) * 100 "R" FROM V$librarycache;
-- Reloads: Nombre de demandes infructueuses
-- Pins : Nombre d’exécutions sans défaut de cache
-- il faut augmenter la taille si le résultant est >= 1%

-- 8 - Sachant que : somme des pins = 45640 et somme des reloads = 270, trouver la valeur de R, que faut-il conclure ?
Select 45640 / (270 + 45640) * 100 "R" FROM V$librarycache WHERE ROWNUM = 1;

-- 9 - Donner la requéte SQL qui permet de vérifier si la mémoire database buffer cache est suffisante ou pas.
SELECT (1 - ((SUM(DECODE(NAME, 'physical reads', VALUE, 0)) / ((SUM(DECODE(NAME, 'db block gets', VALUE, 0)) + (SUM(DECODE(NAME, 'consistent gets', VALUE, 0)))))))) * 100 AS "R" FROM V$SYSSTAT;
-- Si R > 60% ou 70%, OK.

-- 10 - Quelle est la formule qui permet de vérifier si la mémoire data base buffer cache est uffisante ou pas, calculer cette valeur et dites s'il faut augmenter la taille de la SGA
-- Formule = (1 - (physical reads / (db block gets + consistent gets))) * 100
SELECT (1 - ((SUM(DECODE(NAME, 'physical reads', VALUE, 0)) / ((SUM(DECODE(NAME, 'db block gets', VALUE, 0)) + (SUM(DECODE(NAME, 'consistent gets', VALUE, 0)))))))) * 100 AS "R" FROM V$SYSSTAT;