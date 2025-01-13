-- Eliminar tablas si existen
DROP TABLE IF EXISTS bike;
DROP TABLE IF EXISTS brand;

-- Crear tabla de marcas
CREATE TABLE brand (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL UNIQUE
);

-- Crear tabla de motos
CREATE TABLE bike (
    id CHAR(36) PRIMARY KEY DEFAULT(UUID()),
    name VARCHAR(255) NOT NULL,
    year INT NOT NULL,
    poster TEXT,
    engine_capacity INT NOT NULL,
    brand_id INT,
    FOREIGN KEY (brand_id) REFERENCES brand(id)
);

-- Insertar marcas
INSERT INTO brand (name) VALUES 
('Yamaha'), ('Kawasaki'), ('Honda'), ('Suzuki'), 
('Ducati'), ('BMW'), ('KTM'), ('Triumph'), 
('Aprilia'), ('Harley-Davidson'), ('MV Agusta');

-- Insertar motos
INSERT INTO bike (id, name, year, poster, engine_capacity, brand_id) 
VALUES 
(UUID(), 'YZF-R1', 2023, 'https://example.com/images/yamaha_r1.jpg', 998, (SELECT id FROM brand WHERE name = 'Yamaha')),
(UUID(), 'Ninja ZX-10R', 2023, 'https://example.com/images/kawasaki_zx10r.jpg', 998, (SELECT id FROM brand WHERE name = 'Kawasaki')),
(UUID(), 'CBR1000RR-R', 2023, 'https://example.com/images/honda_cbr1000rrr.jpg', 1000, (SELECT id FROM brand WHERE name = 'Honda')),
(UUID(), 'GSX-R1000', 2023, 'https://example.com/images/suzuki_gsxr1000.jpg', 999, (SELECT id FROM brand WHERE name = 'Suzuki')),
(UUID(), 'Panigale V4', 2023, 'https://example.com/images/ducati_panigale_v4.jpg', 1103, (SELECT id FROM brand WHERE name = 'Ducati'));

-- Verificar los datos
SELECT * FROM bike;
