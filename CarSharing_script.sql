USE [MyCarSharing]
GO
/****** Object:  Table [dbo].[Автомобиль]    Script Date: 16.06.2023 11:12:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Автомобиль](
	[Id] [nvarchar](50) NOT NULL,
	[Модель автомобиля id] [int] NOT NULL,
	[Начало использования] [datetime] NOT NULL,
	[Продолжительность использования] [datetime] NOT NULL,
	[Статус доступности] [nchar](10) NOT NULL,
 CONSTRAINT [PK_Автомобиль] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Бронь автомобиля]    Script Date: 16.06.2023 11:12:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Бронь автомобиля](
	[id] [nvarchar](50) NOT NULL,
	[Дата начала брони] [datetime] NOT NULL,
	[Дата окончания брони] [datetime] NOT NULL,
	[Модель автомобиля] [int] NOT NULL,
	[Клиент id] [int] NOT NULL,
 CONSTRAINT [PK_Бронь автомобиля] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Клиент]    Script Date: 16.06.2023 11:12:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Клиент](
	[id] [int] NOT NULL,
	[Фио] [nchar](50) NOT NULL,
	[Номер телефона] [nvarchar](50) NOT NULL,
	[Электронная почта] [nchar](100) NOT NULL,
 CONSTRAINT [PK_Клиент] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Модель автомобиля]    Script Date: 16.06.2023 11:12:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Модель автомобиля](
	[id] [int] NOT NULL,
	[Стоимость аренды] [int] NOT NULL,
	[Количество доступных автомобилей данной модели] [int] NOT NULL,
 CONSTRAINT [PK_Модель автомобиля] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Автомобиль]  WITH CHECK ADD  CONSTRAINT [FK_Автомобиль_Модель автомобиля] FOREIGN KEY([Модель автомобиля id])
REFERENCES [dbo].[Модель автомобиля] ([id])
GO
ALTER TABLE [dbo].[Автомобиль] CHECK CONSTRAINT [FK_Автомобиль_Модель автомобиля]
GO
ALTER TABLE [dbo].[Бронь автомобиля]  WITH CHECK ADD  CONSTRAINT [FK_Бронь автомобиля_Клиент] FOREIGN KEY([Клиент id])
REFERENCES [dbo].[Клиент] ([id])
GO
ALTER TABLE [dbo].[Бронь автомобиля] CHECK CONSTRAINT [FK_Бронь автомобиля_Клиент]
GO
ALTER TABLE [dbo].[Бронь автомобиля]  WITH CHECK ADD  CONSTRAINT [FK_Бронь автомобиля_Модель автомобиля] FOREIGN KEY([Модель автомобиля])
REFERENCES [dbo].[Модель автомобиля] ([id])
GO
ALTER TABLE [dbo].[Бронь автомобиля] CHECK CONSTRAINT [FK_Бронь автомобиля_Модель автомобиля]
GO
