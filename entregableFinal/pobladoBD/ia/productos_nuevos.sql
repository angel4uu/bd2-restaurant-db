select * from producto p join categoria c on p.categoria_id = c.id;

INSERT INTO producto (id, nombre, descripción, stock, precio, categoria_id)
VALUES (10, 'Tequeños de Queso', 'Palitos de masa frita rellenos con queso andino, servidos con guacamole.', 18, 10.00, 1);

INSERT INTO producto (id, nombre, descripción, stock, precio, categoria_id)
VALUES (11, 'Papa Rellena', 'Papa rellena de carne, acompañada de salsa criolla.', 15, 12.00, 1);

INSERT INTO producto (id, nombre, descripción, stock, precio, categoria_id)
VALUES (12, 'Seco de Cordero', 'Estofado tradicional con cordero, acompañado de frejoles y arroz.', 20, 22.50, 2);

INSERT INTO producto (id, nombre, descripción, stock, precio, categoria_id)
VALUES (13, 'Chaufa de Pollo', 'Arroz frito al estilo peruano con trozos de pollo y verduras salteadas.', 25, 18.00, 2);

INSERT INTO producto (id, nombre, descripción, stock, precio, categoria_id)
VALUES (14, 'Torta Helada', 'Postre frío de gelatina y crema, típico de celebraciones.', 10, 9.50, 3);

INSERT INTO producto (id, nombre, descripción, stock, precio, categoria_id)
VALUES (15, 'Helado de Lucuma', 'Helado artesanal hecho con lúcuma natural y trozos de chocolate.', 12, 11.00, 3);

INSERT INTO producto (id, nombre, descripción, stock, precio, categoria_id)
VALUES (16, 'Inka Cola 500ml', 'Bebida gaseosa peruana, en botella personal de medio litro.', 30, 6.00, 4);

INSERT INTO producto (id, nombre, descripción, stock, precio, categoria_id)
VALUES (17, 'Café pasado', 'Café tradicional preparado al estilo peruano, servido caliente.', 14, 5.50, 4);
