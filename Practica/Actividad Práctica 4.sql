/*
    Fecha: 23/02/2016
    Nombre: Sander Pacheco H.
*/

/*Tomando en cuenta la Base de Datos de ejemplo de la Clase 2:*/
/*Ejercicios de Consultas con Composiciones Externas:*/

/* 1. Listar todos los vendedores con la ciudad en que trabajan.*/

Select nombre, ciudad
From Vendedores, Oficinas
Where oficina_vend = oficina

/* 2. Para cada pedido listar su número y la descripción del 
producto, si hay productos que no tienen ningún pedido deben 
también salir en la relación.*/

Select A.descripcion, B.num_pedido 
from Productos as A left join Pedidos as B
ON (A.id_producto = B.producto) AND (A.id_fab = B.fab)

/*Ejercicios de SubConsultas:*/
/* 3. Listar todos los clientes atendidos por Bill Adams.*/

Select * 
From Clientes
where vendedor_clie = (
    Select num_empl 
    from Vendedores 
    where nombre = 'Bill Adams')

/* 4. Lista todos los productos del fabricante ACI para los 
cuales las existencias superan a las existencias del 
producto ACI-41004*/

select *
from Productos
where existencias > (
    select existencias 
    from Productos 
    where id_fab = 'ACI' and id_producto = '41004')

/* 5. Listar todos los clientes que han remitido pedidos de 
ACI Widgets (fabricante ACI, número de productos que 
comienzan con 4100) entre enero y junio de 1990.*/

select A.*, B.fecha_pedido
from Clientes as A, Pedidos as B
where A.num_clie = B.clie and B.fab = 'ACI' 
    and B.producto in (
        select id_producto 
        from Productos
        where id_producto like '4100#')
        and fecha_pedido between #1/1/1990# and #30/6/1990#

/* 6. Listar las oficinas en donde haya un vendedor cuya cuota 
representa más del 55 por ciento del objetivo de la oficina.*/

select DISTINCT A.* 
from Oficinas as A, Vendedores as B
where A.oficina = B.oficina_vend and (0.50 * A.objetivo) < B.cuota

/*Ejercicios de Actualización de BD:*/
/* 7. Eliminar todos los pedidos del cliente 2126*/

delete from Pedidos 
where clie = 2126

/* 8. Suprimir todos clientes atendidos por los empleador 
105, 109 y 111.*/

delete from Clientes 
where vendedor_clie in (105, 109, 111)

/* 9. Suprime todos los vendedores contratados antes de 
julio de 1988 a los que aún no se les asignado una cuota.*/

delete from Vendedores 
where Vendedores.contrato < #1/7/1988# and cuota = Null 

/* 10. Suprimir a los clientes atendidos por vendedores cuyas 
ventas son inferiores al 80% de su cuota.*/

delete from Clientes
where vendedor_clie in (select num_empl from Vendedores where ventas < (0.8 * cuota))

/* 11. Suprimir a los vendedores cuyo total de pedidos 
actual es menor que el 2% de sus cuotas.*/

delete from Vendedores
where num_empl in (
    SELECT A.num_empl 
    FROM Vendedores AS A INNER JOIN Pedidos AS B 
    ON A.num_empl = B.vend 
    GROUP BY A.num_empl 
    HAVING SUM(B.importe) < 0.02 * A.cuota)

/*Ejercicios de Creación de tablas:*/
/* 12. Realizar todas las sentencias CREATE TABLE para crear las tablas de la BD de ejemplo que hemos utilizado.*/

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
