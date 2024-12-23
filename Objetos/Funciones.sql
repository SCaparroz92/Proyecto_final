USE DATABASE clubdb;

-- Descripción: Esta función verifica si un miembro está inscrito en una actividad específica.

DELIMITER //

CREATE FUNCTION esta_inscripto_actividad(p_miembro_id INT, p_actividad_id INT) 
RETURNS BOOLEAN
DETERMINISTIC
BEGIN
    DECLARE count_actividad INT;
    SELECT COUNT(*) INTO count_actividad
    FROM miembros_actividades
    WHERE miembro_id = p_miembro_id AND actividad_id = p_actividad_id;
    
    IF count_actividad > 0 THEN
        RETURN TRUE;
    ELSE
        RETURN FALSE;
    END IF;
END //

DELIMITER ;


-- Descripción: Esta función calcula el total acumulado de pagos realizados por un miembro.

DELIMITER //

CREATE FUNCTION total_pagos_miembro(p_miembro_id INT) 
RETURNS DECIMAL(10, 2)
DETERMINISTIC
BEGIN
    DECLARE total DECIMAL(10, 2);
    SELECT SUM(monto) INTO total
    FROM pagos
    WHERE miembro_id = p_miembro_id;
    RETURN total;
END //

DELIMITER ;