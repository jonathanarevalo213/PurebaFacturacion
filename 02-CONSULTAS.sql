USE Facturacion;

-- 1️⃣ Obtener la lista de precios de todos los productos
SELECT nombre AS Producto, precio AS Precio
FROM Producto;

-- 2️⃣ Obtener la lista de productos cuya existencia en el inventario haya llegado al mínimo permitido (5 unidades)
SELECT nombre AS Producto, stock AS Stock
FROM Producto
WHERE stock <= 5;

-- 3️⃣ Obtener una lista de clientes no mayores de 35 años que hayan realizado compras entre el 1 de febrero de 2000 y el 25 de mayo de 2000
SELECT c.nombre AS Cliente, c.edad, c.correo, f.fecha AS Fecha_Compra
FROM Cliente c
INNER JOIN Factura f ON c.id = f.cliente_id
WHERE c.edad <= 35 AND f.fecha BETWEEN '2000-02-01' AND '2000-05-25';

-- 4️⃣ Obtener el valor total vendido por cada producto en el año 2000
SELECT p.nombre AS Producto, SUM(df.cantidad * df.precio_unitario) AS Total_Vendido
FROM DetalleFactura df
INNER JOIN Producto p ON df.producto_id = p.id
INNER JOIN Factura f ON df.factura_id = f.id
WHERE YEAR(f.fecha) = 2000
GROUP BY p.nombre;

-- 5️⃣ Obtener la última fecha de compra de un cliente y según su frecuencia de compra estimar en qué fecha podría volver a comprar.
-- (La estimación se basa en la frecuencia promedio de días entre compras históricas del cliente)

WITH FechasCliente AS (
    SELECT cliente_id, fecha,
           LAG(fecha) OVER (PARTITION BY cliente_id ORDER BY fecha) AS fecha_anterior
    FROM Factura
)
, Frecuencias AS (
    SELECT cliente_id,
           DATEDIFF(DAY, fecha_anterior, fecha) AS dias_entre_compras
    FROM FechasCliente
    WHERE fecha_anterior IS NOT NULL
)
, PromedioFrecuencia AS (
    SELECT cliente_id, AVG(dias_entre_compras) AS promedio_dias
    FROM Frecuencias
    GROUP BY cliente_id
)
SELECT c.nombre AS Cliente, 
       MAX(f.fecha) AS Ultima_Compra,
       DATEADD(DAY, ISNULL(pf.promedio_dias, 30), MAX(f.fecha)) AS Fecha_Estimada_Proxima_Compra
FROM Cliente c
INNER JOIN Factura f ON c.id = f.cliente_id
LEFT JOIN PromedioFrecuencia pf ON c.id = pf.cliente_id
GROUP BY c.nombre, pf.promedio_dias;
