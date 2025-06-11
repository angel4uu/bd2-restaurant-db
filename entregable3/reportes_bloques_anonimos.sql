BEGIN
  FOR r IN (
    SELECT p.nombre, SUM(pp.cantidad) AS total_vendido
    FROM PEDIDO_PRODUCTO pp
    JOIN PRODUCTO p ON p.id = pp.producto_id
    GROUP BY p.nombre
    ORDER BY SUM(pp.cantidad) DESC
    FETCH FIRST 5 ROWS ONLY
  ) LOOP
    DBMS_OUTPUT.PUT_LINE('Producto: ' || r.nombre || ' - Vendido: ' || r.total_vendido);
  END LOOP;
END;
/



DECLARE
  v_fecha_especifica DATE := TO_DATE('09/06/25', 'DD/MM/YY');
  v_promedio NUMBER;
BEGIN
  SELECT ROUND(AVG(calificacion), 2)
  INTO v_promedio
  FROM RESENA
  WHERE TRUNC(fecha) = v_fecha_especifica;

  DBMS_OUTPUT.PUT_LINE('Promedio de calificaciones para el ' || TO_CHAR(v_fecha_especifica, 'DD/MM/YYYY') || ': ' || v_promedio);
END;
/

BEGIN
  FOR r IN (
    SELECT t.nombres || ' ' || t.apellidos AS nombre, COUNT(q.id_queja) AS total_quejas
    FROM TRABAJADOR t
    LEFT JOIN QUEJA q ON q.id_trabajador = t.id
    GROUP BY t.nombres, t.apellidos
    ORDER BY COUNT(q.id_queja) DESC
  ) LOOP
    DBMS_OUTPUT.PUT_LINE('Trabajador: ' || r.nombre || ' - Quejas: ' || r.total_quejas);
  END LOOP;
END;
/

DECLARE
BEGIN
  FOR r IN (
    SELECT categoria_id, nombre, total_vendido
    FROM (
      SELECT p.categoria_id,
             p.nombre,
             SUM(pp.cantidad) AS total_vendido,
             RANK() OVER (PARTITION BY p.categoria_id ORDER BY SUM(pp.cantidad) DESC) AS rk
      FROM PRODUCTO p
      JOIN PEDIDO_PRODUCTO pp ON pp.producto_id = p.id
      GROUP BY p.categoria_id, p.nombre
    )
    WHERE rk = 1
  ) LOOP
    DBMS_OUTPUT.PUT_LINE(
      'Categoría ID: ' || r.categoria_id ||
      ' – Producto top: ' || r.nombre ||
      ' (' || r.total_vendido || ')'
    );
  END LOOP;
END;

DECLARE
  v_dia DATE;
  v_total NUMBER;
BEGIN
  SELECT dia, total_facturado INTO v_dia, v_total
  FROM (
    SELECT TRUNC(p.fecha) AS dia, SUM(f.monto_final) AS total_facturado
    FROM PAGO p
    JOIN FACTURA f ON f.id = p.factura_id
    GROUP BY TRUNC(p.fecha)
    ORDER BY SUM(f.monto_final) DESC
    FETCH FIRST 1 ROWS ONLY
  );

  DBMS_OUTPUT.PUT_LINE('Día top ventas: ' || v_dia || ' – Total facturación: ' || v_total);
END;
/

DECLARE
BEGIN
  FOR r IN (
    SELECT t.nombres || ' ' || t.apellidos AS nombre,
           TO_CHAR(tr.inicio_turno, 'YYYY-MM') AS mes,
           COUNT(*) AS turnos
    FROM TURNO tr
    JOIN TRABAJADOR t ON t.id = tr.id_trabajador
    GROUP BY t.nombres, t.apellidos, TO_CHAR(tr.inicio_turno, 'YYYY-MM')
    ORDER BY nombre, mes
  ) LOOP
    DBMS_OUTPUT.PUT_LINE('Trabajador: ' || r.nombre || ' – Mes: ' || r.mes || ' – Turnos: ' || r.turnos);
  END LOOP;
END;
/

DECLARE
    CURSOR c_reporte IS
        SELECT 
            t.ID_TRABAJADOR,
            tr.NOMBRES || ' ' || tr.APELLIDOS AS NOMBRE_COMPLETO,
            TO_CHAR(t.INICIO_TURNO, 'YYYY-MM') AS MES,
            COUNT(*) AS CANTIDAD_TURNOS
        FROM TURNO t
        JOIN TRABAJADOR tr ON t.ID_TRABAJADOR = tr.ID
        GROUP BY t.ID_TRABAJADOR, tr.NOMBRES, tr.APELLIDOS, TO_CHAR(t.INICIO_TURNO, 'YYYY-MM')
        ORDER BY t.ID_TRABAJADOR, MES;

    v_id_trabajador TURNO.ID_TRABAJADOR%TYPE;
    v_nombre_completo VARCHAR2(100);
    v_mes             VARCHAR2(7);
    v_total           NUMBER;

BEGIN
    DBMS_OUTPUT.PUT_LINE('REPORTE DE TURNOS POR TRABAJADOR POR MES');
    DBMS_OUTPUT.PUT_LINE(RPAD('ID_TRABAJADOR', 15) || RPAD('NOMBRE', 30) || RPAD('MES', 10) || 'TURNOS');

    FOR registro IN c_reporte LOOP
        v_id_trabajador := registro.ID_TRABAJADOR;
        v_nombre_completo := registro.NOMBRE_COMPLETO;
        v_mes := registro.MES;
        v_total := registro.CANTIDAD_TURNOS;

        DBMS_OUTPUT.PUT_LINE(
            RPAD(v_id_trabajador, 15) || RPAD(v_nombre_completo, 30) || RPAD(v_mes, 10) || v_total
        );
    END LOOP;
END;
/














