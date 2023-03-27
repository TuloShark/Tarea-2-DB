ALTER PROCEDURE listar_Articulos
AS
BEGIN
	SET NOCOUNT ON; --ACTIVAR, PARA QUE NO ENVIE EL MENSAJE FILAS AFECTADAS
	
	SELECT A.Nombre AS [Nombre] -- MUESTRA EL NOMBRE
		, C.Nombre AS [Clase Articulo] --MUESTRA EL NOMBRE DE CLASE DE ARTICULO
		, A.Precio AS [Precio] --MUESTRA EL PRECIO DEL ARTICULO
	
	FROM dbo.Articulo A --DE LA TABLA ARTICULOS
	INNER JOIN dbo.ClaseArticulos C ON A.IdClaseArticulo = C.id -- JUNTA LAS TABLAS Y REMPLAZA ID POR EL NOMBRE RELACIONADO DE LA CLASE ARTICULO
	ORDER BY A.Nombre ASC; --MUESTRA LA TABLA EN ORDEN ALFABETICO ASCENDENTE DEL NOMBRE
	
	SET NOCOUNT OFF;--SE DESACTIVA SIEMPRE ANTES DE FINALIZAR.
END