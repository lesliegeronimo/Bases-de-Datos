-- Creamos las tablas con restricciones adicionales

CREATE TABLE Juez (
    idJuez VARCHAR(50),
    Nombre VARCHAR(50),
    ApellidoP VARCHAR(50),
    ApellidoM VARCHAR(50),
    Nacionalidad VARCHAR(30),
    FechaDeNacimiento DATE,
    UNIQUE (idJuez), -- Garantiza que no haya dos jueces con el mismo id
    CHECK (FechaDeNacimiento < CURRENT_DATE) -- Garantiza que la fecha de nacimiento sea en el pasado
);

-- Comentarios
COMMENT ON TABLE Juez IS 'Tabla que contiene información sobre los jueces';
COMMENT ON COLUMN Juez.idJuez IS 'Identificador único del juez';
COMMENT ON COLUMN Juez.Nombre IS 'Nombre del juez';
COMMENT ON COLUMN Juez.ApellidoP IS 'Apellido paterno del juez';
COMMENT ON COLUMN Juez.ApellidoM IS 'Apellido materno del juez';
COMMENT ON COLUMN Juez.Nacionalidad IS 'Nacionalidad del juez';
COMMENT ON COLUMN Juez.FechaDeNacimiento IS 'Fecha de nacimiento del juez';

CREATE TABLE Arbitro (
    idArbitro VARCHAR(50),
    Nombre VARCHAR(50),
    ApellidoP VARCHAR(50),
    ApellidoM VARCHAR(50),
    Nacionalidad VARCHAR(50),
    FechaDeNacimiento DATE,
    UNIQUE (idArbitro), -- Garantiza que no haya dos árbitros con el mismo id
    CHECK (FechaDeNacimiento < CURRENT_DATE)
);

--Comentarios 
COMMENT ON TABLE Arbitro IS 'Tabla que contiene información sobre los árbitros';
COMMENT ON COLUMN Arbitro.idArbitro IS 'Identificador único del árbitro';
COMMENT ON COLUMN Arbitro.Nombre IS 'Nombre del árbitro';
COMMENT ON COLUMN Arbitro.ApellidoP IS 'Apellido paterno del árbitro';
COMMENT ON COLUMN Arbitro.ApellidoM IS 'Apellido materno del árbitro';
COMMENT ON COLUMN Arbitro.Nacionalidad IS 'Nacionalidad del árbitro';
COMMENT ON COLUMN Arbitro.FechaDeNacimiento IS 'Fecha de nacimiento del árbitro';

CREATE TABLE Entrenador (
    idEntrenador VARCHAR(50),
    Nombre VARCHAR(50),
    ApellidoP VARCHAR(50),
    ApellidoM VARCHAR(50),
    Nacionalidad VARCHAR(50),
    FechaDeNacimiento DATE,
    UNIQUE (idEntrenador),
    CHECK (FechaDeNacimiento < CURRENT_DATE)
);

--Comentarios 
COMMENT ON TABLE Entrenador IS 'Tabla que contiene información sobre los entrenadores';
COMMENT ON COLUMN Entrenador.idEntrenador IS 'Identificador único del entrenador';
COMMENT ON COLUMN Entrenador.Nombre IS 'Nombre del entrenador';
COMMENT ON COLUMN Entrenador.ApellidoP IS 'Apellido paterno del entrenador';
COMMENT ON COLUMN Entrenador.ApellidoM IS 'Apellido materno del entrenador';
COMMENT ON COLUMN Entrenador.Nacionalidad IS 'Nacionalidad del entrenador';
COMMENT ON COLUMN Entrenador.FechaDeNacimiento IS 'Fecha de nacimiento del entrenador';

CREATE TABLE Atleta (
    idAtleta VARCHAR(20),
    NombrePais VARCHAR(30),
    Disciplina VARCHAR(30),
    Genero VARCHAR(10) CHECK (Genero IN ('Masculino', 'Femenino')), -- Solo permite valores específicos para género
    Nombre VARCHAR(50),
    ApellidoP VARCHAR(50),
    ApellidoM VARCHAR(50),
    FechaDeNacimiento DATE,
    Año DATE,
    UNIQUE (idAtleta), -- Garantiza que el id de atleta sea único
    CHECK (FechaDeNacimiento < CURRENT_DATE)
);

--Comentarios 
COMMENT ON TABLE Atleta IS 'Tabla que contiene información de los atletas';
COMMENT ON COLUMN Atleta.idAtleta IS 'Identificador único del atleta';
COMMENT ON COLUMN Atleta.NombrePais IS 'Nombre del país del atleta';
COMMENT ON COLUMN Atleta.Disciplina IS 'Disciplina en la que compite el atleta';
COMMENT ON COLUMN Atleta.Genero IS 'Género del atleta';
COMMENT ON COLUMN Atleta.Nombre IS 'Nombre del atleta';
COMMENT ON COLUMN Atleta.ApellidoP IS 'Apellido paterno del atleta';
COMMENT ON COLUMN Atleta.ApellidoM IS 'Apellido materno del atleta';
COMMENT ON COLUMN Atleta.FechaDeNacimiento IS 'Fecha de nacimiento del atleta';
COMMENT ON COLUMN Atleta.Año IS 'Año de participación del atleta';

CREATE TABLE TelefonoAtleta (
    idAtleta VARCHAR(20),
    Telefono INT CHECK (Telefono > 0), -- Asegura que los números de teléfono sean positivos
    UNIQUE (idAtleta, Telefono) -- Asegura combinaciones únicas de atleta y teléfono
);

--Comentarios
COMMENT ON TABLE TelefonoAtleta IS 'Tabla que contiene los teléfonos de los atletas';
COMMENT ON COLUMN TelefonoAtleta.idAtleta IS 'Identificador del atleta al que pertenece el teléfono';
COMMENT ON COLUMN TelefonoAtleta.Telefono IS 'Número de teléfono del atleta';

CREATE TABLE CorreoAtleta (
    idAtleta VARCHAR(20),
    Correo VARCHAR(30),
    UNIQUE (idAtleta, Correo) -- Asegura combinaciones únicas de atleta y correo
);

--Comentarios
COMMENT ON TABLE CorreoAtleta IS 'Tabla que contiene los correos de los atletas';
COMMENT ON COLUMN CorreoAtleta.idAtleta IS 'Identificador del atleta al que pertenece el correo';
COMMENT ON COLUMN CorreoAtleta.Correo IS 'Correo electrónico del atleta';


CREATE TABLE CorreoJuez (
    idJuez VARCHAR(19),
    Correo VARCHAR(20),
    UNIQUE (idJuez, Correo) -- Combinación única de juez y correo
);

--Comentarios
COMMENT ON TABLE CorreoJuez IS 'Tabla que contiene los correos de los jueces';
COMMENT ON COLUMN CorreoJuez.idJuez IS 'Identificador del juez al que pertenece el correo';
COMMENT ON COLUMN CorreoJuez.Correo IS 'Correo electrónico del juez';

CREATE TABLE CorreoEntrenador (
    idEntrenador VARCHAR(19),
    Correo VARCHAR(20),
    UNIQUE (idEntrenador, Correo) -- Combinación única de entrenador y correo
);

--Comentario

COMMENT ON TABLE CorreoEntrenador IS 'Tabla que contiene los correos de los entrenadores';
COMMENT ON COLUMN CorreoEntrenador.idEntrenador IS 'Identificador del entrenador al que pertenece el correo';
COMMENT ON COLUMN CorreoEntrenador.Correo IS 'Correo electrónico del entrenador';

CREATE TABLE CorreoArbitro (
    idArbitro VARCHAR(19),
    Correo VARCHAR(20),
    UNIQUE (idArbitro, Correo) -- Combinación única de árbitro y correo
);

--Comentarios
COMMENT ON TABLE CorreoArbitro IS 'Tabla que contiene los correos de los árbitros';
COMMENT ON COLUMN CorreoArbitro.idArbitro IS 'Identificador del árbitro al que pertenece el correo';
COMMENT ON COLUMN CorreoArbitro.Correo IS 'Correo electrónico del árbitro';



CREATE TABLE TelefonoJuez (
    idJuez VARCHAR(19),
    Telefono INT CHECK (Telefono > 0), -- El teléfono debe ser positivo
    UNIQUE (idJuez, Telefono) -- Combinación única de juez y teléfono
);

--Comentarios
COMMENT ON TABLE TelefonoJuez IS 'Tabla que contiene los teléfonos de los jueces';
COMMENT ON COLUMN TelefonoJuez.idJuez IS 'Identificador del juez al que pertenece el teléfono';
COMMENT ON COLUMN TelefonoJuez.Telefono IS 'Número de teléfono del juez';

CREATE TABLE TelefonoEntrenador (
    idEntrenador VARCHAR(19),
    Telefono INT CHECK (Telefono > 0),
    UNIQUE (idEntrenador, Telefono)
);

-- Comentarios
COMMENT ON TABLE TelefonoEntrenador IS 'Tabla que contiene los teléfonos de los entrenadores';
COMMENT ON COLUMN TelefonoEntrenador.idEntrenador IS 'Identificador del entrenador al que pertenece el teléfono';
COMMENT ON COLUMN TelefonoEntrenador.Telefono IS 'Número de teléfono del entrenador';

CREATE TABLE TelefonoArbitro (
    idArbitro VARCHAR(19),
    Telefono INT CHECK (Telefono > 0),
    UNIQUE (idArbitro, Telefono)
);

--Comentarios
COMMENT ON TABLE TelefonoArbitro IS 'Tabla que contiene los teléfonos de los árbitros';
COMMENT ON COLUMN TelefonoArbitro.idArbitro IS 'Identificador del árbitro al que pertenece el teléfono';
COMMENT ON COLUMN TelefonoArbitro.Telefono IS 'Número de teléfono del árbitro';

CREATE TABLE Pais (
    NombrePais VARCHAR(30),
    MedallaOro BOOLEAN,
    MedallaPlata BOOLEAN,
    MedallaBronce BOOLEAN,
    UNIQUE (NombrePais) -- El nombre del país debe ser único
);

-- Comentarios
COMMENT ON TABLE Pais IS 'Tabla que contiene información de los países';
COMMENT ON COLUMN Pais.NombrePais IS 'Nombre del país';
COMMENT ON COLUMN Pais.MedallaOro IS 'Indica si el país ganó medalla de oro';
COMMENT ON COLUMN Pais.MedallaPlata IS 'Indica si el país ganó medalla de plata';
COMMENT ON COLUMN Pais.MedallaBronce IS 'Indica si el país ganó medalla de bronce';


CREATE TABLE Disciplina (
    NombreDisciplina VARCHAR(20),
    NombrePais VARCHAR(30),
    Categoria VARCHAR(30),
    Participantes VARCHAR(50),
    Año DATE,
    UNIQUE (NombreDisciplina) -- Asegura que cada disciplina tenga un nombre único
);

--Comentarios
COMMENT ON TABLE Disciplina IS 'Tabla que contiene información sobre las disciplinas';
COMMENT ON COLUMN Disciplina.NombreDisciplina IS 'Nombre de la disciplina';
COMMENT ON COLUMN Disciplina.NombrePais IS 'Nombre del país que participa en la disciplina';
COMMENT ON COLUMN Disciplina.Categoria IS 'Categoría de la disciplina';
COMMENT ON COLUMN Disciplina.Participantes IS 'Participantes en la disciplina';
COMMENT ON COLUMN Disciplina.Año IS 'Año de la competencia en la disciplina';


CREATE TABLE Patrocinadores (
    NombreDisciplina VARCHAR(20),
    Patrocinador VARCHAR(30),
    UNIQUE (NombreDisciplina, Patrocinador) -- Cada disciplina puede tener un patrocinador único
);

-- Comentarios
COMMENT ON TABLE Patrocinadores IS 'Tabla que contiene información sobre los patrocinadores';
COMMENT ON COLUMN Patrocinadores.NombreDisciplina IS 'Nombre de la disciplina patrocinada';
COMMENT ON COLUMN Patrocinadores.Patrocinador IS 'Nombre del patrocinador';

CREATE TABLE Competencia (
    idCompetencia VARCHAR(30),
    idAtleta VARCHAR(20),
    FaseEliminatoria BOOLEAN,
    UNIQUE (idCompetencia)
);

--Comentarios
COMMENT ON TABLE Competencia IS 'Tabla que contiene información sobre las competencias';
COMMENT ON COLUMN Competencia.idCompetencia IS 'Identificador único de la competencia';
COMMENT ON COLUMN Competencia.idAtleta IS 'Identificador del atleta que participa en la competencia';
COMMENT ON COLUMN Competencia.FaseEliminatoria IS 'Indica si es fase eliminatoria';

CREATE TABLE Agenda (
    idAgenda VARCHAR(50),
    Localidad VARCHAR(40),
    Disciplina VARCHAR(40),
    Horario TIME,
    Fecha DATE,
    Precio NUMERIC(10,2) CHECK (Precio >= 0), -- El precio debe ser positivo
    Duracion INT CHECK (Duracion > 0), -- La duración debe ser mayor que cero
    Participantes VARCHAR(40),
    UNIQUE (idAgenda)
);

--Comentarios 
COMMENT ON TABLE Agenda IS 'Tabla que contiene la agenda de eventos';
COMMENT ON COLUMN Agenda.idAgenda IS 'Identificador único de la agenda';
COMMENT ON COLUMN Agenda.Localidad IS 'Localidad del evento';
COMMENT ON COLUMN Agenda.Disciplina IS 'Disciplina del evento';
COMMENT ON COLUMN Agenda.Horario IS 'Horario del evento';
COMMENT ON COLUMN Agenda.Fecha IS 'Fecha del evento';
COMMENT ON COLUMN Agenda.Precio IS 'Precio de la entrada al evento';
COMMENT ON COLUMN Agenda.Duracion IS 'Duración del evento';
COMMENT ON COLUMN Agenda.Participantes IS 'Participantes en el evento';


CREATE TABLE Evento (
    idEvento VARCHAR(40),
    idAgenda VARCHAR(40),
    Localidad VARCHAR(40),
    UNIQUE (idEvento)
);

--Comentarios
COMMENT ON TABLE Evento IS 'Tabla que contiene información sobre los eventos';
COMMENT ON COLUMN Evento.idEvento IS 'Identificador único del evento';
COMMENT ON COLUMN Evento.idAgenda IS 'Identificador de la agenda del evento';
COMMENT ON COLUMN Evento.Localidad IS 'Localidad donde se lleva a cabo el evento';

CREATE TABLE Localidad (
    NombreLocalidad VARCHAR(30),
    idEvento VARCHAR(40),
    Aforo VARCHAR(40),
    Tipo VARCHAR(40),
    Calle VARCHAR(40),
    Numero INT,
    Ciudad VARCHAR(40),
    Pais VARCHAR(40),
    UNIQUE (NombreLocalidad)
);

-- Comentarios
COMMENT ON TABLE Localidad IS 'Tabla que contiene información sobre las localidades';
COMMENT ON COLUMN Localidad.NombreLocalidad IS 'Nombre de la localidad';
COMMENT ON COLUMN Localidad.idEvento IS 'Identificador del evento asociado a la localidad';
COMMENT ON COLUMN Localidad.Aforo IS 'Capacidad de la localidad';
COMMENT ON COLUMN Localidad.Tipo IS 'Tipo de localidad';
COMMENT ON COLUMN Localidad.Calle IS 'Calle de la localidad';
COMMENT ON COLUMN Localidad.Numero IS 'Número de la dirección';
COMMENT ON COLUMN Localidad.Ciudad IS 'Ciudad de la localidad';
COMMENT ON COLUMN Localidad.Pais IS 'País de la localidad';


CREATE TABLE Entrada (
    NumeroEntrada INT,
    idEvento VARCHAR(40),
    Cantidad INT CHECK (Cantidad >= 0), -- Asegura que la cantidad sea mayor o igual a cero
    Fecha DATE,
    UNIQUE (NumeroEntrada)
);

--Comentarios
COMMENT ON TABLE Entrada IS 'Tabla que contiene información sobre las entradas a los eventos';
COMMENT ON COLUMN Entrada.NumeroEntrada IS 'Número de entrada';
COMMENT ON COLUMN Entrada.idEvento IS 'Identificador del evento al que pertenece la entrada';
COMMENT ON COLUMN Entrada.Cantidad IS 'Cantidad de entradas';
COMMENT ON COLUMN Entrada.Fecha IS 'Fecha de emisión de la entrada';

CREATE TABLE Registrar (
    idAgenda VARCHAR(40),
    idEvento VARCHAR(40),
    UNIQUE (idAgenda, idEvento)
);

-- Comentarios
COMMENT ON TABLE Registrar IS 'Tabla que registra la relación entre agenda y evento';
COMMENT ON COLUMN Registrar.idAgenda IS 'Identificador de la agenda';
COMMENT ON COLUMN Registrar.idEvento IS 'Identificador del evento';


CREATE TABLE Incluir (
    idCompetencia VARCHAR(40),
    idEvento VARCHAR(40),
    UNIQUE (idCompetencia, idEvento)
);

-- Comentarios
COMMENT ON TABLE Incluir IS 'Tabla que incluye información sobre competencias en eventos';
COMMENT ON COLUMN Incluir.idCompetencia IS 'Identificador de la competencia';
COMMENT ON COLUMN Incluir.idEvento IS 'Identificador del evento';


CREATE TABLE Representar (
    NombreDisciplina VARCHAR(30),
    idAtleta VARCHAR(40),
    Año DATE,
    UNIQUE (NombreDisciplina, idAtleta)
);

-- Comentarios
COMMENT ON TABLE Representar IS 'Tabla que relaciona disciplinas y atletas';
COMMENT ON COLUMN Representar.NombreDisciplina IS 'Nombre de la disciplina';
COMMENT ON COLUMN Representar.idAtleta IS 'Identificador del atleta';
COMMENT ON COLUMN Representar.Año IS 'Año de participación';


CREATE TABLE Ganar (
    NombreDisciplina VARCHAR(40),
    idAtleta VARCHAR(40),
    Medalla BOOLEAN,
    UNIQUE (NombreDisciplina, idAtleta)
);

--Comentarios
COMMENT ON TABLE Ganar IS 'Tabla que contiene información sobre medallas ganadas';
COMMENT ON COLUMN Ganar.NombreDisciplina IS 'Nombre de la disciplina';
COMMENT ON COLUMN Ganar.idAtleta IS 'Identificador del atleta';
COMMENT ON COLUMN Ganar.Medalla IS 'Indica si el atleta ganó una medalla';

CREATE TABLE Supervisar (
    NombreDisciplina VARCHAR(40),
    idJuez VARCHAR(40),
    idArbitro VARCHAR(40),
    idEntrenador VARCHAR(40),
    UNIQUE (NombreDisciplina)
);

-- Comentarios
COMMENT ON TABLE Supervisar IS 'Tabla que relaciona jueces, árbitros y entrenadores con disciplinas';
COMMENT ON COLUMN Supervisar.NombreDisciplina IS 'Nombre de la disciplina supervisada';
COMMENT ON COLUMN Supervisar.idJuez IS 'Identificador del juez';
COMMENT ON COLUMN Supervisar.idArbitro IS 'Identificador del árbitro';
COMMENT ON COLUMN Supervisar.idEntrenador IS 'Identificador del entrenador';


-- Agregamos las llaves primarias con ALTER TABLE
ALTER TABLE Juez
    ADD PRIMARY KEY (idJuez);

ALTER TABLE Arbitro
    ADD PRIMARY KEY (idArbitro);

ALTER TABLE Entrenador
    ADD PRIMARY KEY (idEntrenador);

ALTER TABLE Atleta
    ADD PRIMARY KEY (idAtleta);

ALTER TABLE TelefonoAtleta
    ADD PRIMARY KEY (idAtleta, Telefono);

ALTER TABLE CorreoAtleta
    ADD PRIMARY KEY (idAtleta, Correo);

ALTER TABLE CorreoJuez
    ADD PRIMARY KEY (idJuez, Correo);

ALTER TABLE CorreoEntrenador
    ADD PRIMARY KEY (idEntrenador, Correo);

ALTER TABLE CorreoArbitro
    ADD PRIMARY KEY (idArbitro, Correo);

ALTER TABLE TelefonoJuez
    ADD PRIMARY KEY (idJuez, Telefono);

ALTER TABLE TelefonoEntrenador
    ADD PRIMARY KEY (idEntrenador, Telefono);

ALTER TABLE TelefonoArbitro
    ADD PRIMARY KEY (idArbitro, Telefono);

ALTER TABLE Pais
    ADD PRIMARY KEY (NombrePais);

ALTER TABLE Disciplina
    ADD PRIMARY KEY (NombreDisciplina);

ALTER TABLE Patrocinadores
    ADD PRIMARY KEY (NombreDisciplina, Patrocinador);

ALTER TABLE Competencia
    ADD PRIMARY KEY (idCompetencia);

ALTER TABLE Agenda
    ADD PRIMARY KEY (idAgenda);

ALTER TABLE Evento
    ADD PRIMARY KEY (idEvento);

ALTER TABLE Localidad
    ADD PRIMARY KEY (NombreLocalidad);

ALTER TABLE Entrada
    ADD PRIMARY KEY (NumeroEntrada);

ALTER TABLE Registrar
    ADD PRIMARY KEY (idAgenda, idEvento);

ALTER TABLE Incluir
    ADD PRIMARY KEY (idCompetencia, idEvento);

ALTER TABLE Representar
    ADD PRIMARY KEY (NombreDisciplina, idAtleta);

ALTER TABLE Ganar
    ADD PRIMARY KEY (NombreDisciplina, idAtleta);

ALTER TABLE Supervisar
    ADD PRIMARY KEY (NombreDisciplina);
   
-- Modificamos las llaves foráneas para incluir ON DELETE RESTRICT

ALTER TABLE TelefonoAtleta
    ADD CONSTRAINT fk_telefono_atleta
    FOREIGN KEY (idAtleta)
    REFERENCES Atleta(idAtleta)
    ON DELETE RESTRICT;
   
ALTER TABLE Atleta
    ADD CONSTRAINT fk_atleta
    FOREIGN KEY (NombrePais)
    REFERENCES Pais(NombrePais)
    ON DELETE RESTRICT;

ALTER TABLE CorreoAtleta
    ADD CONSTRAINT fk_correo_atleta
    FOREIGN KEY (idAtleta)
    REFERENCES Atleta(idAtleta)
    ON DELETE RESTRICT;

ALTER TABLE CorreoJuez
    ADD CONSTRAINT fk_correo_juez
    FOREIGN KEY (idJuez)
    REFERENCES Juez(idJuez)
    ON DELETE RESTRICT;

ALTER TABLE CorreoEntrenador
    ADD CONSTRAINT fk_correo_entrenador
    FOREIGN KEY (idEntrenador)
    REFERENCES Entrenador(idEntrenador)
    ON DELETE RESTRICT;

ALTER TABLE CorreoArbitro
    ADD CONSTRAINT fk_correo_arbitro
    FOREIGN KEY (idArbitro)
    REFERENCES Arbitro(idArbitro)
    ON DELETE RESTRICT;

ALTER TABLE TelefonoJuez
    ADD CONSTRAINT fk_telefono_juez
    FOREIGN KEY (idJuez)
    REFERENCES Juez(idJuez)
    ON DELETE RESTRICT;

ALTER TABLE TelefonoEntrenador
    ADD CONSTRAINT fk_telefono_entrenador
    FOREIGN KEY (idEntrenador)
    REFERENCES Entrenador(idEntrenador)
    ON DELETE RESTRICT;

ALTER TABLE TelefonoArbitro
    ADD CONSTRAINT fk_telefono_arbitro
    FOREIGN KEY (idArbitro)
    REFERENCES Arbitro(idArbitro)
    ON DELETE RESTRICT;

ALTER TABLE Disciplina
    ADD CONSTRAINT fk_disciplina_pais
    FOREIGN KEY (NombrePais)
    REFERENCES Pais(NombrePais)
    ON DELETE RESTRICT;

ALTER TABLE Patrocinadores
    ADD CONSTRAINT fk_patrocinadores_disciplina
    FOREIGN KEY (NombreDisciplina)
    REFERENCES Disciplina(NombreDisciplina)
    ON DELETE RESTRICT;

ALTER TABLE Competencia
    ADD CONSTRAINT fk_competencia_atleta
    FOREIGN KEY (idAtleta)
    REFERENCES Atleta(idAtleta)
    ON DELETE RESTRICT;

ALTER TABLE Localidad
    ADD CONSTRAINT fk_localidad_evento
    FOREIGN KEY (idEvento)
    REFERENCES Evento(idEvento)
    ON DELETE RESTRICT;

ALTER TABLE Localidad
    ADD CONSTRAINT fk_localidad_pais
    FOREIGN KEY (Pais)
    REFERENCES Pais(NombrePais)
    ON DELETE RESTRICT;

ALTER TABLE Entrada
    ADD CONSTRAINT fk_entrada_evento
    FOREIGN KEY (idEvento)
    REFERENCES Evento(idEvento)
    ON DELETE RESTRICT;

ALTER TABLE Registrar
    ADD CONSTRAINT fk_registrar_agenda
    FOREIGN KEY (idAgenda)
    REFERENCES Agenda(idAgenda)
    ON DELETE RESTRICT;

ALTER TABLE Registrar
    ADD CONSTRAINT fk_registrar_evento
    FOREIGN KEY (idEvento)
    REFERENCES Evento(idEvento)
    ON DELETE RESTRICT;

ALTER TABLE Incluir
    ADD CONSTRAINT fk_incluir_competencia
    FOREIGN KEY (idCompetencia)
    REFERENCES Competencia(idCompetencia)
    ON DELETE RESTRICT;

ALTER TABLE Incluir
    ADD CONSTRAINT fk_incluir_evento
    FOREIGN KEY (idEvento)
    REFERENCES Evento(idEvento)
    ON DELETE RESTRICT;

ALTER TABLE Representar
    ADD CONSTRAINT fk_representar_disciplina
    FOREIGN KEY (NombreDisciplina)
    REFERENCES Disciplina(NombreDisciplina)
    ON DELETE RESTRICT;

ALTER TABLE Representar
    ADD CONSTRAINT fk_representar_atleta
    FOREIGN KEY (idAtleta)
    REFERENCES Atleta(idAtleta)
    ON DELETE RESTRICT;

ALTER TABLE Ganar
    ADD CONSTRAINT fk_ganar_disciplina
    FOREIGN KEY (NombreDisciplina)
    REFERENCES Disciplina(NombreDisciplina)
    ON DELETE RESTRICT;

ALTER TABLE Ganar
    ADD CONSTRAINT fk_ganar_atleta
    FOREIGN KEY (idAtleta)
    REFERENCES Atleta(idAtleta)
    ON DELETE RESTRICT;

ALTER TABLE Supervisar
    ADD CONSTRAINT fk_supervisar_juez
    FOREIGN KEY (idJuez)
    REFERENCES Juez(idJuez)
    ON DELETE RESTRICT;

ALTER TABLE Supervisar
    ADD CONSTRAINT fk_supervisar_arbitro
    FOREIGN KEY (idArbitro)
    REFERENCES Arbitro(idArbitro)
    ON DELETE RESTRICT;

ALTER TABLE Supervisar
    ADD CONSTRAINT fk_supervisar_entrenador
    FOREIGN KEY (idEntrenador)
    REFERENCES Entrenador(idEntrenador)
    ON DELETE RESTRICT;


