INSERT INTO miembros (nombre, apellido, fecha_nacimiento, email, telefono, direccion, estatus) VALUES
('Juan', 'Pérez', '1985-07-12', 'juan.perez@example.com', '123456789', 'Calle Falsa 123, Ciudad', 'activo'),
('María', 'Gómez', '1990-03-15', 'maria.gomez@example.com', '234567890', 'Av. Libertador 456, Ciudad', 'activo'),
('Carlos', 'Lopez', '1978-12-20', 'carlos.lopez@example.com', '345678901', 'Calle del Sol 789, Ciudad', 'inactivo'),
('Ana', 'Martínez', '1992-05-10', 'ana.martinez@example.com', '456789012', 'Calle Mayor 321, Ciudad', 'activo'),
('Luis', 'Ramírez', '1984-09-25', 'luis.ramirez@example.com', '567890123', 'Plaza Central 456, Ciudad', 'activo'),
('Elena', 'Sánchez', '1995-02-14', 'elena.sanchez@example.com', '678901234', 'Calle Larga 123, Ciudad', 'inactivo'),
('Javier', 'Torres', '1980-06-30', 'javier.torres@example.com', '789012345', 'Av. San Martín 789, Ciudad', 'activo'),
('Luisa', 'Fernández', '1993-11-05', 'luisa.fernandez@example.com', '890123456', 'Calle Primavera 101, Ciudad', 'activo');


INSERT INTO roles (nombre_rol) VALUES
('Presidente'),
('Vicepresidente'),
('Secretario'),
('Tesorero'),
('Vocal'),
('Miembro activo'),
('Miembro honorario'),
('Coordinador de actividades');


INSERT INTO miembros_roles (miembro_id, rol_id, fecha_asignacion) VALUES
(1, 1, '2024-01-01'),
(2, 2, '2024-01-01'),
(3, 3, '2023-06-15'),
(4, 4, '2023-07-10'),
(5, 5, '2024-02-20'),
(6, 6, '2023-09-25'),
(7, 7, '2024-03-05'),
(8, 8, '2023-12-30');


INSERT INTO actividades (nombre_actividad, descripcion, fecha_inicio, fecha_fin, lugar) VALUES
('Reunión mensual', 'Reunión general de todos los miembros del club', '2024-01-15', '2024-01-15', 'Sala de conferencias'),
('Torneo de ajedrez', 'Competencia de ajedrez entre los miembros del club', '2024-02-10', '2024-02-10', 'Salón de eventos'),
('Curso de liderazgo', 'Curso para mejorar las habilidades de liderazgo de los miembros', '2024-03-05', '2024-03-06', 'Centro de capacitación'),
('Jornada de limpieza', 'Jornada de voluntariado para limpiar la zona de la ciudad', '2024-04-01', '2024-04-01', 'Parque Central'),
('Fútbol amistoso', 'Partido amistoso entre los miembros del club', '2024-05-20', '2024-05-20', 'Campo de fútbol'),
('Conferencia sobre tecnología', 'Conferencia sobre las últimas tendencias tecnológicas', '2024-06-10', '2024-06-10', 'Auditorio principal'),
('Exposición de arte', 'Exposición de obras de arte de miembros del club', '2024-07-15', '2024-07-15', 'Galería de arte'),
('Cena de gala', 'Evento social de fin de año con todos los miembros', '2024-12-20', '2024-12-20', 'Restaurante elegante');


INSERT INTO miembros_actividades (miembro_id, actividad_id, fecha_participacion) VALUES
(1, 1, '2024-01-15'),
(2, 2, '2024-02-10'),
(3, 3, '2024-03-05'),
(4, 4, '2024-04-01'),
(5, 5, '2024-05-20'),
(6, 6, '2024-06-10'),
(7, 7, '2024-07-15'),
(8, 8, '2024-12-20');


INSERT INTO eventos (nombre_evento, descripcion, fecha_evento, lugar) VALUES
('Asamblea anual', 'Reunión donde se discuten las decisiones importantes del club', '2024-01-30', 'Sala principal'),
('Charla motivacional', 'Charla sobre motivación personal y profesional', '2024-02-25', 'Auditorio'),
('Reunión de comité', 'Reunión de los miembros del comité organizador del club', '2024-03-18', 'Oficinas del club'),
('Concierto benéfico', 'Concierto organizado para recaudar fondos para proyectos comunitarios', '2024-04-10', 'Teatro local'),
('Fiesta de verano', 'Fiesta para celebrar el inicio del verano', '2024-06-15', 'Parque central'),
('Torneo de fútbol', 'Torneo de fútbol para todos los miembros', '2024-07-05', 'Estadio local'),
('Exposición fotográfica', 'Exposición de fotos tomadas por los miembros del club', '2024-08-20', 'Galería municipal'),
('Reunión de fin de año', 'Reunión para revisar el progreso del club durante el año', '2024-12-10', 'Centro cultural');


INSERT INTO miembros_eventos (miembro_id, evento_id, fecha_participacion) VALUES
(1, 1, '2024-01-30'),
(2, 2, '2024-02-25'),
(3, 3, '2024-03-18'),
(4, 4, '2024-04-10'),
(5, 5, '2024-06-15'),
(6, 6, '2024-07-05'),
(7, 7, '2024-08-20'),
(8, 8, '2024-12-10');


INSERT INTO pagos (miembro_id, monto, fecha_pago, descripcion) VALUES
(1, 50.00, '2024-01-10', 'Pago mensual de membresía'),
(2, 30.00, '2024-02-05', 'Pago mensual de membresía'),
(3, 45.00, '2024-03-01', 'Pago mensual de membresía'),
(4, 50.00, '2024-04-03', 'Pago mensual de membresía'),
(5, 55.00, '2024-05-02', 'Pago mensual de membresía'),
(6, 40.00, '2024-06-01', 'Pago mensual de membresía'),
(7, 60.00, '2024-07-10', 'Pago mensual de membresía'),
(8, 50.00, '2024-08-15', 'Pago mensual de membresía');


INSERT INTO donaciones (miembro_id, monto, fecha_donacion, descripcion) VALUES
(1, 100.00, '2024-01-20', 'Donación para la causa de limpieza'),
(2, 150.00, '2024-02-15', 'Donación para la compra de materiales educativos'),
(3, 200.00, '2024-03-10', 'Donación para el torneo de ajedrez'),
(4, 300.00, '2024-04-05', 'Donación para el evento de caridad'),
(5, 50.00, '2024-05-05', 'Donación para las actividades de verano'),
(6, 250.00, '2024-06-10', 'Donación para la conferencia de tecnología'),
(7, 500.00, '2024-07-25', 'Donación para el proyecto de arte'),
(8, 350.00, '2024-08-05', 'Donación para el evento benéfico');