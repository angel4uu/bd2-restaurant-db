-- ============================================
-- 1. Top 10 productos más vendidos
-- ============================================

BEGIN
    DBMS_OUTPUT.PUT_LINE('Top 10 productos más vendidos:');
    FOR r IN (
        SELECT p.nombre, SUM(pp.cantidad) AS total_vendido
        FROM pedido_producto pp
        JOIN producto p ON pp.producto_id = p.id
        GROUP BY p.nombre
        ORDER BY total_vendido DESC
        FETCH FIRST 10 ROWS ONLY
    ) LOOP
        DBMS_OUTPUT.PUT_LINE('- ' || r.nombre || ': ' || r.total_vendido || ' unidades');
    END LOOP;
END;
/

-- ============================================
-- 2. Calificación promedio diaria (reseñas)
-- ============================================

BEGIN
    DBMS_OUTPUT.PUT_LINE('Calificación promedio por día:');
    FOR r IN (
        SELECT 
            TO_CHAR(fecha, 'YYYY-MM-DD') AS dia,
            ROUND(AVG(calificacion), 2) AS promedio
        FROM resena
        GROUP BY TO_CHAR(fecha, 'YYYY-MM-DD')
        ORDER BY dia
    ) LOOP
        DBMS_OUTPUT.PUT_LINE('- ' || r.dia || ': ' || r.promedio || ' estrellas');
    END LOOP;
END;
/

-- ============================================
-- 3. Turnos mensuales por trabajador
-- ============================================

BEGIN
    DBMS_OUTPUT.PUT_LINE('Cantidad de turnos por trabajador y mes:');
    FOR r IN (
        SELECT 
            t.nombres || ' ' || t.apellidos AS trabajador,
            TO_CHAR(inicio_turno, 'YYYY-MM') AS mes,
            COUNT(*) AS total_turnos
        FROM turno tu
        JOIN trabajador t ON tu.id_trabajador = t.id
        GROUP BY t.nombres, t.apellidos, TO_CHAR(inicio_turno, 'YYYY-MM')
        ORDER BY mes, trabajador
    ) LOOP
        DBMS_OUTPUT.PUT_LINE('- ' || r.trabajador || ' | ' || r.mes || ': ' || r.total_turnos || ' turnos');
    END LOOP;
END;
/
