-- EQUIPO LUK 

-- EVENTOS CON MÁS DE 200 ENTRADAS VENDIDAS
SELECT evento.idevento, evento.localidad, entrada.cantidad, evento.preciofinal
FROM evento
JOIN entrada ON evento.idevento = entrada.idevento
WHERE entrada.cantidad > 200;

-- ENTRADAS Y AFORO DE LOCALIDAD
SELECT evento.idevento, evento.localidad, entrada.cantidad AS entradas_vendidas, localidad.aforo
FROM evento
JOIN entrada ON evento.idevento = entrada.idevento
JOIN localidad ON evento.idevento = localidad.idevento
WHERE entrada.cantidad > 0;

-- EVENTOS CON PRECIO FINAL MAYOR A 150
SELECT idevento, localidad, preciofinal
FROM evento
WHERE preciofinal > 150;

-- ENTRADAS VENDIDAS POR LOCALIDAD
SELECT localidad.nombrelocalidad, SUM(entrada.cantidad) AS total_entradas
FROM entrada
JOIN localidad ON entrada.idevento = localidad.idevento
GROUP BY localidad.nombrelocalidad
HAVING SUM(entrada.cantidad) > 30;

-- NUMEROS DE TELEFONO AGRUPADOS POR SU TIPO
SELECT 'Atleta' AS tipo, telefonoatleta.telefono
FROM telefonoatleta
UNION
SELECT 'Juez', telefonojuez.telefono
FROM telefonojuez
UNION
SELECT 'Entrenador', telefonoentrenador.telefono
FROM telefonoentrenador
UNION
SELECT 'Árbitro', telefonoarbitro.telefono
FROM telefonoarbitro;
 
-- Cantidad de Atletas que hay en las disciplinas que se imparten..
SELECT 
    disciplina, 
    COUNT(*) AS cantidad_atletas
FROM 
    Atleta
GROUP BY 
    disciplina
ORDER BY 
    cantidad_atletas DESC;

 -- Eventos que se realizan en localidades con una capacidad mayor a 1000 personas
  SELECT e.idEvento, e.Localidad 
FROM Evento e
JOIN Localidad l ON e.idEvento = l.idEvento
WHERE CAST(l.Aforo AS INT) > 1000;

-- Atletas que han participado en competiciones eliminatorias
SELECT a.Nombre, a.ApellidoP, a.ApellidoM, c.idCompetencia -- 
FROM Atleta a
JOIN Competencia c ON a.idAtleta = c.idAtleta
WHERE c.FaseEliminatoria = TRUE;

--  Disciplinas con mas medallas de Oro.
SELECT g.nombredisciplina, SUM(g.medallaoro) AS total_oro
FROM ganar g
GROUP BY g.nombredisciplina
ORDER BY total_oro DESC;



-- Disciplinas con sus patrocinadores y el número total de atletas en cada una
SELECT d.NombreDisciplina, p.Patrocinador, COUNT(r.idAtleta) AS NumeroDeAtletas
FROM Disciplina d
LEFT JOIN Patrocinadores p ON d.NombreDisciplina = p.NombreDisciplina
LEFT JOIN Representar r ON d.NombreDisciplina = r.NombreDisciplina
GROUP BY d.NombreDisciplina, p.Patrocinador;

-- Consultar la disciplina con más participantes por año
SELECT Año, NombreDisciplina, MAX(Participantes) AS MaxParticipantes
FROM Disciplina
GROUP BY Año, NombreDisciplina
ORDER BY Año DESC, MaxParticipantes DESC;

--Eventos con la Mayor Cantidad de Entradas Vendidas, va de mayor entradas vendidas a menor.
SELECT e.idEvento, ag.Fecha, ag.Duracion, SUM(en.Cantidad) AS EntradasVendidas
FROM Evento e
JOIN Entrada en ON e.idEvento = en.idEvento
JOIN Agenda ag ON e.idAgenda = ag.idAgenda
GROUP BY e.idEvento, ag.Fecha, ag.Duracion
ORDER BY EntradasVendidas DESC;

-- Consultar la agenda de eventos por fecha.
SELECT a.idAgenda, a.Localidad, a.Disciplina, a.Horario, a.Fecha, a.Precio, a.Duracion
FROM Agenda a
WHERE a.Fecha BETWEEN '2018-12-01' AND '2024-12-31' 
ORDER BY a.Fecha;


-- Obtener el Total de Dinero Generado por un País en Eventos.
SELECT 
    P.NombrePais,
    SUM(E.PrecioFinal * En.Cantidad) AS DineroGenerado
FROM 
    Pais P
JOIN 
    Atleta A ON P.NombrePais = A.NombrePais
JOIN 
    Representar R ON A.idAtleta = R.idAtleta
JOIN 
    Agenda Ag ON R.NombreDisciplina = Ag.Disciplina
JOIN 
    Evento E ON Ag.idAgenda = E.idAgenda
JOIN 
    Entrada En ON E.idEvento = En.idEvento
GROUP BY 
    P.NombrePais;

-- Eventos con precio más alto
SELECT 
    idEvento,
    PrecioFinal
FROM 
    Evento
ORDER BY 
    PrecioFinal DESC
LIMIT 30;


-- Porcentaje de medallas ganadas por país
SELECT 
    p.NombrePais, 
    SUM(g.MedallaOro) AS TotalOro, 
    SUM(g.MedallaPlata) AS TotalPlata, 
    SUM(g.MedallaBronce) AS TotalBronce, 
    (SUM(g.MedallaOro) + SUM(g.MedallaPlata) + SUM(g.MedallaBronce)) AS TotalMedallas,
    ROUND((SUM(g.MedallaOro) * 100.0 / SUM(g.MedallaOro + g.MedallaPlata + g.MedallaBronce)), 2) AS PorcentajeOro
FROM 
    Pais p
JOIN 
    Atleta a ON p.NombrePais = a.NombrePais
JOIN 
    Ganar g ON a.idAtleta = g.idAtleta
GROUP BY 
    p.NombrePais
ORDER BY 
    TotalMedallas DESC;
   
   -- Consulta para total de entradas vendidas por localidad
SELECT 
    localidad.nombrelocalidad, 
    SUM(entrada.cantidad) AS total_entradas
FROM 
    entrada
JOIN 
    localidad ON entrada.idevento = localidad.idevento
GROUP BY 
    localidad.nombrelocalidad
ORDER BY 
    total_entradas desc;