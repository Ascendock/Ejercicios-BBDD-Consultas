-- Test de pertenencia a conjunto (IN) OR

-- 1.- Muestra los nombres de los animales que trabajan en las pistas CENTRAL o LATERAL2

SELECT nombre, nombre_pista
FROM animales
WHERE nombre_pista IN("CENTRAL" OR "LATERAL2");

-- 2.- Muestra los nombres de las atracciones en las que trabaja leo, princesa1 y princesa2

SELECT distinct nombre_atraccion
FROM animales
WHERE nombre IN("leo","princesa1","princesa2");