USE [1Chmura]
GO
/****** Object:  Table [dbo].[Film]    Script Date: 2019-12-20 11:07:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Film](
	[idFilm] [nchar](10) NOT NULL,
	[Nazwa] [varchar](50) NULL,
	[idKategoria] [nchar](10) NULL,
 CONSTRAINT [PK_Film] PRIMARY KEY CLUSTERED 
(
	[idFilm] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Kategoria]    Script Date: 2019-12-20 11:07:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kategoria](
	[idKategoria] [nchar](10) NOT NULL,
	[Gatunek] [varchar](50) NULL,
 CONSTRAINT [PK_Kategoria] PRIMARY KEY CLUSTERED 
(
	[idKategoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Klienci]    Script Date: 2019-12-20 11:07:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Klienci](
	[idKlienci] [nchar](10) NOT NULL,
	[Imie] [varchar](50) NULL,
	[Nazwisko] [varchar](50) NULL,
	[Adres] [varchar](50) NULL,
	[Kontakt] [varchar](50) NULL,
 CONSTRAINT [PK_Klienci] PRIMARY KEY CLUSTERED 
(
	[idKlienci] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Placowka]    Script Date: 2019-12-20 11:07:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Placowka](
	[idPlacowka] [nchar](10) NOT NULL,
	[Adres] [varchar](50) NULL,
 CONSTRAINT [PK_Placowka] PRIMARY KEY CLUSTERED 
(
	[idPlacowka] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Wypozyczenie]    Script Date: 2019-12-20 11:07:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Wypozyczenie](
	[idWypozyczenie] [nchar](10) NOT NULL,
	[idPlacowka] [nchar](10) NULL,
	[termidOd] [date] NULL,
	[terminDo] [date] NULL,
	[idKlienci] [nchar](10) NULL,
	[idFilm] [nchar](10) NULL,
 CONSTRAINT [PK_Wypozyczenie] PRIMARY KEY CLUSTERED 
(
	[idWypozyczenie] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Film]  WITH CHECK ADD  CONSTRAINT [FK_Film_Kategoria] FOREIGN KEY([idKategoria])
REFERENCES [dbo].[Kategoria] ([idKategoria])
GO
ALTER TABLE [dbo].[Film] CHECK CONSTRAINT [FK_Film_Kategoria]
GO
ALTER TABLE [dbo].[Wypozyczenie]  WITH CHECK ADD  CONSTRAINT [FK_Wypozyczenie_Film] FOREIGN KEY([idFilm])
REFERENCES [dbo].[Film] ([idFilm])
GO
ALTER TABLE [dbo].[Wypozyczenie] CHECK CONSTRAINT [FK_Wypozyczenie_Film]
GO
ALTER TABLE [dbo].[Wypozyczenie]  WITH CHECK ADD  CONSTRAINT [FK_Wypozyczenie_Klienci] FOREIGN KEY([idKlienci])
REFERENCES [dbo].[Klienci] ([idKlienci])
GO
ALTER TABLE [dbo].[Wypozyczenie] CHECK CONSTRAINT [FK_Wypozyczenie_Klienci]
GO
ALTER TABLE [dbo].[Wypozyczenie]  WITH CHECK ADD  CONSTRAINT [FK_Wypozyczenie_Placowka] FOREIGN KEY([idPlacowka])
REFERENCES [dbo].[Placowka] ([idPlacowka])
GO
ALTER TABLE [dbo].[Wypozyczenie] CHECK CONSTRAINT [FK_Wypozyczenie_Placowka]
GO
