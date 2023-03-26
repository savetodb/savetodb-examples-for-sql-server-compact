-- =============================================
-- Application: Sample 13 - Tests
-- Version 10.8, January 9, 2023
--
-- Copyright 2021-2023 Gartle LLC
--
-- License: MIT
-- =============================================

CREATE TABLE [quotes] (
      ['] nvarchar(50) NOT NULL
    , [''] nvarchar(50) NOT NULL
    , [,] nvarchar(50) NOT NULL
    , [-] nvarchar(50) NOT NULL
    , [@] nvarchar(50) NOT NULL
    , [@@] nvarchar(50) NOT NULL
    , [`] nvarchar(50) NULL
    , [``] nvarchar(50) NULL
    , ["] nvarchar(50) NULL
    , [""] nvarchar(50) NULL
    , []]] nvarchar(50) NULL
    , [[] nvarchar(50) NULL
    , [[]]] nvarchar(50) NULL
    , [+] nvarchar(50) NULL
    , [*] nvarchar(50) NULL
    , [%] nvarchar(50) NULL
    , [%%] nvarchar(50) NULL
    , [=] nvarchar(50) NULL
    , [;] nvarchar(50) NULL
    , [:] nvarchar(50) NULL
    , [<>] nvarchar(50) NULL
    , [&] nvarchar(50) NULL
    , [.] nvarchar(50) NULL
    , [..] nvarchar(50) NULL
    , CONSTRAINT [PK_quotes] PRIMARY KEY (['], [''], [,], [-], [@], [@@])
);

CREATE TABLE [datatypes] (
      [id] int IDENTITY(1,1) NOT NULL
    , [bigint] bigint NULL
    , [binary] binary(8) NULL
    , [binary16] binary(16) NULL
    , [bit] bit NULL
    , [datetime] datetime NULL
    , [float] float NULL
    , [image] image NULL
    , [integer] int NULL
    , [money] money NULL
    , [nchar] nchar(10) NULL
    , [ntext] ntext NULL
    , [numeric] numeric NULL
    , [numeric152] numeric(15,2) NULL
    , [nvarchar] nvarchar(255) NULL
    , [real] real NULL
    , [smallint] smallint NULL
    , [timestamp] timestamp NULL
    , [tinyint] tinyint NULL
    , [uniqueidentifier] uniqueidentifier NULL
    , [varbinary] varbinary(50) NULL
    , CONSTRAINT [PK_datatypes] PRIMARY KEY ([id])
);

INSERT INTO [datatypes] ([bigint],[binary],[binary16],[bit],[datetime],[float],[image],[integer],[money],[nchar],[ntext],[numeric],[numeric152],[nvarchar],[real],[smallint],[tinyint],[uniqueidentifier],[varbinary]) VALUES (123456789012345,0x0A0B0C0000000000,0x030201000504070608090A0B0C0D0E0F,1,'20211210 15:20:10',1234567,0x0A0B0C,1234567890,123456789012.12,N'nchar     ',N'ntext',123456789012345,123456789012.45,N'nvarchar',1234567.00,32767,255,N'00010203-0405-0607-0809-0a0b0c0d0e0f',0x0A0B0C);
INSERT INTO [datatypes] ([bigint],[binary],[binary16],[bit],[datetime],[float],[image],[integer],[money],[nchar],[ntext],[numeric],[numeric152],[nvarchar],[real],[smallint],[tinyint],[uniqueidentifier],[varbinary]) VALUES (123456789012345,0x0A0B0C0000000000,0x030201000504070608090A0B0C0D0E0F,1,'20211210 15:20:10',1234567,0x0A0B0C,1234567890,123456789012.12,N'nchar     ',N'ntext',123456789012345,123456789012.45,N'nvarchar',1234567.00,32767,255,N'00010203-0405-0607-0809-0a0b0c0d0e0f',0x0A0B0C);
INSERT INTO [datatypes] ([bigint],[binary],[binary16],[bit],[datetime],[float],[image],[integer],[money],[nchar],[ntext],[numeric],[numeric152],[nvarchar],[real],[smallint],[tinyint],[uniqueidentifier],[varbinary]) VALUES (NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

INSERT INTO [quotes] (['], [''], [,], [-], [@], [@@], [`], [``], ["], [""], []]], [[], [[]]], [+], [*], [%], [%%], [=], [;], [:], [<>], [&], [.], [..]) VALUES (N'''', N'''''', N',', N'-', N'@', N'@@', N'`', N'``', N'"', N'""', N']', N'[', N'[]', N'+', N'*', N'%', N'%%', N'=', N';', N':', N'<>', N'&', N'.', N'..');
INSERT INTO [quotes] (['], [''], [,], [-], [@], [@@], [`], [``], ["], [""], []]], [[], [[]]], [+], [*], [%], [%%], [=], [;], [:], [<>], [&], [.], [..]) VALUES (N'1', N'2', N'3', N'4', N'5', N'6', N'`', N'``', N'"', N'""', N']', N'[', N'[]', N'+', N'*', N'%', N'%%', N'=', N';', N':', N'<>', N'&', N'.', N'..');

-- print Application installed
