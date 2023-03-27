CREATE PROCEDURE Insertar_EventLog
(
	@InAccion INT
	, @InValor VARCHAR (256)
	, @InId VARCHAR(16)
	, @InUsuarios VARCHAR (64)
	, @InIp VARCHAR(64)
)
As
BEGIN
	SET NOCOUNT ON
	
	DECLARE @Descripcion VARCHAR(2000);
		
		IF (@InAccion = 0) --Se realiza el log 
			
			BEGIN
				SET @Descripcion = '{TipoAccion=<Login exitoso> Description=<"">}' 
			END;
		
		ELSE IF (@InAccion = 1) --No se puede loguear correctamente
		
			BEGIN
				SET @Descripcion = '{TipoAccion=<Login no exitoso> Description=<"">}';
			END;

		ELSE IF(@InAccion = 2) --Consulta por nombre
			
			BEGIN
				SET @Descripcion = '{TipoAccion=<Consulta por Nombre> Description=<'+@InValor+'>}';
			END;

		ELSE IF (@InAccion = 3) --Consulta por cantidad
		
			BEGIN
				SET @Descripcion = '{TipoAccion=<Consulta por cantidad> Description=<'+@InValor+'>}';
			END;

		ELSE IF(@InAccion = 4) --Consulta por clase
		
			BEGIN
				SET @Descripcion = '{TipoAccion=<Consulta por clase de articulo> Description=<'+@InValor+'>}';
			END;

		ELSE IF (@InAccion = 5) --Insersion de articulo.

			BEGIN
				SET @Descripcion = '{TipoAccion=<Insertar articulo exitoso> Description=<'+@InValor+'>}';
			END;

		ELSE IF (@InAccion = 6) --Logout
			
			BEGIN;
				SET @Descripcion = '{TipoAccion=<Logout> Description=<"">}';
			END;

		INSERT INTO dbo.EventLog(LogDescription,PostIdUser, PostIP, PostTime)
		Values(@Descripcion 
			,(SELECT A.id FROM dbo.Usuario A WHERE A.UserName = @InUsuarios)
			, @InIp
			, GETDATE()
		);
END;