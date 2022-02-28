-- 1.- Muestra los nombres de las pistas

SELECT nombre
FROM pistas;

-- 2.- Muestra los nombres de los animales que trabajan con artistas

SELECT nombre_animal
FROM animales_artistas;

-- 3.- Muestra los jefes de los artistas (nif's)

SELECT nif_jefe
FROM artistas;

-- 4.- Muestra las atracciones en las que trabajan los artistas

SELECT  nombre_atraccion
FROM atracciones_artistas;

-- 5.- Muestra las fechas en los que hay / hubo atracciones

SELECT nombre,fecha_inicio
FROM atracciones;
