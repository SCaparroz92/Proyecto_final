DROP DATABASE IF EXISTS clubdb;
CREATE DATABASE clubdb;
USE DATABASE clubdb;

CREATE TABLE miembros (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    fecha_nacimiento DATE,
    email VARCHAR(100) UNIQUE,
    telefono VARCHAR(15),
    direccion VARCHAR(255),
    fecha_registro DATE,
    estatus ENUM('activo', 'inactivo') DEFAULT 'activo'
);

CREATE TABLE roles (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_rol VARCHAR(100) NOT NULL
);

CREATE TABLE miembros_roles (
    id INT AUTO_INCREMENT PRIMARY KEY,
    miembro_id INT,
    rol_id INT,
    fecha_asignacion DATE
);

CREATE TABLE actividades (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_actividad VARCHAR(255) NOT NULL,
    descripcion TEXT,
    fecha_inicio DATE,
    fecha_fin DATE,
    lugar VARCHAR(255)
);

CREATE TABLE eventos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_evento VARCHAR(255) NOT NULL,
    descripcion TEXT,
    fecha_evento DATE,
    lugar VARCHAR(255)
);

CREATE TABLE miembros_actividades (
    id INT AUTO_INCREMENT PRIMARY KEY,
    miembro_id INT,
    actividad_id INT,
    fecha_participacion DATE
);

CREATE TABLE miembros_eventos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    miembro_id INT,
    evento_id INT,
    fecha_participacion DATE
);

CREATE TABLE pagos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    miembro_id INT,
    monto DECIMAL(10, 2),
    fecha_pago DATE,
    descripcion TEXT
);

CREATE TABLE donaciones (
    id INT AUTO_INCREMENT PRIMARY KEY,
    miembro_id INT,
    monto DECIMAL(10, 2),
    fecha_donacion DATE,
    descripcion TEXT
);

CREATE TABLE publicaciones (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(255) NOT NULL,
    contenido TEXT,
    fecha_publicacion DATE
);

CREATE TABLE reuniones (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_reunion VARCHAR(255) NOT NULL,
    fecha_reunion DATE,
    lugar VARCHAR(255),
    descripcion TEXT
);

CREATE TABLE votaciones (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo_votacion VARCHAR(255) NOT NULL,
    fecha_votacion DATE,
    descripcion TEXT
);

CREATE TABLE resultados_votacion (
    id INT AUTO_INCREMENT PRIMARY KEY,
    votacion_id INT,
    miembro_id INT,
    voto ENUM('si', 'no', 'abstenerse')
);

CREATE TABLE comunicados (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(255) NOT NULL,
    contenido TEXT,
    fecha_comunicado DATE
);

CREATE TABLE horarios_actividades (
    id INT AUTO_INCREMENT PRIMARY KEY,
    actividad_id INT,
    dia_semana ENUM('lunes', 'martes', 'miércoles', 'jueves', 'viernes', 'sábado', 'domingo'),
    hora_inicio TIME,
    hora_fin TIME
);

CREATE TABLE evaluaciones (
    id INT AUTO_INCREMENT PRIMARY KEY,
    miembro_id INT,
    actividad_id INT,
    puntuacion INT CHECK (puntuacion BETWEEN 1 AND 5),
    comentarios TEXT,
    fecha_evaluacion DATE
);

CREATE TABLE premios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_premio VARCHAR(255) NOT NULL,
    descripcion TEXT
);

CREATE TABLE miembros_premios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    miembro_id INT,
    premio_id INT,
    fecha_otorgamiento DATE
);

ALTER TABLE miembros_roles 
    ADD CONSTRAINT FK_miembro_id FOREIGN KEY (miembro_id) REFERENCES miembros(id) ON DELETE CASCADE,
    ADD CONSTRAINT FK_rol_id FOREIGN KEY (rol_id) REFERENCES roles(id) ON DELETE CASCADE;

ALTER TABLE miembros_actividades
    ADD CONSTRAINT FK_miembro_actividad_id FOREIGN KEY (miembro_id) REFERENCES miembros(id) ON DELETE CASCADE,
    ADD CONSTRAINT FK_actividad_id FOREIGN KEY (actividad_id) REFERENCES actividades(id) ON DELETE CASCADE;

ALTER TABLE miembros_eventos
    ADD CONSTRAINT FK_miembro_evento_id FOREIGN KEY (miembro_id) REFERENCES miembros(id) ON DELETE CASCADE,
    ADD CONSTRAINT FK_evento_id FOREIGN KEY (evento_id) REFERENCES eventos(id) ON DELETE CASCADE;

ALTER TABLE pagos
    ADD CONSTRAINT FK_pago_miembro_id FOREIGN KEY (miembro_id) REFERENCES miembros(id) ON DELETE CASCADE;

ALTER TABLE donaciones
    ADD CONSTRAINT FK_donacion_miembro_id FOREIGN KEY (miembro_id) REFERENCES miembros(id) ON DELETE CASCADE;

ALTER TABLE resultados_votacion
    ADD CONSTRAINT FK_votacion_id FOREIGN KEY (votacion_id) REFERENCES votaciones(id) ON DELETE CASCADE,
    ADD CONSTRAINT FK_miembro_voto_id FOREIGN KEY (miembro_id) REFERENCES miembros(id) ON DELETE CASCADE;

ALTER TABLE horarios_actividades
    ADD CONSTRAINT FK_actividad_horario_id FOREIGN KEY (actividad_id) REFERENCES actividades(id) ON DELETE CASCADE;

ALTER TABLE evaluaciones
    ADD CONSTRAINT FK_miembro_actividad_eval FOREIGN KEY (miembro_id) REFERENCES miembros(id) ON DELETE CASCADE,
    ADD CONSTRAINT FK_actividad_evaluacion FOREIGN KEY (actividad_id) REFERENCES actividades(id) ON DELETE CASCADE;

ALTER TABLE miembros_premios
    ADD CONSTRAINT FK_miembro_premio_id FOREIGN KEY (miembro_id) REFERENCES miembros(id) ON DELETE CASCADE,
    ADD CONSTRAINT FK_premio_id FOREIGN KEY (premio_id) REFERENCES premios(id) ON DELETE CASCADE;
