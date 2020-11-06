
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'root';
FLUSH PRIVILEGES;


CREATE DATABASE IF NOT EXISTS torneo_sa;
USE torneo_sa;
CREATE TABLE Juego
(
    codigo INT NOT NULL AUTO_INCREMENT,  
    nombre VARCHAR(100) NOT NULL,
    direccion VARCHAR(256) NOT NULL,
    PRIMARY KEY (codigo)       
);

CREATE TABLE Torneo
(
    codigo INT NOT NULL AUTO_INCREMENT,  
    nombre VARCHAR(100), 
    codigojuego INT NOT NULL,
    codigoganador INT,
    PRIMARY KEY (codigo),
    FOREIGN KEY (codigojuego) REFERENCES Juego(codigo)
);

CREATE TABLE JugadorTorneo
(
    codigotorneo INT NOT NULL,
    codigojugador INT NOT NULL,
    CONSTRAINT PK_JugadorTorneo PRIMARY KEY (codigotorneo, codigojugador),
    FOREIGN KEY (codigotorneo) REFERENCES Torneo(codigo)
);

CREATE TABLE Partida
(
    codigo INT NOT NULL AUTO_INCREMENT,
    codigotorneo INT NOT NULL,
    fechahora DATETIME DEFAULT CURRENT_TIMESTAMP,    
    estado INT NOT NULL, 
    marcador INT NOT NULL,  
    CONSTRAINT PK_Partida PRIMARY KEY(codigo, codigotorneo),
    FOREIGN KEY(codigotorneo) REFERENCES Torneo(codigo)
);

CREATE TABLE JugadorPartida
(
    codigopartida INT NOT NULL, 
    codigojugador INT NOT NULL,
    CONSTRAINT PK_JugadorPartida PRIMARY KEY(codigopartida,codigojugador),
    FOREIGN KEY(codigopartida) REFERENCES Partida(codigo)
);



INSERT INTO Juego(nombre, direccion) VALUES
('Parchis','parchisserver'),
('Serpiente y escaleras','serpientesserver');
 
INSERT INTO  Torneo(nombre,codigojuego) VALUES 
('Copa Coca Cola',1),
('Copa Huelguera',2),
('Judgement day',1);

INSERT INTO JugadorTorneo(codigotorneo, codigojugador) VALUES 
(1,666),
(1,777),
(1,200),
(1,3323),
(1,9829),
(1,9329),
(1,1234),
(1,4321),
(2,666),
(2,777),
(2,200),
(2,3323),
(2,9829),
(2,9329),
(2,1234),
(2,4321)
;

INSERT INTO Partida(codigotorneo, estado,marcador) VALUES
(1,0,0),
(1,0,0),
(1,0,0),
(1,0,0),
(1,0,0),
(1,0,0),
(1,0,0),
(1,0,0)
;

INSERT INTO JugadorPartida(codigopartida, codigojugador) VALUES
(1,666),
(1,777),
(2,200),
(2,9829)
;


