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
END
// delimiter ;