
-- Entrenadores y Atletas, que compartan el apellido y que se encuentren participando en la misma disciplina.
-- Deberan ordenar la información a partir del apellido paterno.

SELECT  
    E.Nombre AS NombreEntrenador,
    E.ApellidoP AS ApellidoPaterno,
    D.NombreDisciplina AS Disciplina,
    A.Nombre AS NombreAtleta
FROM 
    Entrenador E
JOIN 
    Atleta A ON E.ApellidoP = A.ApellidoP
JOIN 
    Disciplina D ON A.Disciplina = D.NombreDisciplina AND D.NombreDisciplina = E.NombreDisciplina
ORDER BY 
    E.ApellidoP;
   
   
   
   
   --- Atletas que hayan participado en más de 1 disciplina.

   SELECT 
    D.Participantes AS NombreAtleta
FROM 
    Disciplina D
GROUP BY 
    D.Participantes
HAVING 
    COUNT(D.NombreDisciplina) > 1;

   
   -- El número de medallas de oro ganadas por México.
   -- El número de medallas de plata ganadas por Japon.
   -- El número de medallas de bronce ganas por España.
   SELECT 
    (SELECT MedallaOro FROM Pais WHERE NombrePais = 'México') AS MedallasOroMexico,
    (SELECT MedallaPlata FROM Pais WHERE NombrePais = 'Japón') AS MedallasPlataJapon,
    (SELECT MedallaBronce FROM Pais WHERE NombrePais = 'España') AS MedallasBronceEspaña;
   
   
   -- La información de los atletas que ganaron medallas en la disciplina halterofilia.
 SELECT * 
FROM Atleta 
WHERE Disciplina = 'halterofilia';


--  Patrocinadores que solo esten patrocinando a una disciplina.
SELECT Patrocinador
FROM Patrocinadores
GROUP BY Patrocinador
HAVING COUNT(DISTINCT NombreDisciplina) = 1;



--- La información de todos los atletas que hayan ganado alguna medalla. Asi como un conteo de las medallas
-- de oro, plata y bronce que ganaron. La información debera ser ordenada con respecto a las medallas, es
-- decir primero oro, despues plata y al final bronce.

SELECT 
    idAtleta, 
    NombreDisciplina, 
    MedallaOro, 
    MedallaPlata, 
    MedallaBronce
FROM 
    Ganar
WHERE 
    MedallaOro > 0 OR MedallaPlata > 0 OR MedallaBronce > 0
ORDER BY 
    MedallaOro DESC, 
    MedallaPlata DESC, 
    MedallaBronce DESC;

   
   
   -- La información de eventos cuyo precio base sea mayor a 2500. Deberan ordenar la información a partir
-- del precio.
SELECT *
FROM Evento
WHERE Precio > 2500
ORDER BY Precio;



-- Los Jueces y Entrenadores que tengan la misma nacionalidad pero que no se encuentren participando en
-- el mismo evento.
SELECT 
    J.idJuez, J.Nombre AS NombreJuez, J.ApellidoP AS ApellidoPJuez, J.Nacionalidad AS NacionalidadJuez, J.idEvento AS EventoJuez,
    E.idEntrenador, E.Nombre AS NombreEntrenador, E.ApellidoP AS ApellidoPEntrenador, E.Nacionalidad AS NacionalidadEntrenador, E.idEvento AS EventoEntrenador
FROM 
    Juez J
JOIN 
    Entrenador E 
ON 
    J.Nacionalidad = E.Nacionalidad
AND 
    J.idEvento <> E.idEvento;





