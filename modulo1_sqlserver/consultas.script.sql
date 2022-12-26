-- Listar las pistas (tabla Track) con precio mayor o igual a 1€
SELECT T.Name,
	   T.UnitPrice
FROM   dbo.Track T
WHERE  T.UnitPrice >= 1

-- Listar las pistas de más de 4 minutos de duración
SELECT T.Name,
	   T.Milliseconds
FROM   dbo.Track T
WHERE  T.Milliseconds > 240000

-- Listar las pistas que tengan entre 2 y 3 minutos de duración
SELECT T.Name,
	   T.Milliseconds
FROM   dbo.Track T
WHERE  T.Milliseconds BETWEEN  120000 AND 180000

-- Listar las pistas que uno de sus compositores (columna Composer) sea Mercury
SELECT *
FROM   dbo.Track T
WHERE  T.Composer LIKE '%Mercury%'

-- Calcular la media de duración de las pistas (Track) de la plataforma
SELECT AVG(T.Milliseconds)
FROM   dbo.Track T

-- Listar los clientes (tabla Customer) de USA, Canada y Brazil
SELECT C.FirstName, 
	   C.LastName,
	   C.Country
FROM   dbo.Customer C
WHERE C.Country IN ('usa', 'canada', 'brazil')

-- Listar todas las pistas del artista 'Queen' (Artist.Name = 'Queen')
SELECT T.Name,
	   Ar.Name
FROM dbo.Track T
INNER JOIN dbo.Album A
	ON T.AlbumId = A.AlbumId
INNER JOIN dbo.Artist Ar
	ON A.ArtistId = Ar.ArtistId
WHERE Ar.Name = 'Queen'

-- Listar las pistas del artista 'Queen' en las que haya participado como compositor David Bowie
SELECT T.Name,
	   Ar.Name,
	   T.Composer
FROM dbo.Track T
INNER JOIN dbo.Album A
	ON T.AlbumId = A.AlbumId
INNER JOIN dbo.Artist Ar
	ON A.ArtistId = Ar.ArtistId
WHERE Ar.Name = 'Queen' AND T.Composer LIKE '%David Bowie%'

-- Listar las pistas de la playlist 'Heavy Metal Classic'
SELECT T.Name,
	   PL.Name
FROM dbo.PlaylistTrack PT
INNER JOIN dbo.Track T
	ON PT.TrackId = T.TrackId
INNER JOIN dbo.Playlist PL
	ON PT.PlaylistId = PL.PlaylistId
WHERE PL.Name = 'Heavy Metal Classic'

-- Listar las playlist junto con el número de pistas que contienen
SELECT PL.Name, COUNT(*) as TrackCount
FROM dbo.PlaylistTrack PT
INNER JOIN dbo.Track T
	ON PT.TrackId = T.TrackId
INNER JOIN dbo.Playlist PL
	ON PT.PlaylistId = PL.PlaylistId
GROUP BY PL.Name

-- Listar las playlist (sin repetir ninguna) que tienen alguna canción de AC/DC
SELECT PL.Name, COUNT(*) as TrackCount
FROM dbo.PlaylistTrack PT
INNER JOIN dbo.Track T
	ON PT.TrackId = T.TrackId
INNER JOIN dbo.Playlist PL
	ON PT.PlaylistId = PL.PlaylistId
WHERE T.Composer = 'AC/DC'
GROUP BY PL.Name

-- Listar las playlist que tienen alguna canción del artista Queen, junto con la cantidad que tienen
SELECT PL.Name, COUNT(*) as TrackCount
FROM dbo.PlaylistTrack PT
INNER JOIN dbo.Track T
	ON PT.TrackId = T.TrackId
INNER JOIN dbo.Playlist PL
	ON PT.PlaylistId = PL.PlaylistId
WHERE T.Composer = 'Queen'
GROUP BY PL.Name

-- Listar las pistas que no están en ninguna playlist
SELECT T.Name,
	   PT.TrackId,
	   PL.PlaylistId
FROM dbo.PlaylistTrack PT
LEFT JOIN dbo.Track T
	ON PT.TrackId = T.TrackId
RIGHT JOIN dbo.Playlist PL
	ON PT.PlaylistId = PL.PlaylistId
WHERE PT.PlaylistId IS NULL

-- Listar los artistas que no tienen album
SELECT A.Name,
	   AL.AlbumId
FROM dbo.Artist A
LEFT JOIN dbo.Album AL
	ON A.ArtistId = AL.ArtistId
WHERE AL.AlbumId IS NULL

-- Listar los artistas con el número de albums que tienen(Para saber si está bien, asegurate que algunos de los artistas de la query anterior (artistas sin album) aparecen en este listado con 0 albums)
SELECT A.Name, COUNT(*) as NAlbumes
FROM dbo.Artist A
RIGHT JOIN dbo.Album AL
	ON A.ArtistId = AL.ArtistId
-- WHERE A.Name = 'Fernanda Porto'
GROUP BY A.Name