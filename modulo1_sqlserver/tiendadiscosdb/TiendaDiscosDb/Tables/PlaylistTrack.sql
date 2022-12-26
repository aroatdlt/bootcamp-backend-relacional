CREATE TABLE [dbo].[PlaylistTrack]
(
	[PlaylistId] [int] NOT NULL,
	[TrackId] [int] NOT NULL,
	CONSTRAINT [PK_PlaylistTrack] PRIMARY KEY ([PlaylistId],[TrackId])
)
