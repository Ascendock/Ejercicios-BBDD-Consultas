
-- 1.- Muestra las pistas que tengan un aforo inferor a 500

SELECT nombre, aforo
FROM pistas
WHERE aforo < 500;

-- 2.- Encuentra los nombres de los animales que no tengan dos años

SELECT nombre,anhos
FROM animales
WHERE anhos != 2;

/*
-- 3.- Muestra  el nombre de las atracciones y el nif del artista de las atracciones que hayan
comenzado hoy mismo (añade una nueva fila previamente con la fecha de hoy)¿Sería necesario
emplear la opcion distinct?
*/

SELECT nombre_atraccion, nif_artista, curdate() as fecha_actual
FROM atracciones_artistas
WHERE fecha_inicio = curdate();

-- 4.- Muestra los nombres de las atracciones que hayan comenzando en el año 2000

SELECT nombre, fecha_inicio
FROM atracciones
WHERE year(fecha_inicio) = 2000;

-- 5.- Muestra los nombres de los animales que tengan una altura inferior a 2 m

SELECT nombre, estatura
FROM animales
WHERE estatura < 2;

-- 6.- Muestra los nombres de los animales que hayan actuado con algun artista

SELECT distinct nombre_animal
FROM animales_artistas
WHERE nif_artista IS NOT NULL;

-- 7.- Muestra el nombre de las atracciones que hayan tenido mas de 2000 euros de ganancia en un dia

SELECT distinct nombre
FROM atracciones
WHERE ganancias >= 2000;

/*
-- 8.- Suponiendo que la estatura de los animales esta guardada en metros, muestra el nombre,
peso, nombre de pista y estatura en milimetros de los animales que estan en la pista LATERAL1
*/

SELECT nombre, peso, nombre_pista, estatura as estatura_metros, ROUND((estatura*1000)) as estatura_mm
FROM animales
WHERE nombre_pista = "LATERAL1";

/*
-- 9.- Muestra los artistas junto con las atracciones en las que trabajan o trabajaron. Indica
la fecha en la que comenzaron a trabajar y la fecha en la que lo dejaron
*/

SELECT distinct nif_artista, nombre_atraccion, fecha_inicio, fecha_fin
FROM atracciones_artistas;


