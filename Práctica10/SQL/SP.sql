CREATE OR REPLACE PROCEDURE registrar_entrenador(
    p_idEntrenador VARCHAR,
    p_nombre VARCHAR,
    p_apellidoP VARCHAR,
    p_apellidoM VARCHAR,
    p_nacionalidad VARCHAR,
    p_fechaNacimiento DATE,
    p_nombreDisciplina VARCHAR,
    p_idEvento VARCHAR
)
LANGUAGE plpgsql
AS $$
BEGIN
    -- Validación para asegurar que los campos de texto no contienen números ni símbolos
    IF p_nombre ~ '[^a-zA-Z ]' OR
       p_apellidoP ~ '[^a-zA-Z ]' OR
       p_apellidoM ~ '[^a-zA-Z ]' OR
       p_nacionalidad ~ '[^a-zA-Z ]' THEN
        RAISE EXCEPTION 'Los campos de nombre, apellidos y nacionalidad deben contener solo letras y espacios.';
    END IF;

    -- Inserción del entrenador en la tabla
    INSERT INTO Entrenador (
        idEntrenador, Nombre, ApellidoP, ApellidoM, Nacionalidad, FechaDeNacimiento, NombreDisciplina, idEvento
    )
    VALUES (
        p_idEntrenador, p_nombre, p_apellidoP, p_apellidoM, p_nacionalidad, p_fechaNacimiento, p_nombreDisciplina, p_idEvento
    );

    RAISE NOTICE 'Entrenador % registrado exitosamente.', p_idEntrenador;
END;
$$;



CALL registrar_entrenador(
    '0123456789A',
    'Leslie',
    'Geronimo',
    'Soto',
    'Peru',
    '2004-02-14',  -- Fecha de nacimiento
    'clavados',
    '8MG2PE8TM08'
);








CREATE OR REPLACE PROCEDURE eliminar_juez(p_idJuez VARCHAR)
LANGUAGE plpgsql
AS $$
BEGIN
    -- Verifica si el juez existe antes de proceder a eliminar
    IF NOT EXISTS (SELECT 1 FROM Juez WHERE idJuez = p_idJuez) THEN
        RAISE EXCEPTION 'Juez con id % no encontrado.', p_idJuez;
    END IF;

    -- Elimina las referencias del juez en otras tablas antes de eliminar el juez en sí
    DELETE FROM CorreoJuez WHERE idJuez = p_idJuez;
    DELETE FROM TelefonoJuez WHERE idJuez = p_idJuez;
    DELETE FROM Supervisar WHERE idJuez = p_idJuez;

    -- Elimina al juez de la tabla Juez
    DELETE FROM Juez WHERE idJuez = p_idJuez;

    RAISE NOTICE 'Juez con id % y sus referencias eliminadas exitosamente.', p_idJuez;
END;
$$;


CALL eliminar_juez('6AT5RC8KY09');


