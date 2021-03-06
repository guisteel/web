USE [PLAY]
GO
/****** Object:  Table [dbo].[cliente]    Script Date: 17/10/2016 21:05:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cliente](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nome] [varchar](35) NULL,
	[cpf] [varchar](15) NULL,
	[endereco] [varchar](25) NULL,
	[numero] [varchar](25) NULL,
	[cidade] [varchar](2) NULL,
	[estado] [varchar](2) NULL,
	[telefone] [varchar](25) NULL,
 CONSTRAINT [PK_cliente] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[produto]    Script Date: 17/10/2016 21:05:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[produto](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nome] [varchar](25) NULL,
	[genero] [varchar](25) NULL,
	[quantidade] [int] NULL,
	[valor] [float] NULL,
 CONSTRAINT [PK_produto] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[venda]    Script Date: 17/10/2016 21:05:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[venda](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[data] [datetime] NULL,
	[cliente_id] [int] NULL,
	[valorfinal] [float] NULL,
	[produto_id] [int] NULL,
 CONSTRAINT [PK_venda] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[venda]  WITH CHECK ADD  CONSTRAINT [FK_venda_cliente] FOREIGN KEY([cliente_id])
REFERENCES [dbo].[cliente] ([id])
GO
ALTER TABLE [dbo].[venda] CHECK CONSTRAINT [FK_venda_cliente]
GO
ALTER TABLE [dbo].[venda]  WITH CHECK ADD  CONSTRAINT [FK_venda_produto] FOREIGN KEY([produto_id])
REFERENCES [dbo].[produto] ([id])
GO
ALTER TABLE [dbo].[venda] CHECK CONSTRAINT [FK_venda_produto]
GO
