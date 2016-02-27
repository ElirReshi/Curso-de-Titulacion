/*Ejercicios de Actualización de BD:*/
/* 1. Suprimir los clientes que no han realizado pedidos
desde el 10 de noviembre de 1989.*/

delete from Clientes
where num_clie in (
    select num_clie
    from Clientes inner join Pedidos
    ON (num_clie = clie)
	where fecha_pedido < '10/11/1989'
    )

/* 2. Reasignar todos los clientes atendidos por
los empleados 105, 106 ó 107 al empleado número 102.*/

update Clientes
set vendedor_clie = 102
where vendedor_clie in (105, 106, 107)

/* 3. Asigna una cuota de 100000 a todos aquellos
vendedores que actualmente no tienen cuotas.*/

update Vendedores
set cuota = 100000
where cuota in (Null, 0)

/* 4. Reasignar todos los clientes atendidos por
vendedores cuyas ventas son menores que el 80% de
sus cuotas al vendedor 105.*/

update Clientes
set vendedor_clie = 105
where vendedor_clie in (
	select num_empl
	from Vendedores
	where ventas < (0.8 * cuota)
	)

/* 5. Hacer que todos los vendedores que atienden
a más de tres clientes estén bajo las órdenes del
empleado número 106.*/

update Vendedores
set num_empl = 106
where num_empl in (
	select A.num_empl
	from Vendedores as A INNER JOIN Clientes as B
	on (A.num_empl = B.vendedor_clie)
	group by A.num_empl
	having COUNT(B.num_clie) > 3
	)

/*Ejercicios de Creación de Tablas:*/
/* 6. Realizar todas las sentencias CREATE TABLE para crear las tablas de la BD de ejemplo que hemos utilizado.*/

/*Ejercicios de Vistas:*/
/* 7. Crear una vista que muestre a los vendedores del Oeste.*/

select A.*
from Vendedores as A inner join Oficinas as B
on (A.oficina_vend = B.oficina)
where B.region = 'Oeste'

/* 8. Definir una vista que contiene únicamente las oficinas
de la región Este.*/

select *
from Oficinas
where region = 'Este'

/* 9. Definir una vista que muestre únicamente aquellos clientes
que tienen más de 30000 en pedidos actualmente registrados.*/

select *
from Clientes
where num_clie in (
	select clie
	from Pedidos
	group by clie
	having 30000 < SUM(importe)
	)

/* 10. Definir una vista de la tabla oficinas que incluya la ciudad,
el número de la oficina y la región.*/

select ciudad, oficina, region
from Oficinas

/* 11. Definir una vista de la tabla clientes que incluya únicamente
los nombres de los clientes y su asignación a vendedores.*/

select empresa, vendedor_clie from Clientes

/*Ejercicios de Seguridad:*/

/* 12. Permitir al usuario sam insertar o suprimir una oficina.*/

grant insert, delete
on Oficinas
to sam

/* 13. Dar todos los privilegios al usuario sam sobre la tabla vendedores.*/

grant all privileges
on Vendedores
to sam

/* 14. Permitir al usuario larry insertar en la tabla clientes
y permitirle que el pueda dar este privilegio a otros usuarios.*/

grant insert
on Clientes
to larry
with grant option

/* 15. Quitar a sam el privilegio de suprimir en la tabla oficinas.*/

revoke delete
on Oficinas
from sam cascade

/* 16. Quitar a larry el permiso de dar privilegios de inserción
en la tabla clientes a otros usuarios.*/

revoke grant option insert
on Clientes
from larry cascade
