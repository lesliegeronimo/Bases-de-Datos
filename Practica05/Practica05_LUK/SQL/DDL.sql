-- Creamos todas nuestras tablas
CREATE TABLE Juez (
    idJuez VARCHAR(50) PRIMARY KEY,
    Nombre VARCHAR(50),
    ApellidoP VARCHAR(50),
    ApellidoM VARCHAR(50),
    Nacionalidad VARCHAR(30),
    FechaDeNacimiento DATE
);

CREATE TABLE Arbitro (
    idArbitro VARCHAR(50) PRIMARY KEY,
    Nombre VARCHAR(50),
    ApellidoP VARCHAR(50),
    ApellidoM VARCHAR(50),
    Nacionalidad VARCHAR(50),
    FechaDeNacimiento DATE
);

CREATE TABLE Entrenador (
    idEntrenador VARCHAR(50) PRIMARY KEY,
    Nombre VARCHAR(50),
    ApellidoP VARCHAR(50),
    ApellidoM VARCHAR(50),
    Nacionalidad VARCHAR(50),
    FechaDeNacimiento DATE
);

CREATE TABLE Atleta (
    idAtleta VARCHAR(20) PRIMARY KEY,
    NombrePais VARCHAR(30),
    Disciplina VARCHAR(30),
    Genero VARCHAR(10),
    Nombre VARCHAR(50),
    ApellidoP VARCHAR(50),
    ApellidoM VARCHAR(50),
    FechaDeNacimiento DATE,
    Año DATE
);

CREATE TABLE TelefonoAtleta (
    idAtleta VARCHAR(20),
    Telefono INT,
    PRIMARY KEY (idAtleta, Telefono)
);

CREATE TABLE CorreoAtleta (
    idAtleta VARCHAR(20),
    Correo VARCHAR(30),
    PRIMARY KEY (idAtleta, Correo)
);

CREATE TABLE CorreoJuez (
    idJuez VARCHAR(19),
    Correo VARCHAR(20),
    PRIMARY KEY (idJuez, Correo)
);

CREATE TABLE CorreoEntrenador (
    idEntrenador VARCHAR(19),
    Correo VARCHAR(20),
    PRIMARY KEY (idEntrenador, Correo)
);

CREATE TABLE CorreoArbitro (
    idArbitro VARCHAR(19),
    Correo VARCHAR(20),
    PRIMARY KEY (idArbitro, Correo)
);

CREATE TABLE TelefonoJuez (
    idJuez VARCHAR(19),
    Telefono INT,
    PRIMARY KEY (idJuez, Telefono)
);

CREATE TABLE TelefonoEntrenador (
    idEntrenador VARCHAR(19),
    Telefono INT,
    PRIMARY KEY (idEntrenador, Telefono)
);

CREATE TABLE TelefonoArbitro (
    idArbitro VARCHAR(19),
    Telefono INT,
    PRIMARY KEY (idArbitro, Telefono)
);

CREATE TABLE Pais (
    NombrePais VARCHAR(30) PRIMARY KEY,
    MedallaOro BOOLEAN,
    MedallaPlata BOOLEAN,
    MedallaBronce BOOLEAN
);

CREATE TABLE Disciplina (
    NombreDisciplina VARCHAR(20) PRIMARY KEY,
    NombrePais VARCHAR(30),
    Categoria VARCHAR(30),
    Participantes VARCHAR(50),
    Año DATE
);

CREATE TABLE Patrocinadores (
    NombreDisciplina VARCHAR(20),
    Patrocinador VARCHAR(30),
    PRIMARY KEY (NombreDisciplina, Patrocinador)
);

CREATE TABLE Competencia (
    idCompetencia VARCHAR(30) PRIMARY KEY,
    idAtleta VARCHAR(20),
    FaseEliminatoria BOOLEAN
);

CREATE TABLE Agenda (
    idAgenda VARCHAR(50) PRIMARY KEY,
    Localidad VARCHAR(40),
    Disciplina VARCHAR(40),
    Horario TIME,
    Fecha DATE,
    Precio NUMERIC(10,2),
    Duracion INT,
    Participantes VARCHAR(40)
);

CREATE TABLE Evento (
    idEvento VARCHAR(40) PRIMARY KEY,
    idAgenda VARCHAR(40),
    Localidad VARCHAR(40)
);

CREATE TABLE Localidad (
    NombreLocalidad VARCHAR(30) PRIMARY KEY,
    idEvento VARCHAR(40),
    Aforo VARCHAR(40),
    Tipo VARCHAR(40),
    Calle VARCHAR(40),
    Numero INT,
    Ciudad VARCHAR(40),
    Pais VARCHAR(40)
);

CREATE TABLE Entrada (
    NumeroEntrada INT PRIMARY KEY,
    idEvento VARCHAR(40),
    Cantidad INT,
    Fecha DATE
);

CREATE TABLE Registrar (
    idAgenda VARCHAR(40),
    idEvento VARCHAR(40),
    PRIMARY KEY (idAgenda, idEvento)
);

CREATE TABLE Incluir (
    idCompetencia VARCHAR(40),
    idEvento VARCHAR(40),
    PRIMARY KEY (idCompetencia, idEvento)
);

CREATE TABLE Representar (
    NombreDisciplina VARCHAR(30),
    idAtleta VARCHAR(40),
    Año DATE,
    PRIMARY KEY (NombreDisciplina, idAtleta)
);

CREATE TABLE Ganar (
    NombreDisciplina VARCHAR(40),
    idAtleta VARCHAR(40),
    Medalla BOOLEAN,
    PRIMARY KEY (NombreDisciplina, idAtleta)
);

CREATE TABLE Supervisar (
    NombreDisciplina VARCHAR(40),
    idJuez VARCHAR(40),
    idArbitro VARCHAR(40),
    idEntrenador VARCHAR(40),
    PRIMARY KEY (NombreDisciplina)
);

-- Agregamos las llaves foreanas con ALTER TABLE

ALTER TABLE TelefonoAtleta
    ADD CONSTRAINT fk_telefono_atleta
    FOREIGN KEY (idAtleta)
    REFERENCES Atleta(idAtleta);
   
ALTER TABLE Atleta
    ADD CONSTRAINT fk_atleta
    FOREIGN KEY (NombrePais)
    REFERENCES Pais(NombrePais);

ALTER TABLE CorreoAtleta
    ADD CONSTRAINT fk_correo_atleta
    FOREIGN KEY (idAtleta)
    REFERENCES Atleta(idAtleta);

ALTER TABLE CorreoJuez
    ADD CONSTRAINT fk_correo_juez
    FOREIGN KEY (idJuez)
    REFERENCES Juez(idJuez);

ALTER TABLE CorreoEntrenador
    ADD CONSTRAINT fk_correo_entrenador
    FOREIGN KEY (idEntrenador)
    REFERENCES Entrenador(idEntrenador);

ALTER TABLE CorreoArbitro
    ADD CONSTRAINT fk_correo_arbitro
    FOREIGN KEY (idArbitro)
    REFERENCES Arbitro(idArbitro);

ALTER TABLE TelefonoJuez
    ADD CONSTRAINT fk_telefono_juez
    FOREIGN KEY (idJuez)
    REFERENCES Juez(idJuez);

ALTER TABLE TelefonoEntrenador
    ADD CONSTRAINT fk_telefono_entrenador
    FOREIGN KEY (idEntrenador)
    REFERENCES Entrenador(idEntrenador);

ALTER TABLE TelefonoArbitro
    ADD CONSTRAINT fk_telefono_arbitro
    FOREIGN KEY (idArbitro)
    REFERENCES Arbitro(idArbitro);

ALTER TABLE Disciplina
    ADD CONSTRAINT fk_disciplina_pais
    FOREIGN KEY (NombrePais)
    REFERENCES Pais(NombrePais);

ALTER TABLE Patrocinadores
    ADD CONSTRAINT fk_patrocinadores_disciplina
    FOREIGN KEY (NombreDisciplina)
    REFERENCES Disciplina(NombreDisciplina);

ALTER TABLE Competencia
    ADD CONSTRAINT fk_competencia_atleta
    FOREIGN KEY (idAtleta)
    REFERENCES Atleta(idAtleta);

ALTER TABLE Localidad
    ADD CONSTRAINT fk_localidad_evento
    FOREIGN KEY (idEvento)
    REFERENCES Evento(idEvento);

ALTER TABLE Localidad
    ADD CONSTRAINT fk_localidad_pais
    FOREIGN KEY (Pais)
    REFERENCES Pais(NombrePais);

ALTER TABLE Entrada
    ADD CONSTRAINT fk_entrada_evento
    FOREIGN KEY (idEvento)
    REFERENCES Evento(idEvento);

ALTER TABLE Registrar
    ADD CONSTRAINT fk_registrar_agenda
    FOREIGN KEY (idAgenda)
    REFERENCES Agenda(idAgenda);

ALTER TABLE Registrar
    ADD CONSTRAINT fk_registrar_evento
    FOREIGN KEY (idEvento)
    REFERENCES Evento(idEvento);

ALTER TABLE Incluir
    ADD CONSTRAINT fk_incluir_competencia
    FOREIGN KEY (idCompetencia)
    REFERENCES Competencia(idCompetencia);

ALTER TABLE Incluir
    ADD CONSTRAINT fk_incluir_evento
    FOREIGN KEY (idEvento)
    REFERENCES Evento(idEvento);

ALTER TABLE Representar
    ADD CONSTRAINT fk_representar_disciplina
    FOREIGN KEY (NombreDisciplina)
    REFERENCES Disciplina(NombreDisciplina);

ALTER TABLE Representar
    ADD CONSTRAINT fk_representar_atleta
    FOREIGN KEY (idAtleta)
    REFERENCES Atleta(idAtleta);

ALTER TABLE Ganar
    ADD CONSTRAINT fk_ganar_disciplina
    FOREIGN KEY (NombreDisciplina)
    REFERENCES Disciplina(NombreDisciplina);

ALTER TABLE Ganar
    ADD CONSTRAINT fk_ganar_atleta
    FOREIGN KEY (idAtleta)
    REFERENCES Atleta(idAtleta);

ALTER TABLE Supervisar
    ADD CONSTRAINT fk_supervisar_juez
    FOREIGN KEY (idJuez)
    REFERENCES Juez(idJuez);

ALTER TABLE Supervisar
    ADD CONSTRAINT fk_supervisar_arbitro
    FOREIGN KEY (idArbitro)
    REFERENCES Arbitro(idArbitro);

ALTER TABLE Supervisar
    ADD CONSTRAINT fk_supervisar_entrenador
    FOREIGN KEY (idEntrenador)
    REFERENCES Entrenador(idEntrenador);