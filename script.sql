USE [BDD_QCM]
GO
/****** Object:  Table [dbo].[EPREUVE]    Script Date: 08/10/2018 16:28:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EPREUVE](
	[idEpreuve] [int] IDENTITY(1,1) NOT NULL,
	[dateDedutValidite] [datetime] NOT NULL,
	[dateFinValidite] [datetime] NOT NULL,
	[tempsEcoule] [int] NULL,
	[etat] [char](2) NOT NULL,
	[note_obtenue] [float] NULL,
	[niveau_obtenu] [char](3) NULL,
	[idTest] [int] NOT NULL,
	[idUtilisateur] [int] NOT NULL,
 CONSTRAINT [EPREUVE_PK] PRIMARY KEY CLUSTERED 
(
	[idEpreuve] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PROFIL]    Script Date: 08/10/2018 16:28:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PROFIL](
	[codeProfil] [int] NOT NULL,
	[libelle] [varchar](100) NOT NULL,
 CONSTRAINT [PROFIL_PK] PRIMARY KEY CLUSTERED 
(
	[codeProfil] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PROMOTION]    Script Date: 08/10/2018 16:28:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PROMOTION](
	[codePromo] [char](8) NOT NULL,
	[Libelle] [varchar](200) NOT NULL,
 CONSTRAINT [PROMOTION_PK] PRIMARY KEY CLUSTERED 
(
	[codePromo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PROPOSITION]    Script Date: 08/10/2018 16:28:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PROPOSITION](
	[idProposition] [int] NOT NULL,
	[enonce] [varchar](500) NOT NULL,
	[estBonne] [bit] NOT NULL,
	[idQuestion] [int] NOT NULL,
 CONSTRAINT [PROPOSITION_PK] PRIMARY KEY CLUSTERED 
(
	[idProposition] ASC,
	[idQuestion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[QUESTION]    Script Date: 08/10/2018 16:28:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[QUESTION](
	[idQuestion] [int] IDENTITY(1,1) NOT NULL,
	[enonce] [varchar](500) NOT NULL,
	[media] [varbinary](1) NULL,
	[points] [int] NOT NULL,
	[idTheme] [int] NOT NULL,
 CONSTRAINT [QUESTION_PK] PRIMARY KEY CLUSTERED 
(
	[idQuestion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[QUESTION_TIRAGE]    Script Date: 08/10/2018 16:28:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QUESTION_TIRAGE](
	[estMarquee] [bit] NOT NULL,
	[idQuestion] [int] NOT NULL,
	[numordre] [int] NOT NULL,
	[idEpreuve] [int] NOT NULL,
 CONSTRAINT [QUESTION_TIRAGE_PK] PRIMARY KEY CLUSTERED 
(
	[idQuestion] ASC,
	[idEpreuve] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[REPONSE_TIRAGE]    Script Date: 08/10/2018 16:28:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[REPONSE_TIRAGE](
	[idProposition] [int] NOT NULL,
	[idQuestion] [int] NOT NULL,
	[idEpreuve] [int] NOT NULL,
 CONSTRAINT [REPONSE_TIRAGE_PK] PRIMARY KEY CLUSTERED 
(
	[idQuestion] ASC,
	[idEpreuve] ASC,
	[idProposition] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SECTION_TEST]    Script Date: 08/10/2018 16:28:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SECTION_TEST](
	[nbQuestionsATirer] [int] NOT NULL,
	[idTest] [int] NOT NULL,
	[idTheme] [int] NOT NULL,
 CONSTRAINT [SECTION_TEST_PK] PRIMARY KEY CLUSTERED 
(
	[idTest] ASC,
	[idTheme] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TEST]    Script Date: 08/10/2018 16:28:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TEST](
	[idTest] [int] IDENTITY(1,1) NOT NULL,
	[libelle] [varchar](100) NOT NULL,
	[description] [varchar](200) NOT NULL,
	[duree] [int] NOT NULL,
	[seuil_haut] [int] NOT NULL,
	[seuil_bas] [int] NOT NULL,
 CONSTRAINT [TEST_PK] PRIMARY KEY CLUSTERED 
(
	[idTest] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[THEME]    Script Date: 08/10/2018 16:28:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[THEME](
	[idTheme] [int] NOT NULL,
	[libelle] [varchar](200) NOT NULL,
 CONSTRAINT [THEME_PK] PRIMARY KEY CLUSTERED 
(
	[idTheme] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UTILISATEUR]    Script Date: 08/10/2018 16:28:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UTILISATEUR](
	[idUtilisateur] [int] IDENTITY(1,1) NOT NULL,
	[nom] [varchar](250) NOT NULL,
	[prenom] [varchar](250) NOT NULL,
	[email] [varchar](250) NOT NULL,
	[password] [varchar](100) NOT NULL,
	[codeProfil] [int] NOT NULL,
	[codePromo] [char](8) NULL,
 CONSTRAINT [UTILISATEUR_PK] PRIMARY KEY CLUSTERED 
(
	[idUtilisateur] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[EPREUVE] ON 

INSERT [dbo].[EPREUVE] ([idEpreuve], [dateDedutValidite], [dateFinValidite], [tempsEcoule], [etat], [note_obtenue], [niveau_obtenu], [idTest], [idUtilisateur]) VALUES (3, CAST(N'2018-10-04 10:00:00.000' AS DateTime), CAST(N'2018-10-04 16:00:00.000' AS DateTime), 50, N'T ', 16, N'A  ', 1, 3)
INSERT [dbo].[EPREUVE] ([idEpreuve], [dateDedutValidite], [dateFinValidite], [tempsEcoule], [etat], [note_obtenue], [niveau_obtenu], [idTest], [idUtilisateur]) VALUES (6, CAST(N'2018-10-04 10:00:00.000' AS DateTime), CAST(N'2018-10-04 16:00:00.000' AS DateTime), 60, N'T ', 7, N'NA ', 1, 5)
SET IDENTITY_INSERT [dbo].[EPREUVE] OFF
INSERT [dbo].[PROFIL] ([codeProfil], [libelle]) VALUES (10, N'libre')
INSERT [dbo].[PROFIL] ([codeProfil], [libelle]) VALUES (20, N'stagiaire')
INSERT [dbo].[PROFIL] ([codeProfil], [libelle]) VALUES (30, N'formateur')
INSERT [dbo].[PROFIL] ([codeProfil], [libelle]) VALUES (40, N'admin')
INSERT [dbo].[PROMOTION] ([codePromo], [Libelle]) VALUES (N'1', N'promo01')
INSERT [dbo].[PROMOTION] ([codePromo], [Libelle]) VALUES (N'2', N'promo02')
INSERT [dbo].[PROMOTION] ([codePromo], [Libelle]) VALUES (N'3', N'promo03')
INSERT [dbo].[PROMOTION] ([codePromo], [Libelle]) VALUES (N'4', N'promo04')
INSERT [dbo].[PROMOTION] ([codePromo], [Libelle]) VALUES (N'5', N'promo05')
INSERT [dbo].[PROMOTION] ([codePromo], [Libelle]) VALUES (N'6', N'promo06')
INSERT [dbo].[PROPOSITION] ([idProposition], [enonce], [estBonne], [idQuestion]) VALUES (1, N'MariaDB', 1, 1)
INSERT [dbo].[PROPOSITION] ([idProposition], [enonce], [estBonne], [idQuestion]) VALUES (2, N'MySQL', 1, 1)
INSERT [dbo].[PROPOSITION] ([idProposition], [enonce], [estBonne], [idQuestion]) VALUES (3, N'Oracle', 1, 1)
INSERT [dbo].[PROPOSITION] ([idProposition], [enonce], [estBonne], [idQuestion]) VALUES (4, N'Create Read Update Delete', 1, 2)
INSERT [dbo].[PROPOSITION] ([idProposition], [enonce], [estBonne], [idQuestion]) VALUES (5, N'Create Read Upgrade Delete', 0, 2)
INSERT [dbo].[PROPOSITION] ([idProposition], [enonce], [estBonne], [idQuestion]) VALUES (6, N'Create Remove Upgrade Delete', 0, 2)
INSERT [dbo].[PROPOSITION] ([idProposition], [enonce], [estBonne], [idQuestion]) VALUES (7, N'Create Remove Update Delete', 0, 2)
INSERT [dbo].[PROPOSITION] ([idProposition], [enonce], [estBonne], [idQuestion]) VALUES (8, N'class NomClass', 1, 3)
INSERT [dbo].[PROPOSITION] ([idProposition], [enonce], [estBonne], [idQuestion]) VALUES (9, N'class nomClass', 0, 3)
INSERT [dbo].[PROPOSITION] ([idProposition], [enonce], [estBonne], [idQuestion]) VALUES (10, N'new class NomClass', 0, 3)
INSERT [dbo].[PROPOSITION] ([idProposition], [enonce], [estBonne], [idQuestion]) VALUES (11, N'new class nomClass', 0, 3)
SET IDENTITY_INSERT [dbo].[QUESTION] ON 

INSERT [dbo].[QUESTION] ([idQuestion], [enonce], [media], [points], [idTheme]) VALUES (1, N'Donner un SGBD', NULL, 3, 1)
INSERT [dbo].[QUESTION] ([idQuestion], [enonce], [media], [points], [idTheme]) VALUES (2, N'Que signifie CRUD ?', NULL, 1, 1)
INSERT [dbo].[QUESTION] ([idQuestion], [enonce], [media], [points], [idTheme]) VALUES (3, N'Comment déclarer une classe ?', NULL, 10, 2)
SET IDENTITY_INSERT [dbo].[QUESTION] OFF
INSERT [dbo].[QUESTION_TIRAGE] ([estMarquee], [idQuestion], [numordre], [idEpreuve]) VALUES (0, 1, 1, 3)
INSERT [dbo].[QUESTION_TIRAGE] ([estMarquee], [idQuestion], [numordre], [idEpreuve]) VALUES (1, 2, 2, 6)
INSERT [dbo].[REPONSE_TIRAGE] ([idProposition], [idQuestion], [idEpreuve]) VALUES (1, 1, 3)
INSERT [dbo].[SECTION_TEST] ([nbQuestionsATirer], [idTest], [idTheme]) VALUES (4, 1, 1)
INSERT [dbo].[SECTION_TEST] ([nbQuestionsATirer], [idTest], [idTheme]) VALUES (4, 1, 2)
INSERT [dbo].[SECTION_TEST] ([nbQuestionsATirer], [idTest], [idTheme]) VALUES (6, 1, 4)
SET IDENTITY_INSERT [dbo].[TEST] ON 

INSERT [dbo].[TEST] ([idTest], [libelle], [description], [duree], [seuil_haut], [seuil_bas]) VALUES (1, N'Test SQL', N'Test sur le SQL', 120, 16, 10)
INSERT [dbo].[TEST] ([idTest], [libelle], [description], [duree], [seuil_haut], [seuil_bas]) VALUES (2, N'Test JAVA', N'Test sur le JAVA', 30, 16, 10)
INSERT [dbo].[TEST] ([idTest], [libelle], [description], [duree], [seuil_haut], [seuil_bas]) VALUES (3, N'Test PHP', N'Test sur le PHP', 240, 14, 8)
SET IDENTITY_INSERT [dbo].[TEST] OFF
INSERT [dbo].[THEME] ([idTheme], [libelle]) VALUES (1, N'SQL')
INSERT [dbo].[THEME] ([idTheme], [libelle]) VALUES (2, N'PHP')
INSERT [dbo].[THEME] ([idTheme], [libelle]) VALUES (3, N'JAVA')
INSERT [dbo].[THEME] ([idTheme], [libelle]) VALUES (4, N'POO')
SET IDENTITY_INSERT [dbo].[UTILISATEUR] ON 

INSERT [dbo].[UTILISATEUR] ([idUtilisateur], [nom], [prenom], [email], [password], [codeProfil], [codePromo]) VALUES (3, N'Hervé', N'Dupont', N'herve.dupont@gmail.com', N'03AC674216F3E15C761EE1A5E255F067953623C8B388B4459E13F978D7C846F4', 20, N'1       ')
INSERT [dbo].[UTILISATEUR] ([idUtilisateur], [nom], [prenom], [email], [password], [codeProfil], [codePromo]) VALUES (5, N'Arber', N'Drouin', N'arber.drouin@gmail.com', N'03AC674216F3E15C761EE1A5E255F067953623C8B388B4459E13F978D7C846F4', 20, N'1       ')
INSERT [dbo].[UTILISATEUR] ([idUtilisateur], [nom], [prenom], [email], [password], [codeProfil], [codePromo]) VALUES (6, N'Maureen', N'Leclair', N'MaureenLeclair@jourrapide.com', N'03AC674216F3E15C761EE1A5E255F067953623C8B388B4459E13F978D7C846F4', 30, NULL)
INSERT [dbo].[UTILISATEUR] ([idUtilisateur], [nom], [prenom], [email], [password], [codeProfil], [codePromo]) VALUES (7, N'Blanchefle', N'Auclair', N'BlanchefleAuclair@teleworm.us', N'03AC674216F3E15C761EE1A5E255F067953623C8B388B4459E13F978D7C846F4', 30, NULL)
INSERT [dbo].[UTILISATEUR] ([idUtilisateur], [nom], [prenom], [email], [password], [codeProfil], [codePromo]) VALUES (8, N'Catherine', N'Brian', N'
CatherineBrian@dayrep.com', N'03AC674216F3E15C761EE1A5E255F067953623C8B388B4459E13F978D7C846F4', 20, N'2       ')
INSERT [dbo].[UTILISATEUR] ([idUtilisateur], [nom], [prenom], [email], [password], [codeProfil], [codePromo]) VALUES (9, N'Archard', N'Godin', N'
ArchardGodin@dayrep.com', N'03AC674216F3E15C761EE1A5E255F067953623C8B388B4459E13F978D7C846F4', 40, NULL)
SET IDENTITY_INSERT [dbo].[UTILISATEUR] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [UTILISATEUR_EMAIL_UQ]    Script Date: 08/10/2018 16:28:33 ******/
ALTER TABLE [dbo].[UTILISATEUR] ADD  CONSTRAINT [UTILISATEUR_EMAIL_UQ] UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[EPREUVE]  WITH CHECK ADD  CONSTRAINT [Epreuve_Candidat_FK] FOREIGN KEY([idUtilisateur])
REFERENCES [dbo].[UTILISATEUR] ([idUtilisateur])
GO
ALTER TABLE [dbo].[EPREUVE] CHECK CONSTRAINT [Epreuve_Candidat_FK]
GO
ALTER TABLE [dbo].[EPREUVE]  WITH CHECK ADD  CONSTRAINT [Epreuve_Test_FK] FOREIGN KEY([idTest])
REFERENCES [dbo].[TEST] ([idTest])
GO
ALTER TABLE [dbo].[EPREUVE] CHECK CONSTRAINT [Epreuve_Test_FK]
GO
ALTER TABLE [dbo].[PROPOSITION]  WITH CHECK ADD  CONSTRAINT [Proposition_Question_FK] FOREIGN KEY([idQuestion])
REFERENCES [dbo].[QUESTION] ([idQuestion])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PROPOSITION] CHECK CONSTRAINT [Proposition_Question_FK]
GO
ALTER TABLE [dbo].[QUESTION]  WITH CHECK ADD  CONSTRAINT [Question_Theme_FK] FOREIGN KEY([idTheme])
REFERENCES [dbo].[THEME] ([idTheme])
GO
ALTER TABLE [dbo].[QUESTION] CHECK CONSTRAINT [Question_Theme_FK]
GO
ALTER TABLE [dbo].[QUESTION_TIRAGE]  WITH CHECK ADD  CONSTRAINT [Tirage_Epreuve_FK] FOREIGN KEY([idEpreuve])
REFERENCES [dbo].[EPREUVE] ([idEpreuve])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[QUESTION_TIRAGE] CHECK CONSTRAINT [Tirage_Epreuve_FK]
GO
ALTER TABLE [dbo].[QUESTION_TIRAGE]  WITH CHECK ADD  CONSTRAINT [Tirage_Question_FK] FOREIGN KEY([idQuestion])
REFERENCES [dbo].[QUESTION] ([idQuestion])
GO
ALTER TABLE [dbo].[QUESTION_TIRAGE] CHECK CONSTRAINT [Tirage_Question_FK]
GO
ALTER TABLE [dbo].[REPONSE_TIRAGE]  WITH CHECK ADD  CONSTRAINT [Reponse_Proposition_FK] FOREIGN KEY([idProposition], [idQuestion])
REFERENCES [dbo].[PROPOSITION] ([idProposition], [idQuestion])
GO
ALTER TABLE [dbo].[REPONSE_TIRAGE] CHECK CONSTRAINT [Reponse_Proposition_FK]
GO
ALTER TABLE [dbo].[REPONSE_TIRAGE]  WITH CHECK ADD  CONSTRAINT [Reponse_Tirage_FK] FOREIGN KEY([idQuestion], [idEpreuve])
REFERENCES [dbo].[QUESTION_TIRAGE] ([idQuestion], [idEpreuve])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[REPONSE_TIRAGE] CHECK CONSTRAINT [Reponse_Tirage_FK]
GO
ALTER TABLE [dbo].[SECTION_TEST]  WITH CHECK ADD  CONSTRAINT [Section_Test_FK] FOREIGN KEY([idTest])
REFERENCES [dbo].[TEST] ([idTest])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SECTION_TEST] CHECK CONSTRAINT [Section_Test_FK]
GO
ALTER TABLE [dbo].[SECTION_TEST]  WITH CHECK ADD  CONSTRAINT [Section_Theme_FK] FOREIGN KEY([idTheme])
REFERENCES [dbo].[THEME] ([idTheme])
GO
ALTER TABLE [dbo].[SECTION_TEST] CHECK CONSTRAINT [Section_Theme_FK]
GO
ALTER TABLE [dbo].[UTILISATEUR]  WITH CHECK ADD  CONSTRAINT [Candidat_Promotion_FK] FOREIGN KEY([codePromo])
REFERENCES [dbo].[PROMOTION] ([codePromo])
GO
ALTER TABLE [dbo].[UTILISATEUR] CHECK CONSTRAINT [Candidat_Promotion_FK]
GO
ALTER TABLE [dbo].[UTILISATEUR]  WITH CHECK ADD  CONSTRAINT [Utilisateur_Profil_FK] FOREIGN KEY([codeProfil])
REFERENCES [dbo].[PROFIL] ([codeProfil])
GO
ALTER TABLE [dbo].[UTILISATEUR] CHECK CONSTRAINT [Utilisateur_Profil_FK]
GO
ALTER TABLE [dbo].[EPREUVE]  WITH CHECK ADD CHECK  (([niveau_obtenu]='NA' OR [niveau_obtenu]='ECA' OR [niveau_obtenu]='A'))
GO
