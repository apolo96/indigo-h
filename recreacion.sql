CREATE DATABASE recreacion;
USE recreacion;
CREATE TABLE usuarios(
	id bigint(20) PRIMARY KEY AUTO_INCREMENT,
    nombre varchar(60) NOT NULL,
    apellido varchar(60) NOT NULL,
    email varchar(255) NOT NULL,
    password varchar(255) NOT NULL,
    estado character(1) DEFAULT 'A',
    CHECK(estado = "A" OR estado = "D")
);
CREATE TABLE ubicacion(
	id bigint(20) PRIMARY KEY AUTO_INCREMENT,
    longitud varchar(255) NOT NULL,
    latitud varchar(255) NOT NULL
);
CREATE TABLE fotos(
	id bigint(20) PRIMARY KEY AUTO_INCREMENT,
    src varchar(255) NOT NULL
);
CREATE TABLE categoria(
	id bigint(20),
    nombre varchar(50)
);
CREATE TABLE sitio(
	id bigint(20) PRIMARY KEY AUTO_INCREMENT,
    nombre varchar(255) NOT NULL,
    descripcion varchar(255) NOT NULL,
    ciudad varchar(60) NOT NULL,
    id_ubicacion bigint(255),
    id_fotos bigint(20),
    id_categoria bigint(20),    
    CONSTRAINT FOREIGN KEY fk_ubicacion(id_ubicacion) REFERENCES ubicacion(id),
    CONSTRAINT FOREIGN KEY fk_fotos(id_fotos) REFERENCES fotos(id),
    CONSTRAINT FOREIGN KEY fk_categoria(id_categoria) REFERENCES categorias(id)
);
CREATE TABLE comentarios(
	id bigint(20) PRIMARY KEY AUTO_INCREMENT,
    descripcion varchar(255) NOT NULL,
    id_sitio bigint(20) NOT NULL,
    id_persona bigint(20) NOT NULL,
    CONSTRAINT FOREIGN KEY fk_sitio(id_sitio) REFERENCES sitio(id),
    CONSTRAINT FOREIGN KEY fk_persona(id_persona) REFERENCES usuarios(id)
);
CREATE TABLE puntuacion(
	id bigint(20) PRIMARY KEY AUTO_INCREMENT,
    puntuacion bigint(5) NOT NULL,
    id_sitio bigint(50),
    CONSTRAINT FOREIGN KEY fk_sitio(id_sitio) REFERENCES sitio(id)
);

delimiter //
CREATE PROCEDURE registro_cliente(
	IN _nombre varchar(60) ,
	_apellido varchar(60) ,
    _email varchar(255) ,
    _password varchar(255) 
)BEGIN 
	INSERT INTO usuarios(nombre,apellido,email,password) VALUES(_nombre,_apellido,_email,_password);
END
// delimiter ;

CALL registro_cliente('miller','garcia','miller@gmail.com','123');
SELECT * FROM usuarios;

-- delimiter //
-- CREATE PROCEDURE registro_cliente(
-- 	IN _
-- )BEGIN 
-- 	INSERT INTO  VALUES();
-- END
-- // delimiter ;

delimiter //
<<<<<<< HEAD
CREATE PROCEDURE registro_sitio(
	IN _longitud varchar(255),
	_latitud varchar(255),
	_src varchar(255),
	_nombre varchar(50),
	_nombre_sito varchar(255),
    _descripcion varchar(255),
    _ciudad varchar(60)
       
)BEGIN 
	DECLARE _lastIDU int;
    DECLARE _lastIDF int;
    DECLARE _lastIDC int;
	INSERT INTO ubicacion(longitud,latitud) VALUES(_longitud,_latitud);
	SET _lastIDU = LAST_INSERT_ID();
    INSERT INTO fotos(src) VALUES(_src);
	SET _lastIDF = LAST_INSERT_ID();
    INSERT INTO categoria(nombre) VALUES(_nombre);
    SET _lastIDC = LAST_INSERT_ID();
    INSERT 
    INTO sitio( nombre,descripcion,ciudad,id_ubicacion,id_fotos,id_categoria) 
    VALUES(_nombre_sito,_descripcion,_ciudad,_lastIDU,_lastIDF,_lastIDC);
=======
CREATE PROCEDURE registro_comentarios(
	IN	_descripcion varchar(255),
		_id_sitio bigint(20),
		_id_persona bigint(20)
)BEGIN 
	INSERT INTO comentarios(descripcion,id_sitio,id_persona) VALUES(_descripcion,_id_sitio,_id_persona);
END
// delimiter 

CALL registro_comentarios('miller','garcia','miller@gmail.com','123');
SELECT * FROM usuarios;

CREATE PROCEDURE registro_puntuacion(
	IN	_puntuacion bigint(5),
		_id_sitio bigint(50)
)BEGIN 
	INSERT INTO puntuacion(puntuacion,id_sitio) VALUES(_puntuacion,_id_sitio);
>>>>>>> 21c815e8267c9f771f0bacd75837243f224a72f8
END
// delimiter ;

CALL registro_sitio('12.213','12.121','C/:img/bi.jpg','Turismo','San agustin','San Agustín es una población y municipio de Colombia ubicado en el sur del Departamento del Huila. Ubicado a una altura de 1.730 metros','Municipio San agustin');
SELECT * FROM sitio;
CALL registro_sitio('12.213','12.121','C/:img/bias.jpg','Turismo','Desierto','El Desierto de la Tatacoa es la segunda zona árida más extensa de Colombia después de la península de la Guajira','Municipio villa vieja');

