create database Tic

use Tic
go

create table Oficinas (
    oficina int primary key,
    dir int,
    -----
    ciudad nvarchar (max),
    region nvarchar (max),
    objetivo float,
    ventas float
)

create table Vendedores (
    num_empl int primary key,
    oficina_vend int,
    -----
    nombre nvarchar (max),
    edad int,
    titulo nvarchar (max),
    contrato date,
    director int,
    cuota float,
    ventas float
)

create table Clientes (
    num_clie int primary key,
    vendedor_clie int,
    -----
    empresa nvarchar (max),
    lim_credito float
)

create table Productos (
    id_fab char (3) primary key,
    id_producto char (5) primary key,
    -----
    descripcion nvarchar (max),
    precio float,
    existencias int
)

create table Pedidos (
    num_pedido int primary key,
    clie int,
    vend int,
    fab char (3),
    producto char (5),
    -----
    fecha_pedido date,
    cant int,
    importe float
)
