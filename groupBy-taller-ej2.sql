/* CHALLENGE: 13 HAVING */
/* EJercicio 2: GROUP BY + Funciones básicas*/
/* Nombre: Marcos Dominguez Vega | Expediente:228 */

USE tallerReparaciones;

/* CONSULTA 1: Seleccion la suma total de materiales*/
SELECT SUM(mtr.precio) cuentaPrecio
FROM material mtr

/* CONSULTA 2: Muetsra la suma total de proveedor que existen*/
SELECT COUNT(pro.idProveedor) cuentaTotalPro
FROM proveedor pro;

/* CONSULTA 3: Cuantos valores diferentes de id de proveedores hay en la tabla materiales*/
SELECT COUNT(pro.idProveedor) cuenta
FROM proveedor pro
JOIN material mtr ON mtr.idProveedor = pro.idProveedor
WHERE  mtr.idProveedor != pro.idProveedor;

/* CONSULTA 4: Cual es la media del PVP de los materiales*/
SELECT AVG(mtr.precio) media
FROM material mtr;

/* CONSULTA 5:Muetsra el PVP mas barato de todos los materiales*/
SELECT MIN(mtr.precio) precionMIN
FROM material mtr;

/* CONSULTA 6: Selecciona el PVP menos económico de todos los materiales*/
SELECT MAX(mtr.precio) precioMax
FROM material mtr;

/* CONSULTA 7: Muestra el nombre y el PVP del material más económico*/
SELECT mtr.nombre, MIN(mtr.precio) precioMin
FROM material mtr
GROUP BY mtr.nombre;

/* CONSULTA 8: Muestra el nombre y el PVP del material menos económico*/
SELECT mtr.nombre, MAX(mtr.precio) precioMax
FROM material mtr
GROUP BY mtr.nombre;

/* CONSULTA 9: Cual es la suma total de los PVP de la totalidad de los materiales*/
SELECT SUM(mtr.precio) sumaTotal
FROM material mtr;

/* CONSULTA 10: Cuantos materiales tiene el proveedor Panda */
SELECT COUNT(mtr.idMaterial) cuentaTotal
FROM material mtr
JOIN proveedor pro
ON mtr.idProveedor = pro.idProveedor
WHERE pro.nombre = "Panda";

/* CONSULTA 11: Muestra el nombre del proveedor y la media de los PVP de sus materiales*/
SELECT pro.nombre, AVG(mtr.precio) media
FROM proveedor pro
JOIN material mtr
ON mtr.idProveedor = pro.idProveedor
GROUP BY pro.nombre;

/* CONSULTA 12: Muestra el nombre del proveedor y el PVP menos económico que tenga*/
SELECT pro.nombre, MAX(mtr.precio) materialMax
FROM proveedor pro
JOIN material mtr
ON mtr.idProveedor = pro.idProveedor
GROUP BY pro.nombre;

/* CONSULTA 13: Muetsra el nombre del proveedor y el PVP mas económico que tenga*/
SELECT pro.nombre, MIN(mtr.precio) materialMIN
FROM proveedor pro
JOIN material mtr
ON mtr.idProveedor = pro.idProveedor
GROUP BY pro.nombre;

/* CONSULTA 14: Muestra el nombre del proveedor y la suma total de todos los materiales que tenga*/

SELECT pro.nombre, SUM(mtr.precio) precioTotal
FROM proveedor pro
JOIN material mtr
ON mtr.idProveedor = pro.idProveedor
GROUP BY pro.nombre;

/* CONSULTA 15: Muestra el PVP máximo, PVP minimo, PVP medio, suma total de los materiales que tiene el fabricante Panda*/

SELECT MIN(mtr.precio) minimo, MAX(mtr.precio) maximo, AVG(mtr.precio) media, SUM(mtr.precio) total
FROM material mtr
JOIN proveedor pro
ON pro.idProveedor = mtr.idProveedor
WHERE pro.nombre = "Panda";

/* CONSULTA 16: Muestra el número total de materiales que tiene cada proveedor. En este listado tambien tiene que aparecer el nombre del proveedor y debe incluir a los proveedores que no tienen ningún producto. Ordénalo descendentemente por el número de productos*/

SELECT COUNT(mtr.idMaterial) materiales, pro.nombre as fabricante
FROM material mtr
JOIN proveedor pro
ON pro.idProveedor = mtr.idProveedor;
GROUP BY fabricante
ORDER BY materiales DESC;

/*CONSULTA 17: Muestra el PVP máximo, PVP minimo y PVP medio del total de proveedores que exista. En el resultado también debe aparecer el nombre del fabricante. Ordena el resultyado por el PVP medio*/

SELECT MAX(mtr.precio) maximo, MIN(mtr.precio) minimo, AVG(mtr.precio) media, pro.nombre as fabricante
FROM material mtr
JOIN proveedor pro
ON pro.idProveedor = mtr.idProveedor;
GROUP BY frabicante
ORDER BY media DESC;


