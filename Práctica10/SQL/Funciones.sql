CREATE OR REPLACE FUNCTION obtener_edad_atleta(id_atleta VARCHAR)
RETURNS INT AS $$
DECLARE
    edad INT;
    fecha_nacimiento DATE;
BEGIN
    -- Obtenemos la fecha de nacimiento del atleta
    SELECT FechaDeNacimiento INTO fecha_nacimiento
    FROM Atleta
    WHERE idAtleta = id_atleta;

    -- Calculamos la edad del atleta
    IF fecha_nacimiento IS NOT NULL THEN
        edad := DATE_PART('year', AGE(fecha_nacimiento));
    ELSE
        RAISE NOTICE 'Atleta con id % no encontrado', id_atleta;
        RETURN NULL;
    END IF;

    RETURN edad;
END;
$$ LANGUAGE plpgsql;

SELECT obtener_edad_atleta('5WP2YK0ED05');






CREATE OR REPLACE FUNCTION calcular_medallas_pais(nombre_pais VARCHAR)
RETURNS INT AS $$
DECLARE
    total_medallas INT;
BEGIN
    -- Calcula el total de medallas (oro, plata, bronce) para el país
    SELECT COALESCE(MedallaOro, 0) + COALESCE(MedallaPlata, 0) + COALESCE(MedallaBronce, 0) INTO total_medallas
    FROM Pais
    WHERE NombrePais = nombre_pais;

    -- Si el país no se encuentra, devuelve NULL
    IF total_medallas IS NULL THEN
        RAISE NOTICE 'País % no encontrado', nombre_pais;
        RETURN NULL;
    END IF;

    RETURN total_medallas;
END;
$$ LANGUAGE plpgsql;

SELECT calcular_medallas_pais('México');

























