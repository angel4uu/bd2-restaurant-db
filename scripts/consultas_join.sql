-- PRODUCTO CON CATEGORIA

SELECT
    p.nombre,
    p.descripción,
    c.nombre AS categoria,
    p.stock
FROM
    producto p
    INNER JOIN categoria c ON p.categoria_id = c.id
ORDER BY
    p.categoria_id;


-- PEDIDO CON TRABAJADOR

SELECT
    to_char(p.fecha, 'DD/MM/YY') AS "pedido fecha",
    p.total                    AS "monto total",
    p.mesa_id                  AS "mesa",
    m.capacidad                AS "mesa capacidad",
    t.nombres
    || ' '
    || t.apellidos            AS "trabajador encargado"
FROM
    pedido p
    INNER JOIN mesa m ON p.mesa_id = m.id
    INNER JOIN trabajador t ON p.trabajador_id = t.id
ORDER BY
    "pedido fecha" DESC;
    

-- PEDIDO CON PRODUCTO

SELECT 
    pp.pedido_id,
    p.nombre,
    pp.cantidad,
    pp.notas
FROM 
    pedido_producto pp
    INNER JOIN producto p ON pp.producto_id = p.id;


-- PEDIDO CON OFERTA

SELECT 
    po.pedido_id,
    o.nombre,
    po.cantidad,
    o.precio_real,
    o.precio_oferta,
    o.descuento,
    po.notas
FROM 
    pedido_oferta po
    INNER JOIN oferta o ON po.oferta_id = o.id;


-- DETALLE DE PEDIDO

SELECT 
    pp.pedido_id,
    p.nombre,
    pp.cantidad,
    p.precio,
    pp.notas
FROM 
    pedido_producto pp
    INNER JOIN producto p ON pp.producto_id = p.id
UNION
SELECT 
    po.pedido_id,
    o.nombre,
    po.cantidad,
    o.precio_oferta,
    po.notas
FROM 
    pedido_oferta po
    INNER JOIN oferta o ON po.oferta_id = o.id
ORDER BY 
    pedido_id;
