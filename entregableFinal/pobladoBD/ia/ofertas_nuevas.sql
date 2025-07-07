select * from oferta;

INSERT INTO oferta (id, nombre, precio_real, precio_oferta, descuento, fecha_inicio, fecha_fin, estado)
VALUES (3, 'Combo Familiar Andino', 45.00, 38.25, 0.15, TO_TIMESTAMP('2025-07-01', 'YYYY-MM-DD'), TO_TIMESTAMP('2025-12-31', 'YYYY-MM-DD'), 'A');

INSERT INTO oferta (id, nombre, precio_real, precio_oferta, descuento, fecha_inicio, fecha_fin, estado)
VALUES (4, 'Trío Criollo', 40.00, 32.00, 0.20, TO_TIMESTAMP('2025-07-01', 'YYYY-MM-DD'), TO_TIMESTAMP('2025-12-31', 'YYYY-MM-DD'), 'A');

INSERT INTO oferta (id, nombre, precio_real, precio_oferta, descuento, fecha_inicio, fecha_fin, estado)
VALUES (5, 'Dulce Refrescante', 28.00, 23.80, 0.15, TO_TIMESTAMP('2025-07-01', 'YYYY-MM-DD'), TO_TIMESTAMP('2025-12-31', 'YYYY-MM-DD'), 'A');

INSERT INTO oferta (id, nombre, precio_real, precio_oferta, descuento, fecha_inicio, fecha_fin, estado)
VALUES (6, 'Sabor de la Sierra', 35.00, 29.75, 0.15, TO_TIMESTAMP('2025-07-01', 'YYYY-MM-DD'), TO_TIMESTAMP('2025-12-31', 'YYYY-MM-DD'), 'A');

INSERT INTO oferta (id, nombre, precio_real, precio_oferta, descuento, fecha_inicio, fecha_fin, estado)
VALUES (7, 'Merienda para Dos', 30.00, 25.50, 0.15, TO_TIMESTAMP('2025-07-01', 'YYYY-MM-DD'), TO_TIMESTAMP('2025-12-31', 'YYYY-MM-DD'), 'A');
