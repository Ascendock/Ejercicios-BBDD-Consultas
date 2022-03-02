-- 1.- Muestra las atracciones en las que participan animales

SELECT distinct nombre_atraccion
FROM animales;

-- 2.- Muestra los artistas que trabajan en las atracciones

SELECT  distinct nif_artista
FROM atracciones_artistas;

/*
3.- Muestra las atracciones y las fechas en las que se celebraron, 
asi como las ganancias en centimos suponiendo que estan en euros
*/

SELECT nombre, fecha_inicio, ganancias as ganancias_euros, (ganancias*100) as ganancias_centimos
FROM atracciones;

