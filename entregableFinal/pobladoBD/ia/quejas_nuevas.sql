-- PENDIENTE (1)
INSERT INTO queja (id_factura, id_trabajador, descripcion, fecha, estado) 
VALUES (5, 3, 'El mozo no trajo la bebida solicitada y no volvió a la mesa.', TO_TIMESTAMP('2025-06-16 13:40:00', 'YYYY-MM-DD HH24:MI:SS'), 'pendiente');

-- DESCARTADAS (3)
INSERT INTO queja (id_factura, id_trabajador, descripcion, fecha, estado) 
VALUES (14, 2, 'El trabajador fue descortés al entregar la cuenta.', TO_TIMESTAMP('2025-06-18 14:10:00', 'YYYY-MM-DD HH24:MI:SS'), 'descartada');

INSERT INTO queja (id_factura, id_trabajador, descripcion, fecha, estado) 
VALUES (23, 6, 'El personal de cocina olvidó un ingrediente importante.', TO_TIMESTAMP('2025-06-19 12:50:00', 'YYYY-MM-DD HH24:MI:SS'), 'descartada');

INSERT INTO queja (id_factura, id_trabajador, descripcion, fecha, estado) 
VALUES (34, 2, 'El trabajador confundió nuestro pedido con otra mesa.', TO_TIMESTAMP('2025-06-21 19:15:00', 'YYYY-MM-DD HH24:MI:SS'), 'descartada');

-- RESUELTAS (6)
INSERT INTO queja (id_factura, id_trabajador, descripcion, fecha, estado) 
VALUES (46, 4, 'Se derramó bebida sobre la mesa y no se limpió a tiempo.', TO_TIMESTAMP('2025-06-17 14:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'resuelta');

INSERT INTO queja (id_factura, id_trabajador, descripcion, fecha, estado) 
VALUES (55, 1, 'El trabajador levantó el plato antes de que termináramos.', TO_TIMESTAMP('2025-06-20 13:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'resuelta');

INSERT INTO queja (id_factura, id_trabajador, descripcion, fecha, estado) 
VALUES (62, 7, 'El trato fue impersonal y apurado.', TO_TIMESTAMP('2025-06-22 14:45:00', 'YYYY-MM-DD HH24:MI:SS'), 'resuelta');

INSERT INTO queja (id_factura, id_trabajador, descripcion, fecha, estado) 
VALUES (73, 2, 'Tuvimos que esperar mucho para recibir los cubiertos.', TO_TIMESTAMP('2025-06-23 15:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'resuelta');

INSERT INTO queja (id_factura, id_trabajador, descripcion, fecha, estado) 
VALUES (85, 5, 'El mozo parecía distraído y confundió dos órdenes.', TO_TIMESTAMP('2025-06-24 12:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'resuelta');

INSERT INTO queja (id_factura, id_trabajador, descripcion, fecha, estado) 
VALUES (97, 4, 'No nos ofrecieron las promociones disponibles al llegar.', TO_TIMESTAMP('2025-06-26 13:20:00', 'YYYY-MM-DD HH24:MI:SS'), 'resuelta');
