DROP DATABASE IF EXISTS DispReg;
CREATE DATABASE DispReg CHARACTER SET utf8;

USE DispReg;

CREATE TABLE Dispensador(
    id INT AUTO_INCREMENT PRIMARY KEY,
    var_tipo VARCHAR(50),
    tin_capacidad TINYINT DEFAULT 0,
    var_marca VARCHAR(40)
);

CREATE TABLE Producto(
    id INT AUTO_INCREMENT PRIMARY KEY,
    var_marca VARCHAR(25),
    var_nombre VARCHAR(25),
    var_tipoDeProducto VARCHAR(25)
    id_dispensador INT;  -- ! Este atributo no está en los diagramas
    int_existencias INT NOT NULL


);



CREATE TABLE Venta(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    dat_fecha DATE NOT NULL DEFAULT NOW(),
    
);

CREATE TABLE Comprobante(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_venta INT,
    id_producto INT,
    -- no pues ya me vi llevando bases el otro periodo :(
    -- x2
    -- x3 que hagamos grupaso dice?
    -- x4
    -- its_anaehm no está en el dream team ya :c

    -- !Yo propongo
    flo_precio FLOAT NOT NULL, -- TRIGGER
    flo_impuesto FLOAT DEFAULT 0.15,
    flo_billete FLOAT NOT NULL,
    flo_subtotal FLOAT AS (flo_billete * flo_impuesto),
    flo_total FLOAT AS (flo_subtotal + flo_precio),
    flo_cambio FLOAT AS (flo_billete - flo_total),

    CHECK (flo_billete = 1.00 OR flo_billete = 2.00 OR flo_billete = 5.00 OR flo_billete = 10.00 OR flo_billete = 20.00 OR flo_billete = 50.00 OR flo_billete = 100.00 OR flo_billete = 500.00)

    -- Hago billetes predeterminados ya que hay una función que debe contar los billetes más usados, entonces al final se cuentan los valores que les menciono arriba.

);

ALTER TABLE Producto
    ADD CONSTRAINT Product_DISP_FK
        FOREIGN KEY (id_dispensador) REFERENCES Dispensador (id);

ALTER TABLE Venta
    ADD CONSTRAINT Venta_PROD_FK
        FOREIGN KEY (id_dispensador) REFERENCES Dispensador (id);

ALTER TABLE Comprobante 
    ADD CONSTRAINT Comprobante_DISP_FK
        FOREIGN KEY (id_venta) REFERENCES Venta (id);


DELIMITER //
CREATE PROCEDURE createReceipt(
    venta     INT, 
    producto  INT,            
    billete     FLOAT)   
    
    BEGIN    

    INSERT INTO Comprobante (id_venta, id_producto, flo_precio, flo_billete)
        VALUES (venta, producto, 
        (SELECT PRO.flo_price FROM Producto PRO WHERE PRO.id = producto),
        billete);

    UPDATE Producto PRO
        SET PRO.int_existencias = (int_existencias - 1)
        WHERE PRO.id = producto;    

    END//

    CALL createReceipt(1,1,50.00);
