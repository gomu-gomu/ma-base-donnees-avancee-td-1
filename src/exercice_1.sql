-- Exercice 1 - Memoire PGA

-- 1 - Quelle est la vue qui permet d'accéder aux paramètres de la mémoire SGA et PGA.
-- V$SGA et V$PGA_TARGET_ADVICE.
SELECT * FROM V$SGA;
SELECT * FROM V$PGA_TARGET_ADVICE;

-- 2 - Quelle est l'instruction SQL qui permet d'afficher le contenu de Ia Vue V$memory_dynamic_components.
SELECT * FROM V$memory_dynamic_components;

-- 3 - le résultat de l'exécution de l'instruction de la question 2 est dans la figure ci-dessous. Ecrire Ia requéte SQL qui permet d'afficher Ies composants ainsi que leurs tailles.
SELECT COMPONENT, CURRENT_SIZE FROM V$memory_dynamic_components;

-- 4 - l'exécution de l'instruction SQL précédente permet d'afficher ces données.
SELECT COMPONENT, CURRENT_SIZE FROM V$memory_dynamic_components;

-- 5 - Quelle est la valeur de Ia mémoire PGA d'aprés ces résultats.
SELECT * FROM V$PGASTAT WHERE NAME = 'total PGA allocated';