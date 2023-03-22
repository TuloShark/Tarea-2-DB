CREATE TABLE [dbo].[Articulo] (
    [id]              INT           IDENTITY (1, 1) NOT NULL,
    [IdClaseArticulo] INT           NOT NULL,
    [Nombre]          VARCHAR (128) NOT NULL,
    [Precio]          MONEY         NOT NULL,
    PRIMARY KEY CLUSTERED ([id] ASC),
    CONSTRAINT [FK_Articulo_ClaseArticulo] FOREIGN KEY ([IdClaseArticulo]) REFERENCES [dbo].[ClaseArticulo] ([id])
);

