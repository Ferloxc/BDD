
DROP DATABASE IF EXISTS UnahDB;

CREATE DATABASE UnahDB CHARACTER SET utf8;

USE UnahDB;

CREATE TABLE Estudiante(
    id_Estudiante INT AUTO_INCREMENT PRIMARY KEY,
    var_nombre VARCHAR(25) NOT NULL,
    var_numCuenta VARCHAR(11) NOT NULL,
    tin_edad TINYINT NOT NULL
);

CREATE TABLE Asignatura(
    id_Asignatura INT AUTO_INCREMENT PRIMARY KEY,
    var_nombre VARCHAR (25),
    var_departamento VARCHAR(30)
);
 
CREATE TABLE Maestro(
    id_Maestro INT AUTO_INCREMENT PRIMARY KEY,
    tex_nombre VARCHAR(25) NOT NULL,
    tex_departamento VARCHAR(25) NOT NULL
);

CREATE TABLE Chamba(
    int_id_Asignatura INT NOT NULL,  
    int_id_Maestro INT NOT NULL
);

CREATE TABLE Matricula(
    int_id_Asignatura INT NOT NULL,  
    int_id_Estudiante INT NOT NULL
);


ALTER TABLE Chamba
ADD CONSTRAINT Chamba_MAS_FK
    FOREIGN KEY (int_id_Maestro) REFERENCES Maestro (id_Maestro),
ADD CONSTRAINT Chamba_ASI_FK
    FOREIGN KEY (int_id_Asignatura) REFERENCES Asignatura (id_Asignatura);

ALTER TABLE Matricula
ADD CONSTRAINT Matricula_EST_FK
    FOREIGN KEY (int_id_Estudiante) REFERENCES Estudiante (id_Estudiante),
ADD CONSTRAINT Matricula_ASI_FK
    FOREIGN KEY (int_id_Asignatura) REFERENCES Asignatura (id_Asignatura);

INSERT INTO Estudiante(var_nombre,var_numCuenta,tin_edad) VALUES
    ("Fernando","20171030809",20),
    ("Josue","20171034157",21),
    ("Ana","20171001620",21),
    ("Gabriel","18471000809",70),
    ("Moises","20171001679",20),
    ("Leo","20211031716",20),
    ("Juan Carlos","20171001679",26)
;

INSERT INTO Asignatura(var_nombre, var_departamento)VALUES
    ("Base de datos","Sitemas"),
    ("Sistemas Operativos II", "Sistemas"),
    ("Sistemas de Info", "Sistemas"),
    ("Introducción a la IS", "Sistemas"),
    ("Ecuaciones Diferenciales","Matemática")
;

INSERT INTO Maestro(tex_nombre,tex_departamento) VALUES
    ("Inestroza Papi","Sistemas"),
    ("El tio mendoza", "Sistemas"),
    ("El dejatareas Rommel","Sistemas"),
    ("Jaleas de Fresa","Sistemas"),
    ("Don Axel", "Matematicas")
;

INSERT INTO Chamba() VALUES
    (5,5),
    (1,1),
    (1,2),
    (2,2),
    (2,3),
    (3,3),
    (3,4),
    (4,4)
;

INSERT INTO Matricula() VALUES
    (2,1),
    (2,3),
    (2,5),
    (1,1),
    (1,4),
    (4,1),
    (4,2),
    (3,1),
    (3,3),
    (3,4),
    (3,5)
;

SELECT * FROM Estudiante;
SELECT Matricula.int_id_Estudiante, COUNT(*) AS "Cantidad_Clases" FROM Matricula  GROUP BY Matricula.int_id_Estudiante