						-- 			-----CREACION DE PROCEDIMIENTOS-----

-- -------------------------------------------Agregar Animes-------------------------------------------------------
DELIMITER $$

CREATE PROCEDURE AgregarAnime (
    IN pTitulo VARCHAR(255),
    IN pDescripcion TEXT,
    IN pFechaEstreno DATE,
    IN pNumeroEpisodios INT,
    IN pDuracionEpisodio INT,
    IN pEstudioID INT,
    IN pGeneroID INT,
    IN pPlataformaID INT
)
BEGIN
    INSERT INTO Anime (Titulo, Descripcion, FechaEstreno, NumeroEpisodios, DuracionEpisodio, EstudioID, GeneroID, PlataformaID)
    VALUES (pTitulo, pDescripcion, pFechaEstreno, pNumeroEpisodios, pDuracionEpisodio, pEstudioID, pGeneroID, pPlataformaID);
END $$

DELIMITER ;

-- -------------------------------------------Actualizar Datos de Animes-------------------------------------------------------
DELIMITER $$

CREATE PROCEDURE ActualizarAnime(
    IN p_AnimeID INT,
    IN p_Titulo VARCHAR(255),
    IN p_Descripcion TEXT,
    IN p_FechaEstreno DATE,
    IN p_NumeroEpisodios INT,
    IN p_DuracionEpisodio INT,
    IN p_EstudioID INT,
    IN p_GeneroID INT,
    IN p_PlataformaID INT
)
BEGIN
    UPDATE Anime
    SET 
        Titulo = p_Titulo,
        Descripcion = p_Descripcion,
        FechaEstreno = p_FechaEstreno,
        NumeroEpisodios = p_NumeroEpisodios,
        DuracionEpisodio = p_DuracionEpisodio,
        EstudioID = p_EstudioID,
        GeneroID = p_GeneroID,
        PlataformaID = p_PlataformaID
    WHERE AnimeID = p_AnimeID;
END $$

DELIMITER ;

-- -----------------------------------------Testing de Procedimientos-------------------------------------------------------
CALL AgregarAnime(
    'Mushoku Tensei: Isekai Ittara Honki Dasu',
    'Un hombre sin rumbo renace en un mundo de fantasía con el objetivo de vivir su vida al máximo.',
    '2021-01-11',
    23,
    24,
    5,  -- ID del estudio 
    5,  -- ID del género
    3   -- ID de la plataforma 
);

CALL ActualizarAnime(
    16,  -- ID de Mushoku Tensei 
    'Mushoku Tensei: Isekai Ittara Honki Dasu',  -- Nuevo título
    'Un hombre desempleado y sin esperanzas reencarna en un mundo de fantasía.',  -- Nueva descripción
    '2021-01-11',  -- Nueva fecha de estreno
    24,  -- Nuevo número de episodios
    23,  -- Duración de cada episodio en minutos
    8,  -- ID del estudio (por ejemplo, 8 es el ID de Studio Bind)
    5,  -- ID del género (por ejemplo, 5 es el ID de Fantasía)
    1  -- ID de la plataforma de streaming (por ejemplo, 1 es el ID de Crunchyroll)
);
