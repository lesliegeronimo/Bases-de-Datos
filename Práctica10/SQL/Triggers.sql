CREATE OR REPLACE FUNCTION actualizar_medallero()
RETURNS TRIGGER AS $$
BEGIN
    -- Incrementa el conteo de medallas de acuerdo al tipo ganado
    IF NEW.MedallaOro > 0 THEN
        UPDATE Pais
        SET MedallaOro = MedallaOro + NEW.MedallaOro
        WHERE NombrePais = (SELECT NombrePais FROM Atleta WHERE idAtleta = NEW.idAtleta);
    END IF;

    IF NEW.MedallaPlata > 0 THEN
        UPDATE Pais
        SET MedallaPlata = MedallaPlata + NEW.MedallaPlata
        WHERE NombrePais = (SELECT NombrePais FROM Atleta WHERE idAtleta = NEW.idAtleta);
    END IF;

    IF NEW.MedallaBronce > 0 THEN
        UPDATE Pais
        SET MedallaBronce = MedallaBronce + NEW.MedallaBronce
        WHERE NombrePais = (SELECT NombrePais FROM Atleta WHERE idAtleta = NEW.idAtleta);
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;


CREATE TRIGGER actualizar_medallero_trigger
AFTER INSERT ON Ganar
FOR EACH ROW
EXECUTE FUNCTION actualizar_medallero();



INSERT INTO Ganar (NombreDisciplina, idAtleta, MedallaOro, MedallaPlata, MedallaBronce)
VALUES ('atletismo', '5WP2YK0ED05', 1, 0, 0);

INSERT INTO Ganar (NombreDisciplina, idAtleta, MedallaOro, MedallaPlata, MedallaBronce)
VALUES ('atletismo', '5WP2YK0ED05', 10, 3, 0);

INSERT INTO Ganar (NombreDisciplina, idAtleta, MedallaOro, MedallaPlata, MedallaBronce)
VALUES ('atletismo', '5WP2YK0ED05', 20, 20, 20);






ALTER TABLE Evento
ADD COLUMN precio_final NUMERIC(10, 2);


CREATE OR REPLACE FUNCTION calcular_precio_evento()
RETURNS TRIGGER AS $$
DECLARE
    ajuste NUMERIC;
    precio_final NUMERIC;
BEGIN
    -- Determina el ajuste de precio en función de la fase
    CASE NEW.Fase
        WHEN 'final' THEN ajuste := 1.2;
        WHEN 'semifinal' THEN ajuste := 1.1;
        ELSE ajuste := 1.0;
    END CASE;

    -- Calcula el precio final usando el precio ingresado como base
    precio_final := NEW.Precio * ajuste;

    -- Asigna el precio calculado al campo precio_final en la tabla Evento
    NEW.precio_final := precio_final;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;


CREATE OR REPLACE TRIGGER trigger_calcular_precio_evento
BEFORE INSERT OR UPDATE ON Evento
FOR EACH ROW
EXECUTE FUNCTION calcular_precio_evento();



UPDATE Evento
SET idAgenda = '2MD7CG8FE00',
    Localidad = 'Cuba',
    Precio = 2190.00,
    Fase = 'final'
WHERE idEvento = '8MG2PE8TM08';


UPDATE Evento
SET idEvento = idEvento; -- forzamos la ejecución del trigger para que calcule todos los valores 




    