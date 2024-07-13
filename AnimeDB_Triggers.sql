-- -------------------------------------------TRIGGERS------------------------------------------------------

-- -------------------------------------------------------------------------------------------------
-- Este trigger se activa antes de actualizar un registro en la tabla Anime. 
-- Asegura que todas las relaciones asociadas al anime en las tablas Calificacion, 
-- Episodio y Personaje se eliminen para mantener la integridad referencial de la base de datos.
DELIMITER $$

CREATE TRIGGER BeforeUpdateAnime
BEFORE UPDATE ON Anime
FOR EACH ROW
BEGIN
    DELETE FROM Calificacion WHERE AnimeID = OLD.AnimeID;
    DELETE FROM Episodio WHERE AnimeID = OLD.AnimeID;
    DELETE FROM Personaje WHERE AnimeID = OLD.AnimeID;
END $$

DELIMITER ;

-- -------------------------------------------------------------------------------------------------
-- Este trigger se activa después de insertar una nueva calificación. 
-- Calcula el nuevo promedio de calificaciones para el anime correspondiente y 
-- actualiza el campo CalificacionPromedio en la tabla Anime.
DELIMITER $$

CREATE TRIGGER AfterInsertCalificacion
AFTER INSERT ON Calificacion
FOR EACH ROW
BEGIN
    DECLARE nuevoPromedio DECIMAL(3,2);
    SET nuevoPromedio = (SELECT AVG(Puntuacion) FROM Calificacion WHERE AnimeID = NEW.AnimeID);
    UPDATE Anime SET CalificacionPromedio = nuevoPromedio WHERE AnimeID = NEW.AnimeID;
END $$

DELIMITER ;

-- -------------------------------------------TESTING TRIGGERS------------------------------------------------------
SELECT 
    TRIGGER_NAME,
    EVENT_MANIPULATION,
    EVENT_OBJECT_TABLE,
    ACTION_STATEMENT,
    ACTION_TIMING
FROM 
    information_schema.TRIGGERS
WHERE 
    TRIGGER_SCHEMA = 'AnimeDB';
