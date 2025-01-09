DROP TABLE IF EXISTS bikesdb;
CREATE DATABASE bikesdb;
USE bikesdb;

CREATE TABLE brand (
id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(255) NOT NULL UNIQUE
);

CREATE TABLE bike (
id BINARY(16) PRIMARY KEY DEFAULT(UUID_TO_BIN(UUID())),
name VARCHAR(255) NOT NULL,
year INT NOT NULL,
poster TEXT,
engine_capacity INT NOT NULL,
brand_id INT,
FOREIGN KEY (brand_id) REFERENCES brand(id)
);

INSERT INTO brand (name) VALUES ('Yamaha');
INSERT INTO brand (name) VALUES ('Kawasaki');
INSERT INTO brand (name) VALUES ('Honda');
INSERT INTO brand (name) VALUES ('Suzuki');
INSERT INTO brand (name) VALUES ('Ducati');
INSERT INTO brand (name) VALUES ('BMW');
INSERT INTO brand (name) VALUES ('KTM');
INSERT INTO brand (name) VALUES ('Triumph');
INSERT INTO brand (name) VALUES ('Aprilia');
INSERT INTO brand (name) VALUES ('Harley-Davidson');
INSERT INTO brand (name) VALUES ('MV Agusta');

INSERT INTO bike (id, name, year, poster, engine_capacity, brand_id) 
VALUES 
(UUID_TO_BIN(UUID()), 'YZF-R1', 2023, 'https://example.com/images/yamaha_r1.jpg', 998, (SELECT id FROM brand WHERE name = 'Yamaha')),
(UUID_TO_BIN(UUID()), 'Ninja ZX-10R', 2023, 'https://example.com/images/kawasaki_zx10r.jpg', 998, (SELECT id FROM brand WHERE name = 'Kawasaki')),
(UUID_TO_BIN(UUID()), 'CBR1000RR-R', 2023, 'https://example.com/images/honda_cbr1000rrr.jpg', 1000, (SELECT id FROM brand WHERE name = 'Honda')),
(UUID_TO_BIN(UUID()), 'GSX-R1000', 2023, 'https://example.com/images/suzuki_gsxr1000.jpg', 999, (SELECT id FROM brand WHERE name = 'Suzuki')),
(UUID_TO_BIN(UUID()), 'Panigale V4', 2023, 'https://example.com/images/ducati_panigale_v4.jpg', 1103, (SELECT id FROM brand WHERE name = 'Ducati')),
(UUID_TO_BIN(UUID()), 'S1000RR', 2023, 'https://example.com/images/bmw_s1000rr.jpg', 999, (SELECT id FROM brand WHERE name = 'BMW')),
(UUID_TO_BIN(UUID()), 'RC 390', 2023, 'https://example.com/images/ktm_rc390.jpg', 373, (SELECT id FROM brand WHERE name = 'KTM')),
(UUID_TO_BIN(UUID()), 'Street Triple RS', 2023, 'https://example.com/images/triumph_streettriple_rs.jpg', 765, (SELECT id FROM brand WHERE name = 'Triumph')),
(UUID_TO_BIN(UUID()), 'RSV4 Factory', 2023, 'https://example.com/images/aprilia_rsv4_factory.jpg', 1099, (SELECT id FROM brand WHERE name = 'Aprilia')),
(UUID_TO_BIN(UUID()), 'Sportster S', 2023, 'https://example.com/images/harley_sportster_s.jpg', 1252, (SELECT id FROM brand WHERE name = 'Harley-Davidson')),
(UUID_TO_BIN(UUID()), 'F3 800', 2023, 'https://example.com/images/mv_agusta_f3_800.jpg', 798, (SELECT id FROM brand WHERE name = 'MV Agusta')),
(UUID_TO_BIN(UUID()), 'MT-09', 2023, 'https://example.com/images/yamaha_mt09.jpg', 889, (SELECT id FROM brand WHERE name = 'Yamaha')),
(UUID_TO_BIN(UUID()), 'Africa Twin', 2023, 'https://example.com/images/honda_africa_twin.jpg', 1084, (SELECT id FROM brand WHERE name = 'Honda')),
(UUID_TO_BIN(UUID()), 'V-Strom 1050DE', 2023, 'https://example.com/images/suzuki_vstrom_1050de.jpg', 1037, (SELECT id FROM brand WHERE name = 'Suzuki')),
(UUID_TO_BIN(UUID()), 'Multistrada V4', 2023, 'https://example.com/images/ducati_multistrada_v4.jpg', 1158, (SELECT id FROM brand WHERE name = 'Ducati')),
(UUID_TO_BIN(UUID()), 'R 1250 GS', 2023, 'https://example.com/images/bmw_r1250gs.jpg', 1254, (SELECT id FROM brand WHERE name = 'BMW')),
(UUID_TO_BIN(UUID()), '1290 Super Adventure R', 2023, 'https://example.com/images/ktm_1290_superadventure_r.jpg', 1301, (SELECT id FROM brand WHERE name = 'KTM')),
(UUID_TO_BIN(UUID()), 'Tiger 900 Rally', 2023, 'https://example.com/images/triumph_tiger_900_rally.jpg', 888, (SELECT id FROM brand WHERE name = 'Triumph')),
(UUID_TO_BIN(UUID()), 'Tuareg 660', 2023, 'https://example.com/images/aprilia_tuareg_660.jpg', 659, (SELECT id FROM brand WHERE name = 'Aprilia')),
(UUID_TO_BIN(UUID()), 'Pan America 1250', 2023, 'https://example.com/images/harley_panamerica_1250.jpg', 1252, (SELECT id FROM brand WHERE name = 'Harley-Davidson'));


SELECT * FROM bike;