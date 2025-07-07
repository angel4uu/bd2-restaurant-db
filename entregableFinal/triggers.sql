-- =============================================
-- TRIGGERS
-- =============================================

-- Trigger que descuenta del stock del producto al registrar un pedido
CREATE OR REPLACE TRIGGER trg_descuenta_stock
AFTER INSERT ON PEDIDO_PRODUCTO
FOR EACH ROW
BEGIN
  -- Al insertar un producto en un pedido, se descuenta su cantidad del stock del producto correspondiente
  UPDATE PRODUCTO
  SET stock = stock - :NEW.cantidad
  WHERE id = :NEW.producto_id;
END;
/

-- Trigger que marca el pedido como entregado cuando se genera una factura asociada
CREATE OR REPLACE TRIGGER trg_factura_entrega_pedido
AFTER INSERT ON FACTURA
FOR EACH ROW
WHEN (NEW.pedido_id IS NOT NULL)
BEGIN
  -- Al emitir una factura para un pedido, se actualiza el estado del pedido como entregado
  UPDATE PEDIDO
  SET entregado = '1'
  WHERE id = :NEW.pedido_id;
END;
/

-- Trigger que marca una factura como pagada al registrarse un pago relacionado
CREATE OR REPLACE TRIGGER trg_pago_factura_pagada
AFTER INSERT ON PAGO
FOR EACH ROW
BEGIN
  -- Si el nuevo pago está asociado a una factura, se actualiza el estado de dicha factura como pagada
  IF :NEW.factura_id IS NOT NULL THEN
    UPDATE FACTURA
    SET pagado = '1'
    WHERE id = :NEW.factura_id;
  END IF;
END;
/

-- Trigger que impide modificar el contenido económico de una factura ya pagada
CREATE OR REPLACE TRIGGER trg_bloqueo_factura_pagada
BEFORE UPDATE ON FACTURA
FOR EACH ROW
BEGIN
  -- Si la factura ya ha sido marcada como pagada, se prohíbe cambiar monto_final, descuento o IGV
  IF :OLD.pagado = '1' AND 
     (:OLD.monto_final != :NEW.monto_final OR 
      :OLD.descuento != :NEW.descuento OR 
      :OLD.igv != :NEW.igv) THEN
    RAISE_APPLICATION_ERROR(-20002, 'No se puede modificar una factura pagada');
  END IF;
END;
/
