-- Eliminar tablas si existen
DROP TABLE IF EXISTS bike;
DROP TABLE IF EXISTS brand;

-- Crear tabla de marcas
CREATE TABLE brand (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL UNIQUE
);

-- Crear tabla de categorías
CREATE TABLE category (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE
);

-- Crear tabla de motos
CREATE TABLE bike (
    id CHAR(36) PRIMARY KEY DEFAULT(UUID()),
    name VARCHAR(255) NOT NULL,
    year INT NOT NULL,
    poster TEXT,
    engine_capacity INT NOT NULL,
    brand_id INT,
    category_id INT,
    FOREIGN KEY (brand_id) REFERENCES brand(id),
    FOREIGN KEY (category_id) REFERENCES category(id)
);

-- Insertar marcas
INSERT INTO brand (name) VALUES 
('Yamaha'), ('Kawasaki'), ('Honda'), ('Suzuki'), 
('Ducati'), ('BMW'), ('KTM'), ('Triumph'), 
('Aprilia'), ('Harley-Davidson'), ('MV Agusta');

-- Insertar categorías
INSERT INTO category (name) VALUES 
('Racing');

-- Insertar motos
INSERT INTO bike (id, name, year, poster, engine_capacity, brand_id, category_id) 
VALUES 
(UUID(), 'YZF-R1', 2023, 'https://example.com/images/yamaha_r1.jpg', 998, (SELECT id FROM brand WHERE name = 'Yamaha'), (SELECT id FROM category WHERE name = 'Racing')),
(UUID(), 'Ninja ZX-10R', 2023, 'https://example.com/images/kawasaki_zx10r.jpg', 998, (SELECT id FROM brand WHERE name = 'Kawasaki'), (SELECT id FROM category WHERE name = 'Racing')),
(UUID(), 'CBR1000RR-R', 2023, 'https://example.com/images/honda_cbr1000rrr.jpg', 1000, (SELECT id FROM brand WHERE name = 'Honda'), (SELECT id FROM category WHERE name = 'Racing')),
(UUID(), 'GSX-R1000', 2023, 'https://example.com/images/suzuki_gsxr1000.jpg', 999, (SELECT id FROM brand WHERE name = 'Suzuki'), (SELECT id FROM category WHERE name = 'Racing')),
(UUID(), 'Panigale V4', 2023, 'https://example.com/images/ducati_panigale_v4.jpg', 1103, (SELECT id FROM brand WHERE name = 'Ducati'), (SELECT id FROM category WHERE name = 'Racing'));

-- Verificar los datos
SELECT * FROM bike;
