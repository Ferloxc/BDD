-- LyraNoMilo_19
DROP DATABASE IF EXISTS Matrix;

CREATE DATABASE Matrix;
USE Matrix;

CREATE TABLE MatrixA(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    a1 INT NOT NULL,
    a2 INT NOT NULL,
    a3 INT NOT NULL
);

CREATE TABLE MatrixB(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    b1 INT NOT NULL,
    b2 INT NOT NULL,
    b3 INT NOT NULL
);

CREATE TABLE Result(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    r1 INT NOT NULL,
    r2 INT NOT NULL,
    r3 INT NOT NULL
);


INSERT INTO MatrixA (a1,a2,a3) VALUES (2,5,6),(45,8,4),(10,25,9);
INSERT INTO MatrixB (b1,b2,b3) VALUES (4,5,8),(4,6,3),(20,5,7);


/*
Matrix A      Matrix B
|2   5   6|   |4   5  8|
|45  8   4|   |4   6  3|
|10  25  9|   |20  5  7|
*/

DELIMITER //
CREATE PROCEDURE matrixResult(
    ar1    INT,
    ar2    INT,
    ar3    INT,
    br1    INT,
    br2    INT,
    br3    INT)

    BEGIN

    -- FIRST ROW OF RESULTS

    INSERT INTO Result(r1, r2, r3) VALUES
        (((SELECT MatrixA.a1 FROM MatrixA WHERE MatrixA.id = ar1)*
        (SELECT MatrixB.b1 FROM MatrixB WHERE MatrixB.id = br1) + 
        (SELECT MatrixA.a2 FROM MatrixA WHERE MatrixA.id = ar1)*
        (SELECT MatrixB.b1 FROM MatrixB WHERE MatrixB.id = br2) + 
        (SELECT MatrixA.a3 FROM MatrixA WHERE MatrixA.id = ar1)*
        (SELECT MatrixB.b1 FROM MatrixB WHERE MatrixB.id = br3))

        ,

        ((SELECT MatrixA.a1 FROM MatrixA WHERE MatrixA.id = ar1)*
        (SELECT MatrixB.b2 FROM MatrixB WHERE MatrixB.id = br1) + 
        (SELECT MatrixA.a2 FROM MatrixA WHERE MatrixA.id = ar1)*
        (SELECT MatrixB.b2 FROM MatrixB WHERE MatrixB.id = br2) + 
        (SELECT MatrixA.a3 FROM MatrixA WHERE MatrixA.id = ar1)*
        (SELECT MatrixB.b2 FROM MatrixB WHERE MatrixB.id = br3))

        ,

        ((SELECT MatrixA.a1 FROM MatrixA WHERE MatrixA.id = ar1)*
        (SELECT MatrixB.b3 FROM MatrixB WHERE MatrixB.id = br1) + 
        (SELECT MatrixA.a2 FROM MatrixA WHERE MatrixA.id = ar1)*
        (SELECT MatrixB.b3 FROM MatrixB WHERE MatrixB.id = br2) + 
        (SELECT MatrixA.a3 FROM MatrixA WHERE MatrixA.id = ar1)*
        (SELECT MatrixB.b3 FROM MatrixB WHERE MatrixB.id = br3)));

    -- SECOND ROW OF RESULTS
    
    INSERT INTO Result(r1, r2, r3) VALUES
        (((SELECT MatrixA.a1 FROM MatrixA WHERE MatrixA.id = ar2)*
        (SELECT MatrixB.b1 FROM MatrixB WHERE MatrixB.id = br1) + 
        (SELECT MatrixA.a2 FROM MatrixA WHERE MatrixA.id = ar2)*
        (SELECT MatrixB.b1 FROM MatrixB WHERE MatrixB.id = br2) + 
        (SELECT MatrixA.a3 FROM MatrixA WHERE MatrixA.id = ar2)*
        (SELECT MatrixB.b1 FROM MatrixB WHERE MatrixB.id = br3))

        ,

        ((SELECT MatrixA.a1 FROM MatrixA WHERE MatrixA.id = ar2)*
        (SELECT MatrixB.b2 FROM MatrixB WHERE MatrixB.id = br1) + 
        (SELECT MatrixA.a2 FROM MatrixA WHERE MatrixA.id = ar2)*
        (SELECT MatrixB.b2 FROM MatrixB WHERE MatrixB.id = br2) + 
        (SELECT MatrixA.a3 FROM MatrixA WHERE MatrixA.id = ar2)*
        (SELECT MatrixB.b2 FROM MatrixB WHERE MatrixB.id = br3))

        ,

        ((SELECT MatrixA.a1 FROM MatrixA WHERE MatrixA.id = ar2)*
        (SELECT MatrixB.b3 FROM MatrixB WHERE MatrixB.id = br1) + 
        (SELECT MatrixA.a2 FROM MatrixA WHERE MatrixA.id = ar2)*
        (SELECT MatrixB.b3 FROM MatrixB WHERE MatrixB.id = br2) + 
        (SELECT MatrixA.a3 FROM MatrixA WHERE MatrixA.id = ar2)*
        (SELECT MatrixB.b3 FROM MatrixB WHERE MatrixB.id = br3)));

    -- THIRD ROW OF RESULTS

    INSERT INTO Result(r1, r2, r3) VALUES
        (((SELECT MatrixA.a1 FROM MatrixA WHERE MatrixA.id = ar3)*
        (SELECT MatrixB.b1 FROM MatrixB WHERE MatrixB.id = br1) + 
        (SELECT MatrixA.a2 FROM MatrixA WHERE MatrixA.id = ar3)*
        (SELECT MatrixB.b1 FROM MatrixB WHERE MatrixB.id = br2) + 
        (SELECT MatrixA.a3 FROM MatrixA WHERE MatrixA.id = ar3)*
        (SELECT MatrixB.b1 FROM MatrixB WHERE MatrixB.id = br3))

        ,

        ((SELECT MatrixA.a1 FROM MatrixA WHERE MatrixA.id = ar3)*
        (SELECT MatrixB.b2 FROM MatrixB WHERE MatrixB.id = br1) + 
        (SELECT MatrixA.a2 FROM MatrixA WHERE MatrixA.id = ar3)*
        (SELECT MatrixB.b2 FROM MatrixB WHERE MatrixB.id = br2) + 
        (SELECT MatrixA.a3 FROM MatrixA WHERE MatrixA.id = ar3)*
        (SELECT MatrixB.b2 FROM MatrixB WHERE MatrixB.id = br3))

        ,

        ((SELECT MatrixA.a1 FROM MatrixA WHERE MatrixA.id = ar3)*
        (SELECT MatrixB.b3 FROM MatrixB WHERE MatrixB.id = br1) + 
        (SELECT MatrixA.a2 FROM MatrixA WHERE MatrixA.id = ar3)*
        (SELECT MatrixB.b3 FROM MatrixB WHERE MatrixB.id = br2) + 
        (SELECT MatrixA.a3 FROM MatrixA WHERE MatrixA.id = ar3)*
        (SELECT MatrixB.b3 FROM MatrixB WHERE MatrixB.id = br3)));      
        

    END//

CALL matrixResult(1,2,3,1,2,3);

