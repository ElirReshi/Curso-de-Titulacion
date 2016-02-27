create database Tic

use Tic
go

create table Oficinas (
    oficina int primary key,
    -----
    ciudad varchar (max),
    region varchar (max),
    dir int,
    objetivo float,
    ventas float
)

create table Vendedores (
    num_empl int primary key,
    oficina_vend int,
    -----
    nombre varchar (max),
    edad int,
    titulo varchar (max),
    contrato date,
    director int,
    cuota float,
    ventas float
)

create table Clientes (
    num_clie int primary key,
    vendedor_clie int,
    -----
    empresa varchar (max),
    lim_credito float
)

create table Productos (
    Cod_producto char (8) primary key,
    -----
    descripcion varchar (max),
    precio float,
    existencias int
)

create table Pedidos (
    num_pedido int primary key,
    clie int,
    vend int,
    Cod_producto char (8),
    -----
    fecha_pedido date,
    cant int,
    importe float
)

insert into Oficinas
values
(11, 'New York', 'Este', 106, 575000, 692637),
(12, 'Chicago', 'Este', 104, 800000, 735042),
(13, 'Atlanta', 'Este', 105, 350000, 367911),
(21, 'Los Angeles', 'Oeste', 108, 725000, 835915),
(22, 'Denver', 'Oeste', 108, 300000, 186042)

insert into Vendedores
values
(101, 12, 'Dan Roberts', 45, 'Rep Ventas', '20/10/1986', 104, 300000, 305673),
(102, 21, 'Sue Smith', 48, 'Rep Ventas', '10/12/1986', 108, 350000, 474050),
(103, 12, 'Paul Cruz', 29, 'Rep Ventas', '01/03/1987', 104, 275000, 286775),
(104, 12, 'Bob Smith', 33, 'Dir Ventas', '19/05/1987', 106, 200000, 142594),
(105, 13, 'Bill Adams', 37, 'Rep Ventas', '12/02/1988', 104, 350000, 367911),
(106, 11, 'Sam  Clark', 52, 'VP Ventas', '14/06/1988', null, 275000, 299912),
(107, 22, 'Nancy Angelli', 49, 'Rep Ventas', '14/11/1988', 108, 300000, 186042),
(108, 21, 'Larry Fitch', 62, 'Dir Ventas', '12/10/1989', 106, 350000, 361865),
(109, 11, 'Mary Jones', 31, 'Rep Ventas', '12/10/1999', 106, 300000, 392725),
(110, null, 'Tom Snyder', 41, 'Rep Ventas', '13/01/1990', 101, 0, 75985)

insert into Clientes
values
(2101, 106, 'Jones Mfg.', 65000),
(2102, 101, 'First Corp.', 65000),
(2103, 105, 'Acme Mfg.', 50000),
(2105, 101, 'AAA Investments', 45000),
(2106, 102, 'Fred Lewis Corp.', 65000),
(2107, 110, 'Ace International', 35000),
(2108, 109, 'Holm & Landis', 55000),
(2109, 103, 'Chen Associates', 25000),
(2111, 103, 'JCP Inc.', 50000),
(2112, 108, 'Zeta Corp.', 50000),
(2113, 104, 'Ian & Schmidt', 20000),
(2114, 102, 'Orion Corp.', 20000),
(2115, 101, 'Smithson Corp.', 20000),
(2117, 106, 'J.P. Sinclair', 35000),
(2118, 108, 'Midwest Systems', 60000),
(2119, 109, 'Solomon Inc.', 25000),
(2120, 102, 'Rico Enterprises', 50000),
(2121, 103, 'QMA Assoc.', 45000),
(2122, 105, 'Three-Way Lines', 30000),
(2123, 102, 'Carter & Sons', 40000),
(2124, 107, 'Peter Brothers', 40000)

insert into Pedidos
values
(110036, 2107, 110, 'ACI4100Z', '30/01/1990', 9, 22500),
(112961, 2117, 106, 'REI2A44L', '17/12/1989', 7, 31500),
(112963, 2103, 105, 'ACI41004', '17/12/1989', 28, 3276),
(112968, 2102, 101, 'ACI41004', '12/10/1989', 34, 3978),
(112975, 2111, 103, 'REI2A44G', '12/10/1989', 6, 2100),
(112979, 2114, 102, 'ACI4100Z', '12/10/1989', 6, 15000),
(112983, 2103, 105, 'ACI41004', '27/12/1989', 6, 702),
(112987, 2103, 105, 'ACI4100Y', '31/12/1989', 10, 27500),
(112989, 2101, 106, 'FEA114', '03/01/1990', 6, 1458),
(112992, 2118, 108, 'ACI41002', '04/11/1989', 10, 760),
(112993, 2106, 102, 'REI2A45C', '04/01/1989', 24, 1896),
(112997, 2124, 107, 'BIC41003', '08/01/1990', 1, 652),
(113003, 2108, 109, 'IMM779C', '25/01/1990', 3, 5625),
(113007, 2112, 108, 'IMM773C', '08/01/1990', 3, 2925),
(113012, 2111, 105, 'ACI41003', '11/01/1990', 35, 3745),
(113013, 2118, 108, 'BIC41003', '14/01/1990', 1, 652),
(113024, 2114, 108, 'QSAXK47', '20/01/1990', 20, 7100),
(113027, 2103, 105, 'ACI41002', '22/01/1990', 54, 4104),
(113034, 2107, 110, 'REI2A45C', '29/01/1990', 8, 632),
(113042, 2113, 101, 'REI2A44R', '02/02/1990', 5, 22500),
(113045, 2112, 108, 'REI2A44R', '02/02/1990', 10, 45000),
(113048, 2120, 102, 'IMM779C', '10/02/1990', 2, 3750),
(113049, 2118, 108, 'QSAXK47', '10/02/1990', 2, 776),
(113051, 2118, 108, 'QSAXK47', '10/02/1990', 4, 1420),
(113055, 2108, 101, 'ACI4100X', '15/02/1990', 6, 150),
(113057, 2111, 103, 'ACI4100X', '18/02/1990', 24, 600),
(113058, 2108, 109, 'FEA112', '23/02/1990', 10, 1480),
(113062, 2124, 107, 'FEA114', '24/02/1990', 10, 2430),
(113065, 2106, 102, 'QSAXK47', '27/02/1990', 6, 2130),
(113069, 2109, 107, 'IMM775C', '02/03/1990', 22, 31350)

