-- -------------------------------------------VISTAS------------------------------------------------------

-- -------------------------------------------------------------------------------------------------
-- Esta vista proporciona una lista detallada de animes, incluyendo su título, descripción, fecha de estreno, 
-- número de episodios, duración de episodios, nombre del estudio, género y plataforma de streaming asociada.

CREATE VIEW VistaAnimes AS
SELECT AnimeID, Titulo, FechaEstreno, NumeroEpisodios, DuracionEpisodio, EstudioID, GeneroID, PlataformaID
FROM Anime;

-- -------------------------------------------------------------------------------------------------
-- Esta vista proporciona una lista de todos los estudios de animación, incluyendo el nombre del estudio y 
-- la cantidad de animes que han producido.

CREATE VIEW VistaEpisodiosAnimes AS
SELECT e.TituloEpisodio, a.Titulo AS Anime, e.FechaEmision, e.Duracion, e.Director
FROM Episodio e
JOIN Anime a ON e.AnimeID = a.AnimeID;

-- -------------------------------------------------------------------------------------------------
-- Esta vista proporciona una lista de todos los géneros de anime, incluyendo el nombre del género y 
-- la cantidad de animes asociados a cada género.

CREATE VIEW VistaCalificacionesAnimes AS
SELECT c.Usuario, a.Titulo AS Anime, c.Puntuacion, c.Comentario, c.FechaCalificacion
FROM Calificacion c
JOIN Anime a ON c.AnimeID = a.AnimeID;

-- -------------------------------------------------------------------------------------------------
-- Esta vista proporciona una lista de personajes para cada anime, incluyendo el título del anime y 
-- el nombre del personaje.

CREATE VIEW VistaPersonajesAnimes AS
SELECT p.Nombre AS Personaje, a.Titulo AS Anime
FROM Personaje p
JOIN Anime a ON p.AnimeID = a.AnimeID;

-- -------------------------------------------------------------------------------------------------
-- Esta vista proporciona una lista de calificaciones para cada anime, incluyendo el título del anime, 
-- el nombre del usuario que calificó y la puntuación dada.

CREATE VIEW VistaAnimesEstudios AS
SELECT a.AnimeID, a.Titulo, a.FechaEstreno, a.NumeroEpisodios, a.DuracionEpisodio, e.Nombre AS Estudio
FROM Anime a
JOIN Estudio e ON a.EstudioID = e.EstudioID;


-- -------------------------------------------TESTING DE VISTAS------------------------------------------------------
SELECT * FROM VistaAnimes;
SELECT * FROM VistaEstudios;
SELECT * FROM VistaGeneros;
SELECT * FROM VistaPersonajesPorAnime;
SELECT * FROM VistaCalificaciones;
