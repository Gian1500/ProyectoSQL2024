DROP DATABASE IF EXISTS AnimeDB;
CREATE DATABASE AnimeDB;
USE AnimeDB;

-- Tabla que almacena información sobre los estudios de animación
CREATE TABLE Estudio (
    EstudioID INT AUTO_INCREMENT PRIMARY KEY, 
    Nombre VARCHAR(255) NOT NULL, 
    Fundacion YEAR, 
    Sede VARCHAR(255), 
    SitioWeb VARCHAR(255)
);

-- Tabla que almacena información sobre los géneros de los animes
CREATE TABLE Genero (
    GeneroID INT AUTO_INCREMENT PRIMARY KEY, 
    Nombre VARCHAR(255) NOT NULL, 
    Descripcion TEXT 
);

-- Tabla que almacena información sobre las plataformas de streaming
CREATE TABLE PlataformaStreaming (
    PlataformaID INT AUTO_INCREMENT PRIMARY KEY, 
    Nombre VARCHAR(255) NOT NULL,
    SitioWeb VARCHAR(255),
    Descripcion TEXT
);

-- Tabla que almacena información general sobre los animes
CREATE TABLE Anime (
    AnimeID INT AUTO_INCREMENT PRIMARY KEY, 
    Titulo VARCHAR(255) NOT NULL, 
    Descripcion TEXT, 
    FechaEstreno DATE, 
    NumeroEpisodios INT, 
    DuracionEpisodio INT,
    EstudioID INT, 
    GeneroID INT, 
    PlataformaID INT, 
    FOREIGN KEY (EstudioID) REFERENCES Estudio(EstudioID),
    FOREIGN KEY (GeneroID) REFERENCES Genero(GeneroID),
    FOREIGN KEY (PlataformaID) REFERENCES PlataformaStreaming(PlataformaID)
);

-- Tabla que almacena información sobre los episodios de los animes
CREATE TABLE Episodio (
    EpisodioID INT AUTO_INCREMENT PRIMARY KEY, 
    AnimeID INT NOT NULL,
    NumeroEpisodio INT NOT NULL, 
    TituloEpisodio VARCHAR(255) NOT NULL, 
    FechaEmision DATE, 
    Duracion INT, 
    Resumen TEXT, 
    Director VARCHAR(255), 
    FOREIGN KEY (AnimeID) REFERENCES Anime(AnimeID)
);

-- Tabla que almacena información sobre los personajes de los animes
CREATE TABLE Personaje (
    PersonajeID INT AUTO_INCREMENT PRIMARY KEY, 
    Nombre VARCHAR(255) NOT NULL,
    Descripcion TEXT, 
    AnimeID INT NOT NULL,
    ActorVoz VARCHAR(255), 
    FOREIGN KEY (AnimeID) REFERENCES Anime(AnimeID)
);

-- Tabla intermedia que relaciona animes con personajes
CREATE TABLE AnimePersonaje (
    AnimeID INT NOT NULL,
    PersonajeID INT NOT NULL, 
    PRIMARY KEY (AnimeID, PersonajeID), 
    FOREIGN KEY (AnimeID) REFERENCES Anime(AnimeID),
    FOREIGN KEY (PersonajeID) REFERENCES Personaje(PersonajeID)
);

-- Tabla intermedia que relaciona animes con géneros
CREATE TABLE AnimeGenero (
    AnimeID INT NOT NULL,
    GeneroID INT NOT NULL, 
    PRIMARY KEY (AnimeID, GeneroID), 
    FOREIGN KEY (AnimeID) REFERENCES Anime(AnimeID),
    FOREIGN KEY (GeneroID) REFERENCES Genero(GeneroID)
);

-- Tabla que almacena calificaciones de los usuarios para los animes
CREATE TABLE Calificacion (
    CalificacionID INT AUTO_INCREMENT PRIMARY KEY, 
    AnimeID INT NOT NULL, 
    Usuario VARCHAR(255) NOT NULL, 
    Puntuacion INT CHECK (Puntuacion BETWEEN 1 AND 10), 
    Comentario TEXT,
    FechaCalificacion DATE, 
    FOREIGN KEY (AnimeID) REFERENCES Anime(AnimeID)
);


				----------------------------
				  -- Carga de Datos --
				----------------------------
-- Carga de datos para la tabla que contiene los estudios de animación
INSERT INTO Estudio (Nombre, Fundacion, Sede, SitioWeb) VALUES
('Studio Ghibli', 1985, 'Tokyo, Japan', 'http://www.ghibli.jp'),
('Toei Animation', 1948, 'Tokyo, Japan', 'http://www.toei-anim.co.jp'),
('Madhouse', 1972, 'Tokyo, Japan', 'http://www.madhouse.co.jp'),
('Bones', 1998, 'Tokyo, Japan', 'http://www.bones.co.jp'),
('Production I.G', 1987, 'Tokyo, Japan', 'http://www.production-ig.com'),
('Sunrise', 1972, 'Tokyo, Japan', 'http://www.sunrise-inc.co.jp'),
('Kyoto Animation', 1981, 'Kyoto, Japan', 'http://www.kyotoanimation.co.jp'),
('MAPPA', 2011, 'Tokyo, Japan', 'http://www.mappa.co.jp'),
('Studio Deen', 1975, 'Tokyo, Japan', 'http://www.deen.co.jp'),
('A-1 Pictures', 2005, 'Tokyo, Japan', 'http://www.a1p.jp'),
('CloverWorks', 2018, 'Tokyo, Japan', 'http://www.cloverworks.co.jp'),
('Wit Studio', 2012, 'Tokyo, Japan', 'http://www.witstudio.co.jp'),
('TMS Entertainment', 1946, 'Tokyo, Japan', 'http://www.tms-e.co.jp'),
('Liden Films', 2012, 'Tokyo, Japan', 'http://www.lidenfilms.jp'),
('White Fox', 2007, 'Tokyo, Japan', 'http://www.whitefox-co.jp');

-- Carga de datos para la tabla que contiene los generos de anime
INSERT INTO Genero (Nombre, Descripcion) VALUES
('Accion', 'Género con muchas escenas de lucha y emoción'),
('Aventura', 'Historias que implican viajes y exploraciones'),
('Comedia', 'Historias diseñadas para hacer reír'),
('Drama', 'Historias con situaciones serias y emocionales'),
('Fantasia', 'Historias que contienen elementos mágicos y sobrenaturales'),
('Magia', 'Historias centradas en el uso de la magia'),
('Horror', 'Historias diseñadas para asustar'),
('Misterio', 'Historias que implican resolver un enigma o crimen'),
('Romance', 'Historias centradas en relaciones amorosas'),
('Ciencia Ficcion', 'Historias que exploran conceptos científicos y futuristas'),
('Slice of Life', 'Historias que representan la vida cotidiana'),
('Deporte', 'Historias centradas en actividades deportivas'),
('Supernatural', 'Historias que involucran fenómenos sobrenaturales'),
('Thriller', 'Historias con alto suspenso y tensión'),
('Musical', 'Historias que incorporan música y danza en la narrativa');

-- Carga de datos para la tabla que contiene las plataformas donde se emiten los animes
INSERT INTO PlataformaStreaming (Nombre, SitioWeb, Descripcion) VALUES
('Crunchyroll', 'http://www.crunchyroll.com', 'Plataforma de streaming de anime y manga'),
('Funimation', 'http://www.funimation.com', 'Plataforma de streaming de anime con doblaje'),
('Netflix', 'http://www.netflix.com', 'Plataforma global de streaming con contenido variado'),
('Amazon Prime Video', 'http://www.primevideo.com', 'Plataforma de streaming de Amazon'),
('Hulu', 'http://www.hulu.com', 'Plataforma de streaming con series y películas'),
('HiDive', 'http://www.hidive.com', 'Plataforma de streaming de anime con contenido exclusivo'),
('VRV', 'http://www.vrv.co', 'Servicio de streaming que incluye varios canales de anime y entretenimiento'),
('Disney+', 'http://www.disneyplus.com', 'Plataforma de streaming de Disney con series y películas'),
('HBO Max', 'http://www.hbomax.com', 'Plataforma de streaming con contenido de HBO y más'),
('YouTube', 'http://www.youtube.com', 'Plataforma de videos con contenido generado por usuarios y más'),
('Apple TV+', 'http://www.apple.com/tv/', 'Plataforma de streaming de Apple con contenido original'),
('Tubi', 'http://www.tubi.tv', 'Plataforma gratuita de streaming con publicidad'),
('Vudu', 'http://www.vudu.com', 'Plataforma de streaming y compra de películas y series'),
('Daisuki', 'http://www.daisuki.net', 'Plataforma de streaming de anime, ahora descontinuada'),
('AnimeLab', 'http://www.animelab.com', 'Plataforma de streaming de anime disponible en Australia y Nueva Zelanda');

-- Carga de datos para la tabla que contiene los animes
INSERT INTO Anime (Titulo, Descripcion, FechaEstreno, NumeroEpisodios, DuracionEpisodio, EstudioID, GeneroID, PlataformaID) VALUES
('Naruto', 'La historia de un ninja adolescente en busca de reconocimiento y su sueño de convertirse en Hokage.', '2002-10-03', 220, 23, 2, 1, 1),
('One Piece', 'Las aventuras de Monkey D. Luffy y su tripulación de piratas en busca del One Piece.', '1999-10-20', 1000, 24, 2, 2, 1),
('Attack on Titan', 'La humanidad lucha contra gigantes devoradores de humanos.', '2013-04-07', 75, 24, 8, 4, 2),
('My Hero Academia', 'Un joven sin poderes en un mundo de superhéroes busca convertirse en el héroe más grande de todos.', '2016-04-03', 88, 24, 4, 1, 1),
('Fullmetal Alchemist: Brotherhood', 'Dos hermanos alquimistas buscan la piedra filosofal para recuperar sus cuerpos.', '2009-04-05', 64, 24, 3, 4, 3),
('Sword Art Online', 'Jugadores quedan atrapados en un juego de realidad virtual y deben luchar para sobrevivir.', '2012-07-08', 25, 24, 10, 4, 1),
('Death Note', 'Un estudiante de secundaria encuentra un cuaderno que le permite matar a cualquier persona con solo escribir su nombre en él.', '2006-10-04', 37, 23, 3, 4, 3),
('Demon Slayer', 'Un joven lucha contra demonios para salvar a su hermana y vengar a su familia.', '2019-04-06', 26, 24, 8, 5, 1),
('One Punch Man', 'Un superhéroe abrumadoramente poderoso busca un rival digno.', '2015-10-05', 12, 24, 3, 1, 1),
('Tokyo Ghoul', 'Un joven se convierte en mitad ghoul y debe adaptarse a su nueva vida.', '2014-07-04', 12, 24, 11, 7, 1),
('Steins;Gate', 'Un grupo de amigos descubre cómo enviar mensajes de texto al pasado y debe lidiar con las consecuencias.', '2011-04-06', 24, 24, 3, 4, 2),
('Your Lie in April', 'Un pianista prodigio que ha dejado de tocar conoce a una violinista que cambia su vida.', '2014-10-10', 22, 22, 6, 9, 3),
('Re:Zero', 'Un joven es transportado a un mundo de fantasía y descubre que tiene el poder de regresar en el tiempo cada vez que muere.', '2016-04-04', 25, 25, 15, 10, 1),
('Hunter x Hunter', 'Un joven busca convertirse en cazador para encontrar a su padre.', '2011-10-02', 148, 23, 3, 2, 1),
('Violet Evergarden', 'Una ex soldado busca entender el significado del amor mientras trabaja como escritora de cartas.', '2018-01-11', 13, 24, 7, 6, 3);


-- Carga de datos para la tabla que contiene los capítulos
INSERT INTO Episodio (AnimeID, NumeroEpisodio, TituloEpisodio, FechaEmision, Duracion, Resumen, Director) VALUES
(1, 1, 'Enter: Naruto Uzumaki!', '2002-10-03', 23, 'Naruto Uzumaki, a misfit ninja, struggles to gain recognition.', 'Hayato Date'),
(1, 2, 'My Name is Konohamaru!', '2002-10-10', 23, 'Naruto befriends Konohamaru, the grandson of the Third Hokage.', 'Hayato Date'),
(2, 1, 'I\'m Luffy! The Man Who\'s Gonna Be King of the Pirates!', '1999-10-20', 24, 'Luffy sets out on his adventure to find the One Piece and become the Pirate King.', 'Konosuke Uda'),
(2, 2, 'The Great Swordsman Appears! Pirate Hunter, Roronoa Zoro', '1999-11-17', 24, 'Luffy meets Zoro, a feared swordsman who will become his first crewmate.', 'Konosuke Uda'),
(3, 1, 'To You, in 2000 Years: The Fall of Shiganshina', '2013-04-07', 24, 'Eren and Mikasa witness the fall of Shiganshina and the appearance of the Colossal Titan.', 'Tetsurō Araki'),
(3, 2, 'That Day: The Fall of Shiganshina, Part 2', '2013-04-14', 24, 'The Titans break through Wall Maria, leading to tragedy for Eren and Mikasa.', 'Tetsurō Araki'),
(4, 1, 'Izuku Midoriya: Origin', '2016-04-03', 24, 'Izuku Midoriya dreams of becoming a hero despite being born without quirks.', 'Kenji Nagasaki'),
(4, 2, 'What It Takes to Be a Hero', '2016-04-10', 24, 'Izuku meets his idol All Might, who changes his fate forever.', 'Kenji Nagasaki'),
(5, 1, 'Fullmetal Alchemist', '2009-04-05', 24, 'The Elric brothers use alchemy to resurrect their mother, leading to dire consequences.', 'Yasuhiro Irie'),
(5, 2, 'The First Day', '2009-04-12', 24, 'Edward becomes a State Alchemist, starting their journey for the Philosopher\'s Stone.', 'Yasuhiro Irie'),
(6, 1, 'The World of Swords', '2012-07-08', 24, 'Players are trapped in the virtual reality MMORPG Sword Art Online.', 'Tomohiko Itō'),
(6, 2, 'Beater', '2012-07-15', 24, 'Kirito, a solo player, takes on the responsibility of clearing the game.', 'Tomohiko Itō'),
(7, 1, 'Rebirth', '2006-10-04', 23, 'Light Yagami discovers the Death Note and begins his quest to rid the world of criminals.', 'Tetsurō Araki'),
(7, 2, 'Confrontation', '2006-10-11', 23, 'Light begins his deadly game of cat and mouse with the genius detective L.', 'Tetsurō Araki'),
(8, 1, 'Cruelty', '2019-04-06', 24, 'Tanjiro Kamado becomes a demon slayer to avenge his family and cure his sister.', 'Haruo Sotozaki'),
(8, 2, 'Trainer Sakonji Urokodaki', '2019-04-13', 24, 'Tanjiro begins his training under the guidance of Sakonji Urokodaki.', 'Haruo Sotozaki');


-- Carga de datos para la tabla que contiene los actores de voz
INSERT INTO Personaje (Nombre, Descripcion, AnimeID, ActorVoz) VALUES
('Naruto Uzumaki', 'El protagonista principal que sueña con convertirse en Hokage.', 1, 'Junko Takeuchi'),
('Sasuke Uchiha', 'El último sobreviviente del clan Uchiha que busca vengarse.', 1, 'Noriaki Sugiyama'),
('Monkey D. Luffy', 'El capitán de los Piratas de Sombrero de Paja que busca el One Piece.', 2, 'Mayumi Tanaka'),
('Roronoa Zoro', 'El espadachín de los Piratas de Sombrero de Paja.', 2, 'Kazuya Nakai'),
('Eren Yeager', 'Un joven que desea exterminar a los Titanes.', 3, 'Yuki Kaji'),
('Mikasa Ackerman', 'La hermana adoptiva de Eren y una guerrera excepcional.', 3, 'Yui Ishikawa'),
('Izuku Midoriya', 'Un joven sin poderes que quiere convertirse en el héroe más grande.', 4, 'Daiki Yamashita'),
('All Might', 'El héroe número uno y símbolo de la paz.', 4, 'Kenta Miyake'),
('Edward Elric', 'El alquimista estatal más joven en busca de la piedra filosofal.', 5, 'Romi Park'),
('Alphonse Elric', 'El hermano menor de Edward atrapado en una armadura.', 5, 'Rie Kugimiya'),
('Kirito', 'Un jugador solitario atrapado en Sword Art Online.', 6, 'Yoshitsugu Matsuoka'),
('Asuna', 'La compañera de Kirito en Sword Art Online.', 6, 'Haruka Tomatsu'),
('Light Yagami', 'Un estudiante de secundaria que encuentra la Death Note.', 7, 'Mamoru Miyano'),
('L', 'Un detective enigmático que persigue a Light.', 7, 'Kappei Yamaguchi'),
('Tanjiro Kamado', 'Un joven cazador de demonios que busca curar a su hermana.', 8, 'Natsuki Hanae');

-- Carga de datos para la tabla que Gestiona la relación de muchos a muchos entre los animes y los personajes.
INSERT INTO AnimePersonaje (AnimeID, PersonajeID) VALUES
(1, 1),
(1, 2),
(2, 3),
(2, 4),
(3, 5),
(3, 6),
(4, 7),
(4, 8),
(5, 9),
(5, 10),
(6, 11),
(6, 12),
(7, 13),
(7, 14),
(8, 15);

-- Carga de datos para la tabla que Gestiona la relación de muchos a muchos entre los animes y generos
INSERT INTO AnimeGenero (AnimeID, GeneroID) VALUES
(1, 1),
(2, 2),
(3, 7),
(4, 1),
(5, 4),
(6, 4),
(7, 8),
(8, 5),
(9, 1),
(10, 7),
(11, 10),
(12, 9),
(13, 5),
(14, 2),
(15, 9);

-- Carga de datos para la tabla que contiene la calificacion de cada anime
INSERT INTO Calificacion (AnimeID, Usuario, Puntuacion, Comentario, FechaCalificacion) VALUES
(1, 'usuario1', 9, 'Gran desarrollo de personajes y trama emocionante.', '2023-01-15'),
(1, 'usuario2', 8, 'Muy bueno pero demasiado relleno.', '2023-02-20'),
(2, 'usuario3', 10, 'Mejor anime de todos los tiempos.', '2023-03-10'),
(2, 'usuario4', 9, 'Luffy es increíble!', '2023-04-05'),
(3, 'usuario5', 8, 'Muy emocionante, aunque un poco oscuro.', '2023-05-12'),
(3, 'usuario6', 9, 'Las escenas de acción son impresionantes.', '2023-06-21'),
(4, 'usuario7', 10, 'Inspirador y lleno de acción.', '2023-07-14'),
(4, 'usuario8', 9, 'Me encanta la evolución de Deku.', '2023-08-03'),
(5, 'usuario9', 10, 'Obra maestra, excelente narrativa.', '2023-09-18'),
(5, 'usuario10', 10, 'Uno de los mejores animes de todos los tiempos.', '2023-10-27'),
(6, 'usuario11', 7, 'Buena premisa pero algunos arcos son flojos.', '2023-11-06'),
(6, 'usuario12', 8, 'Gran animación y acción.', '2023-12-25'),
(7, 'usuario13', 10, 'Inteligente y emocionante.', '2024-01-14'),
(7, 'usuario14', 9, 'Brillante y cautivador.', '2024-02-19'),
(8, 'usuario15', 10, 'Increíblemente bien hecho y emocional.', '2024-03-08');


