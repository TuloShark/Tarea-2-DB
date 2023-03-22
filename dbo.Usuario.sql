CREATE TABLE [dbo].[Usuario] (
    [id]       INT          IDENTITY (1, 1) NOT NULL,
    [UserName] VARCHAR (128) NOT NULL,
    [Password] VARCHAR (128) NOT NULL,
    PRIMARY KEY CLUSTERED ([id] ASC)
);

