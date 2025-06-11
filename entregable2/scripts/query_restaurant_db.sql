SELECT * FROM CATEGORIA;

SELECT * FROM MESA;

SELECT * FROM METODO_PAGO;

SELECT * FROM ROL;

SELECT * FROM PRODUCTO;

SELECT 
  o.id AS oferta_id, 
  o.nombre,
  o.precio_real, 
  o.precio_oferta, 
  o.descuento, 
  o.fecha_inicio, 
  o.fecha_fin, 
  op.producto_id, 
  p.nombre AS producto, 
  op.cantidad
FROM OFERTA o
JOIN OFERTA_PRODUCTO op ON o.id = op.oferta_id
JOIN PRODUCTO p ON op.producto_id = p.id;