
-- 1.- Muestra los animales con una estatura menor de 220 cm y un peso entre 1000 gramos y 1500 gramos

SELECT nombre, estatura, peso
FROM animales
WHERE estatura < 2.2 AND peso BETWEEN 100 AND 150;

-- 2.- Muestra las pistas con un aforo entre 200 y 500 personas

SELECT  nombre, aforo
FROM pistas
WHERE aforo BETWEEN 200 AND 500;

-- 3.- Muestra las atracciones que trabajaron artistas entre 1999 y 2000 ambos incluidos

SELECT nombre_atraccion
FROM atracciones_artistas
WHERE (year(fecha_inicio) >=1999) AND (year(fecha_fin) <= 2000);

