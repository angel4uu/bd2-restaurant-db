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

-- PEDIDO CON MESA 

SELECT
    pe.id AS pedido_id,
    m.numero AS mesa,
    m.capacidad,
    pe.fecha
FROM
    pedido pe
    INNER JOIN mesa m ON pe.mesa_id = m.id
ORDER BY
    pe.fecha;

-- PAGO, FACTURA Y METODO DE PAGO

SELECT
    pg.id AS pago_id,
    pg.numero_transaccion,
    f.id AS factura_id,
    mp.nombre AS metodo_pago,
    pg.fecha
FROM
    pago pg
    INNER JOIN factura f ON pg.factura_id = f.id
    INNER JOIN metodo_pago mp ON pg.metodo_pago_id = mp.id;


-- PRODUCTO, PEDIDO Y PEDIDOPRODUCTO CON CATEGORIA

SELECT
    pg.id AS pago_id,
    pg.numero_transaccion,
    f.id AS factura_id,
    mp.nombre AS metodo_pago,
    pg.fecha
FROM
    pago pg
    INNER JOIN factura f ON pg.factura_id = f.id
    INNER JOIN metodo_pago mp ON pg.metodo_pago_id = mp.id;

-- TRABAJADOR Y ROL

SELECT
    t.nombres 
    || ' ' 
    || t.apellidos AS trabajador,
    r.nombre AS rol
FROM
    trabajador t
    INNER JOIN rol r ON t.rol_id = r.id;

-- FACTURA CON PEDIDO Y MESA

SELECT
    f.id AS factura_id,
    f.monto_final,
    f.fecha,
    m.numero AS numero_mesa
FROM
    factura f
    INNER JOIN pedido p ON f.pedido_id = p.id
    INNER JOIN mesa m ON p.mesa_id = m.id;
