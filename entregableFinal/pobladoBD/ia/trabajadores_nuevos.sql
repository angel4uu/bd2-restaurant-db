select * from trabajador t join rol r on t.rol_id = r.id;

INSERT INTO trabajador (id, nombres, apellidos, correo, contrasena, rol_id)
VALUES (6, 'Diego', 'Palomino', 'diego.palomino@email.com', '123456', 2);

INSERT INTO trabajador (id, nombres, apellidos, correo, contrasena, rol_id)
VALUES (7, 'Karina', 'Ramos', 'karina.ramos@email.com', '123456', 2);

INSERT INTO trabajador (id, nombres, apellidos, correo, contrasena, rol_id)
VALUES (8, 'José Luis', 'Mendoza', 'jose.mendoza@email.com', '123456', 2);
