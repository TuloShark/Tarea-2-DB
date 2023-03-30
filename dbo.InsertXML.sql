CREATE PROCEDURE [dbo].[InsertXML]
AS
BEGIN
	DELETE FROM [dbo].[Usuario] -- Se borran los datos de las tablas para evitar repetidos
	DELETE FROM [dbo].[Articulo]
	DELETE FROM [dbo].[ClaseArticulo]

	DBCC CHECKIDENT ('Usuario', RESEED,0) -- Se declaran los valores iniciales de los id de las tablas en 0
	DBCC CHECKIDENT ('Articulo', RESEED,0)
	DBCC CHECKIDENT ('ClaseArticulo', RESEED,0)

	DECLARE @xmlData XML -- Se declara la variable XML

	SET @xmlData = 
		( -- Se define la variable XML, se utiliza la dirección del archivo
		SELECT *
		FROM OPENROWSET(BULK 'D:\S3\ronbuckets\DatosXML_ejemplo.xml', SINGLE_BLOB) -- En este caso se usa la ruta de un S3 BUCKET
		AS xmlData -- Se guarda en una variable para futuras lecturas
		);

	INSERT INTO [dbo].[Usuario] -- Se inserta a la tabla Usuario
	SELECT  
		T.Item.value('@Nombre', 'VARCHAR(128)') AS [UserName],
		T.Item.value('@Password', 'VARCHAR(128)') AS [Password]
	FROM @xmlData.nodes('root/Usuarios/Usuario') -- Ruta de Usuario
	AS T(Item)

	INSERT INTO [dbo].[ClaseArticulo] -- Se inserta a ClaseArticulo
	SELECT  
		T.Item.value('@Nombre', 'VARCHAR(128)') AS [Nombre]
	FROM @xmlData.nodes('root/ClasesdeArticulos/ClasesdeArticulo') -- Ruta de ClaseArticulo
	AS T(Item)

	INSERT INTO [dbo].[Articulo] -- Se inserta a Articulo
	SELECT
		(SELECT id FROM [dbo].[ClaseArticulo] WHERE [Nombre] = -- Se debe mapear el id con el nombre
		T.Item.value('@ClasesdeArticulo', 'VARCHAR(128)')) AS [idClaseArticulo],
		T.Item.value('@Nombre', 'VARCHAR(128)') AS [Nombre],
		T.Item.value('@precio', 'money') AS [Precio]
	FROM @xmlData.nodes('root/Articulos/Articulo') -- Ruta de Articulo
	AS T(Item)
END