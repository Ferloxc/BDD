DROP DATABASE IF EXISTS DispReg;
CREATE DATABASE DispReg CHARACTER SET utf8;

USE DispReg;

CREATE TABLE Dispensador(
    id INT AUTO_INCREMENT PRIMARY KEY,
    var_tipo VARCHAR(50),
    tin_capacidad TINYINT DEFAULT 200,
    var_marca VARCHAR(40)
);

CREATE TABLE Producto(
    id INT AUTO_INCREMENT PRIMARY KEY,
    var_marca VARCHAR(25),
    var_nombre VARCHAR(25),
    var_tipoDeProducto VARCHAR(25)
    id_dispensador INT;

);

CREATE TABLE Venta(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    dat_fecha DATE NOT NULL DEFAULT NOW(),
    id_dispensador INT
);

CREATE TABLE Comprobante(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_venta INT
);

ALTER TABLE Producto
    ADD CONSTRAINT Product_DISP_FK
        FOREIGN KEY (id_dispensador) REFERENCES Dispensador (id);

ALTER TABLE Venta
    ADD CONSTRAINT Venta_DISP_FK
        FOREIGN KEY (id_dispensador) REFERENCES Dispensador (id);

ALTER TABLE Comprobante 
    ADD CONSTRAINT Comprobante_DISP_FK
        FOREIGN KEY (id_venta) REFERENCES Venta (id);
