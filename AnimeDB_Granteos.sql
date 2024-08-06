-- -------------------------------------------GRANTEOS Y USUARIOS------------------------------------------------------

-- ==========================================
-- Crea un usuario administrador con todos los permisos.
CREATE USER 'admin_user'@'localhost' IDENTIFIED BY 'admin_password';
-- Crea un usuario visualizador con permisos de solo lectura.
CREATE USER 'viewer_user'@'localhost' IDENTIFIED BY 'viewer_password';

-- ==========================================
-- Concede todos los privilegios sobre la base de datos AnimeDB al usuario administrador.
GRANT ALL PRIVILEGES ON AnimeDB.* TO 'admin_user'@'localhost';
-- Concede permisos de solo lectura sobre la base de datos AnimeDB al usuario visualizador.
GRANT SELECT ON AnimeDB.* TO 'viewer_user'@'localhost';

-- ==========================================
-- Muestra todos los permisos concedidos al usuario administrador.
SHOW GRANTS FOR 'admin_user'@'localhost';
-- Muestra todos los permisos concedidos al usuario visualizador.
SHOW GRANTS FOR 'viewer_user'@'localhost';
