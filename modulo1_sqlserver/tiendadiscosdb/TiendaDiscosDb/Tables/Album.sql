CREATE TABLE [dbo].[Album]
(
	[AlbumId] [int] NOT NULL,
	[Title] [nvarchar](160) NOT NULL,
	[ArtistId] [int] NOT NULL,
	CONSTRAINT [PK_Album] PRIMARY KEY ([AlbumId])
)
