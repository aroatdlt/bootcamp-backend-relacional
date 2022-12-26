-- Listar las pistas ordenadas por el número de veces que aparecen en playlists de forma descendente
SELECT T.Name, COUNT(*) as TrackCount
FROM dbo.PlaylistTrack PT
INNER JOIN dbo.Track T
	ON PT.TrackId = T.TrackId
INNER JOIN dbo.Playlist PL
	ON PT.PlaylistId = PL.PlaylistId
GROUP BY T.Name
ORDER BY COUNT(*) DESC
-- Listar las pistas más compradas (la tabla InvoiceLine tiene los registros de compras)
SELECT T.Name, COUNT(*) as TrackCount
FROM dbo.Track T
INNER JOIN dbo.InvoiceLine IL
	ON T.TrackId = IL.TrackId
GROUP BY T.Name
ORDER BY COUNT(*) DESC

-- Listar los artistas más comprados
SELECT A.Name, COUNT(*) as TrackCount
FROM dbo.Artist A
INNER JOIN dbo.Album AL
	ON A.ArtistId = AL.ArtistId
INNER JOIN dbo.Track T
	ON AL.AlbumId = T.AlbumId
INNER JOIN dbo.InvoiceLine IL
	ON T.TrackId = IL.TrackId
GROUP BY A.Name
ORDER BY COUNT(*) DESC

-- Listar las pistas que aún no han sido compradas por nadie
-- Listar los artistas que aún no han vendido ninguna pista