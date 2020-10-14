/*Sección de eliminación y creación de la BD*/
DROP DATABASE IF EXISTS armarioDB ;
CREATE DATABASE armarioDB;
USE armarioBD;

/*Definición de tabla Armario*/
CREATE TABLE Armario(
        id INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
        var_marca VARCHAR(60),
        tim_fecha TIMESTAMP NOT NULL DEFAULT NOW(),
        var_material VARCHAR(25) NOT NULL,
        var_dueño VARCHAR(25) NOT NULL,
        var_tamaño VARCHAR(6) NOT NULL,
);

/*Definición de tabla Vestuario*/
CREATE TABLE Vestuario(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_armario INT NOT NULL,
    var_talla VARCHAR(25) NOT NULL,
    var_marca VARCHAR(25) NOT NULL,    
    enu_tipo ENUM('pantalon','camisa','vestido','calcetas','sueter','zapatos')
    var_material VARCHAR(25) NOT NULL,
    enu_genero ENUM('femenino','masculino','unisex'), 

    FOREIGN KEY (id_armario)
        REFERENCES Armario(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

INSERT INTO Armario(
    var_marca,    
    var_material,
    var_dueño,
    var_tamaño,       
) VALUES 
    ('El Gallo mas gallo', 'Abedul', 'Ana H.', '3.5 m'),
    ('La Curacao', 'Tugsteno', NULL, '30cm'),
    ('Elektra','URSS','Vladimir Putin','35KM')
;

INSERT INTO Vestuario(
    id_armario,
    var_talla,
    var_marca,
    enu_tipo,
    var_material,
    enu_genero
)VALUES(
    (1,'5','Golazo','camisa','algodon','femenino'),
    (2,'43','Nike','pantalon','Poliestar','unisex'),    
    (3,'6.5','PULL & BEAR','camisa','seda','masculino'),
    (1,'7','Adidas','calcetas','lana','unisex')
);

-- !CONSULTAS
--Total de tipos de prendas almacenados.

SELECT ARM.id 'Armario',
        (SELECT COUNT(VES.enu_tipo) FROM Vestuario VES WHERE VES.id_armario = ARM.id) 'Tipos'
    FROM Armario ARM;


-- Listado de cantidad de elementos por cada tipo de prenda guardada.
SELECT enu_tipo AS 'tipo', COUNT(*) FROM Armario INNER JOIN Vestimenta GROUP BY tipo ON Armario.id = Vestimenta.id;

-- ? intento de consulta del primer inciso, dale alguien de linux que lo pruebe despues plz
-- arre
SELECT count(*) AS 'Cantidad', Vestuario.enu_tipo AS 'Tipo' FROM Vestuario GROUP BY Vestuario.enu_tipo;