-- -------------------------------------------FUNCIONES------------------------------------------------------

-- -------------------------------------------Obtener Promedio de Calificacion--------------------------------------------------------- 
DELIMITER $$

CREATE FUNCTION ObtenerCalificacionPromedio (pAnimeID INT)
RETURNS DECIMAL(3,2)
DETERMINISTIC
BEGIN
    DECLARE promedio DECIMAL(3,2);
    SELECT AVG(Puntuacion) INTO promedio FROM Calificacion WHERE AnimeID = pAnimeID;
    RETURN promedio;
END $$

DELIMITER ;

-- -------------------------------------------Obtener Cantidad de Episodios-------------------------------------------------------- 

DELIMITER $$

CREATE FUNCTION ObtenerCantidadEpisodios (pAnimeID INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE cantidad INT;
    SELECT COUNT(*) INTO cantidad FROM Episodio WHERE AnimeID = pAnimeID;
    RETURN cantidad;
END $$

DELIMITER ;

-- -------------------------------------------TESTING DE FUNCIONES------------------------------------------------------

SELECT ObtenerCantidadEpisodios(1) AS CantidadEpisodios;

SELECT ObtenerCalificacionPromedio(1) AS CalificacionPromedio;
