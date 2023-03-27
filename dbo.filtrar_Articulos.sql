﻿ALTER PROCEDURE filtrar_Nombre (
	@InNombre VARCHAR(128)
)
AS
BEGIN
	SET NOCOUNT ON;
	SELECT A.Nombre AS [Nombre] -- MUESTRA EL NOMBRE
		, C.Nombre AS [Clase Articulo] --MUESTRA EL NOMBRE DE CLASE DE ARTICULO
		, A.Precio AS [Precio] --MUESTRA EL PRECIO DEL ARTICULO
	
	FROM dbo.Articulo A --DE LA TABLA ARTICULOS
	INNER JOIN dbo.ClaseArticulos C ON A.IdClaseArticulo = C.id -- JUNTA LAS TABLAS Y REMPLAZA ID POR EL NOMBRE RELACIONADO DE LA CLASE ARTICULO
	WHERE A.Nombre LIKE '%'+@InNombre+'%'
	ORDER BY A.Nombre ASC; --MUESTRA LA TABLA EN ORDEN ALFABETICO ASCENDENTE DEL NOMBRE
	 

	SET NOCOUNT OFF;--SE DESACTIVA SIEMPRE ANTES DE FINALIZAR.
END;