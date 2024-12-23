USE DATABASE clubdb;

-- Descripción: Esta vista muestra los resultados de las votaciones en un club.
CREATE VIEW resultados_votaciones AS
SELECT v.titulo_votacion, r.miembro_id, m.nombre, m.apellido, r.voto
FROM resultados_votacion r
JOIN votaciones v ON r.votacion_id = v.id
JOIN miembros m ON r.miembro_id = m.id;

SELECT * FROM clubdb.resultados_votaciones;

-- Descripción: Esta vista muestra los pagos pendientes de los miembros, es decir, aquellos pagos cuyo monto es mayor que 0.
CREATE VIEW pagos_pendientes AS
SELECT p.id, p.miembro_id, m.nombre, m.apellido, p.monto, p.fecha_pago, p.descripcion
FROM pagos p
JOIN miembros m ON p.miembro_id = m.id
WHERE p.monto > 0;

SELECT * FROM clubdb.pagos_pendientes;

-- Descripción: Esta vista muestra la información de los miembros que participan en eventos del club.
CREATE VIEW eventos_participantes AS
SELECT e.id AS evento_id, e.nombre_evento, e.fecha_evento, e.lugar, m.id AS miembro_id, m.nombre, m.apellido
FROM eventos e
JOIN miembros_eventos me ON e.id = me.evento_id
JOIN miembros m ON me.miembro_id = m.id;

SELECT * FROM clubdb.eventos_participantes;

-- Descripción: Esta vista muestra la información de los miembros que participan en actividades del club.
CREATE VIEW actividades_participantes AS
SELECT a.id AS actividad_id, a.nombre_actividad, a.fecha_inicio, a.fecha_fin, m.id AS miembro_id, m.nombre, m.apellido
FROM actividades a
JOIN miembros_actividades ma ON a.id = ma.actividad_id
JOIN miembros m ON ma.miembro_id = m.id;

SELECT * FROM clubdb.actividades_participantes;

-- Descripción: Esta vista muestra los miembros que están activos en el club.
CREATE VIEW miembros_activos AS
SELECT id, nombre, apellido, email, telefono, direccion, fecha_registro
FROM miembros
WHERE estatus = 'activo';

SELECT * FROM clubdb.miembros_activos;