
-- Test de correspondencia con patrón (LIKE)
-- 1.- Lista los nombres de atracciones que tengan "gran" entre sus palabras

SELECT nombre
FROM atracciones
WHERE nombre LIKE '%gran%';

-- 2.- Mostrar los nombres de las atracciones que tengan una palabra seguida de un espacio y acabando la ultima palabra en 's'

SELECT nombre
FROM atracciones
WHERE nombre LIKE '% %s';

-- 3.- Lista los nombres de las atracciones cuya segunda letra sea una 'l'

SELECT nombre
FROM atracciones 
WHERE nombre LIKE '_l%';


-- Test de valor nulo (IS NULL)

-- 4.- Lista aquellos artistas junto con la atraccion que todavia estan trabajando en alguna atraccion

SELECT distinct nif_artista, nombre_atraccion
FROM atracciones_artistas
WHERE fecha_fin IS NULL;

-- 5.- Lista aquellas atracciones que ya esten funcionando en el circo

SELECT nombre
FROM atracciones
WHERE fecha_inicio IS NOT NULL;

-- 6.- Lista los animales que tengan uno o dos años y un peso mayor o igual a 20

SELECT nombre, anhos, peso
FROM animales
WHERE anhos IN(1,2) AND peso >= 20;


-- Condiciones de búsqueda compuestas (AND, OR y NOT)
-- 7.- Lista los artistas que tengan un apellido que comience por 'San' o 'Gar'

SELECT nombre, apellidos
FROM artistas
WHERE nombre LIKE 'Ju%' OR apellidos LIKE 'Per%';


-- Ordenación de los resultados de una consulta (cláusula ORDER BY)
-- 8.- Lista los nombres de los artistas ordenados alfabeticamente

SELECT nombre
FROM artistas
ORDER BY nombre ASC;

-- 9.- Lista los artistas que trabajan en la atraccion 'El Gran Felino', ordenados por su numero de nif de forma descendente

SELECT nombre_atraccion, nif_artista
FROM atracciones_artistas
WHERE nombre_atraccion = 'El gran felino' AND fecha_fin IS NOT NULL
ORDER BY nif_artista DESC;

/*
10.- Lista todas las atracciones, indicando la fecha en la que se realizo la atraccion y el factor de ganancia, que se obtiene
dividiendo el numero de espectadores por la ganancia, ordenados de mayor a menor por el factor de ganancia, posteriormente
de menor a mayor por la fecha de actuacion y por ultimo de mayor a menor por el nombre de la atraccion
*/

SELECT nombre_atraccion, fecha, (ganancias/num_espectadores) as factor_ganancia
FROM atraccion_dia
ORDER BY factor_ganancia DESC, fecha ASC, nombre_atraccion DESC;











