CREATE TABLE IF NOT EXISTS roles (
    id BIGSERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL UNIQUE,
    CONSTRAINT chk_roles_nombre CHECK (LENGTH(TRIM(nombre)) > 0)
);

CREATE TABLE IF NOT EXISTS usuarios (
    id BIGSERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    rol_id BIGINT NOT NULL,
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    CONSTRAINT fk_usuarios_roles FOREIGN KEY (rol_id)
        REFERENCES roles(id) ON UPDATE CASCADE ON DELETE RESTRICT,
    CONSTRAINT chk_usuarios_nombre CHECK (LENGTH(TRIM(nombre)) > 0),
    CONSTRAINT chk_usuarios_email CHECK (LENGTH(TRIM(email)) > 3),
    CONSTRAINT chk_usuarios_password CHECK (LENGTH(password) > 0)
);
