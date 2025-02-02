
--Atletas cuyo nombre empiece con la letra R.
SELECT * FROM Atleta
WHERE Nombre LIKE 'R%';


--Entrenadores que hayan nacido en el mes de Junio.
SELECT * FROM Entrenador
WHERE EXTRACT(MONTH FROM FechaDeNacimiento) = 6;

--Eventos que hayan ocurrido entre el 1 de enero del 2024 y del 14 de abril del 2024.
SELECT * FROM Entrada
WHERE Fecha BETWEEN '2024-01-01' AND '2024-04-14';


--Localidades cuyo aforo sean mayor a 400 personas.
SELECT * FROM Localidad
WHERE Aforo > 400;


--Todos los Patrocinadores que se tengan registrados en los Juegos Olimpicos.
SELECT *
FROM Patrocinadores;
