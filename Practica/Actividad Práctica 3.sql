/*
    Fecha: 22/02/2016
    Nombre: Sander Pacheco H.
*/

/*Ejercicios de Consultas Agrupadas:*/
-- 1. Obtener para cada vendedor cual es promedio de límite de crédito de sus clientes.

select num_empl, nombre, avg(lim_credito) as 'Promedio del límite de crédito'
from Vendedores, Clientes
where num_empl = vendedor_clie
group by num_empl, nombre

-- 2. Obtener el importe total para cada producto solicitado en pedidos.

select id_fab, id_producto, sum(importe) as 'Importe Total'
from Pedidos, Productos
where id_fab = fab and id_producto = producto
group by id_fab, id_producto

-- 3. Obtener el importe total de pedidos solicitados por cada uno de los clientes.

select empresa, num_clie, sum(importe) as 'Importe Total'
from Pedidos, Clientes
where num_clie = clie
group by empresa, num_clie

------------------------------------------------------
/*Ejercicios de Consultas Multitablas:*/
-- 4. Listar los datos de cada oficina junto al nombre de su director. Ordénelos por el nombre del director.

select oficina, nombre
from Oficinas, Vendedores
where dir = num_empl
order by nombre

-- 5. Listar los pedidos con un importe mayor que 20000 indicado el número del pedido, la fecha y la descripción del producto.

select num_pedido, fecha_pedido, importe, descripcion
from Pedidos, Productos
where id_fab = fab and id_producto = producto and importe > 20000

/* 6. Listar los pedidos que han tenido una cantidad mayor que 
20 indicando su número, el nombre del cliente que lo solicitó 
y la cantidad.*/

select num_pedido, empresa, cant
from Pedidos, Clientes
where cant > 20 and clie = num_clie

-- 7. Liste los clientes de la empresa indicando el nombre de su vendedor asociado.

select empresa, nombre
from Clientes, Vendedores
where vendedor_clie = num_empl

-- 8. Para cada producto liste el importe total de los pedidos efectuados.

SELECT Productos.id_producto, sum(Pedidos.importe) as 'Importe Total'
FROM Productos LEFT JOIN Pedidos ON Productos.id_producto = Pedidos.producto
group by Productos.id_producto

