SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[ContextKey] [nvarchar](300) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Name] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ClaimType] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ClaimValue] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[User_Id] [nvarchar](128) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[UserId] [nvarchar](128) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[LoginProvider] [nvarchar](128) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[ProviderKey] [nvarchar](128) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[RoleId] [nvarchar](128) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[UserName] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[PasswordHash] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SecurityStamp] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Discriminator] [nvarchar](128) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Authors](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](60) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Surname] [nvarchar](60) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 CONSTRAINT [PK_dbo.Authors] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Books](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](60) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[ReleaseDate] [datetime] NOT NULL,
	[Genre] [nvarchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[AuthorID] [int] NOT NULL,
 CONSTRAINT [PK_dbo.Books] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'201601131252100_Init', N'MvcBook.Migrations.Configuration', 0x1F8B0800000000000400DD5CDD6EEC3410BE47E21DA25C0112DDB6474270B40BEA694FA182B647670BB7959B78B716F923F196F6D9B8E0917805ECC449ECF827CEEF6E7B73B4C7B167C6339FEDF178A6FFFDF3EFF2A7E730709E609AA1385AB92747C7AE03232FF651B45DB93BBCF9F67BF7A71FBFFC62F9D10F9F9D3FCA7EEF683F3232CA56EE23C6C9FBC522F31E6108B2A31079699CC51B7CE4C5E102F8F1E2F4F8F887C5C9C90212122EA1E538CBCFBB08A310E6FF21FF3D8F230F26780782EBD88741C6DAC997754ED5B90121CC12E0C1957BFDE47D88E33F8F8A9EAE73162040A458C360E33A208A620C3091F1FDEF195CE3348EB6EB843480E0EE2581A4DF06041964B2BFAFBBDB4EE3F8944E63510FECA506B79A2099E247A20AFC42C5CBA7B972CF76F8314EF93EA4D7AFF04568204D9FD23881297EF90C376CE4D585EB2CC4718BE6C06A1837863227BF22FCEED4756E7641001E0258E98A53EA1AC729FC1946300518FA9F00C63025BABBF2613E09897B8317FDB7E4468C4330E63AD7E0F937186DF1E3CAFD8E80EA123D43BF6C6002FC1E2182483206A73BA810D0CC74BD4BA3E9F92E17B51D8DD6A5E07D8BB6BD433898DFB89F610041062F88C8256FFAFB0E85DD6991B9A7A619BC9B6406C56A6FB75483CA0D7842DBDC704A7AAE4334937FCE1E51526C8F47147AF7E5F7CB340E3FC70143246BBE5FC7BBD4A34A88E56F7720DD42DC13F6258C28D95EF0F77BC0DF3758F3E4F4FB29CCD9B2C5919F33EE35A5D2C959D8EF3C79254AA7F39B43F132E74F20CBFE8E53FF17903D8EC0BDE52483DE2E25E65C631026E373D36E29E7014061A6DC527884E5DDEE73AC71BB8BBA47B599941B8DA65BB91FD98AFA5BBC4551BBA87937A3A8750FA3A85CB7AEA25262ED92DEB36E6A298BAFD2AEADE832CAE65D1967FECD647A07269F186536F93ACE39FD0182DD04ACB4702BC03EE61236A14EB1D207232F5F6B7D904707CBE85376CD7990E627E4531D588C283B1349BAE3BB946CEE03B331CDB9D90B3A9B9CF9B025D1E9A8302D09C589327849F4F5A63BAC08CAA2CFD6BD2F6897F2EE0F56B951DA60453BDD173DD5A8AA3A184155F752616A30F8ADBC0F937FD470507A01BE90F403B9E6339B36A56CD095036A4912202F9FA7929682C65996C51ECA8770719B7B6568EE63E43B869B74CD270FFD38D7BB00232A101172E57E23594C4DAE52724DAEBCC98B044FDCE69ABE8D2E60003174CEBC22D4790E320FF832A289417CB1856C0330A58A06C13901094E018AB0BC67A0C8430908F46237865806B8A84815F1E6970B98C0888240AF7B1BAE75F845E65DB168A8A94D2BCB05071F33AA34CE970E116D9E987A7D142E7B07E0B5DDD974CB702A24F654287774DBCC54758EAB675A78A23D15AABA59CEADD0BE4BDB3C0FAB55AEF23AEC57B9D95E3602685D9FB9977BED01D8A046E10EA84153F814FDA0297B130A262A0687854C691A330353B2950D7FB59FBD075C329FCF062FCDF0D31EB631A3602DFBABDD52190C47514B336351D4C4816D9085A74EC6603202A6B2BB7EF1403FC2672CC1910E5C432C7871E4A252FBFE0D2759DAFF4402D47B540D2F5CF696C1EC92240D1677CC162254ED2622F22545414472DCDA2832D7B003D932C26E24CB1CA40E64DB7458AFD706510E5AA239AB974EAE87E221B48972F36DAE9A420519699998EF6F1C810AB4CD4D4E9C92C57475215C79E636F78D2E370E6E3A2AEC1994D372C7E008B39531AA96F8A89E594BBA4B44976B84464BE552B2D492E2E230B196B8209559491A5FB68337AB5111DB162C3524FBAF1C5925A9810A2AE36366EDA83C2A5B9FAACDC2B62E5017FD1A945206EDAA33BBFAB65C14B97AAC61B9D024F52DAF4192A068CB25F9B116675D64F89D7FBBEE9E55171634165EA648AEABA4AD38E138055BD8F84A5813492F519AE10B80C103A051DF733F94BA75F1504A96A2A322DBB03CF7CAFEF4773146CC783C529F5BB51A2FC9CC42EA0CE6EFA1D279230F74689A250840AAC81E3B8F835D18E90374FAD1453E063FBE68B1A75025EEF144AA4699CE72D1D080E4C04A5A966E17A2D1AC4C5AF801030C2A67045A99533D6C1A63DE15C97D3C01D6644F4348D5E329091FECE9B1743D9E126BB2A751477F7932FA98F0DE40A63B41AC41A6CFBFCB29B581CD3C5C0B3ABF013AC5B5523FDA7E07D993518A03B98B51AE32FAFB76F395C63A94E2D703CCA37253A7324F9D74C7D3A85BED298949743C35F14B87A343CC94130E10F1D3F860EAB62ED516DBB7C1894FE3A33C3E98A729956FB0FCD80B9479290A5104B01C5F995F8FCD37DEC357A9F42A7DC0DA35EBE6E0542BC6CC66D56BCFA344113C19C95C8A7CCDCE36D3D098E65CE1F23079225C73475A2CD35222C6DA0F12032C343412061499939D31A0A161F20E9A38D0BD2CE8A934F21479622D999A7A9A42F2A1E06CE833390F0415A3DD02D4B9839D31D1ED36300E24CA7752E106A9793B9DDE6862A0AC654F67F166FB6D9B0DE8BC35D390A0B4279BC2EDB2DEAC36F69C84FAAD9093A0B770DA17D3DEA78E5EAE66CC53B6B614FA6C76A9B05685401BA1CE250B3BB617394B71C8A28BEB947B14B9C7BC64188647B4C3D1FAAFE03C40448775876B10A10DCCF05DFC278C56EEE9F1C969A356BA47DDF222CBFCE0308B97119D7C6B05C88062BEE809A4DE2348A5A2D661E5C8FDC81E78B5F124C6B8E30B8CC7B286A27ED827BFF1E0FA61A580EFBA0BD82C0FCE553B6E75E87E4A72950ACA73F34758A45F85E0F9EBB751453B9A9EEAC85C775DC9D45485AF5A8ABD8B5B07516CDCF507A9F335954A4EB2FB4AD591834C2357400E2257F9A1F3DBF8CD17258EB6FF286B0E47A3AE28299C1306AFA6106F34858B757623EBBA5FF95599F0376F8D9498EFD7A3E0AB5782B1360B6492C2AA375E4A7548A9EB2C23775829D7E09CF5B9D3D475AF14EA1D5313739A19641DCBCB0E09642C3F7B5879DBAB0399EE19E44D14891569BAFBA8D7D2E7E2EEB3F246F3BC3179E1D79B2DF63AA4FD6BDFE0DAC7EE650DAEBD1770C959D44D9BB2A72CF1CD405FBC55BC7EAC5CFF2126562F6E13BAEA9926F1C207974817CD2AC2CABA1E6DED52013689BCF859297F96DC40ACCEBFD7312B569B96197B2DD43253978898983177D3C891F531B3551704B5179AD9D5999979ABCB6C5AABD1AC8AD1CC9CD5D69DAE624D5C487CD27F5B999A54D9F67AAAD2B4B52DDDCACFCCB56CAFA7FC6CB83A8485A7C9037A057566FC1A9673D8BB949419ABA70EBFA26C3822C65442870A32395D82B82ADC5F8E27EE5286B635099A081A414F7052AA3E57D1262E7DA5864465974684F31A62E0130FE62CC568033C4C3E7B30CBF2BF27C6124D3F860FD0BF8A6E7738D9613265183E0442C49DFA5C26FE79999C28F3F236C9FF22D71853206222FA9E7D1B7DD8A1C0AFE4BE5484623524A833C7DE91A82D317D4FDABE54946EE2C89210535FE583DEC1300908B1EC365A8327A897AD5D87A2C69617086C5310668C463D9EFC97C0CF0F9F7FFC1F4FB9BC5BFB600000, N'6.0.0-20911')
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'0b5ab548-6b0f-47e4-8e6a-e238543e5aef', N'Admin')
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'27034b2a-5780-4d9c-9506-7845ee1f4b81', N'Employee')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'6edf0667-6dc3-4a79-b722-cb2b7b529b83', N'27034b2a-5780-4d9c-9506-7845ee1f4b81')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'b96780ff-aad7-49ce-90d7-0f738d51795f', N'0b5ab548-6b0f-47e4-8e6a-e238543e5aef')
GO
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [PasswordHash], [SecurityStamp], [Discriminator]) VALUES (N'4c277b1f-2cc5-4b5f-8823-2d179790d7d8', N'klaudiaPal', N'AK2A4DgdFZCaxDtdCyfL9sPUJofrMr5kCx7c1LENgKuyECN5C3c9eRvd5trHyk857A==', N'1a06b6c3-6060-4ea8-8426-c5a28a094995', N'ApplicationUser')
GO
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [PasswordHash], [SecurityStamp], [Discriminator]) VALUES (N'6edf0667-6dc3-4a79-b722-cb2b7b529b83', N'Klaudia', N'AO5nr5skQsUVBeETKyXWfkpApFUmqiOFv/YDRIVRcrcSRPgKvn+uWkS4wI783/zBLw==', N'efb80aec-63b5-4042-8d5b-1f6b13f5e1e9', N'ApplicationUser')
GO
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [PasswordHash], [SecurityStamp], [Discriminator]) VALUES (N'b96780ff-aad7-49ce-90d7-0f738d51795f', N'Admin', N'AOJ9eKzb6tlCy3xv1O7C5DHKOT7Ce97E+A4WSod5MsMwSLSePs9k687LnFBRJNiNoA==', N'6a7d92d3-90ab-4dd0-9698-c30373ceb5c0', N'ApplicationUser')
GO
SET IDENTITY_INSERT [dbo].[Authors] ON 

GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (1, N'Nicolas', N'Sparks')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (2, N'Dan', N'Brown')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (3, N'Gayle', N'Forman')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (4, N'Virginia', N'Andrews')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (5, N'Andy', N'Weir')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (6, N'William', N'Shakespeare')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (9, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (10, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (11, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (12, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (13, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (14, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (15, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (16, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (17, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (18, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (19, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (20, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (21, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (22, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (23, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (24, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (25, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (26, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (27, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (28, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (29, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (30, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (31, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (32, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (33, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (34, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (35, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (36, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (37, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (38, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (39, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (40, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (41, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (42, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (43, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (44, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (45, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (46, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (47, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (48, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (49, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (50, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (51, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (52, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (53, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (54, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (55, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (56, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (57, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (58, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (59, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (60, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (61, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (62, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (63, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (64, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (65, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (66, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (67, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (68, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (69, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (70, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (71, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (72, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (73, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (74, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (75, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (76, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (77, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (78, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (79, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (80, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (81, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (82, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (83, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (84, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (85, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (86, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (87, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (88, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (89, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (90, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (91, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (92, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (93, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (94, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (95, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (96, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (97, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (98, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (99, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (100, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (101, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (102, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (103, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (104, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (105, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (106, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (107, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (108, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (109, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (110, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (111, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (112, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (113, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (114, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (115, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (116, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (117, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (118, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (119, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (120, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (121, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (122, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (123, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (124, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (125, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (126, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (127, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (128, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (129, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (130, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (131, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (132, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (133, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (134, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (135, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (136, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (137, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (138, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (139, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (140, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (141, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (142, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (143, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (144, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (145, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (146, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (147, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (148, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (149, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (150, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (151, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (152, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (153, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (154, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (155, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (156, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (157, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (158, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (159, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (160, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (161, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (162, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (163, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (164, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (165, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (166, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (167, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (168, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (169, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (170, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (171, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (172, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (173, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (174, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (175, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (176, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (177, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (178, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (179, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (180, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (181, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (182, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (183, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (184, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (185, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (186, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (187, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (188, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (189, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (190, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (191, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (192, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (193, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (194, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (195, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (196, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (197, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (198, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (199, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (200, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (201, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (202, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (203, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (204, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (205, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (206, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (207, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (208, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (209, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (210, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (211, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (212, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (213, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (214, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (215, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (216, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (217, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (218, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (219, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (220, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (221, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (222, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (223, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (224, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (225, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (226, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (227, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (228, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (229, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (230, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (231, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (232, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (233, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (234, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (235, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (236, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (237, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (238, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (239, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (240, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (241, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (242, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (243, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (244, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (245, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (246, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (247, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (248, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (249, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (250, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (251, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (252, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (253, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (254, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (255, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (256, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (257, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (258, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (259, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (260, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (261, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (262, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (263, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (264, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (265, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (266, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (267, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (268, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (269, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (270, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (271, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (272, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (273, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (274, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (275, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (276, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (277, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (278, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (279, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (280, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (281, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (282, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (283, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (284, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (285, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (286, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (287, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (288, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (289, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (290, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (291, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (292, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (293, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (294, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (295, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (296, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (297, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (298, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (299, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (300, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (301, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (302, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (303, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (304, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (305, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (306, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (307, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (308, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (309, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (310, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (311, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (312, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (313, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (314, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (315, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (316, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (317, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (318, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (319, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (320, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (321, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (322, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (323, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (324, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (325, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (326, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (327, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (328, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (329, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (330, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (331, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (332, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (333, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (334, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (335, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (336, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (337, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (338, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (339, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (340, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (341, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (342, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (343, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (344, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (345, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (346, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (347, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (348, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (349, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (350, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (351, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (352, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (353, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (354, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (355, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (356, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (357, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (358, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (359, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (360, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (361, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (362, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (363, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (364, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (365, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (366, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (367, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (368, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (369, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (370, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (371, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (372, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (373, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (374, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (375, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (376, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (377, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (378, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (379, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (380, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (381, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (382, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (383, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (384, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (385, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (386, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (387, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (388, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (389, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (390, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (391, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (392, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (393, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (394, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (395, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (396, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (397, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (398, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (399, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (400, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (401, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (402, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (403, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (404, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (405, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (406, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (407, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (408, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (409, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (410, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (411, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (412, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (413, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (414, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (415, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (416, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (417, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (418, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (419, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (420, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (421, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (422, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (423, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (424, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (425, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (426, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (427, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (428, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (429, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (430, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (431, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (432, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (433, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (434, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (435, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (436, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (437, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (438, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (439, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (440, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (441, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (442, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (443, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (444, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (445, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (446, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (447, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (448, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (449, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (450, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (451, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (452, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (453, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (454, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (455, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (456, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (457, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (458, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (459, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (460, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (461, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (462, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (463, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (464, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (465, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (466, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (467, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (468, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (469, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (470, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (471, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (472, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (473, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (474, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (475, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (476, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (477, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (478, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (479, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (480, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (481, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (482, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (483, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (484, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (485, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (486, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (487, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (488, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (489, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (490, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (491, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (492, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (493, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (494, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (495, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (496, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (497, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (498, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (499, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (500, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (501, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (502, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (503, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (504, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (505, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (506, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (507, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (508, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (509, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (510, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (511, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (512, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (513, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (514, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (515, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (516, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (517, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (518, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (519, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (520, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (521, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (522, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (523, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (524, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (525, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (526, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (527, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (528, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (529, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (530, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (531, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (532, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (533, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (534, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (535, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (536, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (537, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (538, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (539, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (540, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (541, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (542, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (543, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (544, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (545, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (546, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (547, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (548, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (549, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (550, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (551, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (552, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (553, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (554, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (555, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (556, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (557, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (558, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (559, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (560, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (561, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (562, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (563, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (564, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (565, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (566, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (567, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (568, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (569, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (570, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (571, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (572, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (573, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (574, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (575, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (576, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (577, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (578, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (579, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (580, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (581, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (582, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (583, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (584, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (585, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (586, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (587, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (588, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (589, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (590, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (591, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (592, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (593, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (594, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (595, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (596, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (597, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (598, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (599, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (600, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (601, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (602, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (603, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (604, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (605, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (606, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (607, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (608, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (609, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (610, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (611, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (612, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (613, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (614, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (615, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (616, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (617, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (618, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (619, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (620, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (621, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (622, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (623, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (624, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (625, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (626, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (627, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (628, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (629, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (630, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (631, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (632, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (633, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (634, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (635, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (636, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (637, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (638, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (639, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (640, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (641, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (642, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (643, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (644, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (645, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (646, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (647, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (648, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (649, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (650, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (651, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (652, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (653, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (654, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (655, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (656, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (657, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (658, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (659, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (660, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (661, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (662, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (663, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (664, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (665, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (666, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (667, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (668, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (669, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (670, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (671, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (672, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (673, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (674, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (675, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (676, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (677, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (678, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (679, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (680, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (681, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (682, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (683, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (684, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (685, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (686, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (687, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (688, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (689, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (690, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (691, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (692, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (693, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (694, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (695, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (696, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (697, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (698, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (699, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (700, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (701, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (702, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (703, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (704, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (705, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (706, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (707, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (708, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (709, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (710, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (711, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (712, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (713, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (714, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (715, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (716, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (717, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (718, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (719, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (720, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (721, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (722, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (723, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (724, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (725, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (726, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (727, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (728, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (729, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (730, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (731, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (732, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (733, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (734, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (735, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (736, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (737, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (738, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (739, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (740, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (741, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (742, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (743, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (744, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (745, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (746, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (747, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (748, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (749, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (750, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (751, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (752, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (753, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (754, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (755, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (756, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (757, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (758, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (759, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (760, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (761, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (762, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (763, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (764, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (765, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (766, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (767, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (768, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (769, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (770, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (771, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (772, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (773, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (774, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (775, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (776, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (777, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (778, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (779, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (780, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (781, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (782, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (783, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (784, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (785, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (786, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (787, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (788, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (789, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (790, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (791, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (792, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (793, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (794, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (795, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (796, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (797, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (798, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (799, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (800, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (801, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (802, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (803, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (804, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (805, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (806, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (807, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (808, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (809, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (810, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (811, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (812, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (813, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (814, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (815, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (816, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (817, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (818, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (819, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (820, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (821, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (822, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (823, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (824, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (825, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (826, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (827, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (828, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (829, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (830, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (831, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (832, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (833, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (834, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (835, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (836, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (837, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (838, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (839, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (840, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (841, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (842, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (843, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (844, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (845, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (846, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (847, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (848, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (849, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (850, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (851, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (852, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (853, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (854, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (855, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (856, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (857, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (858, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (859, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (860, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (861, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (862, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (863, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (864, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (865, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (866, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (867, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (868, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (869, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (870, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (871, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (872, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (873, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (874, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (875, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (876, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (877, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (878, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (879, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (880, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (881, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (882, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (883, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (884, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (885, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (886, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (887, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (888, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (889, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (890, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (891, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (892, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (893, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (894, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (895, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (896, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (897, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (898, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (899, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (900, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (901, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (902, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (903, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (904, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (905, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (906, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (907, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (908, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (909, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (910, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (911, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (912, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (913, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (914, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (915, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (916, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (917, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (918, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (919, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (920, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (921, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (922, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (923, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (924, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (925, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (926, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (927, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (928, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (929, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (930, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (931, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (932, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (933, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (934, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (935, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (936, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (937, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (938, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (939, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (940, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (941, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (942, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (943, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (944, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (945, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (946, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (947, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (948, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (949, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (950, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (951, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (952, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (953, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (954, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (955, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (956, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (957, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (958, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (959, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (960, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (961, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (962, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (963, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (964, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (965, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (966, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (967, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (968, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (969, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (970, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (971, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (972, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (973, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (974, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (975, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (976, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (977, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (978, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (979, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (980, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (981, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (982, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (983, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (984, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (985, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (986, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (987, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (988, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (989, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (990, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (991, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (992, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (993, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (994, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (995, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (996, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (997, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (998, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (999, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (1000, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (1001, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (1002, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (1003, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (1004, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (1005, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (1006, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (1007, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (1008, N'Joanne', N'Murray')
GO
INSERT [dbo].[Authors] ([ID], [Name], [Surname]) VALUES (1009, N'Joanne', N'Murray')
GO
SET IDENTITY_INSERT [dbo].[Authors] OFF
GO
SET IDENTITY_INSERT [dbo].[Books] ON 

GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (1, N'The Da Vinci Code', CAST(N'2003-03-18T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (2, N'The Notebook', CAST(N'1996-11-01T00:00:00.000' AS DateTime), N'Love story', 1)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (4, N'If I Stay', CAST(N'2009-04-19T00:00:00.000' AS DateTime), N'Novel', 3)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (5, N'Where She Went', CAST(N'2011-04-30T00:00:00.000' AS DateTime), N'Novel', 3)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (6, N'Deception Point', CAST(N'2001-02-06T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (7, N'A Bend in the Road', CAST(N'2001-08-21T00:00:00.000' AS DateTime), N'Love story', 1)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (8, N'The Longest Ride', CAST(N'2014-09-13T00:00:00.000' AS DateTime), N'Love story', 1)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (9, N'Angels and Demons', CAST(N'2000-01-26T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (29, N'New', CAST(N'2015-10-19T00:00:00.000' AS DateTime), N'Thriller', 1)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (32, N'New', CAST(N'2015-12-15T00:00:00.000' AS DateTime), N'Comedy', 1)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (33, N'Inferno', CAST(N'2013-10-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (34, N'Zaginiony Symbol', CAST(N'2009-03-12T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (41, N'Romeo i Julia', CAST(N'2015-10-19T00:00:00.000' AS DateTime), N'Love story', 6)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (42, N'Test', CAST(N'1999-12-12T00:00:00.000' AS DateTime), N'Thriller', 1)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (43, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (44, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (45, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (46, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (47, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (48, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (49, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (50, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (51, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (52, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (53, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (54, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (55, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (56, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (57, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (58, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (59, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (60, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (61, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (62, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (63, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (64, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (65, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (66, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (67, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (68, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (69, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (70, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (71, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (72, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (73, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (74, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (75, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (76, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (77, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (78, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (79, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (80, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (81, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (82, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (83, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (84, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (85, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (86, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (87, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (88, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (89, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (90, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (91, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (92, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (93, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (94, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (95, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (96, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (97, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (98, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (99, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (100, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (101, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (102, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (103, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (104, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (105, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (106, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (107, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (108, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (109, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (110, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (111, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (112, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (113, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (114, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (115, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (116, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (117, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (118, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (119, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (120, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (121, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (122, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (123, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (124, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (125, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (126, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (127, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (128, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (129, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (130, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (131, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (132, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (133, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (134, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (135, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (136, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (137, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (138, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (139, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (140, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (141, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (142, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (143, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (144, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (145, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (146, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (147, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (148, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (149, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (150, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (151, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (152, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (153, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (154, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (155, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (156, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (157, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (158, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (159, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (160, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (161, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (162, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (163, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (164, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (165, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (166, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (167, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (168, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (169, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (170, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (171, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (172, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (173, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (174, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (175, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (176, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (177, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (178, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (179, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (180, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (181, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (182, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (183, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (184, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (185, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (186, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (187, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (188, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (189, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (190, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (191, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (192, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (193, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (194, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (195, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (196, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (197, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (198, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (199, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (200, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (201, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (202, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (203, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (204, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (205, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (206, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (207, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (208, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (209, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (210, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (211, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (212, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (213, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (214, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (215, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (216, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (217, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (218, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (219, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (220, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (221, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (222, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (223, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (224, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (225, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (226, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (227, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (228, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (229, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (230, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (231, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (232, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (233, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (234, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (235, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (236, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (237, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (238, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (239, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (240, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (241, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (242, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (243, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (244, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (245, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (246, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (247, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (248, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (249, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (250, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (251, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (252, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (253, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (254, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (255, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (256, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (257, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (258, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (259, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (260, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (261, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (262, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (263, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (264, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (265, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (266, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (267, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (268, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (269, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (270, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (271, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (272, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (273, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (274, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (275, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (276, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (277, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (278, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (279, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (280, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (281, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (282, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (283, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (284, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (285, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (286, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (287, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (288, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (289, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (290, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (291, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (292, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (293, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (294, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (295, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (296, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (297, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (298, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (299, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (300, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (301, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (302, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (303, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (304, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (305, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (306, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (307, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (308, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (309, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (310, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (311, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (312, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (313, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (314, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (315, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (316, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (317, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (318, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (319, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (320, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (321, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (322, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (323, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (324, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (325, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (326, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (327, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (328, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (329, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (330, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (331, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (332, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (333, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (334, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (335, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (336, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (337, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (338, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (339, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (340, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (341, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (342, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (343, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (344, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (345, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (346, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (347, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (348, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (349, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (350, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (351, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (352, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (353, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (354, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (355, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (356, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (357, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (358, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (359, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (360, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (361, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (362, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (363, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (364, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (365, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (366, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (367, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (368, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (369, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (370, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (371, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (372, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (373, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (374, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (375, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (376, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (377, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (378, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (379, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (380, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (381, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (382, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (383, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (384, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (385, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (386, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (387, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (388, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (389, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (390, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (391, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (392, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (393, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (394, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (395, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (396, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (397, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (398, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (399, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (400, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (401, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (402, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (403, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (404, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (405, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (406, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (407, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (408, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (409, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (410, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (411, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (412, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (413, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (414, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (415, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (416, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (417, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (418, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (419, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (420, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (421, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (422, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (423, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (424, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (425, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (426, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (427, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (428, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (429, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (430, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (431, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (432, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (433, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (434, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (435, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (436, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (437, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (438, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (439, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (440, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (441, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (442, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (443, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (444, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (445, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (446, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (447, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (448, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (449, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (450, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (451, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (452, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (453, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (454, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (455, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (456, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (457, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (458, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (459, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (460, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (461, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (462, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (463, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (464, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (465, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (466, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (467, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (468, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (469, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (470, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (471, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (472, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (473, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (474, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (475, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (476, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (477, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (478, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (479, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (480, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (481, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (482, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (483, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (484, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (485, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (486, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (487, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (488, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (489, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (490, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (491, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (492, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (493, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (494, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (495, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (496, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (497, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (498, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (499, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (500, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (501, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (502, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (503, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (504, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (505, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (506, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (507, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (508, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (509, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (510, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (511, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (512, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (513, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (514, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (515, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (516, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (517, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (518, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (519, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (520, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (521, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (522, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (523, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (524, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (525, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (526, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (527, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (528, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (529, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (530, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (531, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (532, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (533, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (534, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (535, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (536, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (537, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (538, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (539, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (540, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (541, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (542, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (543, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (544, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (545, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (546, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (547, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (548, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (549, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (550, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (551, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (552, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (553, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (554, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (555, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (556, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (557, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (558, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (559, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (560, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (561, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (562, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (563, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (564, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (565, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (566, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (567, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (568, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (569, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (570, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (571, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (572, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (573, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (574, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (575, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (576, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (577, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (578, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (579, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (580, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (581, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (582, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (583, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (584, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (585, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (586, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (587, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (588, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (589, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (590, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (591, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (592, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (593, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (594, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (595, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (596, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (597, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (598, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (599, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (600, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (601, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (602, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (603, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (604, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (605, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (606, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (607, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (608, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (609, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (610, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (611, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (612, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (613, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (614, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (615, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (616, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (617, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (618, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (619, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (620, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (621, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (622, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (623, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (624, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (625, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (626, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (627, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (628, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (629, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (630, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (631, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (632, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (633, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (634, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (635, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (636, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (637, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (638, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (639, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (640, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (641, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (642, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (643, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (644, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (645, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (646, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (647, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (648, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (649, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (650, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (651, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (652, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (653, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (654, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (655, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (656, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (657, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (658, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (659, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (660, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (661, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (662, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (663, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (664, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (665, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (666, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (667, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (668, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (669, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (670, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (671, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (672, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (673, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (674, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (675, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (676, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (677, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (678, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (679, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (680, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (681, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (682, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (683, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (684, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (685, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (686, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (687, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (688, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (689, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (690, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (691, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (692, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (693, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (694, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (695, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (696, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (697, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (698, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (699, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (700, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (701, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (702, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (703, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (704, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (705, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (706, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (707, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (708, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (709, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (710, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (711, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (712, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (713, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (714, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (715, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (716, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (717, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (718, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (719, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (720, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (721, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (722, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (723, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (724, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (725, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (726, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (727, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (728, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (729, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (730, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (731, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (732, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (733, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (734, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (735, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (736, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (737, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (738, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (739, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (740, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (741, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (742, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (743, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (744, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (745, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (746, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (747, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (748, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (749, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (750, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (751, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (752, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (753, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (754, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (755, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (756, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (757, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (758, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (759, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (760, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (761, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (762, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (763, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (764, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (765, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (766, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (767, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (768, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (769, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (770, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (771, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (772, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (773, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (774, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (775, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (776, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (777, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (778, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (779, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (780, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (781, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (782, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (783, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (784, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (785, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (786, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (787, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (788, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (789, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (790, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (791, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (792, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (793, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (794, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (795, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (796, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (797, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (798, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (799, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (800, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (801, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (802, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (803, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (804, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (805, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (806, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (807, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (808, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (809, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (810, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (811, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (812, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (813, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (814, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (815, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (816, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (817, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (818, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (819, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (820, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (821, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (822, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (823, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (824, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (825, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (826, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (827, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (828, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (829, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (830, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (831, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (832, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (833, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (834, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (835, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (836, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (837, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (838, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (839, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (840, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (841, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (842, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (843, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (844, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (845, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (846, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (847, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (848, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (849, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (850, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (851, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (852, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (853, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (854, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (855, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (856, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (857, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (858, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (859, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (860, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (861, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (862, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (863, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (864, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (865, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (866, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (867, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (868, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (869, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (870, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (871, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (872, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (873, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (874, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (875, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (876, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (877, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (878, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (879, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (880, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (881, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (882, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (883, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (884, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (885, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (886, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (887, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (888, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (889, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (890, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (891, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (892, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (893, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (894, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (895, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (896, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (897, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (898, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (899, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (900, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (901, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (902, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (903, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (904, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (905, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (906, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (907, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (908, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (909, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (910, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (911, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (912, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (913, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (914, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (915, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (916, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (917, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (918, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (919, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (920, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (921, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (922, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (923, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (924, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (925, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (926, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (927, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (928, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (929, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (930, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (931, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (932, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (933, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (934, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (935, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (936, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (937, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (938, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (939, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (940, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (941, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (942, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (943, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (944, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (945, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (946, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (947, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (948, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (949, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (950, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (951, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (952, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (953, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (954, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (955, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (956, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (957, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (958, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (959, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (960, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (961, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (962, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (963, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (964, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (965, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (966, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (967, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (968, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (969, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (970, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (971, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (972, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (973, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (974, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (975, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (976, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (977, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (978, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (979, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (980, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (981, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (982, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (983, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (984, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (985, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (986, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (987, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (988, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (989, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (990, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (991, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (992, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (993, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (994, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (995, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (996, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (997, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (998, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (999, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (1000, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (1001, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (1002, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (1003, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (1004, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (1005, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (1006, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (1007, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (1008, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (1009, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (1010, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (1011, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (1012, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (1013, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (1014, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (1015, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (1016, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (1017, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (1018, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (1019, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (1020, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (1021, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (1022, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (1023, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (1024, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (1025, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (1026, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (1027, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (1028, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (1029, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (1030, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (1031, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (1032, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (1033, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (1034, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (1035, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (1036, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (1037, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (1038, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (1039, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (1040, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (1041, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (1042, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (1043, N'Digital Fortress', CAST(N'1998-06-10T00:00:00.000' AS DateTime), N'Thriller', 2)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (1044, N'Test', CAST(N'2016-05-05T00:00:00.000' AS DateTime), N'Comedy', 1)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (1045, N'Test', CAST(N'2016-05-05T00:00:00.000' AS DateTime), N'Comedy', 1)
GO
INSERT [dbo].[Books] ([ID], [Title], [ReleaseDate], [Genre], [AuthorID]) VALUES (1046, N'Test', CAST(N'2016-05-05T00:00:00.000' AS DateTime), N'Comedy', 1)
GO
SET IDENTITY_INSERT [dbo].[Books] OFF
GO
SET ANSI_PADDING ON

GO
CREATE NONCLUSTERED INDEX [IX_User_Id] ON [dbo].[AspNetUserClaims]
(
	[User_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
SET ANSI_PADDING ON

GO
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
SET ANSI_PADDING ON

GO
CREATE NONCLUSTERED INDEX [IX_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
SET ANSI_PADDING ON

GO
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserRoles]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
CREATE NONCLUSTERED INDEX [IX_AuthorID] ON [dbo].[Books]
(
	[AuthorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_User_Id] FOREIGN KEY([User_Id])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_User_Id]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[Books]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Books_dbo.Authors_AuthorID] FOREIGN KEY([AuthorID])
REFERENCES [dbo].[Authors] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Books] CHECK CONSTRAINT [FK_dbo.Books_dbo.Authors_AuthorID]
GO
