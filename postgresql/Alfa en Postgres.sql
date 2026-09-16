-- 1. Crear esquemas/tablas independientes primero (Usuario, Taller)

CREATE TABLE "usuario" (
    "id_usuario" SERIAL PRIMARY KEY,
    "nombre" VARCHAR(50) NOT NULL,
    "apellido" VARCHAR(50) NOT NULL,
    "correo" VARCHAR(100) NOT NULL UNIQUE,
    "contrasena" VARCHAR(255) NOT NULL,
    "telefono" VARCHAR(20),
    "direccion" VARCHAR(100),
    "rol" VARCHAR(20) DEFAULT 'CLIENTE',
    "fecha_registro" TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    "estado_usuario" VARCHAR(20) DEFAULT 'ACTIVO'
);

CREATE TABLE "taller" (
    "id_taller" SERIAL PRIMARY KEY,
    "nombre_taller" VARCHAR(100) NOT NULL,
    "direccion" VARCHAR(100),
    "telefono" VARCHAR(20),
    "correo" VARCHAR(100),
    "horario_atencion" VARCHAR(100),
    "capacidad_diaria" INT,
    "estado_taller" VARCHAR(20) DEFAULT 'ACTIVO'
);

-- 2. Tablas secundarias

CREATE TABLE "moto" (
    "id_moto" SERIAL PRIMARY KEY,
    "placa" VARCHAR(10) NOT NULL UNIQUE,
    "marca" VARCHAR(50) NOT NULL,
    "modelo" VARCHAR(50) NOT NULL,
    "cilindraje" INT,
    "color" VARCHAR(30),
    "anio" INT,
    "kilometraje" INT,
    "id_usuario" INT NOT NULL,
    CONSTRAINT "fk_moto_usuario" FOREIGN KEY ("id_usuario") REFERENCES "usuario" ("id_usuario")
);

CREATE TABLE "tecnico" (
    "id_tecnico" SERIAL PRIMARY KEY,
    "nombre_tecnico" VARCHAR(100) NOT NULL,
    "especialidad" VARCHAR(100),
    "telefono" VARCHAR(20),
    "id_taller" INT NOT NULL,
    CONSTRAINT "fk_tecnico_taller" FOREIGN KEY ("id_taller") REFERENCES "taller" ("id_taller")
);

CREATE TABLE "servicio" (
    "id_servicio" SERIAL PRIMARY KEY,
    "nombre_servicio" VARCHAR(100) NOT NULL,
    "descripcion" TEXT,
    "costo" NUMERIC(10, 2),
    "duracion_estimada" VARCHAR(50),
    "id_taller" INT NOT NULL,
    CONSTRAINT "fk_servicio_taller" FOREIGN KEY ("id_taller") REFERENCES "taller" ("id_taller")
);

-- 3. Citas y Órdenes de trabajo

CREATE TABLE "cita" (
    "id_cita" SERIAL PRIMARY KEY,
    "fecha" DATE NOT NULL,
    "hora" TIME NOT NULL,
    "estado_cita" VARCHAR(20) DEFAULT 'PENDIENTE',
    "id_usuario" INT NOT NULL,
    "id_moto" INT NOT NULL,
    "id_taller" INT NOT NULL,
    "id_servicio" INT NOT NULL,
    CONSTRAINT "fk_cita_usuario" FOREIGN KEY ("id_usuario") REFERENCES "usuario" ("id_usuario"),
    CONSTRAINT "fk_cita_moto" FOREIGN KEY ("id_moto") REFERENCES "moto" ("id_moto"),
    CONSTRAINT "fk_cita_taller" FOREIGN KEY ("id_taller") REFERENCES "taller" ("id_taller"),
    CONSTRAINT "fk_cita_servicio" FOREIGN KEY ("id_servicio") REFERENCES "servicio" ("id_servicio")
);

CREATE TABLE "orden_trabajo" (
    "id_orden" SERIAL PRIMARY KEY,
    "fecha_ingreso" DATE,
    "descripcion_falla" TEXT,
    "diagnostico" TEXT,
    "estado_orden" VARCHAR(20) DEFAULT 'ABIERTA',
    "id_cita" INT NOT NULL,
    "id_tecnico" INT NOT NULL,
    CONSTRAINT "fk_orden_cita" FOREIGN KEY ("id_cita") REFERENCES "cita" ("id_cita"),
    CONSTRAINT "fk_orden_tecnico" FOREIGN KEY ("id_tecnico") REFERENCES "tecnico" ("id_tecnico")
);

-- 4. Cotizaciones y Pagos

CREATE TABLE "cotizacion" (
    "id_cotizacion" SERIAL PRIMARY KEY,
    "fecha_cotizacion" DATE,
    "total" NUMERIC(10, 2),
    "estado_cotizacion" VARCHAR(20) DEFAULT 'PENDIENTE',
    "id_orden" INT NOT NULL,
    CONSTRAINT "fk_cotizacion_orden" FOREIGN KEY ("id_orden") REFERENCES "orden_trabajo" ("id_orden")
);

CREATE TABLE "pago" (
    "id_pago" SERIAL PRIMARY KEY,
    "monto" NUMERIC(10, 2) NOT NULL,
    "metodo_pago" VARCHAR(20),
    "fecha_pago" TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    "estado_pago" VARCHAR(20) DEFAULT 'PENDIENTE',
    "id_cotizacion" INT NOT NULL,
    CONSTRAINT "fk_pago_cotizacion" FOREIGN KEY ("id_cotizacion") REFERENCES "cotizacion" ("id_cotizacion")
);