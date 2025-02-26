use iliasvilux_bikeapi;

SET FOREIGN_KEY_CHECKS = 0;

-- Eliminar tablas si existen
DROP TABLE IF EXISTS bike_images;
DROP TABLE IF EXISTS bike;
DROP TABLE IF EXISTS category;
DROP TABLE IF EXISTS brand;

SET FOREIGN_KEY_CHECKS = 1;

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
    engine_capacity INT NOT NULL,
    brand_id INT,
    category_id INT,
    FOREIGN KEY (brand_id) REFERENCES brand(id),
    FOREIGN KEY (category_id) REFERENCES category(id)
);

CREATE TABLE bike_images (
    id INT AUTO_INCREMENT PRIMARY KEY,
    bike_id CHAR(36) NOT NULL,
    image_url TEXT NOT NULL,
    is_main BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (bike_id) REFERENCES bike(id) ON DELETE CASCADE
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
INSERT INTO bike (id, name, year, engine_capacity, brand_id, category_id) 
VALUES 
(UUID(), 'YZF-R1', 2023, 998, (SELECT id FROM brand WHERE name = 'Yamaha'), (SELECT id FROM category WHERE name = 'Racing')),
(UUID(), 'Ninja ZX-10R', 2023, 998, (SELECT id FROM brand WHERE name = 'Kawasaki'), (SELECT id FROM category WHERE name = 'Racing')),
(UUID(), 'CBR1000RR-R', 2023, 1000, (SELECT id FROM brand WHERE name = 'Honda'), (SELECT id FROM category WHERE name = 'Racing'));
-- (UUID(), 'GSX-R1000', 2023, 'https://example.com/images/suzuki_gsxr1000.jpg', 999, (SELECT id FROM brand WHERE name = 'Suzuki'), (SELECT id FROM category WHERE name = 'Racing')),
-- (UUID(), 'Panigale V4', 2023, 'https://example.com/images/ducati_panigale_v4.jpg', 1103, (SELECT id FROM brand WHERE name = 'Ducati'), (SELECT id FROM category WHERE name = 'Racing')),
-- (UUID(), 'KTM RC 390', 2022, 'https://example.com/images/ktm_rc390.jpg', 373, (SELECT id FROM brand WHERE name = 'KTM'), (SELECT id FROM category WHERE name = 'Racing')),
-- (UUID(), 'BMW S1000RR', 2021, 'https://example.com/images/bmw_s1000rr.jpg', 999, (SELECT id FROM brand WHERE name = 'BMW'), (SELECT id FROM category WHERE name = 'Racing')),
-- (UUID(), 'Honda CBR650R', 2020, 'https://example.com/images/honda_cbr650r.jpg', 649, (SELECT id FROM brand WHERE name = 'Honda'), (SELECT id FROM category WHERE name = 'Racing')),
-- (UUID(), 'Yamaha R3', 2023, 'https://example.com/images/yamaha_r3.jpg', 321, (SELECT id FROM brand WHERE name = 'Yamaha'), (SELECT id FROM category WHERE name = 'Racing')),
-- (UUID(), 'Kawasaki Ninja 400', 2023, 'https://example.com/images/kawasaki_ninja400.jpg', 399, (SELECT id FROM brand WHERE name = 'Kawasaki'), (SELECT id FROM category WHERE name = 'Racing'));

-- Trail
INSERT INTO bike (id, name, year, engine_capacity, brand_id, category_id) 
VALUES 
(UUID(), 'CRF250L', 2020, 249, (SELECT id FROM brand WHERE name = 'Honda'), (SELECT id FROM category WHERE name = 'Trail')),
(UUID(), '390 Adventure', 2021, 373, (SELECT id FROM brand WHERE name = 'KTM'), (SELECT id FROM category WHERE name = 'Trail')),
(UUID(), 'Tenere 700', 2023, 689, (SELECT id FROM brand WHERE name = 'Yamaha'), (SELECT id FROM category WHERE name = 'Trail'));
-- (UUID(), 'BMW G 310 GS', 2023, 'https://example.com/images/bmw_g310gs.jpg', 313, (SELECT id FROM brand WHERE name = 'BMW'), (SELECT id FROM category WHERE name = 'Trail')),
-- (UUID(), 'Suzuki V-Strom 650', 2022, 'https://example.com/images/suzuki_vstrom_650.jpg', 645, (SELECT id FROM brand WHERE name = 'Suzuki'), (SELECT id FROM category WHERE name = 'Trail')),
-- (UUID(), 'Honda CRF1100L Africa Twin', 2021, 'https://example.com/images/honda_africa_twin.jpg', 1084, (SELECT id FROM brand WHERE name = 'Honda'), (SELECT id FROM category WHERE name = 'Trail')),
-- (UUID(), 'Kawasaki Versys 650', 2020, 'https://example.com/images/kawasaki_versys650.jpg', 649, (SELECT id FROM brand WHERE name = 'Kawasaki'), (SELECT id FROM category WHERE name = 'Trail')),
-- (UUID(), 'Suzuki V-Strom 250', 2022, 'https://example.com/images/suzuki_vstrom_250.jpg', 248, (SELECT id FROM brand WHERE name = 'Suzuki'), (SELECT id FROM category WHERE name = 'Trail')),
-- (UUID(), 'KTM 125 Duke', 2021, 'https://example.com/images/ktm_125duke.jpg', 124, (SELECT id FROM brand WHERE name = 'KTM'), (SELECT id FROM category WHERE name = 'Trail')),
-- (UUID(), 'BMW F 750 GS', 2022, 'https://example.com/images/bmw_f750gs.jpg', 853, (SELECT id FROM brand WHERE name = 'BMW'), (SELECT id FROM category WHERE name = 'Trail'));

-- Naked
INSERT INTO bike (id, name, year, engine_capacity, brand_id, category_id) 
VALUES 
(UUID(), 'MT-03', 2023, 321, (SELECT id FROM brand WHERE name = 'Yamaha'), (SELECT id FROM category WHERE name = 'Naked')),
(UUID(), 'Z400', 2022, 399, (SELECT id FROM brand WHERE name = 'Kawasaki'), (SELECT id FROM category WHERE name = 'Naked')),
(UUID(), 'CB500F', 2021, 471, (SELECT id FROM brand WHERE name = 'Honda'), (SELECT id FROM category WHERE name = 'Naked'));
-- (UUID(), 'Suzuki GSX-S750', 2022, 'https://example.com/images/suzuki_gsx_s750.jpg', 749, (SELECT id FROM brand WHERE name = 'Suzuki'), (SELECT id FROM category WHERE name = 'Naked')),
-- (UUID(), 'BMW F 900 R', 2023, 'https://example.com/images/bmw_f900r.jpg', 895, (SELECT id FROM brand WHERE name = 'BMW'), (SELECT id FROM category WHERE name = 'Naked')),
-- (UUID(), 'KTM 890 Duke', 2021, 'https://example.com/images/ktm_890duke.jpg', 889, (SELECT id FROM brand WHERE name = 'KTM'), (SELECT id FROM category WHERE name = 'Naked')),
-- (UUID(), 'Ducati Monster 797', 2020, 'https://example.com/images/ducati_monster797.jpg', 803, (SELECT id FROM brand WHERE name = 'Ducati'), (SELECT id FROM category WHERE name = 'Naked')),
-- (UUID(), 'Yamaha MT-07', 2023, 'https://example.com/images/yamaha_mt07.jpg', 689, (SELECT id FROM brand WHERE name = 'Yamaha'), (SELECT id FROM category WHERE name = 'Naked')),
-- (UUID(), 'Triumph Street Triple 765', 2022, 'https://example.com/images/triumph_streettriple765.jpg', 765, (SELECT id FROM brand WHERE name = 'Triumph'), (SELECT id FROM category WHERE name = 'Naked')),
-- (UUID(), 'Honda CB650R', 2021, 'https://example.com/images/honda_cb650r.jpg', 649, (SELECT id FROM brand WHERE name = 'Honda'), (SELECT id FROM category WHERE name = 'Naked'));

-- Sport-Touring
INSERT INTO bike (id, name, year, engine_capacity, brand_id, category_id) 
VALUES
(UUID(), 'R 1250 RT', 2022, 1254, (SELECT id FROM brand WHERE name = 'BMW'), (SELECT id FROM category WHERE name = 'Sport-Touring')),
(UUID(), 'VFR800X Crossrunner', 2020, 782, (SELECT id FROM brand WHERE name = 'Honda'), (SELECT id FROM category WHERE name = 'Sport-Touring')),
(UUID(), 'Multistrada 950', 2021, 937, (SELECT id FROM brand WHERE name = 'Ducati'), (SELECT id FROM category WHERE name = 'Sport-Touring'));
-- (UUID(), 'Triumph Tiger 900', 2023, 'https://example.com/images/triumph_tiger900.jpg', 888, (SELECT id FROM brand WHERE name = 'Triumph'), (SELECT id FROM category WHERE name = 'Sport-Touring')),
-- (UUID(), 'KTM 1290 Super Duke GT', 2020, 'https://example.com/images/ktm_1290_superduke.jpg', 1301, (SELECT id FROM brand WHERE name = 'KTM'), (SELECT id FROM category WHERE name = 'Sport-Touring')),
-- (UUID(), 'Yamaha FJR1300', 2022, 'https://example.com/images/yamaha_fjr1300.jpg', 1298, (SELECT id FROM brand WHERE name = 'Yamaha'), (SELECT id FROM category WHERE name = 'Sport-Touring')),
-- (UUID(), 'BMW K 1600 GTL', 2021, 'https://example.com/images/bmw_k1600gtl.jpg', 1649, (SELECT id FROM brand WHERE name = 'BMW'), (SELECT id FROM category WHERE name = 'Sport-Touring')),
-- (UUID(), 'Honda CBR650R', 2020, 'https://example.com/images/honda_cbr650r.jpg', 649, (SELECT id FROM brand WHERE name = 'Honda'), (SELECT id FROM category WHERE name = 'Sport-Touring')),
-- (UUID(), 'Suzuki GSX-S1000F', 2022, 'https://example.com/images/suzuki_gsx_s1000f.jpg', 999, (SELECT id FROM brand WHERE name = 'Suzuki'), (SELECT id FROM category WHERE name = 'Sport-Touring'));

-- Maxi-Scooter
INSERT INTO bike (id, name, year, engine_capacity, brand_id, category_id) 
VALUES 
(UUID(), 'TMAX 560', 2023, 562, (SELECT id FROM brand WHERE name = 'Yamaha'), (SELECT id FROM category WHERE name = 'Maxi-Scooter')),
(UUID(), 'Forza 350', 2022, 350, (SELECT id FROM brand WHERE name = 'Honda'), (SELECT id FROM category WHERE name = 'Maxi-Scooter')),
(UUID(), 'Burgman 650', 2021, 638, (SELECT id FROM brand WHERE name = 'Suzuki'), (SELECT id FROM category WHERE name = 'Maxi-Scooter'));
-- (UUID(), 'BMW C 400 X', 2023, 'https://example.com/images/bmw_c400x.jpg', 350, (SELECT id FROM brand WHERE name = 'BMW'), (SELECT id FROM category WHERE name = 'Maxi-Scooter')),
-- (UUID(), 'Kymco AK 550', 2022, 'https://example.com/images/kymco_ak550.jpg', 550, (SELECT id FROM brand WHERE name = 'Kymco'), (SELECT id FROM category WHERE name = 'Maxi-Scooter')),
-- (UUID(), 'Yamaha XMAX 300', 2023, 'https://example.com/images/yamaha_xmax.jpg', 292, (SELECT id FROM brand WHERE name = 'Yamaha'), (SELECT id FROM category WHERE name = 'Maxi-Scooter')),
-- (UUID(), 'Honda PCX 150', 2022, 'https://example.com/images/honda_pcx150.jpg', 149, (SELECT id FROM brand WHERE name = 'Honda'), (SELECT id FROM category WHERE name = 'Maxi-Scooter')),
-- (UUID(), 'Suzuki Address 110', 2021, 'https://example.com/images/suzuki_address.jpg', 113, (SELECT id FROM brand WHERE name = 'Suzuki'), (SELECT id FROM category WHERE name = 'Maxi-Scooter')),
-- (UUID(), 'Kymco People S 125', 2022, 'https://example.com/images/kymco_peoples125.jpg', 125, (SELECT id FROM brand WHERE name = 'Kymco'), (SELECT id FROM category WHERE name = 'Maxi-Scooter')),
-- (UUID(), 'Peugeot Metropolis 400', 2023, 'https://example.com/images/peugeot_metropolis.jpg', 400, (SELECT id FROM brand WHERE name = 'Peugeot'), (SELECT id FROM category WHERE name = 'Maxi-Scooter'));

-- Custom
INSERT INTO bike (id, name, year, engine_capacity, brand_id, category_id) 
VALUES 
(UUID(), 'Iron 883', 2023, 883, (SELECT id FROM brand WHERE name = 'Harley-Davidson'), (SELECT id FROM category WHERE name = 'Custom')),
(UUID(), 'Scrambler 800', 2021, 803, (SELECT id FROM brand WHERE name = 'Ducati'), (SELECT id FROM category WHERE name = 'Custom'));
-- (UUID(), 'Triumph Bonneville T120', 2022, 'https://example.com/images/triumph_bonneville_t120.jpg', 1200, (SELECT id FROM brand WHERE name = 'Triumph'), (SELECT id FROM category WHERE name = 'Custom')),
-- (UUID(), 'Harley-Davidson Forty-Eight', 2023, 'https://example.com/images/harley_fortyeight.jpg', 1200, (SELECT id FROM brand WHERE name = 'Harley-Davidson'), (SELECT id FROM category WHERE name = 'Custom')),
-- (UUID(), 'BMW R NineT', 2022, 'https://example.com/images/bmw_r9t.jpg', 1170, (SELECT id FROM brand WHERE name = 'BMW'), (SELECT id FROM category WHERE name = 'Custom')),
-- (UUID(), 'Honda Rebel 500', 2023, 'https://example.com/images/honda_rebel500.jpg', 471, (SELECT id FROM brand WHERE name = 'Honda'), (SELECT id FROM category WHERE name = 'Custom')),
-- (UUID(), 'Kawasaki Vulcan S', 2021, 'https://example.com/images/kawasaki_vulcan_s.jpg', 649, (SELECT id FROM brand WHERE name = 'Kawasaki'), (SELECT id FROM category WHERE name = 'Custom')),
-- (UUID(), 'Harley-Davidson Street 750', 2022, 'https://example.com/images/harley_street750.jpg', 749, (SELECT id FROM brand WHERE name = 'Harley-Davidson'), (SELECT id FROM category WHERE name = 'Custom')),
-- (UUID(), 'Indian Chief Vintage', 2021, 'https://example.com/images/indian_chief_vintage.jpg', 1811, (SELECT id FROM brand WHERE name = 'Indian'), (SELECT id FROM category WHERE name = 'Custom'));

-- Insertar imagenes para cada moto

INSERT INTO bike_images (bike_id, image_url, is_main) VALUES
((SELECT id FROM bike WHERE name = 'YZF-R1' LIMIT 1), 'https://cdn2.yamaha-motor.eu/prod/product-assets/2025/YZF1000R1COMP/2025-Yamaha-YZF1000R1COMP-EU-Tech_Black-Studio-002-03.jpg', TRUE),
((SELECT id FROM bike WHERE name = 'YZF-R1' LIMIT 1), 'https://cdn2.yamaha-motor.eu/prod/product-assets/2025/YZF1000R1COMP/2025-Yamaha-YZF1000R1COMP-EU-Tech_Black-Studio-004-03.jpg', FALSE),
((SELECT id FROM bike WHERE name = 'YZF-R1' LIMIT 1), 'https://cdn2.yamaha-motor.eu/prod/product-assets/2025/YZF1000R1COMP/2025-Yamaha-YZF1000R1COMP-EU-Tech_Black-Studio-006-03.jpg', FALSE),
((SELECT id FROM bike WHERE name = 'YZF-R1' LIMIT 1), 'https://cdn2.yamaha-motor.eu/prod/product-assets/2025/YZF1000R1COMP/2025-Yamaha-YZF1000R1COMP-EU-Tech_Black-Studio-005-03.jpg', FALSE);
INSERT INTO bike_images (bike_id, image_url, is_main) VALUES
((SELECT id FROM bike WHERE name = 'Ninja ZX-10R' LIMIT 1), 'https://storage.kawasaki.eu/public/kawasaki.eu/en-EU/model/25MY_Ninja_ZX-10R_GN1_STU__2_.jpg', TRUE),
((SELECT id FROM bike WHERE name = 'Ninja ZX-10R' LIMIT 1), 'https://storage.kawasaki.eu/public/kawasaki.eu/en-EU/model/25MY_Ninja_ZX-10R_GN1_STU__3_.jpg', FALSE),
((SELECT id FROM bike WHERE name = 'Ninja ZX-10R' LIMIT 1), 'https://storage.kawasaki.eu/public/kawasaki.eu/en-EU/model/25MY_Ninja_ZX-10R_GN1_STU__1_.jpg', FALSE);
INSERT INTO bike_images (bike_id, image_url, is_main) VALUES
((SELECT id FROM bike WHERE name = 'CBR1000RR-R' LIMIT 1), 'https://www.honda.es/content/dam/central/motorcycles/colour-picker/supersports/cbr1000rr-r/cbr1000rr-r_sp_2024/r-380_grandprixred/24YM_CBR1000RR-R_FIREBLADE_Studio_GRAND_PRIX_RED_SP_RHS.png/jcr:content/renditions/fb_r_w.webp', TRUE);
INSERT INTO bike_images (bike_id, image_url, is_main) VALUES
((SELECT id FROM bike WHERE name = 'CRF250L' LIMIT 1), 'https://www.honda.es/content/dam/central/motorcycles/colour-picker/off-road/crf250r/crf250r_2025/r-292r_extreme_red/25YM_CRF250R_Studio_RHS.png/jcr:content/renditions/fb_r_w.webp', TRUE);
INSERT INTO bike_images (bike_id, image_url, is_main) VALUES
((SELECT id FROM bike WHERE name = '390 Adventure' LIMIT 1), 'https://azwecdnepstoragewebsiteuploads.azureedge.net/PHO_BIKE_90_RE_KTM-390-adv-sw_%23SALL_%23AEPI_%23V1.png', TRUE),
((SELECT id FROM bike WHERE name = '390 Adventure' LIMIT 1), 'https://azwecdnepstoragewebsiteuploads.azureedge.net/PHO_BIKE_90_LI_390-ADVENTURE-SPOKED-WHEELS-EU-MY23-90-Left-EU--Global_%23SALL_%23AEPI_%23V1.png', FALSE),
((SELECT id FROM bike WHERE name = '390 Adventure' LIMIT 1), 'https://azwecdnepstoragewebsiteuploads.azureedge.net/PHO_BIKE_PERS_LIHI_390-ADVENTURE-SPOKED-WHEELS-EU-MY23-Rear-Left-EU--Global_%23SALL_%23AEPI_%23V1.png', FALSE);
INSERT INTO bike_images (bike_id, image_url, is_main) VALUES
((SELECT id FROM bike WHERE name = 'Tenere 700' LIMIT 1), 'https://cdn2.yamaha-motor.eu/prod/product-assets/2025/XTZ700/2025-Yamaha-XTZ700-EU-Icon_Blue-Studio-002-03.jpg', TRUE),
((SELECT id FROM bike WHERE name = 'Tenere 700' LIMIT 1), 'https://cdn2.yamaha-motor.eu/prod/product-assets/2025/XTZ700/2025-Yamaha-XTZ700-EU-Icon_Blue-Studio-004-03.jpg', FALSE),
((SELECT id FROM bike WHERE name = 'Tenere 700' LIMIT 1), 'https://cdn2.yamaha-motor.eu/prod/product-assets/2025/XTZ700/2025-Yamaha-XTZ700-EU-Icon_Blue-Studio-006-03.jpg', FALSE),
((SELECT id FROM bike WHERE name = 'Tenere 700' LIMIT 1), 'https://cdn2.yamaha-motor.eu/prod/product-assets/2025/XTZ700/2025-Yamaha-XTZ700-EU-Icon_Blue-Studio-005-03.jpg', FALSE);
INSERT INTO bike_images (bike_id, image_url, is_main) VALUES
((SELECT id FROM bike WHERE name = 'MT-03' LIMIT 1), 'https://cdn2.yamaha-motor.eu/prod/product-assets/2025/MT320/2025-Yamaha-MT320-EU-Ice_Storm-Studio-002-03.jpg', TRUE),
((SELECT id FROM bike WHERE name = 'MT-03' LIMIT 1), 'https://cdn2.yamaha-motor.eu/prod/product-assets/2025/MT320/2025-Yamaha-MT320-EU-Ice_Storm-Studio-004-03.jpg', FALSE),
((SELECT id FROM bike WHERE name = 'MT-03' LIMIT 1), 'https://cdn2.yamaha-motor.eu/prod/product-assets/2025/MT320/2025-Yamaha-MT320-EU-Ice_Storm-Studio-006-03.jpg', FALSE),
((SELECT id FROM bike WHERE name = 'MT-03' LIMIT 1), 'https://cdn2.yamaha-motor.eu/prod/product-assets/2025/MT320/2025-Yamaha-MT320-EU-Ice_Storm-Studio-005-03.jpg', FALSE);
INSERT INTO bike_images (bike_id, image_url, is_main) VALUES
((SELECT id FROM bike WHERE name = 'Z400' LIMIT 1), 'https://storage.kawasaki.eu/public/kawasaki.eu/en-EU/model/23MY_Z400_GN1_STU__1_.jpg', TRUE),
((SELECT id FROM bike WHERE name = 'Z400' LIMIT 1), 'https://storage.kawasaki.eu/public/kawasaki.eu/en-EU/model/23MY_Z400_GN1_STU__3_.jpg', FALSE);
INSERT INTO bike_images (bike_id, image_url, is_main) VALUES
((SELECT id FROM bike WHERE name = 'CB500F' LIMIT 1), 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fwww.philharmonicmoto.com%2Fwp-content%2Fuploads%2F2023%2F10%2F306310_2021_Honda_CB500F-e1726667344646.jpg&f=1&nofb=1&ipt=10a3cfdb1143fa12929593d21942e080cc3adf0a8c9bfc5daa3355f736e1c1e4&ipo=images', TRUE);
INSERT INTO bike_images (bike_id, image_url, is_main) VALUES
((SELECT id FROM bike WHERE name = 'R 1250 RT' LIMIT 1), 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fs3.eu-west-1.amazonaws.com%2Fcdn.motorbikemag.es%2Fwp-content%2Fuploads%2F2020%2F10%2FBMW-R-1250-RT-2021-55.jpg&f=1&nofb=1&ipt=6f9ad295fc720079896b8464074d12c3784125bf2320cbd415416b50d2b22d66&ipo=images', TRUE);
INSERT INTO bike_images (bike_id, image_url, is_main) VALUES
((SELECT id FROM bike WHERE name = 'VFR800X Crossrunner' LIMIT 1), 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fi0.wp.com%2Fwww.asphaltandrubber.com%2Fwp-content%2Fuploads%2F2014%2F09%2F2015-Honda-VFR800X-Crossrunner-01.jpg&f=1&nofb=1&ipt=e2b84bee9adf055cfe571f484b6d1109f54f8c7a457385fe218f3cdcfe96db8c&ipo=images', TRUE);
INSERT INTO bike_images (bike_id, image_url, is_main) VALUES
((SELECT id FROM bike WHERE name = 'Multistrada 950' LIMIT 1), 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fwww.totalmotorcycle.com%2Fwp-content%2Fuploads%2F2019%2F10%2F2020-Ducati-Multistrada-950S2.jpg&f=1&nofb=1&ipt=10dbff727ef6ee8fb0346eef3ead127b11aaf964f963f821a703df3c8151bdac&ipo=images', TRUE);
INSERT INTO bike_images (bike_id, image_url, is_main) VALUES
((SELECT id FROM bike WHERE name = 'TMAX 560' LIMIT 1), 'https://cdn2.yamaha-motor.eu/prod/product-assets/2024/XP500A/2024-Yamaha-XP500A-EU-Icon_Black-Studio-002-03.jpg', TRUE),
((SELECT id FROM bike WHERE name = 'TMAX 560' LIMIT 1), 'https://cdn2.yamaha-motor.eu/prod/product-assets/2024/XP500A/2024-Yamaha-XP500A-EU-Icon_Black-Studio-006-03.jpg', FALSE),
((SELECT id FROM bike WHERE name = 'TMAX 560' LIMIT 1), 'https://cdn2.yamaha-motor.eu/prod/product-assets/2024/XP500A/2024-Yamaha-XP500A-EU-Icon_Black-Studio-008-03.jpg', FALSE),
((SELECT id FROM bike WHERE name = 'TMAX 560' LIMIT 1), 'https://cdn2.yamaha-motor.eu/prod/product-assets/2024/XP500A/2024-Yamaha-XP500A-EU-Icon_Black-Studio-007-03.jpg', FALSE);
INSERT INTO bike_images (bike_id, image_url, is_main) VALUES
((SELECT id FROM bike WHERE name = 'Forza 350' LIMIT 1), 'https://external-content.duckduckgo.com/iu/?u=http%3A%2F%2Fmotonewsbrasil.com%2Fwp-content%2Fuploads%2F2020%2F10%2Fhonda-forza-350-2021-1.jpg&f=1&nofb=1&ipt=0cf7b8435d452e2c6682e6748de290ac3541529e592810930b61274573099395&ipo=images', TRUE);
INSERT INTO bike_images (bike_id, image_url, is_main) VALUES
((SELECT id FROM bike WHERE name = 'Burgman 650' LIMIT 1), 'https://external-content.duckduckgo.com/iu/?u=http%3A%2F%2Fmotonewsbrasil.com%2Fwp-content%2Fuploads%2F2020%2F10%2Fhonda-forza-350-2021-1.jpg&f=1&nofb=1&ipt=0cf7b8435d452e2c6682e6748de290ac3541529e592810930b61274573099395&ipo=images', TRUE);
INSERT INTO bike_images (bike_id, image_url, is_main) VALUES
((SELECT id FROM bike WHERE name = 'Iron 883' LIMIT 1), 'https://www.moto1pro.com/sites/default/files/harley-davidson-iron-883.jpg', TRUE);
INSERT INTO bike_images (bike_id, image_url, is_main) VALUES
((SELECT id FROM bike WHERE name = 'Scrambler 800' LIMIT 1), 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ffarm5.staticflickr.com%2F4533%2F37991241134_07f5d1a4a4_h.jpg&f=1&nofb=1&ipt=5af19627b3414513f7824c74eadc2c5bd9fdaf1d0e3df125f96c79e701f80fae&ipo=images', TRUE);

-- Verificar los datos
SELECT * FROM bike;