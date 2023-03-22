CREATE TABLE [dbo].[EventLog] (
    [Id]             INT            IDENTITY (1, 1) NOT NULL,
    [LogDescription] VARCHAR (2000) NOT NULL,
    [PostIdUser]     INT            NOT NULL,
    [PostIP]         VARCHAR (64)   NOT NULL,
    [PostTime]       DATETIME       NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);

