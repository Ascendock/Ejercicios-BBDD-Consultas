-- Funciones de columna
-- 1.- Cuantas veces se celebraron cada una de las atracciones

SELECT nombre_atraccion, count(*)
FROM atraccion_dia
GROUP BY nombre_atraccion
ORDER BY nombre_atraccion;

-- 2.- De cuantos empleados disponen cada uno de los jefes (indicar nif jefe)

SELECT distinct count(*) as num_empleados, nif_jefe
FROM artistas
WHERE nif_jefe IS NOT NULL
GROUP BY nif
ORDER BY nif_jefe ASC;

-- 3.- De cuantos empleados dispone cada uno de los jefes (indicar nombre y apellidos de los jefes)

SELECT jefes.nombre, jefes.apellidos, count(*) as num_empleados
FROM artistas INNER JOIN artistas as jefes
				ON (artistas.nif_jefe = jefes.nif)
GROUP BY jefes.nif
ORDER BY jefes.nombre;     

-- 4.- Cuantas veces se tuvo una ganancia superior a 20000 durante el año 2000

SELECT count(*) as num_veces
FROM atraccion_dia
WHERE ganancias > 20000 AND year(fecha)=2000
ORDER BY ganancias DESC;

/*
-- 5.- Obtén en cuantas atracciones distintas esta actuando cada artista, mostrando su nombre y apellidos
y siempre que la suma de las ganancias sea superior a 50000
*/

SELECT artistas.nombre, apellidos, atracciones.nombre, ganancias, count(*) as num_distintas
FROM atracciones_artistas INNER JOIN artistas
				ON (atracciones_artistas.nif_artista = artistas.nif)
			INNER JOIN atracciones
				ON (atracciones.nombre = atracciones_artistas.nombre_atraccion)
WHERE fecha_fin IS NULL
GROUP BY artistas.nombre
HAVING SUM(atracciones.ganancias) > 50000
ORDER BY artistas.nombre ASC;



SELECT artistas.nif as nif, artistas.nombre as nombre, artistas.apellidos as apellido, count(*)
FROM artistas INNER JOIN atracciones_artistas
				ON (artistas.nif = atracciones_artistas.nif_artista)
					INNER JOIN atracciones
				ON(atracciones_artistas.nombre_atraccion = atracciones.nombre)
WHERE fecha_fin IS NULL
GROUP BY artistas.nif
HAVING SUM(atracciones.ganancias) > 50000
ORDER BY artistas.nif;

-- 6.- Muestra el mayor peso y el menor peso

SELECT MAX(peso), MIN(peso)
FROM animales
ORDER BY peso;

-- 7.- Muestra el peso medio de los animales que hayan actuado en pistas con un aforo entre 200 y 500

SELECT pistas.nombre, round(avg(peso),3) as peso_medio
FROM animales INNER JOIN pistas
			ON (animales.nombre_pista = pistas.nombre)
WHERE aforo BETWEEN 200 AND 500
GROUP BY pistas.nombre
ORDER BY animales.peso ASC; 

/*
-- 8.- Muestra el numero de atracciones *por año* siempre que se hayan obtenido unas ganancias
por año superior a 40000
*/

SELECT *
FROM atracciones
GROUP BY year(fecha_inicio)
HAVING sum(ganancias) > 40000
ORDER BY fecha ASC;

SELECT YEAR(fecha) as año,COUNT(*) as NumAtracciones
FROM ATRACCION_DIA
GROUP BY YEAR(fecha)
HAVING SUM(ganancias) > 40000
ORDER BY año ASC;

/*
-- 9.- Muestra cuantos tipos de animales tenemos en el circo, que trabajen en las pistas LATERAL1 
o LATERAL2, pero solo deben mostrar aquellos tipos en los que haya al menos dos animales
*/

SELECT tipo, count(tipo) AS numero_tipos
FROM animales
WHERE nombre_pista IN ("LATERAL1","LATERAL2")
GROUP BY tipo
HAVING COUNT(tipo) >=2
ORDER BY tipo ASC;

/*
-- 10.- Muestra las atracciones que se celebraron en el año 2000
*/

SELECT nombre_atraccion, count(*) as num_veces_año
FROM atraccion_dia
WHERE year(fecha)= 2000
GROUP BY nombre_atraccion
ORDER BY nombre_atraccion ASC;

/*
-- 11.- Muestra por cada atraccion, la fecha de inicio de la misma y cuantos espectadores
habia siempre que las ganancias fueran superiores a 40000 entre los años 1999 y 2002
*/

SELECT atracciones.nombre,atracciones.fecha_inicio, atracciones.ganancias, SUM(num_espectadores)
FROM atracciones INNER JOIN atraccion_dia
					ON (atracciones.nombre = atraccion_dia.nombre_atraccion)
WHERE atracciones.ganancias > 40000 AND year(fecha) BETWEEN 1999 AND 2002  
GROUP BY atracciones.nombre
ORDER BY atracciones.nombre ASC;





           
