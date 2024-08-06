-- -------------------------------------------INFORMES------------------------------------------------------

-- -----------Informe de Animes por Género-------------------

SELECT g.Nombre AS Genero, COUNT(a.AnimeID) AS NumeroDeAnimes
FROM Genero g
LEFT JOIN AnimeGenero ag ON g.GeneroID = ag.GeneroID
LEFT JOIN Anime a ON ag.AnimeID = a.AnimeID
GROUP BY g.Nombre
ORDER BY NumeroDeAnimes DESC;

-- -----------Informe de Animes por Estudio---------------------

SELECT e.Nombre AS Estudio, COUNT(a.AnimeID) AS NumeroDeAnimes
FROM Estudio e
LEFT JOIN Anime a ON e.EstudioID = a.EstudioID
GROUP BY e.Nombre
ORDER BY NumeroDeAnimes DESC;


-- -----------Informe de Animes por Plataforma de Streaming-------------------

SELECT p.Nombre AS Plataforma, COUNT(a.AnimeID) AS NumeroDeAnimes
FROM PlataformaStreaming p
LEFT JOIN Anime a ON p.PlataformaID = a.PlataformaID
GROUP BY p.Nombre
ORDER BY NumeroDeAnimes DESC;

-- -----------Informe de Calificaciones Promedio por Anime--------------

SELECT a.Titulo AS Anime, AVG(c.Puntuacion) AS CalificacionPromedio
FROM Anime a
LEFT JOIN Calificacion c ON a.AnimeID = c.AnimeID
GROUP BY a.Titulo
ORDER BY CalificacionPromedio DESC;


-- -----------Informe de Personajes por Anime--------------------

SELECT a.Titulo AS Anime, COUNT(p.PersonajeID) AS NumeroDePersonajes
FROM Anime a
LEFT JOIN AnimePersonaje ap ON a.AnimeID = ap.AnimeID
LEFT JOIN Personaje p ON ap.PersonajeID = p.PersonajeID
GROUP BY a.Titulo
ORDER BY NumeroDePersonajes DESC;

-- -----------Informe de Episodios por Anime-------------------------

SELECT a.Titulo AS Anime, COUNT(e.EpisodioID) AS NumeroDeEpisodios
FROM Anime a
LEFT JOIN Episodio e ON a.AnimeID = e.AnimeID
GROUP BY a.Titulo
ORDER BY NumeroDeEpisodios DESC;

-- -----------Informe de Animes con sus Géneros------------------------

SELECT a.Titulo AS Anime, GROUP_CONCAT(g.Nombre SEPARATOR ', ') AS Generos
FROM Anime a
LEFT JOIN AnimeGenero ag ON a.AnimeID = ag.AnimeID
LEFT JOIN Genero g ON ag.GeneroID = g.GeneroID
GROUP BY a.Titulo
ORDER BY a.Titulo;


-- -----------Informe de Animes por Año de Estreno--------------

SELECT YEAR(FechaEstreno) AS Anio, COUNT(AnimeID) AS NumeroDeAnimes
FROM Anime
GROUP BY YEAR(FechaEstreno)
ORDER BY Anio DESC;


-- -----------Informe de Comentarios y Puntuaciones de Usuarios para un Anime específico------------

SELECT c.Usuario, c.Puntuacion, c.Comentario, c.FechaCalificacion
FROM Calificacion c
JOIN Anime a ON c.AnimeID = a.AnimeID
WHERE a.Titulo = 'Naruto'
ORDER BY c.FechaCalificacion DESC;


-- -----------Informe de Duración Total de los Animes------------------

SELECT a.Titulo AS Anime, SUM(e.Duracion) AS DuracionTotal
FROM Anime a
LEFT JOIN Episodio e ON a.AnimeID = e.AnimeID
GROUP BY a.Titulo
ORDER BY DuracionTotal DESC;