/* Creación DB */
-- Creacion Esquema 1: Salud
CREATE SCHEMA IF NOT EXISTS doce_salud;
USE doce_salud;

-- Tabla 1: Pacientes
CREATE TABLE IF NOT EXISTS pacientes (
    id_paciente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    fecha_nacimiento DATE,
    direccion VARCHAR(255),
    telefono VARCHAR(15),
    correo VARCHAR(100)
);

-- Tabla 2: Médicos
CREATE TABLE IF NOT EXISTS medicos (
    id_medico INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    especialidad VARCHAR(100),
    telefono VARCHAR(15),
    correo VARCHAR(100)
);

-- Tabla 3: Citas médicas
CREATE TABLE IF NOT EXISTS citas_medicas (
    id_cita INT AUTO_INCREMENT PRIMARY KEY,
    id_paciente INT,
    id_medico INT,
    fecha_cita DATETIME,
    motivo_consulta TEXT
);

-- Tabla 4: Tratamientos
CREATE TABLE IF NOT EXISTS tratamientos (
    id_tratamiento INT AUTO_INCREMENT PRIMARY KEY,
    id_paciente INT,
    nombre_tratamiento VARCHAR(100),
    descripcion TEXT,
    fecha_inicio DATE,
    fecha_fin DATE
);

-- Tabla 5: Facturas
CREATE TABLE IF NOT EXISTS facturas (
    id_factura INT AUTO_INCREMENT PRIMARY KEY,
    id_paciente INT,
    fecha_factura DATE,
    monto DECIMAL(10, 2)
);

-- --------------------------------------------

-- Creación Esquema 2: Administración
CREATE SCHEMA IF NOT EXISTS doce_administracion;
USE doce_administracion;

-- Tabla 1: Empleados
CREATE TABLE IF NOT EXISTS empleados (
    id_empleado INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    puesto VARCHAR(100),
    fecha_contratacion DATE,
    salario DECIMAL(10, 2),
    departamento VARCHAR(50)
);

-- Tabla 2: Departamentos
CREATE TABLE IF NOT EXISTS departamentos (
    id_departamento INT AUTO_INCREMENT PRIMARY KEY,
    nombre_departamento VARCHAR(50),
    gerente VARCHAR(100),
    presupuesto_anual DECIMAL(15, 2)
);

-- Tabla 3: Proyectos
CREATE TABLE IF NOT EXISTS proyectos (
    id_proyecto INT AUTO_INCREMENT PRIMARY KEY,
    nombre_proyecto VARCHAR(100),
    fecha_inicio DATE,
    fecha_fin DATE,
    presupuesto DECIMAL(15, 2),
    id_departamento INT
);

-- Tabla 4: Asistencia
CREATE TABLE IF NOT EXISTS asistencia (
    id_asistencia INT AUTO_INCREMENT PRIMARY KEY,
    id_empleado INT,
    fecha DATE,
    estado ENUM('Presente', 'Ausente', 'Tarde')
);

-- Tabla 5: Pagos
CREATE TABLE IF NOT EXISTS pagos (
    id_pago INT AUTO_INCREMENT PRIMARY KEY,
    id_empleado INT,
    fecha_pago DATE,
    monto DECIMAL(10, 2)
);

-- -------------------------------------------------

-- Creación Esquema: Logística
CREATE SCHEMA IF NOT EXISTS doce_logistica;
USE doce_logistica;

-- Tabla 1: Productos
CREATE TABLE IF NOT EXISTS productos (
    id_producto INT AUTO_INCREMENT PRIMARY KEY,
    nombre_producto VARCHAR(100),
    descripcion TEXT,
    precio DECIMAL(10, 2),
    stock INT
);

-- Tabla 2: Proveedores
CREATE TABLE IF NOT EXISTS proveedores (
    id_proveedor INT AUTO_INCREMENT PRIMARY KEY,
    nombre_proveedor VARCHAR(100),
    telefono VARCHAR(15),
    direccion VARCHAR(255),
    correo VARCHAR(100)
);

-- Tabla 3: Pedidos
CREATE TABLE IF NOT EXISTS pedidos (
    id_pedido INT AUTO_INCREMENT PRIMARY KEY,
    id_proveedor INT,
    fecha_pedido DATE,
    monto_total DECIMAL(10, 2),
    estado ENUM('Pendiente', 'Enviado', 'Recibido')
);

-- Tabla 4: Inventario
CREATE TABLE IF NOT EXISTS inventario (
    id_inventario INT AUTO_INCREMENT PRIMARY KEY,
    id_producto INT,
    fecha_actualizacion DATE,
    cantidad INT
);

-- Tabla 5: Envíos
CREATE TABLE IF NOT EXISTS envios (
    id_envio INT AUTO_INCREMENT PRIMARY KEY,
    id_pedido INT,
    fecha_envio DATE,
    empresa_envio VARCHAR(100),
    tracking_number VARCHAR(50)
);