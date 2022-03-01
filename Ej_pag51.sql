-- Consulta de tres o más tablas.

/*
-- 1.- Muestra los animales que trabajan en pistas con un aforo mayor que 500 ordenador por
el nombre
*/

SELECT animales.nombre AS nombre_animal, pistas.nombre AS nombre_pista, aforo
FROM animales INNER JOIN pistas
					ON (animales.nombre_pista = pistas.nombre)
WHERE aforo > 500
ORDER BY animales.nombre ASC;                    

/*
-- 2.- Muestra el nombre completo de los artistas que trabajan en las atracciones 'El gran felino' o
'Las jirafas' ordenados por el nombre
*/

SELECT CONCAT(artistas.nombre," ",apellidos) as "Nombre - Apellido", atracciones.nombre
FROM artistas INNER JOIN atracciones_artistas
					ON (artistas.nif = atracciones_artistas.nif_artista)
			  INNER JOIN atracciones
					ON (atracciones_artistas.nombre_atraccion = atracciones.nombre)
WHERE atracciones.nombre = "El gran felino" OR atracciones.nombre = "Las jirafas"
ORDER BY artistas.nombre ASC;

/*
-- 3.- Muestra el nombre completo de los artistas que trabajan en las atracciones El gran felino o el devorador
ordenados por nombre
*/

SELECT CONCAT(artistas.nombre," ",apellidos) as "Nombre - Apellido", atracciones.nombre as nombre_atraccion
FROM artistas INNER JOIN atracciones_artistas
					ON (artistas.nif = atracciones_artistas.nif_artista)
			  INNER JOIN atracciones
					ON (atracciones_artistas.nombre_atraccion = atracciones.nombre)
WHERE atracciones.nombre = "El gran felino" OR atracciones.nombre = "El devorador"
ORDER BY artistas.nombre;                    

/*
-- 4.- Muestra los animales que no tengan 2 o 3 años, pero solo cuando hayan actuado en atracciones con una 
ganancia total superior a 30000
*/

SELECT animales.nombre, anhos
FROM animales INNER JOIN atracciones
						ON (animales.nombre_atraccion = atracciones.nombre)
WHERE animales.anhos NOT IN (2,3) AND ganancias > 30000
ORDER BY animales.nombre ASC;
                    
/*
-- 5.- Muestra las atracciones, fecha y numero de espectadores que se celebraron a partir del año 2000
junto con el nombre de los artistas que participaron pero solo de aquellas atracciones que tuvieran
una recaudacion superior a 20000 el dia que se celebró
*/

SELECT DISTINCT atracciones.nombre AS nombre_atraccion, artistas.nombre AS nombre_artista, atraccion_dia.fecha as fecha, num_espectadores, atraccion_dia.ganancias AS ganancias_dia
FROM atraccion_dia INNER JOIN atracciones
						ON (atraccion_dia.nombre_atraccion = atracciones.nombre)
				   INNER JOIN atracciones_artistas
						ON (atracciones.nombre = atracciones_artistas.nombre_atraccion)
				   INNER JOIN artistas
						ON (atracciones_artistas.nif_artista = artistas.nif)
WHERE atraccion_dia.ganancias > 20000
ORDER BY atracciones.nombre ASC;








