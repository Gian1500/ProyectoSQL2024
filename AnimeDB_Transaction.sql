-- -------------------------------------------SAVEPOINT, COMMIT Y TRANSACTION------------------------------------------------------
START TRANSACTION;

-- Intentamos insertar un nuevo estudio
INSERT INTO Estudio (Nombre, Fundacion, Sede, SitioWeb) VALUES
('Trigger', 2011, 'Tokyo, Japan', 'http://www.st-trigger.co.jp');

-- Creamos un punto de guardado
SAVEPOINT afterEstudioInsert;

-- Intentamos insertar un nuevo género
INSERT INTO Genero (Nombre, Descripcion) VALUES
('Mecha', 'Género que involucra robots gigantes');

-- Creamos un segundo punto de guardado
SAVEPOINT afterGeneroInsert;

-- Intentamos insertar un nuevo anime
INSERT INTO Anime (Titulo, Descripcion, FechaEstreno, NumeroEpisodios, DuracionEpisodio, EstudioID, GeneroID, PlataformaID) VALUES
('Kill la Kill', 'Una estudiante busca respuestas sobre la muerte de su padre.', '2013-10-03', 24, 24, 16, 16, 1);

-- Creamos un tercer punto de guardado
SAVEPOINT afterAnimeInsert;

-- Si todo ha ido bien, confirmamos la transacción
COMMIT;

-- Si hubo un error al insertar el anime, revertimos al punto después de insertar el género
ROLLBACK TO afterGeneroInsert;

-- Si hubo un error al insertar el género, revertimos al punto después de insertar el estudio
ROLLBACK TO afterEstudioInsert;

-- Si hubo un error al insertar el estudio, revertimos toda la transacción
ROLLBACK;

-- Creamos un nuevo punto de guardado
SAVEPOINT afterRollback;

-- Insertamos los datos nuevamente después del rollback
INSERT INTO Genero (Nombre, Descripcion) VALUES
('Mecha', 'Género que involucra robots gigantes');

-- Confirmamos la transacción
COMMIT;