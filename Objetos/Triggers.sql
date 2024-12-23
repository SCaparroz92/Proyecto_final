USE DATABASE clubdb;


-- Descripción: Este trigger se activa después de eliminar un registro de la tabla miembros.
DELIMITER //

CREATE TRIGGER after_miembro_delete
AFTER DELETE ON miembros
FOR EACH ROW
BEGIN
    DELETE FROM miembros_actividades WHERE miembro_id = OLD.id;
    DELETE FROM miembros_eventos WHERE miembro_id = OLD.id;
    -- Eliminar los pagos realizados por el miembro
    DELETE FROM pagos WHERE miembro_id = OLD.id;
    DELETE FROM donaciones WHERE miembro_id = OLD.id;
END //

DELIMITER ;


-- Descripción: Este trigger se activa después de insertar un nuevo pago en la tabla pagos. 
-- Su objetivo es verificar el total acumulado de pagos de un miembro y actualizar el estatus del miembro a 'activo'.
DELIMITER //

CREATE TRIGGER after_pago_insert
AFTER INSERT ON pagos
FOR EACH ROW
BEGIN
    DECLARE total_pagos DECIMAL(10, 2);
    SELECT SUM(monto) INTO total_pagos
    FROM pagos
    WHERE miembro_id = NEW.miembro_id;
    
    IF total_pagos > 1000 THEN
        UPDATE miembros
        SET estatus = 'activo'
        WHERE id = NEW.miembro_id;
    END IF;
END //

DELIMITER ;