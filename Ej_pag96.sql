-- Subconsultas

-- 1.- Lista las atracciones que tengan unas ganancias acumuladas por encima de la media

SELECT nombre, ganancias
FROM atracciones
WHERE ganancias > 	(
						SELECT round(AVG(ganancias),2)
                        FROM atracciones
                    )
ORDER BY nombre ASC;

-- 2.- Lista los animales que han sido atendidos por 'Luis Sanchez'(suponemos que no hay nombres repetidos ya que no devuelve mas de una fila)

-- Con subconsultas

SELECT nombre_animal
FROM animales_artistas
WHERE nif_artista = (
					SELECT nif
                    FROM artistas
					WHERE nombre = "Luis" AND
						  apellidos = "Sanchez"	
                    )
ORDER BY nombre_animal;	

-- Con INNER JOIN

SELECT nombre_animal
FROM animales_artistas INNER JOIN artistas
				ON (animales_artistas.nif_artista = artistas.nif)
WHERE nombre = 'Luis' AND apellidos = 'Sanchez'
ORDER BY nombre_animal;                


-- 3.- Obten aquellas atracciones a las que hayan acudido un numero de espectadores superior a la media de espectadores

SELECT nombre_atraccion, num_espectadores
FROM atraccion_dia
WHERE num_espectadores > (
							SELECT AVG(num_espectadores)
                            FROM atraccion_dia
						 )
ORDER BY num_espectadores ASC;                         

-- 4.- Muestra aquellos artistas (apellidos y nombre) que cuiden de animales que tengan un peso superior a 90

SELECT DISTINCT CONCAT(apellidos," ",nombre) AS apellidos_nombre
FROM artistas INNER JOIN animales_artistas
					ON (artistas.nif = animales_artistas.nif_artista)
WHERE animales_artistas.nombre_animal IN (
											SELECT nombre_animal
                                            FROM animales
                                            WHERE peso >= 90
											)      
ORDER BY apellidos_nombre;                                            
                                            
-- 5.- Lista aquellos animales que tengan mas de un año y que actuen en pistas con un aforo de menos de 500

SELECT nombre
FROM animales
WHERE anhos > 1 AND nombre_pista IN (
									SELECT nombre 
                                    FROM pistas
									WHERE aforo < 500
									)
ORDER BY nombre;                                    

-- Test de existencia EXISTS (solo con subconsultas)

-- 6.- Lista aquellos artistas que hayan trabajado en alguna atraccion

SELECT nombre, apellidos
FROM artistas
WHERE EXISTS (
				SELECT nif_artista 
                FROM atracciones_artistas
                WHERE nif_artista = artistas.nif
			)
ORDER BY nombre ASC, apellidos ASC;         

-- 7.- Lista los animales, con su nombre, tipo y años, siempre que esten cuidados por algun artista

SELECT nombre, tipo, anhos
FROM animales
WHERE EXISTS (
				SELECT nombre_animal
				FROM animales_artistas
                WHERE nombre = nombre_animal
				)
ORDER BY nombre ASC;

-- 8.- Muestra las atracciones que tengan las dos mayores ganancias acumuladas

SELECT nombre, MAX(ganancias) AS ganancias
FROM atracciones
GROUP BY nombre
ORDER BY ganancias DESC
LIMIT 2;

-- 9.- Muestra la pista con el aforo mas pequeño

SELECT nombre, aforo
FROM pistas
WHERE aforo = (
				SELECT MIN(aforo)
                FROM pistas
                )
ORDER BY nombre ASC;     

-- 10.- Muestra la atraccion que tenga la mayor ganancia acumulada haciendo una subconsulta

SELECT nombre, ganancias
FROM atracciones
WHERE ganancias = (
					SELECT MAX(ganancias)
                    FROM atracciones
					)
ORDER BY ganancias DESC;                    

-- 11.- Muestra el nif, nombre y apellidos de los artistas que trabajen con dos o mas animales y que pesen
-- todos ellos igual o mas de 100 kilos

SELECT nif, nombre, apellidos
FROM artistas
WHERE 2 <= (
			SELECT count(*)
            FROM animales_artistas INNER JOIN animales
									ON (animales_artistas.nombre_animal = animales.nombre)
            WHERE animales_artistas.nif_artista = artistas.nif AND animales.peso >= 100
			)
ORDER BY nombre ASC;        

/*
-- 12.- Muestra las atracciones que tuvieran un numero de espectadores superior a 150 haciendo uso de una subconsulta
con EXISTS
*/

SELECT nombre
FROM atracciones
WHERE EXISTS (
			SELECT num_espectadores
            FROM atraccion_dia
            WHERE atraccion_dia.nombre_atraccion = atracciones.nombre AND num_espectadores > 150
			)
GROUP BY nombre
ORDER BY nombre ASC;






			