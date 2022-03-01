-- Consultas multitabla
-- Composiciones simples

-- 1.- Queremos saber los nombres de las atracciones y ganancias en las que actúan nuestros animales

SELECT animales.nombre as nombre_animal, atracciones.nombre, ganancias
FROM animales INNER JOIN atracciones
					ON(animales.nombre_atraccion = atracciones.nombre)
ORDER BY nombre_animal ASC, nombre ASC;    

-- 2.- Para cada animal, establece el nombre de la pista y el aforo que tiene, ordenado por el nombre del animal

SELECT animales.nombre AS nombre_animal, pistas.nombre AS nombre_pista, aforo
FROM animales INNER JOIN pistas
					ON(animales.nombre_pista = pistas.nombre)
ORDER BY animales.nombre ASC;                    
			
-- 3.- Muestra los nombres de los artistas que actuan con animales

SELECT nombre
FROM artistas INNER JOIN animales_artistas 
				ON(artistas.nif = animales_artistas.nif_artista)
ORDER BY nombre ASC;   

/*
-- 4.-Muestra los nif's de los artistas y el nombre y peso de los animales con los que actuan
*/                 
-- 2 tablas

SELECT nif_artista, nombre
FROM animales_artistas INNER JOIN animales
					ON (animales_artistas.nombre_animal = animales.nombre)
ORDER BY nombre ASC;                    

-- 3 tablas
-- Muestra los nombres de los artistas y el nombre y peso de los animales con los que actuan

SELECT artistas.nombre as nombre_artista, animales.nombre as nombre_animal, peso
FROM artistas INNER JOIN animales_artistas
					ON (artistas.nif = animales_artistas.nif_artista)
				INNER JOIN animales
					ON (animales_artistas.nombre_animal = animales.nombre)
ORDER BY nombre_artista ASC;           

/*
-- 5.- Muestra los artistas que actuaron en cada una de las atracciones que se celebraron, indicando tambien
la fecha en la que se celebró la atraccion y la ganancia que tuvo
*/         

-- 3 tablas
SELECT artistas.nombre as nombre_artista, atracciones.nombre as nombre_atraccion, atracciones.fecha_inicio as fecha_inicio, ganancias
FROM artistas INNER JOIN atracciones_artistas				
					ON (artistas.nif = atracciones_artistas.nif_artista)
				INNER JOIN atracciones
					ON (atracciones_artistas.nombre_atraccion = atracciones.nombre)
WHERE atracciones.fecha_inicio IS NOT NULL                    
ORDER BY nombre_artista ASC;                    

-- 2 tablas
/*
Muestra los nif's de los artistas que actuaron en cada una de las atracciones que se celebraron, indicando tambien
la fecha en la que se celebró la atraccion y la ganancia que tuvo
*/ 

SELECT nif_artista, atracciones_artistas.fecha_inicio as fecha_inicio, ganancias
FROM atracciones_artistas INNER JOIN atracciones
					ON (atracciones_artistas.nombre_atraccion = atracciones.nombre)
WHERE atracciones.fecha_inicio IS NOT NULL
ORDER BY atracciones.nombre ASC;

/*
-- 6.- Muestra los animales con la pista en la que actuan y su aforo pero de solo los animales que 
tienen una edad entre 2 y 5 años
*/

SELECT animales.nombre AS nombre_animal, pistas.nombre as nombre_pista, aforo
FROM animales INNER JOIN pistas
					ON (animales.nombre_pista = pistas.nombre)
WHERE animales.anhos BETWEEN 2 AND 5
ORDER BY animales.nombre ASC;             

/*
-- 7.- Muestra las atracciones que hayan comenzado a partir del año 2000(incluido) o que todavia
no se hayan estrenado
*/

SELECT  nombre, fecha_inicio
FROM atracciones 
WHERE fecha_inicio > "2000-01-01" OR fecha_inicio IS NULL
ORDER BY nombre ASC;

-- 8.- Muestra los animales junto con las atracciones así como las ganancias de dichas atracciones

SELECT animales.nombre as nombre_animales, atracciones.nombre as nombre_atraccion, ganancias
FROM animales INNER JOIN atracciones
					ON (animales.nombre_atraccion = atracciones.nombre)
ORDER BY animales.nombre ASC;                    
                    




           
