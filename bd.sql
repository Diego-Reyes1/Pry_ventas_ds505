create database bd_ventas_ds505
go

use bd_ventas_ds505
go

create table tb_personal(
	dni char(8) not null primary key,
	ap_paterno varchar(25) not null,
	ap_materno varchar(25) not null,
	nombre varchar(25) not null,
	genero char(1),
	fecha_nacimiento date,
	sueldo float)
go

set dateformat 'dmy'
go

insert into tb_personal values
 ('12345678', 'Castillo', 'Liñan', 'Joe', 'M', '15-03-2000', 1592.74),
 ('77334154', 'Reyes', 'Bonifacio', 'Diego', 'M', '06-08-2003', 2490.99),
 ('74882534', 'Lujan', 'Carrion', 'Miguel', 'M', '24-11-2004', 1282.20),
 ('50163141', 'Rojas', 'Manrique', 'Alexa', 'F', '18-06-2002', 1005.00)
 go

 select * from tb_personal;

 USE bd_ventas_ds505;
 go

 CREATE TABLE tb_marca (
    codigo_marca CHAR(5) NOT NULL PRIMARY KEY,
    marca VARCHAR(30) NOT NULL
);
GO

-- Crear tabla tb_categoria
CREATE TABLE tb_categoria (
    codigo_categoria CHAR(5) NOT NULL PRIMARY KEY,
    categoria VARCHAR(30) NOT NULL
);
GO

-- Crear tabla tb_producto
CREATE TABLE tb_producto (
    codigo_producto CHAR(5) NOT NULL PRIMARY KEY,
    producto VARCHAR(40) NOT NULL,
    stock_disponible INT,
    costo FLOAT,
    ganancia FLOAT,
    producto_codigo_marca CHAR(5) NOT NULL,
    producto_codigo_categoria CHAR(5) NOT NULL,
    FOREIGN KEY (producto_codigo_marca) REFERENCES tb_marca (codigo_marca),
    FOREIGN KEY (producto_codigo_categoria) REFERENCES tb_categoria (codigo_categoria)
);
GO

-- Crear tabla tb_departamento
CREATE TABLE tb_departamento (
    codigo_departamento CHAR(5) NOT NULL PRIMARY KEY,
    departamento VARCHAR(25) NOT NULL
);
GO

-- Crear tabla tb_provincia
CREATE TABLE tb_provincia (
    codigo_provincia CHAR(5) NOT NULL PRIMARY KEY,
    provincia VARCHAR(50) NOT NULL,
    provincia_codigo_departamento CHAR(5) NOT NULL,
    FOREIGN KEY (provincia_codigo_departamento) REFERENCES tb_departamento (codigo_departamento)
);
GO

-- Crear tabla tb_distrito
CREATE TABLE tb_distrito (
    codigo_distrito CHAR(5) NOT NULL PRIMARY KEY,
    distrito VARCHAR(50) NOT NULL,
    distrito_codigo_provincia CHAR(5) NOT NULL,
    FOREIGN KEY (distrito_codigo_provincia) REFERENCES tb_provincia (codigo_provincia)
);
GO

-- Crear tabla tb_cliente
CREATE TABLE tb_cliente (
    codigo_cliente CHAR(5) NOT NULL PRIMARY KEY,
    nombre VARCHAR(20) NOT NULL,
    ap_paterno VARCHAR(20) NOT NULL,
    ap_materno VARCHAR(20) NOT NULL,
    fecha_nacimiento DATE,
    direccion VARCHAR(50),
    correo_electronico VARCHAR(50),
    cliente_codigo_distrito CHAR(5) NOT NULL,
    cliente_codigo_provincia CHAR(5),
    cliente_codigo_departamento CHAR(5),
    FOREIGN KEY (cliente_codigo_distrito) REFERENCES tb_distrito (codigo_distrito),
    FOREIGN KEY (cliente_codigo_provincia) REFERENCES tb_provincia (codigo_provincia),
    FOREIGN KEY (cliente_codigo_departamento) REFERENCES tb_departamento (codigo_departamento)
);
GO

-- Crear tabla tb_venta
CREATE TABLE tb_venta (
    codigo_venta CHAR(5) NOT NULL PRIMARY KEY,
    fecha DATE,
    venta_codigo_cliente CHAR(5) NOT NULL,
    monto FLOAT,
    igv FLOAT,
    FOREIGN KEY (venta_codigo_cliente) REFERENCES tb_cliente (codigo_cliente)
);
GO

-- Crear tabla tb_detalles_venta
CREATE TABLE tb_detalles_venta (
    dv_codigo_venta CHAR(5) NOT NULL,
    dv_codigo_producto CHAR(5) NOT NULL,
    cantidad INT,
    costo FLOAT,
    descuento FLOAT,
    FOREIGN KEY (dv_codigo_venta) REFERENCES tb_venta (codigo_venta),
    FOREIGN KEY (dv_codigo_producto) REFERENCES tb_producto (codigo_producto)
);
GO

-- Crear tabla tb_proveedor
CREATE TABLE tb_proveedor (
    codigo_proveedor CHAR(5) NOT NULL PRIMARY KEY,
    razon_social VARCHAR(30) NOT NULL,
    ruc CHAR(11) NOT NULL,
    direccion VARCHAR(50) NOT NULL
);
GO

-- Insertar datos en tb_marca
INSERT INTO tb_marca (codigo_marca, marca) VALUES
('M001', 'Nike'),
('M002', 'Adidas'),
('M003', 'Apple'),
('M004', 'Samsung'),
('M005', 'Sony');
GO

-- Insertar datos en tb_categoria
INSERT INTO tb_categoria (codigo_categoria, categoria) VALUES
('C001', 'Electrónicos'),
('C002', 'Ropa'),
('C003', 'Calzado'),
('C004', 'Hogar'),
('C005', 'Deportes');
GO

-- Insertar datos en tb_producto
INSERT INTO tb_producto (codigo_producto, producto, stock_disponible, costo, ganancia, producto_codigo_marca, producto_codigo_categoria) VALUES
('P001', 'iPhone 12', 50, 1200.00, 400.00, 'M003', 'C001'),
('P002', 'Samsung Galaxy S21', 70, 1100.00, 350.00, 'M004', 'C001'),
('P003', 'Zapatillas Adidas Ultraboost', 30, 150.00, 50.00, 'M002', 'C003'),
('P004', 'Smart TV Sony Bravia', 20, 800.00, 250.00, 'M005', 'C001');
GO

-- Insertar datos en tb_departamento
INSERT INTO tb_departamento (codigo_departamento, departamento) VALUES
('DP001', 'Lima'),
('DP002', 'Arequipa'),
('DP003', 'Cusco'),
('DP004', 'Piura'),
('DP005', 'La Libertad'),
('DP006', 'Junín'),
('DP007', 'Puno'),
('DP008', 'Lambayeque'),
('DP009', 'Tacna'),
('DP010', 'Cajamarca');
GO

-- Insertar datos en tb_provincia
INSERT INTO tb_provincia (codigo_provincia, provincia, provincia_codigo_departamento) VALUES
('PR001', 'Lima', 'DP001'),
('PR002', 'Arequipa', 'DP002'),
('PR003', 'Cusco', 'DP003'),
('PR004', 'Piura', 'DP004'),
('PR005', 'Trujillo', 'DP005'),
('PR006', 'Huancayo', 'DP006'),
('PR007', 'Juliaca', 'DP007'),
('PR008', 'Chiclayo', 'DP008'),
('PR009', 'Tacna', 'DP009'),
('PR010', 'Cajamarca', 'DP010'),
('PR011', 'Callao', 'DP001'),
('PR012', 'Chimbote', 'DP005'),
('PR013', 'Cusco', 'DP003'),
('PR014', 'Ica', 'DP006'),
('PR015', 'Chachapoyas', 'DP010');
GO

-- Insertar datos en tb_distrito
INSERT INTO tb_distrito (codigo_distrito, distrito, distrito_codigo_provincia) VALUES
('D001', 'Miraflores', 'PR001'),
('D002', 'Yanahuara', 'PR002'),
('D003', 'San Sebastián', 'PR003'),
('D004', 'Castilla', 'PR004'),
('D005', 'Trujillo', 'PR005'),
('D006', 'El Tambo', 'PR006'),
('D007', 'San Román', 'PR007'),
('D008', 'José Leonardo Ortiz', 'PR008'),
('D009', 'Tacna', 'PR009'),
('D010', 'Cajamarca', 'PR010'),
('D011', 'Callao', 'PR011'),
('D012', 'Chimbote', 'PR012'),
('D013', 'Wanchaq', 'PR013'),
('D014', 'Ica', 'PR014'),
('D015', 'Chachapoyas', 'PR015');
GO

-- Insertar datos en tb_cliente
INSERT INTO tb_cliente (codigo_cliente, nombre, ap_paterno, ap_materno, fecha_nacimiento, direccion, correo_electronico, cliente_codigo_distrito, cliente_codigo_provincia, cliente_codigo_departamento) VALUES
('C001', 'Juan', 'Pérez', 'Gómez', '2000-01-01', 'Av. Los Sauces 123', 'juan.perez@example.com', 'D001', 'PR001', 'DP001'),
('C002', 'María', 'García', 'López', '1995-05-15', 'Jr. Los Robles 456', 'maria.garcia@example.com', 'D002', 'PR002', 'DP002'),
('C003', 'Pedro', 'Díaz', 'Martínez', '1988-10-20', 'Av. Los Olivos 789', 'pedro.diaz@example.com', 'D003', 'PR003', 'DP003'),
('C004', 'Ana', 'Torres', 'Sánchez', '1980-12-05', 'Calle Las Margaritas 234', 'ana.torres@example.com', 'D004', 'PR004', 'DP004'),
('C005', 'Jheidy', 'Rimachi', 'Manotupa', '2005-04-18', 'Av. Jardines Este', 'rmheidy18@gmail.com', 'D005', 'PR005', 'DP005');
GO

-- Insertar datos en tb_venta
INSERT INTO tb_venta (codigo_venta, fecha, venta_codigo_cliente, monto, igv) VALUES
('V001', '2022-03-10', 'C001', 500.00, 90.00),
('V002', '2022-03-12', 'C002', 800.00, 144.00),
('V003', '2022-03-15', 'C003', 1200.00, 216.00),
('V004', '2022-03-20', 'C004', 350.00, 63.00),
('V005', '2022-03-25', 'C005', 600.00, 108.00);
GO

-- Insertar datos en tb_detalles_venta
INSERT INTO tb_detalles_venta (dv_codigo_venta, dv_codigo_producto, cantidad, costo, descuento) VALUES
('V001', 'P001', 2, 1000.00, 0.00),
('V001', 'P002', 1, 1100.00, 0.00),
('V002', 'P003', 1, 150.00, 0.00),
('V003', 'P004', 1, 800.00, 0.00),
('V004', 'P002', 2, 220.00, 0.00);
GO

-- Insertar datos en tb_proveedor
INSERT INTO tb_proveedor (codigo_proveedor, razon_social, ruc, direccion) VALUES
('PV001', 'Proveedor A', '20123456789', 'Av. Principal 123, Lima'),
('PV002', 'Proveedor B', '20134567890', 'Jr. Secundario 456, Arequipa'),
('PV003', 'Proveedor C', '20145678901', 'Calle Principal 789, Cusco'),
('PV004', 'Proveedor D', '20156789012', 'Av. Primavera 234, Piura'),
('PV005', 'Proveedor E', '20167890123', 'Jr. San Martín 567, La Libertad');
GO


-- VENTA
CREATE PROCEDURE sp_ListarVenta
AS
BEGIN
    SELECT codigo_venta, fecha, CONCAT(nombre, ' ', ap_paterno, ' ', ap_materno) as nombre_completo, monto, igv
    FROM tb_venta
    INNER JOIN tb_cliente ON tb_venta.venta_codigo_cliente = tb_cliente.codigo_cliente
    ORDER BY fecha asc;
END
GO

EXEC sp_ListarVenta;

-- MARCA
CREATE PROCEDURE sp_ListarMarca
AS
BEGIN
    SELECT * FROM tb_marca ORDER BY marca asc;
END
GO

EXEC sp_ListarMarca;

-- CATEGORIA
CREATE PROCEDURE sp_ListarCategoria
AS
BEGIN
    SELECT * FROM tb_categoria ORDER BY categoria asc;
END
GO

EXEC sp_ListarCategoria;

-- PRODUCTO
CREATE PROCEDURE ListarProducto
AS
BEGIN
    SELECT * FROM tb_producto ORDER BY stock_disponible asc;
END
GO

EXEC sp_ListarProducto;

-- DISTRITO
CREATE PROCEDURE sp_ListarDistrito
AS
BEGIN
    SELECT * FROM tb_distrito ORDER BY distrito asc;
END
GO

EXEC sp_ListarDistrito;

-- Crear la tabla tb_personal
CREATE TABLE tb_personal (
    dni CHAR(8) NOT NULL PRIMARY KEY,
    ap_paterno VARCHAR(25) NOT NULL,
    ap_materno VARCHAR(25) NOT NULL,
    nombre VARCHAR(25) NOT NULL,
    genero CHAR(1) NOT NULL,
    fecha_nacimiento DATE,
    sueldo FLOAT
);

-- Insertar datos en la tabla tb_personal
INSERT INTO tb_personal VALUES
('12345678', 'Castillo', 'Liñán', 'Joe', 'M', '2000-03-15', 1592.74),
('11223344', 'Ramos', 'López', 'Ericka', 'F', '2002-11-20', 1756.96),
('66554422', 'Flores', 'Alvarez', 'Rosa', 'F', '1999-06-30', 2159.47);

-- Verificar los datos insertados
SELECT * FROM tb_personal;

-- Crear el procedimiento almacenado sp_ListarPersonal
CREATE PROCEDURE sp_ListarPersonal
AS
BEGIN
    SELECT * FROM tb_personal ORDER BY ap_paterno ASC;
END;
GO

-- Llamar al procedimiento almacenado
EXEC sp_ListarPersonal;

