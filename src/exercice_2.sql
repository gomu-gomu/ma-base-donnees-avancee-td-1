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