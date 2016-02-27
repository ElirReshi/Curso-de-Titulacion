/*
    Fecha: 18/02/2016
    Nombre: Sander Pacheco H.
    Ejercicios de Consultas Simples:
*/

-- 1. Listar los productos ordenados por su precio.

select *
from Productos
order by precio;

-- 2. Listar los productos ordenados por su fabricante y dentro de estos por su código.

select *
from Productos
order by id_fab, id_producto;

-- 3. Listar los vendedores en orden decreciente de su edad, dentro de la edad ordenarlos por el nombre.

select *
from Vendedores
order by edad desc, nombre;

-- 4. Listar los productos ordenados por el valor de su inventario.

select *
from Productos
order by existencias;

-- 5. Listar los vendedores que atienden a algún cliente o que han tomado algún pedido.

SELECT DISTINCT Pedidos.vend, Vendedores.nombre
FROM Vendedores INNER JOIN Pedidos ON Vendedores.num_empl = Pedidos.vend;


-- 6. ¿Cuál es el total de los pedidos aceptados por el vendedor 107?

select count(*)
from Pedidos
where vend = 107;

-- 7. ¿Cuál es la fecha de pedido más antigua en la base de datos?

select Min(fecha_pedido)
from Pedidos;

-- 8. ¿Cuál es el mejor promedio de ventas entre todos los vendedores?

select avg(ventas)
from Vendedores;

-- 9. ¿Cuántos clientes hay?

select count(*)
from Clientes;

