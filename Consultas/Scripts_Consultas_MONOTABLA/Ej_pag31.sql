-- Consultas propuestas

/*
1.- Muestra aquellos animales que sean jirafas o leones y que trabajen en alguna de las pistas laterales.
A mayores del animal, muestra el factor de crecimiento que se calcula dividiendo la altura en cm entre
el peso en kg. De dicho factor muestra 3 digitos decimales. Ordena los resultados por este factor de 
forma descendente y por el nombre alfabéticamente
*/

SELECT nombre, nombre_pista, round(((estatura*100)/peso),3) AS factor_crecimiento
FROM animales
WHERE nombre_pista IN("LATERAL1","LATERAL2") AND tipo IN("León","Jirafa")
ORDER BY factor_crecimiento DESC, nombre ASC;

/*
2.- Muestra las ganancias que se obtuvieron entre los años 1998 y 2000 ambos incluidos
ordenada de mayor a menor
*/

SELECT nombre, ganancias
FROM atracciones
WHERE fecha_inicio BETWEEN '1998-01-01' AND '2000-12-31'
ORDER BY ganancias DESC;

/*
3.- Muestra los nombres de los animales que son atendidos por los artistas cuyo segundo dígito 
del nif empieza en 1 y acaba en la letra 'A' ordenador alfabéticamente
*/

SELECT nombre_animal, nif_artista
FROM animales_artistas
WHERE nif_artista LIKE '1%A'
ORDER BY nombre_animal ASC;

/*
4.- Muestra el apellido y nombre en la misma columna con el formato nombre => apellido, el apellido y nombre
separados en dos columnas de aquellos artistas que no tienen jefe, ordenados alfabeticamente de la Z a la A
por apellido y por nombre de la A a la Z
*/

SELECT CONCAT(nombre," ",apellidos) as 'nombre => apellido', nombre, apellidos
FROM artistas
WHERE nif_jefe IS NULL
ORDER BY apellidos DESC, nombre ASC;

/*
5.- Muestra las atracciones que hayan comenzado y que tengan unas ganancias entre 10000 y 50000
*/

SELECT nombre,ganancias
FROM atracciones
WHERE ganancias BETWEEN 10000 AND 50000 AND fecha_inicio IS NOT NULL
ORDER BY nombre ASC;

/*
6.- Muestra los artistas que hayan trabajado en la atraccion 'El gran felino' a partir de mayo del
2000 y que aun siga trabajando
*/

SELECT nif_artista, nombre_atraccion
FROM atracciones_artistas
WHERE nombre_atraccion = 'El gran felino' AND fecha_fin IS NULL;

/*
7.- Muestra el aforo junto a su nombre, de las pistas cuyo nombre tenga como tercera letra una T y como segunda letra
del final, la L, ordenados por aforo de mayor a menor
*/

SELECT nombre, aforo
FROM pistas
WHERE nombre LIKE '___t%_l%'
ORDER BY nombre ASC;

/*
8.- Muestra las atracciones en las que hayan trabajado artistas pero ya no estén trabajando
*/

SELECT nombre_atraccion, nif_artista
FROM atracciones_artistas
WHERE fecha_fin IS NOT NULL
ORDER BY nombre_atraccion ASC;

/*
9.- Muestra las atracciones que no hayan comenzado
*/

SELECT nombre
FROM atracciones
WHERE fecha_inicio IS NULL
ORDER BY nombre ASC;





