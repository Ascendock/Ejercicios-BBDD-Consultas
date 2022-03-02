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











			