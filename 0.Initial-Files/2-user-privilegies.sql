/* Creacion User */
-- Crear el usuario 'franco' con contraseña 'cucul'
CREATE USER 'franco'@'localhost' IDENTIFIED BY 'cucul';

-- Otorgar todos los privilegios sobre los esquemas doce_salud, doce_administracion y doce_logistica
GRANT ALL PRIVILEGES ON doce_salud.* TO 'franco'@'localhost';
GRANT ALL PRIVILEGES ON doce_administracion.* TO 'franco'@'localhost';
GRANT ALL PRIVILEGES ON doce_logistica.* TO 'franco'@'localhost';
GRANT PROCESS ON *.* TO 'franco'@'localhost';

-- Aplicar los cambios de privilegios
FLUSH PRIVILEGES;