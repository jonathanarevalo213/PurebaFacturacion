USE Facturacion;

CREATE TABLE Cliente (
    id INT PRIMARY KEY IDENTITY,
    nombre NVARCHAR(100),
    edad INT,
    correo NVARCHAR(100)
);

CREATE TABLE Producto (
    id INT PRIMARY KEY IDENTITY,
    nombre NVARCHAR(100),
    precio DECIMAL(10,2),
    stock INT
);

CREATE TABLE Factura (
    id INT PRIMARY KEY IDENTITY,
    cliente_id INT,
    fecha DATETIME,
    FOREIGN KEY (cliente_id) REFERENCES Cliente(id)
);

CREATE TABLE DetalleFactura (
    id INT PRIMARY KEY IDENTITY,
    factura_id INT,
    producto_id INT,
    cantidad INT,
    precio_unitario DECIMAL(10,2),
    FOREIGN KEY (factura_id) REFERENCES Factura(id),
    FOREIGN KEY (producto_id) REFERENCES Producto(id)
);

INSERT INTO Cliente (nombre, edad, correo)
VALUES ('Carlos Gómez', 30, 'carlos@gmail.com'),
       ('Ana Ruiz', 40, 'ana@gmail.com'),
       ('Sofía Torres', 28, 'sofia@gmail.com'),
       ('Luis Fernández', 22, 'luis@gmail.com'),
       ('Marta López', 35, 'marta@gmail.com'),
       ('Ricardo Pérez', 50, 'ricardo@gmail.com'),
       ('Daniela Vargas', 32, 'daniela@gmail.com');

INSERT INTO Producto (nombre, precio, stock)
VALUES ('Monitor', 450.00, 5),
       ('Teclado', 60.00, 20),
       ('Mouse', 25.00, 2),
       ('Laptop', 1200.00, 3),
       ('Impresora', 300.00, 10),
       ('Tablet', 700.00, 4),
       ('Audífonos', 80.00, 15);

INSERT INTO Factura (cliente_id, fecha)
VALUES (1, '2000-02-05'),
       (2, '2000-04-01'),
       (3, '2000-06-10'),
       (4, '2000-02-20'),
       (5, '2000-03-15'),
       (6, '2000-04-25'),
       (7, '2000-05-10');

INSERT INTO DetalleFactura (factura_id, producto_id, cantidad, precio_unitario)
VALUES (1, 1, 1, 450.00),
       (2, 3, 3, 25.00),
       (3, 2, 2, 60.00),
       (4, 4, 1, 1200.00),
       (5, 6, 2, 300.00),
       (6, 5, 1, 700.00),
       (7, 7, 3, 80.00);
