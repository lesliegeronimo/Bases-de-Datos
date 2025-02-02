/* ============================================================
   Procedimiento: crear_atleta
   ============================================================
   Descripción:
       Este procedimiento permite registrar un nuevo atleta en la 
       tabla `Atleta`. Antes de realizar la inserción, valida que
       el identificador no exista previamente para evitar duplicados.

   Objetivo:
       Insertar un nuevo registro en la tabla `Atleta` con los datos
       proporcionados, garantizando la integridad y unicidad del ID.

   Parámetros de Entrada:
       - p_idAtleta (VARCHAR): Identificador único del atleta.
       - p_nombrePais (VARCHAR): Nombre del país de origen del atleta.
       - p_disciplina (VARCHAR): Disciplina en la que compite el atleta.
       - p_genero (VARCHAR): Género del atleta (Masculino/Femenino).
       - p_nombre (VARCHAR): Nombre del atleta.
       - p_apellidoP (VARCHAR): Apellido paterno del atleta.
       - p_apellidoM (VARCHAR): Apellido materno del atleta.
       - p_fechaNacimiento (DATE): Fecha de nacimiento del atleta.
       - p_año (DATE): Año en el que participa el atleta.

   Consideraciones:
       - Este procedimiento no verifica dependencias en otras tablas.
   ============================================================
*/

CREATE OR REPLACE PROCEDURE crear_atleta(
    p_idAtleta VARCHAR,
    p_nombrePais VARCHAR,
    p_disciplina VARCHAR,
    p_genero VARCHAR,
    p_nombre VARCHAR,
    p_apellidoP VARCHAR,
    p_apellidoM VARCHAR,
    p_fechaNacimiento DATE,
    p_año DATE
)
LANGUAGE plpgsql
AS $$
BEGIN
    -- Verifica si el ID del atleta ya existe
    IF EXISTS (SELECT 1 FROM Atleta WHERE idAtleta = p_idAtleta) THEN
        RAISE EXCEPTION 'El atleta con ID % ya existe.', p_idAtleta;
    END IF;

    -- Inserta un nuevo registro en la tabla Atleta
    INSERT INTO Atleta (
        idAtleta, nombrePais, disciplina, genero, nombre, apellidoP, apellidoM, fechaDeNacimiento, año
    ) VALUES (
        p_idAtleta, p_nombrePais, p_disciplina, p_genero, p_nombre, p_apellidoP, p_apellidoM, p_fechaNacimiento, p_año
    );

    -- Notifica que la inserción fue exitosa
    RAISE NOTICE 'Atleta con ID % registrado exitosamente.', p_idAtleta;
END;
$$;

-- Ejemplo de uso 
CALL crear_atleta(
    'A110', 'Brasil', 'Fútbol', 'Masculino', 
    'Neymar', 'da Silva', 'Santos Júnior', '1998-06-12', '2024-07-28'
);


/* ============================================================
   Función: obtener_aforo_localidad
   ============================================================
   Descripción:
       Esta función devuelve el aforo de una localidad específica 
       basado en el nombre de la localidad. La consulta buscará 
       el aforo en la tabla `localidad` correspondiente a la localidad 
       indicada.

   Parámetros de Entrada:
       - p_nombre_localidad (VARCHAR): El nombre de la localidad 
         cuya capacidad (aforo) se desea obtener.

   Retorno:
       - Devuelve un valor de tipo `INT` que representa el aforo 
         de la localidad especificada.

   ============================================================
*/

CREATE OR REPLACE FUNCTION obtener_aforo_localidad(p_nombre_localidad VARCHAR)
RETURNS INT AS $$
DECLARE
    aforo INT;  -- Variable para almacenar el aforo de la localidad
BEGIN
    -- Obtenemos el aforo de la localidad
    SELECT l.aforo INTO aforo
    FROM localidad l
    WHERE l.nombrelocalidad = p_nombre_localidad;

    -- Si no se encuentra la localidad, lanzamos una excepción
    IF aforo IS NULL THEN
        RAISE NOTICE 'La localidad "%" no se encuentra en la base de datos.', p_nombre_localidad;
        RETURN NULL;
    END IF;

    -- Retorna el aforo de la localidad
    RETURN aforo;
END;
$$ LANGUAGE plpgsql;

-- Ejemplo de uso
SELECT obtener_aforo_localidad('Estadio Nacional');


/* ============================================================
   Función: obtener_total_medallas_pais
   ============================================================
   Descripción:
       Esta función devuelve el total de medallas ganadas por un país, 
       sumando las medallas de oro, plata y bronce de la tabla `pais`.
       Si el país no existe en la base de datos, la función devuelve NULL.

   Parámetros de Entrada:
       - p_nombre_pais (VARCHAR): El nombre del país cuyo total de medallas 
         se desea obtener.

   Retorno:
       - Devuelve un valor de tipo `INT` que representa el total de medallas 
         ganadas por el país especificado.

   ============================================================
*/

CREATE OR REPLACE FUNCTION obtener_total_medallas_pais(p_nombre_pais VARCHAR)
RETURNS INT AS $$
DECLARE
    total_medallas INT;  -- Variable para almacenar el total de medallas
BEGIN
    -- Sumar medallas de oro, plata y bronce para el país
    SELECT COALESCE(medallaoro, 0) + COALESCE(medallaplata, 0) + COALESCE(medallabronce, 0)
    INTO total_medallas
    FROM pais
    WHERE nombrepais = p_nombre_pais;

    -- Si el país no existe, lanzar una advertencia y retornar NULL
    IF total_medallas IS NULL THEN
        RAISE NOTICE 'País "%" no encontrado en la base de datos.', p_nombre_pais;
        RETURN NULL;
    END IF;

    -- Retornar el total de medallas
    RETURN total_medallas;
END;
$$ LANGUAGE plpgsql;

-- Ejemplo de uso
SELECT obtener_total_medallas_pais('Colombia');


/* ============================================================
   Trigger: conflictos_localidad_horario
   ============================================================
   Descripción:
       Este trigger verifica que no exista otro evento en la misma localidad
       y con el mismo horario al intentar insertar un nuevo evento en la tabla `Agenda`.
       Si ya existe un evento con la misma combinación de localidad y horario,
       se lanzará una excepción que detendrá la inserción.

   ============================================================
*/
CREATE OR REPLACE FUNCTION conflictos_localidad_horario()
RETURNS TRIGGER AS $$
BEGIN
    -- Verifica si ya existe un evento en la misma localidad y con el mismo horario
    IF EXISTS (
        SELECT 1
        FROM Agenda
        WHERE localidad = NEW.localidad
        AND horario = NEW.horario
    ) THEN
        RAISE EXCEPTION 'Ya existe un evento en la localidad % a las %.', NEW.localidad, NEW.horario;
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Crear el trigger para que se ejecute antes de la inserción en la tabla Agenda
CREATE TRIGGER trigger_conflictos_localidad_horario
BEFORE INSERT ON Agenda
FOR EACH ROW
EXECUTE FUNCTION conflictos_localidad_horario();

-- Ejemplo de uso
INSERT INTO Agenda (idagenda, localidad, disciplina, horario, fecha, precio, duracion, participantes) VALUES ('Z006', 'Pista de Ciclismo', 'Ciclismo', '08:00:00', '2024-07-30', 35.00, 180, '30');


/* ============================================================
   Trigger: verificar_precio_minimo_evento
   ============================================================
   Descripción:
       Los eventos deben ser económicamente sostenibles a largo plazo. 
       Si los precios son demasiado bajos, podría ser difícil garantizar
       la continuidad y el éxito de futuras ediciones, lo que afectaría la planificación a largo plazo.

       Por esta razon este trigger valida que el precio de un evento no sea menor a 50. 
       Si el precio ingresado es menor a 50, el trigger lanzará una excepción 
       y evitará la inserción o actualización del evento.

   ============================================================
*/

CREATE OR REPLACE FUNCTION verificar_precio_minimo_evento()
RETURNS TRIGGER AS $$
BEGIN
    -- Verifica si el precio es menor a 50
    IF NEW.precio < 50 THEN
        RAISE EXCEPTION 'El precio del evento debe ser al menos 50. Precio ingresado: %', NEW.precio;
    END IF;

    -- Si el precio es válido, permite la inserción o actualización
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Crear el trigger para que se ejecute antes de la inserción o actualización en la tabla Evento
CREATE TRIGGER trigger_verificar_precio_minimo_evento
BEFORE INSERT OR UPDATE ON Evento
FOR EACH ROW
EXECUTE FUNCTION verificar_precio_minimo_evento();

-- Ejemplo de uso
INSERT INTO Evento (idevento, idagenda, precio, fase, preciofinal, localidad) VALUES ('ZV020', 'A010', 40, 1, 90, 'Ring Central');


/* ============================================================
   Trigger: maximo_participantes
   ============================================================
   Descripción:
       Este trigger verifica que el número de participantes en una disciplina 
       no supere el máximo permitido de 80. Si se intenta insertar un valor mayor 
       a 80, se lanzará una excepción y no se permitirá la inserción.
   ============================================================
*/

CREATE OR REPLACE FUNCTION maximo_participantes()
RETURNS TRIGGER AS $$
BEGIN
    -- Verifica si el número de participantes (convertido a entero) es mayor a 80
    IF CAST(NEW.Participantes AS INTEGER) > 80 THEN
        RAISE EXCEPTION 'El número máximo de participantes en % es 80. Se intentó insertar % participantes.',
        NEW.NombreDisciplina, NEW.Participantes;
    END IF;

    -- Si la verificación pasa, permite la inserción
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Crear el trigger para que se ejecute antes de la inserción en la tabla Disciplina
CREATE TRIGGER trigger_maximo_participantes
BEFORE INSERT ON Disciplina
FOR EACH ROW
EXECUTE FUNCTION maximo_participantes();

-- Caso de uso
INSERT INTO Disciplina (NombreDisciplina, NombrePais, Participantes, Año) VALUES ('Atletismo', 'Estados Unidos', 90, '2020-01-01');