USE DATABASE clubdb;

-- Descripción: Este procedimiento se utiliza para actualizar el estatus de un miembro en la tabla miembros.
DELIMITER //

CREATE PROCEDURE actualizar_estatus_miembro(
    IN p_miembro_id INT,
    IN p_estatus ENUM('activo', 'inactivo')
)
BEGIN
    UPDATE miembros
    SET estatus = p_estatus
    WHERE id = p_miembro_id;
END //

DELIMITER ;

CALL actualizar_estatus_miembro(1, 'activo');



-- Descripción: Este procedimiento se utiliza para registrar un nuevo miembro en la tabla miembros
DELIMITER //

CREATE PROCEDURE registrar_miembro(
    IN p_nombre VARCHAR(100),
    IN p_apellido VARCHAR(100),
    IN p_fecha_nacimiento DATE,
    IN p_email VARCHAR(100),
    IN p_telefono VARCHAR(15),
    IN p_direccion VARCHAR(255)
)
BEGIN
    INSERT INTO miembros (nombre, apellido, fecha_nacimiento, email, telefono, direccion)
    VALUES (p_nombre, p_apellido, p_fecha_nacimiento, p_email, p_telefono, p_direccion);
END //

DELIMITER ;

CALL registrar_miembro('nombre', 'apellido', 'fecha nacimiento', 'email', 'telefono', 'direccion');
