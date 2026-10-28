CREATE TABLE IF NOT EXISTS categorias (
    id BIGSERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL UNIQUE,
    CONSTRAINT chk_categorias_nombre CHECK (LENGTH(TRIM(nombre)) > 0)
);

CREATE TABLE IF NOT EXISTS marcas (
    id BIGSERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL UNIQUE,
    CONSTRAINT chk_marcas_nombre CHECK (LENGTH(TRIM(nombre)) > 0)
);

CREATE TABLE IF NOT EXISTS productos (
    id BIGSERIAL PRIMARY KEY,
    nombre VARCHAR(150) NOT NULL,
    descripcion VARCHAR(500),
    precio_compra NUMERIC(10, 2) NOT NULL,
    precio_venta NUMERIC(10, 2) NOT NULL,
    stock INTEGER NOT NULL DEFAULT 0,
    marca_id BIGINT NOT NULL,
    categoria_id BIGINT NOT NULL,
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    CONSTRAINT fk_productos_marcas FOREIGN KEY (marca_id)
        REFERENCES marcas(id) ON UPDATE CASCADE ON DELETE RESTRICT,
    CONSTRAINT fk_productos_categorias FOREIGN KEY (categoria_id)
        REFERENCES categorias(id) ON UPDATE CASCADE ON DELETE RESTRICT,
    CONSTRAINT chk_productos_nombre CHECK (LENGTH(TRIM(nombre)) > 0),
    CONSTRAINT chk_productos_precio_compra CHECK (precio_compra >= 0),
    CONSTRAINT chk_productos_precio_venta CHECK (precio_venta >= 0),
    CONSTRAINT chk_productos_stock CHECK (stock >= 0)
);
