
----------------------------------------------- TABLAS DE JUEZ -----------------------------------------------
CREATE TABLE Juez (
    idJuez VARCHAR(50),
    Nombre VARCHAR(50),
    ApellidoP VARCHAR(50),
    ApellidoM VARCHAR(50),
    Nacionalidad VARCHAR(30),
    FechaDeNacimiento DATE,
    UNIQUE (idJuez),
    CHECK (FechaDeNacimiento < CURRENT_DATE)
);

CREATE TABLE CorreoJuez (
    idJuez VARCHAR(19),
    Correo VARCHAR(20),
    UNIQUE (idJuez, Correo) -- Combinación única de juez y correo
);

CREATE TABLE TelefonoJuez (
    idJuez VARCHAR(19),
    Telefono INT CHECK (Telefono > 0),
    UNIQUE (idJuez, Telefono) -- Combinación única de juez y teléfono
);
----------------------------------------------- TABLAS DE ARBITRO -----------------------------------------------
CREATE TABLE Arbitro (
    idArbitro VARCHAR(50),
    Nombre VARCHAR(50),
    ApellidoP VARCHAR(50),
    ApellidoM VARCHAR(50),
    Nacionalidad VARCHAR(50),
    FechaDeNacimiento DATE,
    UNIQUE (idArbitro),
    CHECK (FechaDeNacimiento < CURRENT_DATE)
);
CREATE TABLE CorreoArbitro (
    idArbitro VARCHAR(19),
    Correo VARCHAR(20),
    UNIQUE (idArbitro, Correo) -- Combinación única de árbitro y correo
);
CREATE TABLE TelefonoArbitro (
    idArbitro VARCHAR(19),
    Telefono INT CHECK (Telefono > 0),
    UNIQUE (idArbitro, Telefono)
);
----------------------------------------------- TABLAS DE ENTRENADOR -----------------------------------------------
CREATE TABLE Entrenador (
    idEntrenador VARCHAR(50),
    Nombre VARCHAR(50),
    ApellidoP VARCHAR(50),
    ApellidoM VARCHAR(50),
    Nacionalidad VARCHAR(50),
    NombrePais VARCHAR(30), -- ESTO no ESTÁ EN EL RELACIONAL
    FechaDeNacimiento DATE,
    UNIQUE (idEntrenador),
    CHECK (FechaDeNacimiento < CURRENT_DATE)
);
CREATE TABLE CorreoEntrenador (
    idEntrenador VARCHAR(19),
    Correo VARCHAR(20),
    UNIQUE (idEntrenador, Correo) -- Combinación única de entrenador y correo
);
CREATE TABLE TelefonoEntrenador (
    idEntrenador VARCHAR(19),
    Telefono INT CHECK (Telefono > 0),
    UNIQUE (idEntrenador, Telefono)
);
----------------------------------------------- TABLAS DE ATLETA -----------------------------------------------
CREATE TABLE Atleta (
    idAtleta VARCHAR(20),
    NombrePais VARCHAR(30),
    Disciplina VARCHAR(30),
    Genero VARCHAR(10),
    Nombre VARCHAR(50),
    ApellidoP VARCHAR(50),
    ApellidoM VARCHAR(50),
    FechaDeNacimiento DATE,
    Año DATE,
    UNIQUE (idAtleta),
    CHECK (FechaDeNacimiento < CURRENT_DATE),
    CHECK (Genero IN ('Masculino', 'Femenino'))
);
CREATE TABLE TelefonoAtleta (
    idAtleta VARCHAR(20),
    Telefono INT CHECK (Telefono > 0),
    UNIQUE (idAtleta, Telefono) -- Asegura combinaciones únicas de atleta y teléfono
);
CREATE TABLE CorreoAtleta (
    idAtleta VARCHAR(20),
    Correo VARCHAR(30),
    UNIQUE (idAtleta, Correo) -- Asegura combinaciones únicas de atleta y correo
);
CREATE TABLE Representar ( -- REQUIERE CAMBIOS LA TABLA EN EL RELACIONAL
    NombreDisciplina VARCHAR(30),
    idAtleta VARCHAR(40),
    Año DATE,
    UNIQUE (NombreDisciplina, idAtleta)
);
----------------------------------------------- TABLA DE PAIS -----------------------------------------------
CREATE TABLE Pais (
    NombrePais VARCHAR(30),
    MedallaOro INT,
    MedallaPlata INT,
    MedallaBronce INT -- ESTOS VALORES DEBEN SER INT EN EL RELACIONAL
);
----------------------------------------------- TABLA DE LOCALIDAD -----------------------------------------------
CREATE TABLE Localidad ( --- REQUIERE CAMBIOS LA TABLA EN EL RELACIONAL
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
----------------------------------------------- TABLA DE DISCIPLINA -----------------------------------------------
CREATE TABLE Disciplina (
    NombreDisciplina VARCHAR(20),
    NombrePais VARCHAR(30),
    Categoria VARCHAR(30),
    Participantes VARCHAR(50),
    Año DATE,
    UNIQUE (NombreDisciplina)
);
CREATE TABLE Supervisar (
    NombreDisciplina VARCHAR(40),
    idJuez VARCHAR(40),
    idArbitro VARCHAR(40),
    idEntrenador VARCHAR(40),
    UNIQUE (NombreDisciplina)
);
CREATE TABLE Ganar ( --- REQUIERE CAMBIOS LA TABLA EN EL RELACIONAL
	id INT,
    NombreDisciplina VARCHAR(40),
    idAtleta VARCHAR(40),
    MedallaOro INT,
    MedallaPlata INT,
    MedallaBronce INT,
    UNIQUE (NombreDisciplina, idAtleta)
);
CREATE TABLE Patrocinadores (
    NombreDisciplina VARCHAR(20),
    Patrocinador VARCHAR(30),
    UNIQUE (NombreDisciplina, Patrocinador)
);
----------------------------------------------- TABLAS DE EVENTO -----------------------------------------------
CREATE TABLE Agenda (
    idAgenda VARCHAR(50),
    Localidad VARCHAR(40),
    Disciplina VARCHAR(40),
    Horario TIME,
    Fecha DATE,
    Precio NUMERIC(10,2) CHECK (Precio >= 0),
    Duracion INT CHECK (Duracion > 0),
    Participantes VARCHAR(40),
    UNIQUE (idAgenda)
);
CREATE TABLE Evento (
    idEvento VARCHAR(40),
    idAgenda VARCHAR(40),
    Precio INT CHECK (Precio > 0),
    Fase INT check (Fase > 0),
    PrecioFinal INT CHECK (PrecioFinal > 0),
    Localidad VARCHAR(40),
    UNIQUE (idEvento)
);
CREATE TABLE Entrada (
    NumeroEntrada INT,
    idEvento VARCHAR(40),
    Cantidad INT CHECK (Cantidad >= 0),
    Fecha DATE,
    UNIQUE (NumeroEntrada)
);
CREATE TABLE Registrar (
    idAgenda VARCHAR(40),
    idEvento VARCHAR(40),
    UNIQUE (idAgenda, idEvento)
);
CREATE TABLE Incluir (
    idCompetencia VARCHAR(40),
    idEvento VARCHAR(40),
    UNIQUE (idCompetencia, idEvento)
);
----------------------------------------------- TABLAS DE COMPETENCIAS -----------------------------------------------
CREATE TABLE Competencia (
    idCompetencia VARCHAR(30),
    idAtleta VARCHAR(20),
    FaseEliminatoria BOOLEAN,
    UNIQUE (idCompetencia)
);

-------------------------------------- COMENTARIOS IDENTIFICACIÓN DE TABLAS --------------------------------------
-- JUEZ
COMMENT ON TABLE Juez IS 'Tabla que contiene información sobre los jueces';
COMMENT ON COLUMN Juez.idJuez IS 'Identificador único del juez';
COMMENT ON COLUMN Juez.Nombre IS 'Nombre del juez';
COMMENT ON COLUMN Juez.ApellidoP IS 'Apellido paterno del juez';
COMMENT ON COLUMN Juez.ApellidoM IS 'Apellido materno del juez';
COMMENT ON COLUMN Juez.Nacionalidad IS 'Nacionalidad del juez';
COMMENT ON COLUMN Juez.FechaDeNacimiento IS 'Fecha de nacimiento del juez';

COMMENT ON TABLE CorreoJuez IS 'Tabla que contiene los correos de los jueces';
COMMENT ON COLUMN CorreoJuez.idJuez IS 'Identificador del juez al que pertenece el correo';
COMMENT ON COLUMN CorreoJuez.Correo IS 'Correo electrónico del juez';

COMMENT ON TABLE TelefonoJuez IS 'Tabla que contiene los teléfonos de los jueces';
COMMENT ON COLUMN TelefonoJuez.idJuez IS 'Identificador del juez al que pertenece el teléfono';
COMMENT ON COLUMN TelefonoJuez.Telefono IS 'Número de teléfono del juez';

-- ARBITRO
COMMENT ON TABLE Arbitro IS 'Tabla que contiene información sobre los árbitros';
COMMENT ON COLUMN Arbitro.idArbitro IS 'Identificador único del árbitro';
COMMENT ON COLUMN Arbitro.Nombre IS 'Nombre del árbitro';
COMMENT ON COLUMN Arbitro.ApellidoP IS 'Apellido paterno del árbitro';
COMMENT ON COLUMN Arbitro.ApellidoM IS 'Apellido materno del árbitro';
COMMENT ON COLUMN Arbitro.Nacionalidad IS 'Nacionalidad del árbitro';
COMMENT ON COLUMN Arbitro.FechaDeNacimiento IS 'Fecha de nacimiento del árbitro';

COMMENT ON TABLE CorreoArbitro IS 'Tabla que contiene los correos de los árbitros';
COMMENT ON COLUMN CorreoArbitro.idArbitro IS 'Identificador del árbitro al que pertenece el correo';
COMMENT ON COLUMN CorreoArbitro.Correo IS 'Correo electrónico del árbitro';

COMMENT ON TABLE TelefonoArbitro IS 'Tabla que contiene los teléfonos de los árbitros';
COMMENT ON COLUMN TelefonoArbitro.idArbitro IS 'Identificador del árbitro al que pertenece el teléfono';
COMMENT ON COLUMN TelefonoArbitro.Telefono IS 'Número de teléfono del árbitro';

-- ENTRENADOR
COMMENT ON TABLE Entrenador IS 'Tabla que contiene información sobre los entrenadores';
COMMENT ON COLUMN Entrenador.idEntrenador IS 'Identificador único del entrenador';
COMMENT ON COLUMN Entrenador.Nombre IS 'Nombre del entrenador';
COMMENT ON COLUMN Entrenador.ApellidoP IS 'Apellido paterno del entrenador';
COMMENT ON COLUMN Entrenador.ApellidoM IS 'Apellido materno del entrenador';
COMMENT ON COLUMN Entrenador.Nacionalidad IS 'Nacionalidad del entrenador';
COMMENT ON COLUMN Entrenador.NombrePais IS 'País del entrenador';
COMMENT ON COLUMN Entrenador.FechaDeNacimiento IS 'Fecha de nacimiento del entrenador';

COMMENT ON TABLE CorreoEntrenador IS 'Tabla que contiene los correos de los entrenadores';
COMMENT ON COLUMN CorreoEntrenador.idEntrenador IS 'Identificador del entrenador al que pertenece el correo';
COMMENT ON COLUMN CorreoEntrenador.Correo IS 'Correo electrónico del entrenador';

COMMENT ON TABLE TelefonoEntrenador IS 'Tabla que contiene los teléfonos de los entrenadores';
COMMENT ON COLUMN TelefonoEntrenador.idEntrenador IS 'Identificador del entrenador al que pertenece el teléfono';
COMMENT ON COLUMN TelefonoEntrenador.Telefono IS 'Número de teléfono del entrenador';

-- ATLETA
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

COMMENT ON TABLE TelefonoAtleta IS 'Tabla que contiene los teléfonos de los atletas';
COMMENT ON COLUMN TelefonoAtleta.idAtleta IS 'Identificador del atleta al que pertenece el teléfono';
COMMENT ON COLUMN TelefonoAtleta.Telefono IS 'Número de teléfono del atleta';

COMMENT ON TABLE CorreoAtleta IS 'Tabla que contiene los correos de los atletas';
COMMENT ON COLUMN CorreoAtleta.idAtleta IS 'Identificador del atleta al que pertenece el correo';
COMMENT ON COLUMN CorreoAtleta.Correo IS 'Correo electrónico del atleta';

COMMENT ON TABLE Representar IS 'Tabla que relaciona disciplinas y atletas';
COMMENT ON COLUMN Representar.NombreDisciplina IS 'Nombre de la disciplina';
COMMENT ON COLUMN Representar.idAtleta IS 'Identificador del atleta';
COMMENT ON COLUMN Representar.Año IS 'Año de participación';

-- PAIS
COMMENT ON TABLE Pais IS 'Tabla que contiene información de los países';
COMMENT ON COLUMN Pais.NombrePais IS 'Nombre del país';
COMMENT ON COLUMN Pais.MedallaOro IS 'Número de medallas de oro ganadas';
COMMENT ON COLUMN Pais.MedallaPlata IS 'Número de medallas de plata ganadas';
COMMENT ON COLUMN Pais.MedallaBronce IS 'Número de medallas de bronce ganadas';

-- EVENTO
COMMENT ON TABLE Agenda IS 'Tabla que contiene la agenda de eventos';
COMMENT ON COLUMN Agenda.idAgenda IS 'Identificador único de la agenda';
COMMENT ON COLUMN Agenda.Localidad IS 'Localidad del evento';
COMMENT ON COLUMN Agenda.Disciplina IS 'Disciplina del evento';
COMMENT ON COLUMN Agenda.Horario IS 'Horario del evento';
COMMENT ON COLUMN Agenda.Fecha IS 'Fecha del evento';
COMMENT ON COLUMN Agenda.Precio IS 'Precio de la entrada al evento';
COMMENT ON COLUMN Agenda.Duracion IS 'Duración del evento';
COMMENT ON COLUMN Agenda.Participantes IS 'Participantes en el evento';

COMMENT ON TABLE Evento IS 'Tabla que contiene información sobre los eventos';
COMMENT ON COLUMN Evento.idEvento IS 'Identificador único del evento';
COMMENT ON COLUMN Evento.idAgenda IS 'Identificador de la agenda del evento';
COMMENT ON COLUMN Evento.Precio IS 'Precio inicial de entrada al evento';
COMMENT ON COLUMN Evento.Fase IS 'Fase en la que se encuentra el evento';
COMMENT ON COLUMN Evento.PrecioFinal IS 'Precio despues de verificar la fase del evento';
COMMENT ON COLUMN Evento.Localidad IS 'Localidad donde se lleva a cabo el evento';

COMMENT ON TABLE Entrada IS 'Tabla que contiene información sobre las entradas a los eventos';
COMMENT ON COLUMN Entrada.NumeroEntrada IS 'Número de entrada';
COMMENT ON COLUMN Entrada.idEvento IS 'Identificador del evento al que pertenece la entrada';
COMMENT ON COLUMN Entrada.Cantidad IS 'Cantidad de entradas';
COMMENT ON COLUMN Entrada.Fecha IS 'Fecha de emisión de la entrada';

COMMENT ON TABLE Registrar IS 'Tabla que registra la relación entre agenda y evento';
COMMENT ON COLUMN Registrar.idAgenda IS 'Identificador de la agenda';
COMMENT ON COLUMN Registrar.idEvento IS 'Identificador del evento';

COMMENT ON TABLE Incluir IS 'Tabla que incluye información sobre competencias en eventos';
COMMENT ON COLUMN Incluir.idCompetencia IS 'Identificador de la competencia';
COMMENT ON COLUMN Incluir.idEvento IS 'Identificador del evento';

-- LOCALIDAD
COMMENT ON TABLE Localidad IS 'Tabla que contiene información sobre las localidades';
COMMENT ON COLUMN Localidad.NombreLocalidad IS 'Nombre de la localidad';
COMMENT ON COLUMN Localidad.idEvento IS 'Identificador del evento asociado a la localidad';
COMMENT ON COLUMN Localidad.Aforo IS 'Capacidad de la localidad';
COMMENT ON COLUMN Localidad.Tipo IS 'Tipo de localidad';
COMMENT ON COLUMN Localidad.Calle IS 'Calle de la localidad';
COMMENT ON COLUMN Localidad.Numero IS 'Número de la dirección';
COMMENT ON COLUMN Localidad.Ciudad IS 'Ciudad de la localidad';
COMMENT ON COLUMN Localidad.Pais IS 'País de la localidad';

-- DISCIPLINA
COMMENT ON TABLE Disciplina IS 'Tabla que contiene información sobre las disciplinas';
COMMENT ON COLUMN Disciplina.NombreDisciplina IS 'Nombre de la disciplina';
COMMENT ON COLUMN Disciplina.NombrePais IS 'Nombre del país que participa en la disciplina';
COMMENT ON COLUMN Disciplina.Categoria IS 'Categoría de la disciplina';
COMMENT ON COLUMN Disciplina.Participantes IS 'Participantes en la disciplina';
COMMENT ON COLUMN Disciplina.Año IS 'Año de la competencia en la disciplina';

COMMENT ON TABLE Supervisar IS 'Tabla que relaciona jueces, árbitros y entrenadores con disciplinas';
COMMENT ON COLUMN Supervisar.NombreDisciplina IS 'Nombre de la disciplina supervisada';
COMMENT ON COLUMN Supervisar.idJuez IS 'Identificador del juez';
COMMENT ON COLUMN Supervisar.idArbitro IS 'Identificador del árbitro';
COMMENT ON COLUMN Supervisar.idEntrenador IS 'Identificador del entrenador';

COMMENT ON TABLE Ganar IS 'Tabla que contiene información sobre medallas ganadas';
COMMENT ON COLUMN Ganar.id IS 'id del registro';
COMMENT ON COLUMN Ganar.NombreDisciplina IS 'Nombre de la disciplina';
COMMENT ON COLUMN Ganar.idAtleta IS 'Identificador del atleta';
COMMENT ON COLUMN Ganar.MedallaOro IS 'Numero de medallas de oro ganadas';
COMMENT ON COLUMN Ganar.MedallaPlata IS 'Numero de medallas de plata ganadas';
COMMENT ON COLUMN Ganar.MedallaBronce IS 'Numero de medallas de bronce ganadas';

COMMENT ON TABLE Patrocinadores IS 'Tabla que contiene información sobre los patrocinadores';
COMMENT ON COLUMN Patrocinadores.NombreDisciplina IS 'Nombre de la disciplina patrocinada';
COMMENT ON COLUMN Patrocinadores.Patrocinador IS 'Nombre del patrocinador';

-- COMPETENCIAS 
COMMENT ON TABLE Competencia IS 'Tabla que contiene información sobre las competencias';
COMMENT ON COLUMN Competencia.idCompetencia IS 'Identificador único de la competencia';
COMMENT ON COLUMN Competencia.idAtleta IS 'Identificador del atleta que participa en la competencia';
COMMENT ON COLUMN Competencia.FaseEliminatoria IS 'Indica si es fase eliminatoria';

----------------------------------------------- LLAVES PRIMARIAS -----------------------------------------------
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

ALTER TABLE TelefonoJuez
    ADD PRIMARY KEY (idJuez, Telefono);

ALTER TABLE CorreoEntrenador
    ADD PRIMARY KEY (idEntrenador, Correo);

ALTER TABLE TelefonoEntrenador
    ADD PRIMARY KEY (idEntrenador, Telefono);

ALTER TABLE CorreoArbitro
    ADD PRIMARY KEY (idArbitro, Correo);

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
    ADD PRIMARY KEY (id);

ALTER TABLE Supervisar
    ADD PRIMARY KEY (NombreDisciplina);










----------------------------------------------- LLAVES FORANEAS -----------------------------------------------
-- ATLETA
   ALTER TABLE Atleta
    ADD CONSTRAINT fk_atleta
    FOREIGN KEY (NombrePais)
    REFERENCES Pais(NombrePais)
    ON DELETE RESTRICT;
   
   ALTER TABLE TelefonoAtleta
    ADD CONSTRAINT fk_telefono_atleta
    FOREIGN KEY (idAtleta)
    REFERENCES Atleta(idAtleta)
    ON DELETE RESTRICT;
   
   ALTER TABLE CorreoAtleta
    ADD CONSTRAINT fk_correo_atleta
    FOREIGN KEY (idAtleta)
    REFERENCES Atleta(idAtleta)
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
   
-- -- JUEZ
   ALTER TABLE CorreoJuez
    ADD CONSTRAINT fk_correo_juez
    FOREIGN KEY (idJuez)
    REFERENCES Juez(idJuez)
    ON DELETE RESTRICT;
   
   ALTER TABLE TelefonoJuez
    ADD CONSTRAINT fk_telefono_juez
    FOREIGN KEY (idJuez)
    REFERENCES Juez(idJuez)
    ON DELETE RESTRICT;
   
   ALTER TABLE TelefonoJuez
   ALTER COLUMN Telefono SET DATA TYPE BIGINT;
   
-- ENTRENADOR
   ALTER TABLE CorreoEntrenador
    ADD CONSTRAINT fk_correo_entrenador
    FOREIGN KEY (idEntrenador)
    REFERENCES Entrenador(idEntrenador)
    ON DELETE RESTRICT;
   
   ALTER TABLE TelefonoEntrenador
    ADD CONSTRAINT fk_telefono_entrenador
    FOREIGN KEY (idEntrenador)
    REFERENCES Entrenador(idEntrenador)
    ON DELETE RESTRICT;
   
-- ARBITRO
   ALTER TABLE CorreoArbitro
    ADD CONSTRAINT fk_correo_arbitro
    FOREIGN KEY (idArbitro)
    REFERENCES Arbitro(idArbitro)
    ON DELETE RESTRICT;
   
   ALTER TABLE TelefonoArbitro
    ADD CONSTRAINT fk_telefono_arbitro
    FOREIGN KEY (idArbitro)
    REFERENCES Arbitro(idArbitro)
    ON DELETE RESTRICT;
   
-- DISCIPLINA
   ALTER TABLE Disciplina
    ADD CONSTRAINT fk_disciplina_pais
    FOREIGN KEY (NombrePais)
    REFERENCES Pais(NombrePais)
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
   
   ALTER TABLE Patrocinadores
    ADD CONSTRAINT fk_patrocinadores_disciplina
    FOREIGN KEY (NombreDisciplina)
    REFERENCES Disciplina(NombreDisciplina)
    ON DELETE RESTRICT;
   
-- EVENTO
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
   
-- COMPETENCIA
   ALTER TABLE Competencia
    ADD CONSTRAINT fk_competencia_atleta
    FOREIGN KEY (idAtleta)
    REFERENCES Atleta(idAtleta)
    ON DELETE RESTRICT;

-- LOCALIDAD
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











ALTER TABLE Entrenador
ADD COLUMN NombreDisciplina VARCHAR(20);

   ALTER TABLE Atleta
    ADD CONSTRAINT fk_atleta_disciplina
    FOREIGN KEY (Disciplina)
    REFERENCES Disciplina(NombreDisciplina)
    ON DELETE RESTRICT;

       ALTER TABLE Entrenador
    ADD CONSTRAINT fk_entrenador_disciplina
    FOREIGN KEY (NombreDisciplina)
    REFERENCES Disciplina(NombreDisciplina)
    ON DELETE RESTRICT;



    ALTER TABLE Entrenador
ADD COLUMN idEvento VARCHAR(50);

ALTER TABLE Juez
    ADD COLUMN idEvento VARCHAR(50);
   
   ALTER TABLE Entrenador
    ADD CONSTRAINT fk_entrenador_evento
    FOREIGN KEY (idEvento)
    REFERENCES Evento(idEvento);

       ALTER TABLE Juez
    ADD CONSTRAINT fk_juez_evento
    FOREIGN KEY (idEvento)
    REFERENCES Evento(idEvento);
   
   




-------------------------------------- MODIFICACIONES A LAS TABLAS --------------------------------------


ALTER TABLE Disciplina
    DROP COLUMN Categoria;
   

   
ALTER TABLE entrenador 
ALTER COLUMN NombreDisciplina TYPE VARCHAR(50);

ALTER TABLE Entrenador
    DROP COLUMN NombrePais;

ALTER TABLE Disciplina
ALTER COLUMN NombreDisciplina TYPE VARCHAR(50);

ALTER TABLE correoarbitro
ALTER COLUMN correo TYPE VARCHAR(50);

ALTER TABLE telefonoarbitro
ALTER COLUMN telefono TYPE BIGINT;

ALTER TABLE telefonoatleta
ALTER COLUMN telefono TYPE BIGINT;

ALTER TABLE TelefonoEntrenador
ALTER COLUMN Telefono TYPE BIGINT;

ALTER TABLE TelefonoJuez
ALTER COLUMN Telefono TYPE BIGINT;

ALTER TABLE correoentrenador
ALTER COLUMN correo TYPE VARCHAR(50);

ALTER TABLE correojuez
ALTER COLUMN correo TYPE VARCHAR(50);

ALTER TABLE localidad
ALTER COLUMN nombrelocalidad TYPE VARCHAR(50);

ALTER TABLE patrocinadores
ALTER COLUMN nombredisciplina TYPE VARCHAR(50);

ALTER TABLE CorreoAtleta
ALTER COLUMN correo TYPE VARCHAR(50);
