-- Eliminar tablas si existen
DROP TABLE IF EXISTS bike;
DROP TABLE IF EXISTS category;
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
('Aprilia'), ('Harley-Davidson'), ('MV-Agusta');

-- Insertar categorías
INSERT INTO category (name) VALUES 
('Racing'),
('Trail'),
('Naked'),
('Sport-Touring'),
('Maxi-Scooter'),
('Custom');

-- Insertar motos para cada categoría con cilindradas variadas

-- Racing
INSERT INTO bike (id, name, year, poster, engine_capacity, brand_id, category_id) 
VALUES 
(UUID(), 'YZF-R1', 2023, 'https://example.com/images/yamaha_r1.jpg', 998, (SELECT id FROM brand WHERE name = 'Yamaha'), (SELECT id FROM category WHERE name = 'Racing')),
(UUID(), 'Ninja ZX-10R', 2023, 'https://example.com/images/kawasaki_zx10r.jpg', 998, (SELECT id FROM brand WHERE name = 'Kawasaki'), (SELECT id FROM category WHERE name = 'Racing')),
(UUID(), 'CBR1000RR-R', 2023, 'https://example.com/images/honda_cbr1000rrr.jpg', 1000, (SELECT id FROM brand WHERE name = 'Honda'), (SELECT id FROM category WHERE name = 'Racing')),
(UUID(), 'GSX-R1000', 2023, 'https://example.com/images/suzuki_gsxr1000.jpg', 999, (SELECT id FROM brand WHERE name = 'Suzuki'), (SELECT id FROM category WHERE name = 'Racing')),
(UUID(), 'Panigale V4', 2023, 'https://example.com/images/ducati_panigale_v4.jpg', 1103, (SELECT id FROM brand WHERE name = 'Ducati'), (SELECT id FROM category WHERE name = 'Racing')),
(UUID(), 'KTM RC 390', 2022, 'https://example.com/images/ktm_rc390.jpg', 373, (SELECT id FROM brand WHERE name = 'KTM'), (SELECT id FROM category WHERE name = 'Racing')),
(UUID(), 'BMW S1000RR', 2021, 'https://example.com/images/bmw_s1000rr.jpg', 999, (SELECT id FROM brand WHERE name = 'BMW'), (SELECT id FROM category WHERE name = 'Racing')),
(UUID(), 'Honda CBR650R', 2020, 'https://example.com/images/honda_cbr650r.jpg', 649, (SELECT id FROM brand WHERE name = 'Honda'), (SELECT id FROM category WHERE name = 'Racing')),
(UUID(), 'Yamaha R3', 2023, 'https://example.com/images/yamaha_r3.jpg', 321, (SELECT id FROM brand WHERE name = 'Yamaha'), (SELECT id FROM category WHERE name = 'Racing')),
(UUID(), 'Kawasaki Ninja 400', 2023, 'https://example.com/images/kawasaki_ninja400.jpg', 399, (SELECT id FROM brand WHERE name = 'Kawasaki'), (SELECT id FROM category WHERE name = 'Racing'));

-- Trail
INSERT INTO bike (id, name, year, poster, engine_capacity, brand_id, category_id) 
VALUES 
(UUID(), 'Honda CRF250L', 2020, 'https://example.com/images/honda_crf250l.jpg', 249, (SELECT id FROM brand WHERE name = 'Honda'), (SELECT id FROM category WHERE name = 'Trail')),
(UUID(), 'KTM 390 Adventure', 2021, 'https://example.com/images/ktm_390_adventure.jpg', 373, (SELECT id FROM brand WHERE name = 'KTM'), (SELECT id FROM category WHERE name = 'Trail')),
(UUID(), 'BMW G 310 GS', 2023, 'https://example.com/images/bmw_g310gs.jpg', 313, (SELECT id FROM brand WHERE name = 'BMW'), (SELECT id FROM category WHERE name = 'Trail')),
(UUID(), 'Suzuki V-Strom 650', 2022, 'https://example.com/images/suzuki_vstrom_650.jpg', 645, (SELECT id FROM brand WHERE name = 'Suzuki'), (SELECT id FROM category WHERE name = 'Trail')),
(UUID(), 'Yamaha Tenere 700', 2023, 'https://example.com/images/yamaha_tenere700.jpg', 689, (SELECT id FROM brand WHERE name = 'Yamaha'), (SELECT id FROM category WHERE name = 'Trail')),
(UUID(), 'Honda CRF1100L Africa Twin', 2021, 'https://example.com/images/honda_africa_twin.jpg', 1084, (SELECT id FROM brand WHERE name = 'Honda'), (SELECT id FROM category WHERE name = 'Trail')),
(UUID(), 'Kawasaki Versys 650', 2020, 'https://example.com/images/kawasaki_versys650.jpg', 649, (SELECT id FROM brand WHERE name = 'Kawasaki'), (SELECT id FROM category WHERE name = 'Trail')),
(UUID(), 'Suzuki V-Strom 250', 2022, 'https://example.com/images/suzuki_vstrom_250.jpg', 248, (SELECT id FROM brand WHERE name = 'Suzuki'), (SELECT id FROM category WHERE name = 'Trail')),
(UUID(), 'KTM 125 Duke', 2021, 'https://example.com/images/ktm_125duke.jpg', 124, (SELECT id FROM brand WHERE name = 'KTM'), (SELECT id FROM category WHERE name = 'Trail')),
(UUID(), 'BMW F 750 GS', 2022, 'https://example.com/images/bmw_f750gs.jpg', 853, (SELECT id FROM brand WHERE name = 'BMW'), (SELECT id FROM category WHERE name = 'Trail'));

-- Naked
INSERT INTO bike (id, name, year, poster, engine_capacity, brand_id, category_id) 
VALUES 
(UUID(), 'Yamaha MT-03', 2023, 'https://example.com/images/yamaha_mt03.jpg', 321, (SELECT id FROM brand WHERE name = 'Yamaha'), (SELECT id FROM category WHERE name = 'Naked')),
(UUID(), 'Kawasaki Z400', 2022, 'https://example.com/images/kawasaki_z400.jpg', 399, (SELECT id FROM brand WHERE name = 'Kawasaki'), (SELECT id FROM category WHERE name = 'Naked')),
(UUID(), 'Honda CB500F', 2021, 'https://example.com/images/honda_cb500f.jpg', 471, (SELECT id FROM brand WHERE name = 'Honda'), (SELECT id FROM category WHERE name = 'Naked')),
(UUID(), 'Suzuki GSX-S750', 2022, 'https://example.com/images/suzuki_gsx_s750.jpg', 749, (SELECT id FROM brand WHERE name = 'Suzuki'), (SELECT id FROM category WHERE name = 'Naked')),
(UUID(), 'BMW F 900 R', 2023, 'https://example.com/images/bmw_f900r.jpg', 895, (SELECT id FROM brand WHERE name = 'BMW'), (SELECT id FROM category WHERE name = 'Naked')),
(UUID(), 'KTM 890 Duke', 2021, 'https://example.com/images/ktm_890duke.jpg', 889, (SELECT id FROM brand WHERE name = 'KTM'), (SELECT id FROM category WHERE name = 'Naked')),
(UUID(), 'Ducati Monster 797', 2020, 'https://example.com/images/ducati_monster797.jpg', 803, (SELECT id FROM brand WHERE name = 'Ducati'), (SELECT id FROM category WHERE name = 'Naked')),
(UUID(), 'Yamaha MT-07', 2023, 'https://example.com/images/yamaha_mt07.jpg', 689, (SELECT id FROM brand WHERE name = 'Yamaha'), (SELECT id FROM category WHERE name = 'Naked')),
(UUID(), 'Triumph Street Triple 765', 2022, 'https://example.com/images/triumph_streettriple765.jpg', 765, (SELECT id FROM brand WHERE name = 'Triumph'), (SELECT id FROM category WHERE name = 'Naked')),
(UUID(), 'Honda CB650R', 2021, 'https://example.com/images/honda_cb650r.jpg', 649, (SELECT id FROM brand WHERE name = 'Honda'), (SELECT id FROM category WHERE name = 'Naked'));

-- Sport-Touring
INSERT INTO bike (id, name, year, poster, engine_capacity, brand_id, category_id) 
VALUES 
(UUID(), 'Kawasaki Ninja 650', 2021, 'https://example.com/images/kawasaki_ninja_650.jpg', 649, (SELECT id FROM brand WHERE name = 'Kawasaki'), (SELECT id FROM category WHERE name = 'Sport-Touring')),
(UUID(), 'BMW R 1250 RT', 2022, 'https://example.com/images/bmw_r1250rt.jpg', 1254, (SELECT id FROM brand WHERE name = 'BMW'), (SELECT id FROM category WHERE name = 'Sport-Touring')),
(UUID(), 'Honda VFR800X Crossrunner', 2020, 'https://example.com/images/honda_vfr800x.jpg', 782, (SELECT id FROM brand WHERE name = 'Honda'), (SELECT id FROM category WHERE name = 'Sport-Touring')),
(UUID(), 'Ducati Multistrada 950', 2021, 'https://example.com/images/ducati_multistrada950.jpg', 937, (SELECT id FROM brand WHERE name = 'Ducati'), (SELECT id FROM category WHERE name = 'Sport-Touring')),
(UUID(), 'Triumph Tiger 900', 2023, 'https://example.com/images/triumph_tiger900.jpg', 888, (SELECT id FROM brand WHERE name = 'Triumph'), (SELECT id FROM category WHERE name = 'Sport-Touring')),
(UUID(), 'KTM 1290 Super Duke GT', 2020, 'https://example.com/images/ktm_1290_superduke.jpg', 1301, (SELECT id FROM brand WHERE name = 'KTM'), (SELECT id FROM category WHERE name = 'Sport-Touring')),
(UUID(), 'Yamaha FJR1300', 2022, 'https://example.com/images/yamaha_fjr1300.jpg', 1298, (SELECT id FROM brand WHERE name = 'Yamaha'), (SELECT id FROM category WHERE name = 'Sport-Touring')),
(UUID(), 'BMW K 1600 GTL', 2021, 'https://example.com/images/bmw_k1600gtl.jpg', 1649, (SELECT id FROM brand WHERE name = 'BMW'), (SELECT id FROM category WHERE name = 'Sport-Touring')),
(UUID(), 'Honda CBR650R', 2020, 'https://example.com/images/honda_cbr650r.jpg', 649, (SELECT id FROM brand WHERE name = 'Honda'), (SELECT id FROM category WHERE name = 'Sport-Touring')),
(UUID(), 'Suzuki GSX-S1000F', 2022, 'https://example.com/images/suzuki_gsx_s1000f.jpg', 999, (SELECT id FROM brand WHERE name = 'Suzuki'), (SELECT id FROM category WHERE name = 'Sport-Touring'));

-- Maxi-Scooter
INSERT INTO bike (id, name, year, poster, engine_capacity, brand_id, category_id) 
VALUES 
(UUID(), 'Yamaha TMAX 560', 2023, 'https://example.com/images/yamaha_tmax.jpg', 562, (SELECT id FROM brand WHERE name = 'Yamaha'), (SELECT id FROM category WHERE name = 'Maxi-Scooter')),
(UUID(), 'Honda Forza 350', 2022, 'https://example.com/images/honda_forza350.jpg', 350, (SELECT id FROM brand WHERE name = 'Honda'), (SELECT id FROM category WHERE name = 'Maxi-Scooter')),
(UUID(), 'Suzuki Burgman 650', 2021, 'https://example.com/images/suzuki_burgman.jpg', 638, (SELECT id FROM brand WHERE name = 'Suzuki'), (SELECT id FROM category WHERE name = 'Maxi-Scooter')),
(UUID(), 'BMW C 400 X', 2023, 'https://example.com/images/bmw_c400x.jpg', 350, (SELECT id FROM brand WHERE name = 'BMW'), (SELECT id FROM category WHERE name = 'Maxi-Scooter')),
(UUID(), 'Kymco AK 550', 2022, 'https://example.com/images/kymco_ak550.jpg', 550, (SELECT id FROM brand WHERE name = 'Kymco'), (SELECT id FROM category WHERE name = 'Maxi-Scooter')),
(UUID(), 'Yamaha XMAX 300', 2023, 'https://example.com/images/yamaha_xmax.jpg', 292, (SELECT id FROM brand WHERE name = 'Yamaha'), (SELECT id FROM category WHERE name = 'Maxi-Scooter')),
(UUID(), 'Honda PCX 150', 2022, 'https://example.com/images/honda_pcx150.jpg', 149, (SELECT id FROM brand WHERE name = 'Honda'), (SELECT id FROM category WHERE name = 'Maxi-Scooter')),
(UUID(), 'Suzuki Address 110', 2021, 'https://example.com/images/suzuki_address.jpg', 113, (SELECT id FROM brand WHERE name = 'Suzuki'), (SELECT id FROM category WHERE name = 'Maxi-Scooter')),
(UUID(), 'Kymco People S 125', 2022, 'https://example.com/images/kymco_peoples125.jpg', 125, (SELECT id FROM brand WHERE name = 'Kymco'), (SELECT id FROM category WHERE name = 'Maxi-Scooter')),
(UUID(), 'Peugeot Metropolis 400', 2023, 'https://example.com/images/peugeot_metropolis.jpg', 400, (SELECT id FROM brand WHERE name = 'Peugeot'), (SELECT id FROM category WHERE name = 'Maxi-Scooter'));

-- Custom
INSERT INTO bike (id, name, year, poster, engine_capacity, brand_id, category_id) 
VALUES 
(UUID(), 'Harley-Davidson Iron 883', 2023, 'https://example.com/images/harley_iron883.jpg', 883, (SELECT id FROM brand WHERE name = 'Harley-Davidson'), (SELECT id FROM category WHERE name = 'Custom')),
(UUID(), 'Indian Scout Sixty', 2021, 'https://example.com/images/indian_scout_sixty.jpg', 999, (SELECT id FROM brand WHERE name = 'Indian'), (SELECT id FROM category WHERE name = 'Custom')),
(UUID(), 'Ducati Scrambler 800', 2021, 'https://example.com/images/ducati_scrambler_800.jpg', 803, (SELECT id FROM brand WHERE name = 'Ducati'), (SELECT id FROM category WHERE name = 'Custom')),
(UUID(), 'Triumph Bonneville T120', 2022, 'https://example.com/images/triumph_bonneville_t120.jpg', 1200, (SELECT id FROM brand WHERE name = 'Triumph'), (SELECT id FROM category WHERE name = 'Custom')),
(UUID(), 'Harley-Davidson Forty-Eight', 2023, 'https://example.com/images/harley_fortyeight.jpg', 1200, (SELECT id FROM brand WHERE name = 'Harley-Davidson'), (SELECT id FROM category WHERE name = 'Custom')),
(UUID(), 'BMW R NineT', 2022, 'https://example.com/images/bmw_r9t.jpg', 1170, (SELECT id FROM brand WHERE name = 'BMW'), (SELECT id FROM category WHERE name = 'Custom')),
(UUID(), 'Honda Rebel 500', 2023, 'https://example.com/images/honda_rebel500.jpg', 471, (SELECT id FROM brand WHERE name = 'Honda'), (SELECT id FROM category WHERE name = 'Custom')),
(UUID(), 'Kawasaki Vulcan S', 2021, 'https://example.com/images/kawasaki_vulcan_s.jpg', 649, (SELECT id FROM brand WHERE name = 'Kawasaki'), (SELECT id FROM category WHERE name = 'Custom')),
(UUID(), 'Harley-Davidson Street 750', 2022, 'https://example.com/images/harley_street750.jpg', 749, (SELECT id FROM brand WHERE name = 'Harley-Davidson'), (SELECT id FROM category WHERE name = 'Custom')),
(UUID(), 'Indian Chief Vintage', 2021, 'https://example.com/images/indian_chief_vintage.jpg', 1811, (SELECT id FROM brand WHERE name = 'Indian'), (SELECT id FROM category WHERE name = 'Custom'));

-- Verificar los datos
SELECT * FROM bike;
