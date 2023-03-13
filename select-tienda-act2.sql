USE tienda;
/* CHALLENGE 11: (select) */
/* Actividad 2 */
/* Nombre: Marcos Dominguez Vega | Expediente: 228 */

/* CONSULTA 1: */
SELECT CONCAT_WS(" ",ven.nombreVen,ven.ap1Ven,ven.ap2Ven) nombreCompleto
FROM vendedor ven
WHERE ven.idVen = (
	SELECT vnt.idVendedor
	FROM venta vnt
	WHERE vnt.totalVenta = (
		SELECT MIN(vnt.totalVenta)
		FROM venta vnt
		WHERE vnt.fechaVenta BETWEEN "2023-12-31" AND "2023-01-01"
	)
);

/* CONSULTA 2: */
SELECT CONCAT_WS(" ",comp.nombreCom, comp.ap1Com, comp.ap2Com) nombreCompleto, comp.ciudad
FROM comprador comp
JOIN venta vnt ON vnt.idComprador = comp.idCom
WHERE vnt.fechaVenta BETWEEN "2021-12-31" AND "2021-01-01" AND vnt.totalVenta <= (
		SELECT AVG(vnt.totalventa)
		FROM venta vnt
		WHERE vnt.fechaVenta BETWEEN "2021-12-31" AND "2021-01-01"
	);

/* CONSULTA 3: */
SELECT (ven.comision*vnt.totalVenta/100) as sueldo
FROM vendedor ven
JOIN venta vnt ON vnt.idVendedor = ven.idVen
WHERE vnt.totalVenta < (
		SELECT vnt.totalVenta
		FROM venta vnt
		JOIN comprador comp ON comp.idCom = vnt.idComprador
		WHERE comp.ciudad = "Galway"
	);

/* CONSULTA 4: */
