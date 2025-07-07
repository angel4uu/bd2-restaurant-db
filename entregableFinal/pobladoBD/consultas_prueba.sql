-- =============================================
-- CONSULTA 1: Stock de Productos y Estado
-- =============================================
SELECT 
    nombre,
    stock,
    precio,
    CASE 
        WHEN stock = 0 THEN 'Agotado'
        WHEN stock < 10 THEN 'Bajo'
        ELSE 'Suficiente'
    END AS estado_stock
FROM 
    producto
ORDER BY 
    stock DESC;


-- =============================================
-- CONSULTA 2: Uso de Ofertas y sus Ingresos
-- =============================================
SELECT 
    o.nombre AS oferta,
    COUNT(po.id) AS veces_usada,
    SUM(po.cantidad * po.precio) AS ingresos_oferta
FROM 
    pedido_oferta po
JOIN 
    oferta o ON po.oferta_id = o.id
GROUP BY 
    o.nombre
ORDER BY 
    veces_usada DESC;


-- =============================================
-- CONSULTA 3: Quejas por Trabajador y Estado
-- =============================================
SELECT 
    t.nombres || ' ' || t.apellidos AS trabajador,
    q.estado,
    COUNT(q.id_queja) AS total_quejas
FROM 
    queja q
JOIN 
    trabajador t ON q.id_trabajador = t.id
GROUP BY 
    t.nombres, t.apellidos, q.estado
ORDER BY 
    total_quejas DESC;



