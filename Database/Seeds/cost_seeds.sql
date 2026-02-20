\set ON_ERROR_STOP on

-- ========================================
-- REALISTIC NEPAL PRICING (2025-26)
-- ========================================
-- Key Nepali vs Tourist differences:
--   Permits: Nepali 10-20x less (Sagarmatha: NPR 3000 vs 30000)
--   National parks: Nepali NPR 100 vs NPR 2000
--   Temples: Nepali free vs NPR 1000
--   Accommodation: Nepali local guesthouses 50-60% cheaper
--   Food: Nepali bhojanalaya 50-60% cheaper
--   Guide: Nepali often go without guide
--   Transport: Nepali get local bus rates
-- ========================================

-- =========================
-- EVEREST BASE CAMP TREK
-- =========================

-- NEPALI
INSERT INTO costs (destination_id, season, accommodation_type, group_size_category, nationality,
    transportation_cost, accommodation_cost_per_day, food_cost_per_day, permit_cost, guide_cost_per_day, equipment_cost, miscellaneous_cost)
SELECT id, 'spring', 'standard', 'small', 'nepali',
    4000, 800, 600, 3000, 2000, 3000, 200
FROM destinations WHERE name = 'Everest Base Camp Trek' LIMIT 1;

INSERT INTO costs (destination_id, season, accommodation_type, group_size_category, nationality,
    transportation_cost, accommodation_cost_per_day, food_cost_per_day, permit_cost, guide_cost_per_day, equipment_cost, miscellaneous_cost)
SELECT id, 'autumn', 'standard', 'small', 'nepali',
    5000, 900, 700, 3000, 2000, 3000, 250
FROM destinations WHERE name = 'Everest Base Camp Trek' LIMIT 1;

INSERT INTO costs (destination_id, season, accommodation_type, group_size_category, nationality,
    transportation_cost, accommodation_cost_per_day, food_cost_per_day, permit_cost, guide_cost_per_day, equipment_cost, miscellaneous_cost)
SELECT id, 'winter', 'standard', 'small', 'nepali',
    3500, 600, 500, 3000, 1800, 4000, 200
FROM destinations WHERE name = 'Everest Base Camp Trek' LIMIT 1;

INSERT INTO costs (destination_id, season, accommodation_type, group_size_category, nationality,
    transportation_cost, accommodation_cost_per_day, food_cost_per_day, permit_cost, guide_cost_per_day, equipment_cost, miscellaneous_cost)
SELECT id, 'summer', 'standard', 'small', 'nepali',
    3000, 500, 500, 3000, 1500, 3000, 150
FROM destinations WHERE name = 'Everest Base Camp Trek' LIMIT 1;

-- TOURIST
INSERT INTO costs (destination_id, season, accommodation_type, group_size_category, nationality,
    transportation_cost, accommodation_cost_per_day, food_cost_per_day, permit_cost, guide_cost_per_day, equipment_cost, miscellaneous_cost)
SELECT id, 'spring', 'standard', 'small', 'tourist',
    18000, 2000, 1800, 30000, 3500, 10000, 600
FROM destinations WHERE name = 'Everest Base Camp Trek' LIMIT 1;

INSERT INTO costs (destination_id, season, accommodation_type, group_size_category, nationality,
    transportation_cost, accommodation_cost_per_day, food_cost_per_day, permit_cost, guide_cost_per_day, equipment_cost, miscellaneous_cost)
SELECT id, 'autumn', 'standard', 'small', 'tourist',
    20000, 2200, 2000, 30000, 3500, 10000, 700
FROM destinations WHERE name = 'Everest Base Camp Trek' LIMIT 1;

INSERT INTO costs (destination_id, season, accommodation_type, group_size_category, nationality,
    transportation_cost, accommodation_cost_per_day, food_cost_per_day, permit_cost, guide_cost_per_day, equipment_cost, miscellaneous_cost)
SELECT id, 'winter', 'standard', 'small', 'tourist',
    15000, 1500, 1500, 30000, 3000, 12000, 500
FROM destinations WHERE name = 'Everest Base Camp Trek' LIMIT 1;

INSERT INTO costs (destination_id, season, accommodation_type, group_size_category, nationality,
    transportation_cost, accommodation_cost_per_day, food_cost_per_day, permit_cost, guide_cost_per_day, equipment_cost, miscellaneous_cost)
SELECT id, 'summer', 'standard', 'small', 'tourist',
    12000, 1400, 1400, 30000, 2800, 10000, 400
FROM destinations WHERE name = 'Everest Base Camp Trek' LIMIT 1;

-- =========================
-- EVEREST THREE PASSES TREK
-- =========================

-- NEPALI
INSERT INTO costs (destination_id, season, accommodation_type, group_size_category, nationality,
    transportation_cost, accommodation_cost_per_day, food_cost_per_day, permit_cost, guide_cost_per_day, equipment_cost, miscellaneous_cost)
SELECT id, 'spring', 'standard', 'small', 'nepali',
    4500, 900, 700, 3000, 2200, 4000, 250
FROM destinations WHERE name = 'Everest Three Passes Trek' LIMIT 1;

INSERT INTO costs (destination_id, season, accommodation_type, group_size_category, nationality,
    transportation_cost, accommodation_cost_per_day, food_cost_per_day, permit_cost, guide_cost_per_day, equipment_cost, miscellaneous_cost)
SELECT id, 'autumn', 'standard', 'small', 'nepali',
    5000, 1000, 800, 3000, 2200, 4000, 300
FROM destinations WHERE name = 'Everest Three Passes Trek' LIMIT 1;

-- TOURIST
INSERT INTO costs (destination_id, season, accommodation_type, group_size_category, nationality,
    transportation_cost, accommodation_cost_per_day, food_cost_per_day, permit_cost, guide_cost_per_day, equipment_cost, miscellaneous_cost)
SELECT id, 'spring', 'standard', 'small', 'tourist',
    20000, 2500, 2200, 30000, 4000, 12000, 800
FROM destinations WHERE name = 'Everest Three Passes Trek' LIMIT 1;

INSERT INTO costs (destination_id, season, accommodation_type, group_size_category, nationality,
    transportation_cost, accommodation_cost_per_day, food_cost_per_day, permit_cost, guide_cost_per_day, equipment_cost, miscellaneous_cost)
SELECT id, 'autumn', 'standard', 'small', 'tourist',
    22000, 2700, 2400, 30000, 4000, 12000, 900
FROM destinations WHERE name = 'Everest Three Passes Trek' LIMIT 1;

-- =========================
-- GOKYO LAKES TREK
-- =========================

-- NEPALI
INSERT INTO costs (destination_id, season, accommodation_type, group_size_category, nationality,
    transportation_cost, accommodation_cost_per_day, food_cost_per_day, permit_cost, guide_cost_per_day, equipment_cost, miscellaneous_cost)
SELECT id, 'spring', 'standard', 'small', 'nepali',
    4000, 800, 600, 3000, 1800, 3000, 200
FROM destinations WHERE name = 'Gokyo Lakes Trek' LIMIT 1;

INSERT INTO costs (destination_id, season, accommodation_type, group_size_category, nationality,
    transportation_cost, accommodation_cost_per_day, food_cost_per_day, permit_cost, guide_cost_per_day, equipment_cost, miscellaneous_cost)
SELECT id, 'autumn', 'standard', 'small', 'nepali',
    4500, 900, 650, 3000, 1800, 3000, 220
FROM destinations WHERE name = 'Gokyo Lakes Trek' LIMIT 1;

-- TOURIST
INSERT INTO costs (destination_id, season, accommodation_type, group_size_category, nationality,
    transportation_cost, accommodation_cost_per_day, food_cost_per_day, permit_cost, guide_cost_per_day, equipment_cost, miscellaneous_cost)
SELECT id, 'spring', 'standard', 'small', 'tourist',
    18000, 2000, 1700, 30000, 3500, 10000, 600
FROM destinations WHERE name = 'Gokyo Lakes Trek' LIMIT 1;

INSERT INTO costs (destination_id, season, accommodation_type, group_size_category, nationality,
    transportation_cost, accommodation_cost_per_day, food_cost_per_day, permit_cost, guide_cost_per_day, equipment_cost, miscellaneous_cost)
SELECT id, 'autumn', 'standard', 'small', 'tourist',
    19000, 2200, 1900, 30000, 3500, 10000, 700
FROM destinations WHERE name = 'Gokyo Lakes Trek' LIMIT 1;

-- =========================
-- EVEREST PANORAMA TREK
-- =========================

-- NEPALI
INSERT INTO costs (destination_id, season, accommodation_type, group_size_category, nationality,
    transportation_cost, accommodation_cost_per_day, food_cost_per_day, permit_cost, guide_cost_per_day, equipment_cost, miscellaneous_cost)
SELECT id, 'spring', 'standard', 'small', 'nepali',
    3500, 700, 500, 3000, 1500, 2000, 150
FROM destinations WHERE name = 'Everest Panorama Trek' LIMIT 1;

INSERT INTO costs (destination_id, season, accommodation_type, group_size_category, nationality,
    transportation_cost, accommodation_cost_per_day, food_cost_per_day, permit_cost, guide_cost_per_day, equipment_cost, miscellaneous_cost)
SELECT id, 'autumn', 'standard', 'small', 'nepali',
    4000, 800, 550, 3000, 1500, 2000, 180
FROM destinations WHERE name = 'Everest Panorama Trek' LIMIT 1;

-- TOURIST
INSERT INTO costs (destination_id, season, accommodation_type, group_size_category, nationality,
    transportation_cost, accommodation_cost_per_day, food_cost_per_day, permit_cost, guide_cost_per_day, equipment_cost, miscellaneous_cost)
SELECT id, 'spring', 'standard', 'small', 'tourist',
    15000, 1800, 1500, 30000, 3000, 8000, 500
FROM destinations WHERE name = 'Everest Panorama Trek' LIMIT 1;

INSERT INTO costs (destination_id, season, accommodation_type, group_size_category, nationality,
    transportation_cost, accommodation_cost_per_day, food_cost_per_day, permit_cost, guide_cost_per_day, equipment_cost, miscellaneous_cost)
SELECT id, 'autumn', 'standard', 'small', 'tourist',
    16000, 2000, 1600, 30000, 3000, 8000, 600
FROM destinations WHERE name = 'Everest Panorama Trek' LIMIT 1;

-- =========================
-- ANNAPURNA BASE CAMP TREK
-- =========================

-- NEPALI (ACAP permit: NPR 200 for Nepali vs NPR 3000 for tourist)
INSERT INTO costs (destination_id, season, accommodation_type, group_size_category, nationality,
    transportation_cost, accommodation_cost_per_day, food_cost_per_day, permit_cost, guide_cost_per_day, equipment_cost, miscellaneous_cost)
SELECT id, 'spring', 'standard', 'small', 'nepali',
    2000, 600, 500, 200, 1500, 2000, 150
FROM destinations WHERE name = 'Annapurna Base Camp Trek' LIMIT 1;

INSERT INTO costs (destination_id, season, accommodation_type, group_size_category, nationality,
    transportation_cost, accommodation_cost_per_day, food_cost_per_day, permit_cost, guide_cost_per_day, equipment_cost, miscellaneous_cost)
SELECT id, 'autumn', 'standard', 'small', 'nepali',
    2500, 700, 550, 200, 1500, 2000, 200
FROM destinations WHERE name = 'Annapurna Base Camp Trek' LIMIT 1;

INSERT INTO costs (destination_id, season, accommodation_type, group_size_category, nationality,
    transportation_cost, accommodation_cost_per_day, food_cost_per_day, permit_cost, guide_cost_per_day, equipment_cost, miscellaneous_cost)
SELECT id, 'winter', 'standard', 'small', 'nepali',
    1800, 500, 450, 200, 1300, 2500, 150
FROM destinations WHERE name = 'Annapurna Base Camp Trek' LIMIT 1;

-- TOURIST
INSERT INTO costs (destination_id, season, accommodation_type, group_size_category, nationality,
    transportation_cost, accommodation_cost_per_day, food_cost_per_day, permit_cost, guide_cost_per_day, equipment_cost, miscellaneous_cost)
SELECT id, 'spring', 'standard', 'small', 'tourist',
    8000, 1800, 1500, 6000, 3000, 8000, 500
FROM destinations WHERE name = 'Annapurna Base Camp Trek' LIMIT 1;

INSERT INTO costs (destination_id, season, accommodation_type, group_size_category, nationality,
    transportation_cost, accommodation_cost_per_day, food_cost_per_day, permit_cost, guide_cost_per_day, equipment_cost, miscellaneous_cost)
SELECT id, 'autumn', 'standard', 'small', 'tourist',
    9000, 2000, 1600, 6000, 3000, 8000, 600
FROM destinations WHERE name = 'Annapurna Base Camp Trek' LIMIT 1;

INSERT INTO costs (destination_id, season, accommodation_type, group_size_category, nationality,
    transportation_cost, accommodation_cost_per_day, food_cost_per_day, permit_cost, guide_cost_per_day, equipment_cost, miscellaneous_cost)
SELECT id, 'winter', 'standard', 'small', 'tourist',
    7000, 1500, 1300, 6000, 2800, 9000, 400
FROM destinations WHERE name = 'Annapurna Base Camp Trek' LIMIT 1;

-- =========================
-- ANNAPURNA CIRCUIT TREK
-- =========================

-- NEPALI
INSERT INTO costs (destination_id, season, accommodation_type, group_size_category, nationality,
    transportation_cost, accommodation_cost_per_day, food_cost_per_day, permit_cost, guide_cost_per_day, equipment_cost, miscellaneous_cost)
SELECT id, 'spring', 'standard', 'small', 'nepali',
    2500, 600, 450, 200, 1500, 2000, 150
FROM destinations WHERE name = 'Annapurna Circuit Trek' LIMIT 1;

INSERT INTO costs (destination_id, season, accommodation_type, group_size_category, nationality,
    transportation_cost, accommodation_cost_per_day, food_cost_per_day, permit_cost, guide_cost_per_day, equipment_cost, miscellaneous_cost)
SELECT id, 'autumn', 'standard', 'small', 'nepali',
    3000, 700, 500, 200, 1500, 2000, 180
FROM destinations WHERE name = 'Annapurna Circuit Trek' LIMIT 1;

-- TOURIST
INSERT INTO costs (destination_id, season, accommodation_type, group_size_category, nationality,
    transportation_cost, accommodation_cost_per_day, food_cost_per_day, permit_cost, guide_cost_per_day, equipment_cost, miscellaneous_cost)
SELECT id, 'spring', 'standard', 'small', 'tourist',
    10000, 2000, 1700, 6000, 3500, 10000, 600
FROM destinations WHERE name = 'Annapurna Circuit Trek' LIMIT 1;

INSERT INTO costs (destination_id, season, accommodation_type, group_size_category, nationality,
    transportation_cost, accommodation_cost_per_day, food_cost_per_day, permit_cost, guide_cost_per_day, equipment_cost, miscellaneous_cost)
SELECT id, 'autumn', 'standard', 'small', 'tourist',
    11000, 2200, 1800, 6000, 3500, 10000, 700
FROM destinations WHERE name = 'Annapurna Circuit Trek' LIMIT 1;

-- =========================
-- POON HILL TREK
-- =========================

-- NEPALI
INSERT INTO costs (destination_id, season, accommodation_type, group_size_category, nationality,
    transportation_cost, accommodation_cost_per_day, food_cost_per_day, permit_cost, guide_cost_per_day, equipment_cost, miscellaneous_cost)
SELECT id, 'spring', 'standard', 'small', 'nepali',
    1500, 400, 350, 100, 0, 500, 100
FROM destinations WHERE name = 'Poon Hill Trek' LIMIT 1;

INSERT INTO costs (destination_id, season, accommodation_type, group_size_category, nationality,
    transportation_cost, accommodation_cost_per_day, food_cost_per_day, permit_cost, guide_cost_per_day, equipment_cost, miscellaneous_cost)
SELECT id, 'autumn', 'standard', 'small', 'nepali',
    1800, 450, 400, 100, 0, 500, 120
FROM destinations WHERE name = 'Poon Hill Trek' LIMIT 1;

-- TOURIST
INSERT INTO costs (destination_id, season, accommodation_type, group_size_category, nationality,
    transportation_cost, accommodation_cost_per_day, food_cost_per_day, permit_cost, guide_cost_per_day, equipment_cost, miscellaneous_cost)
SELECT id, 'spring', 'standard', 'small', 'tourist',
    5000, 1200, 1000, 3000, 2500, 5000, 300
FROM destinations WHERE name = 'Poon Hill Trek' LIMIT 1;

INSERT INTO costs (destination_id, season, accommodation_type, group_size_category, nationality,
    transportation_cost, accommodation_cost_per_day, food_cost_per_day, permit_cost, guide_cost_per_day, equipment_cost, miscellaneous_cost)
SELECT id, 'autumn', 'standard', 'small', 'tourist',
    5500, 1300, 1100, 3000, 2500, 5000, 350
FROM destinations WHERE name = 'Poon Hill Trek' LIMIT 1;

-- =========================
-- MARDI HIMAL TREK
-- =========================

-- NEPALI
INSERT INTO costs (destination_id, season, accommodation_type, group_size_category, nationality,
    transportation_cost, accommodation_cost_per_day, food_cost_per_day, permit_cost, guide_cost_per_day, equipment_cost, miscellaneous_cost)
SELECT id, 'spring', 'standard', 'small', 'nepali',
    1800, 500, 400, 100, 1000, 1500, 100
FROM destinations WHERE name = 'Mardi Himal Trek' LIMIT 1;

INSERT INTO costs (destination_id, season, accommodation_type, group_size_category, nationality,
    transportation_cost, accommodation_cost_per_day, food_cost_per_day, permit_cost, guide_cost_per_day, equipment_cost, miscellaneous_cost)
SELECT id, 'autumn', 'standard', 'small', 'nepali',
    2000, 550, 450, 100, 1000, 1500, 120
FROM destinations WHERE name = 'Mardi Himal Trek' LIMIT 1;

-- TOURIST
INSERT INTO costs (destination_id, season, accommodation_type, group_size_category, nationality,
    transportation_cost, accommodation_cost_per_day, food_cost_per_day, permit_cost, guide_cost_per_day, equipment_cost, miscellaneous_cost)
SELECT id, 'spring', 'standard', 'small', 'tourist',
    6000, 1500, 1200, 3000, 2800, 7000, 400
FROM destinations WHERE name = 'Mardi Himal Trek' LIMIT 1;

INSERT INTO costs (destination_id, season, accommodation_type, group_size_category, nationality,
    transportation_cost, accommodation_cost_per_day, food_cost_per_day, permit_cost, guide_cost_per_day, equipment_cost, miscellaneous_cost)
SELECT id, 'autumn', 'standard', 'small', 'tourist',
    6500, 1600, 1300, 3000, 2800, 7000, 450
FROM destinations WHERE name = 'Mardi Himal Trek' LIMIT 1;

-- =========================
-- LANGTANG VALLEY TREK
-- =========================

-- NEPALI
INSERT INTO costs (destination_id, season, accommodation_type, group_size_category, nationality,
    transportation_cost, accommodation_cost_per_day, food_cost_per_day, permit_cost, guide_cost_per_day, equipment_cost, miscellaneous_cost)
SELECT id, 'spring', 'standard', 'small', 'nepali',
    1500, 500, 400, 200, 1200, 1500, 100
FROM destinations WHERE name = 'Langtang Valley Trek' LIMIT 1;

INSERT INTO costs (destination_id, season, accommodation_type, group_size_category, nationality,
    transportation_cost, accommodation_cost_per_day, food_cost_per_day, permit_cost, guide_cost_per_day, equipment_cost, miscellaneous_cost)
SELECT id, 'autumn', 'standard', 'small', 'nepali',
    1800, 550, 450, 200, 1200, 1500, 120
FROM destinations WHERE name = 'Langtang Valley Trek' LIMIT 1;

-- TOURIST
INSERT INTO costs (destination_id, season, accommodation_type, group_size_category, nationality,
    transportation_cost, accommodation_cost_per_day, food_cost_per_day, permit_cost, guide_cost_per_day, equipment_cost, miscellaneous_cost)
SELECT id, 'spring', 'standard', 'small', 'tourist',
    6000, 1500, 1200, 5000, 2800, 7000, 400
FROM destinations WHERE name = 'Langtang Valley Trek' LIMIT 1;

INSERT INTO costs (destination_id, season, accommodation_type, group_size_category, nationality,
    transportation_cost, accommodation_cost_per_day, food_cost_per_day, permit_cost, guide_cost_per_day, equipment_cost, miscellaneous_cost)
SELECT id, 'autumn', 'standard', 'small', 'tourist',
    6500, 1600, 1300, 5000, 2800, 7000, 450
FROM destinations WHERE name = 'Langtang Valley Trek' LIMIT 1;

-- =========================
-- LANGTANG GOSAINKUNDA TREK
-- =========================

-- NEPALI
INSERT INTO costs (destination_id, season, accommodation_type, group_size_category, nationality,
    transportation_cost, accommodation_cost_per_day, food_cost_per_day, permit_cost, guide_cost_per_day, equipment_cost, miscellaneous_cost)
SELECT id, 'spring', 'standard', 'small', 'nepali',
    1800, 600, 450, 200, 1500, 2000, 120
FROM destinations WHERE name = 'Langtang Gosainkunda Trek' LIMIT 1;

INSERT INTO costs (destination_id, season, accommodation_type, group_size_category, nationality,
    transportation_cost, accommodation_cost_per_day, food_cost_per_day, permit_cost, guide_cost_per_day, equipment_cost, miscellaneous_cost)
SELECT id, 'autumn', 'standard', 'small', 'nepali',
    2000, 650, 500, 200, 1500, 2000, 150
FROM destinations WHERE name = 'Langtang Gosainkunda Trek' LIMIT 1;

-- TOURIST
INSERT INTO costs (destination_id, season, accommodation_type, group_size_category, nationality,
    transportation_cost, accommodation_cost_per_day, food_cost_per_day, permit_cost, guide_cost_per_day, equipment_cost, miscellaneous_cost)
SELECT id, 'spring', 'standard', 'small', 'tourist',
    7000, 1700, 1400, 5000, 3000, 8000, 500
FROM destinations WHERE name = 'Langtang Gosainkunda Trek' LIMIT 1;

INSERT INTO costs (destination_id, season, accommodation_type, group_size_category, nationality,
    transportation_cost, accommodation_cost_per_day, food_cost_per_day, permit_cost, guide_cost_per_day, equipment_cost, miscellaneous_cost)
SELECT id, 'autumn', 'standard', 'small', 'tourist',
    7500, 1800, 1500, 5000, 3000, 8000, 550
FROM destinations WHERE name = 'Langtang Gosainkunda Trek' LIMIT 1;

-- =========================
-- MANASLU CIRCUIT TREK
-- =========================

-- NEPALI (Manaslu restricted area permit: NPR 3000 vs USD 100/NPR 13000 for tourist)
INSERT INTO costs (destination_id, season, accommodation_type, group_size_category, nationality,
    transportation_cost, accommodation_cost_per_day, food_cost_per_day, permit_cost, guide_cost_per_day, equipment_cost, miscellaneous_cost)
SELECT id, 'spring', 'standard', 'small', 'nepali',
    3000, 700, 550, 3000, 2000, 3000, 180
FROM destinations WHERE name = 'Manaslu Circuit Trek' LIMIT 1;

INSERT INTO costs (destination_id, season, accommodation_type, group_size_category, nationality,
    transportation_cost, accommodation_cost_per_day, food_cost_per_day, permit_cost, guide_cost_per_day, equipment_cost, miscellaneous_cost)
SELECT id, 'autumn', 'standard', 'small', 'nepali',
    3500, 800, 600, 3000, 2000, 3000, 200
FROM destinations WHERE name = 'Manaslu Circuit Trek' LIMIT 1;

-- TOURIST
INSERT INTO costs (destination_id, season, accommodation_type, group_size_category, nationality,
    transportation_cost, accommodation_cost_per_day, food_cost_per_day, permit_cost, guide_cost_per_day, equipment_cost, miscellaneous_cost)
SELECT id, 'spring', 'standard', 'small', 'tourist',
    12000, 2000, 1700, 15000, 3500, 10000, 600
FROM destinations WHERE name = 'Manaslu Circuit Trek' LIMIT 1;

INSERT INTO costs (destination_id, season, accommodation_type, group_size_category, nationality,
    transportation_cost, accommodation_cost_per_day, food_cost_per_day, permit_cost, guide_cost_per_day, equipment_cost, miscellaneous_cost)
SELECT id, 'autumn', 'standard', 'small', 'tourist',
    13000, 2200, 1800, 15000, 3500, 10000, 700
FROM destinations WHERE name = 'Manaslu Circuit Trek' LIMIT 1;

-- =========================
-- UPPER MUSTANG TREK
-- =========================

-- NEPALI (restricted area but Nepali don't need special permit)
INSERT INTO costs (destination_id, season, accommodation_type, group_size_category, nationality,
    transportation_cost, accommodation_cost_per_day, food_cost_per_day, permit_cost, guide_cost_per_day, equipment_cost, miscellaneous_cost)
SELECT id, 'spring', 'standard', 'small', 'nepali',
    4000, 800, 500, 500, 1800, 2000, 200
FROM destinations WHERE name = 'Upper Mustang Trek' LIMIT 1;

INSERT INTO costs (destination_id, season, accommodation_type, group_size_category, nationality,
    transportation_cost, accommodation_cost_per_day, food_cost_per_day, permit_cost, guide_cost_per_day, equipment_cost, miscellaneous_cost)
SELECT id, 'autumn', 'standard', 'small', 'nepali',
    4500, 900, 550, 500, 1800, 2000, 250
FROM destinations WHERE name = 'Upper Mustang Trek' LIMIT 1;

-- TOURIST (USD 500/10 days restricted area permit = NPR 65000)
INSERT INTO costs (destination_id, season, accommodation_type, group_size_category, nationality,
    transportation_cost, accommodation_cost_per_day, food_cost_per_day, permit_cost, guide_cost_per_day, equipment_cost, miscellaneous_cost)
SELECT id, 'spring', 'standard', 'small', 'tourist',
    15000, 2500, 2000, 65000, 4000, 8000, 800
FROM destinations WHERE name = 'Upper Mustang Trek' LIMIT 1;

INSERT INTO costs (destination_id, season, accommodation_type, group_size_category, nationality,
    transportation_cost, accommodation_cost_per_day, food_cost_per_day, permit_cost, guide_cost_per_day, equipment_cost, miscellaneous_cost)
SELECT id, 'autumn', 'standard', 'small', 'tourist',
    16000, 2700, 2100, 65000, 4000, 8000, 900
FROM destinations WHERE name = 'Upper Mustang Trek' LIMIT 1;

-- ========================================
-- CULTURAL DESTINATION COSTS
-- ========================================

-- =========================
-- KATHMANDU VALLEY CULTURAL TOUR
-- =========================

-- NEPALI (temple/monument entry: free or NPR 50-100)
INSERT INTO costs (destination_id, season, accommodation_type, group_size_category, nationality,
    transportation_cost, accommodation_cost_per_day, food_cost_per_day, permit_cost, guide_cost_per_day, equipment_cost, miscellaneous_cost)
SELECT id, 'spring', 'standard', 'small', 'nepali',
    500, 800, 400, 50, 0, 0, 100
FROM destinations WHERE name = 'Kathmandu Valley Cultural Tour' LIMIT 1;

INSERT INTO costs (destination_id, season, accommodation_type, group_size_category, nationality,
    transportation_cost, accommodation_cost_per_day, food_cost_per_day, permit_cost, guide_cost_per_day, equipment_cost, miscellaneous_cost)
SELECT id, 'autumn', 'standard', 'small', 'nepali',
    500, 800, 400, 50, 0, 0, 100
FROM destinations WHERE name = 'Kathmandu Valley Cultural Tour' LIMIT 1;

INSERT INTO costs (destination_id, season, accommodation_type, group_size_category, nationality,
    transportation_cost, accommodation_cost_per_day, food_cost_per_day, permit_cost, guide_cost_per_day, equipment_cost, miscellaneous_cost)
SELECT id, 'winter', 'standard', 'small', 'nepali',
    500, 700, 350, 50, 0, 0, 80
FROM destinations WHERE name = 'Kathmandu Valley Cultural Tour' LIMIT 1;

INSERT INTO costs (destination_id, season, accommodation_type, group_size_category, nationality,
    transportation_cost, accommodation_cost_per_day, food_cost_per_day, permit_cost, guide_cost_per_day, equipment_cost, miscellaneous_cost)
SELECT id, 'summer', 'standard', 'small', 'nepali',
    500, 700, 350, 50, 0, 0, 80
FROM destinations WHERE name = 'Kathmandu Valley Cultural Tour' LIMIT 1;

-- TOURIST (Durbar Square: NPR 1000-1500 per site)
INSERT INTO costs (destination_id, season, accommodation_type, group_size_category, nationality,
    transportation_cost, accommodation_cost_per_day, food_cost_per_day, permit_cost, guide_cost_per_day, equipment_cost, miscellaneous_cost)
SELECT id, 'spring', 'standard', 'small', 'tourist',
    3000, 3500, 2500, 1500, 4000, 0, 400
FROM destinations WHERE name = 'Kathmandu Valley Cultural Tour' LIMIT 1;

INSERT INTO costs (destination_id, season, accommodation_type, group_size_category, nationality,
    transportation_cost, accommodation_cost_per_day, food_cost_per_day, permit_cost, guide_cost_per_day, equipment_cost, miscellaneous_cost)
SELECT id, 'autumn', 'standard', 'small', 'tourist',
    3000, 3500, 2500, 1500, 4000, 0, 400
FROM destinations WHERE name = 'Kathmandu Valley Cultural Tour' LIMIT 1;

INSERT INTO costs (destination_id, season, accommodation_type, group_size_category, nationality,
    transportation_cost, accommodation_cost_per_day, food_cost_per_day, permit_cost, guide_cost_per_day, equipment_cost, miscellaneous_cost)
SELECT id, 'winter', 'standard', 'small', 'tourist',
    2500, 3000, 2200, 1500, 3500, 0, 350
FROM destinations WHERE name = 'Kathmandu Valley Cultural Tour' LIMIT 1;

INSERT INTO costs (destination_id, season, accommodation_type, group_size_category, nationality,
    transportation_cost, accommodation_cost_per_day, food_cost_per_day, permit_cost, guide_cost_per_day, equipment_cost, miscellaneous_cost)
SELECT id, 'summer', 'standard', 'small', 'tourist',
    2500, 3000, 2200, 1500, 3500, 0, 300
FROM destinations WHERE name = 'Kathmandu Valley Cultural Tour' LIMIT 1;

-- =========================
-- LUMBINI BUDDHIST PILGRIMAGE
-- =========================

-- NEPALI
INSERT INTO costs (destination_id, season, accommodation_type, group_size_category, nationality,
    transportation_cost, accommodation_cost_per_day, food_cost_per_day, permit_cost, guide_cost_per_day, equipment_cost, miscellaneous_cost)
SELECT id, 'spring', 'standard', 'small', 'nepali',
    2000, 500, 300, 0, 0, 0, 100
FROM destinations WHERE name = 'Lumbini Buddhist Pilgrimage' LIMIT 1;

INSERT INTO costs (destination_id, season, accommodation_type, group_size_category, nationality,
    transportation_cost, accommodation_cost_per_day, food_cost_per_day, permit_cost, guide_cost_per_day, equipment_cost, miscellaneous_cost)
SELECT id, 'autumn', 'standard', 'small', 'nepali',
    2000, 500, 300, 0, 0, 0, 100
FROM destinations WHERE name = 'Lumbini Buddhist Pilgrimage' LIMIT 1;

-- TOURIST
INSERT INTO costs (destination_id, season, accommodation_type, group_size_category, nationality,
    transportation_cost, accommodation_cost_per_day, food_cost_per_day, permit_cost, guide_cost_per_day, equipment_cost, miscellaneous_cost)
SELECT id, 'spring', 'standard', 'small', 'tourist',
    8000, 2500, 1800, 200, 3000, 0, 300
FROM destinations WHERE name = 'Lumbini Buddhist Pilgrimage' LIMIT 1;

INSERT INTO costs (destination_id, season, accommodation_type, group_size_category, nationality,
    transportation_cost, accommodation_cost_per_day, food_cost_per_day, permit_cost, guide_cost_per_day, equipment_cost, miscellaneous_cost)
SELECT id, 'autumn', 'standard', 'small', 'tourist',
    8000, 2500, 1800, 200, 3000, 0, 300
FROM destinations WHERE name = 'Lumbini Buddhist Pilgrimage' LIMIT 1;

-- =========================
-- POKHARA CULTURAL EXPERIENCE
-- =========================

-- NEPALI
INSERT INTO costs (destination_id, season, accommodation_type, group_size_category, nationality,
    transportation_cost, accommodation_cost_per_day, food_cost_per_day, permit_cost, guide_cost_per_day, equipment_cost, miscellaneous_cost)
SELECT id, 'spring', 'standard', 'small', 'nepali',
    1500, 600, 350, 50, 0, 0, 100
FROM destinations WHERE name = 'Pokhara Cultural Experience' LIMIT 1;

INSERT INTO costs (destination_id, season, accommodation_type, group_size_category, nationality,
    transportation_cost, accommodation_cost_per_day, food_cost_per_day, permit_cost, guide_cost_per_day, equipment_cost, miscellaneous_cost)
SELECT id, 'autumn', 'standard', 'small', 'nepali',
    1500, 600, 350, 50, 0, 0, 100
FROM destinations WHERE name = 'Pokhara Cultural Experience' LIMIT 1;

-- TOURIST
INSERT INTO costs (destination_id, season, accommodation_type, group_size_category, nationality,
    transportation_cost, accommodation_cost_per_day, food_cost_per_day, permit_cost, guide_cost_per_day, equipment_cost, miscellaneous_cost)
SELECT id, 'spring', 'standard', 'small', 'tourist',
    6000, 3000, 2000, 200, 3500, 0, 400
FROM destinations WHERE name = 'Pokhara Cultural Experience' LIMIT 1;

INSERT INTO costs (destination_id, season, accommodation_type, group_size_category, nationality,
    transportation_cost, accommodation_cost_per_day, food_cost_per_day, permit_cost, guide_cost_per_day, equipment_cost, miscellaneous_cost)
SELECT id, 'autumn', 'standard', 'small', 'tourist',
    6000, 3000, 2000, 200, 3500, 0, 400
FROM destinations WHERE name = 'Pokhara Cultural Experience' LIMIT 1;

-- ========================================
-- WILDLIFE DESTINATION COSTS
-- ========================================

-- =========================
-- CHITWAN NATIONAL PARK SAFARI
-- =========================

-- NEPALI (park entry: NPR 100 vs NPR 2000 for foreigners)
INSERT INTO costs (destination_id, season, accommodation_type, group_size_category, nationality,
    transportation_cost, accommodation_cost_per_day, food_cost_per_day, permit_cost, guide_cost_per_day, equipment_cost, miscellaneous_cost)
SELECT id, 'spring', 'standard', 'small', 'nepali',
    1500, 1500, 500, 100, 1500, 0, 200
FROM destinations WHERE name = 'Chitwan National Park Safari' LIMIT 1;

INSERT INTO costs (destination_id, season, accommodation_type, group_size_category, nationality,
    transportation_cost, accommodation_cost_per_day, food_cost_per_day, permit_cost, guide_cost_per_day, equipment_cost, miscellaneous_cost)
SELECT id, 'autumn', 'standard', 'small', 'nepali',
    1500, 1500, 500, 100, 1500, 0, 200
FROM destinations WHERE name = 'Chitwan National Park Safari' LIMIT 1;

INSERT INTO costs (destination_id, season, accommodation_type, group_size_category, nationality,
    transportation_cost, accommodation_cost_per_day, food_cost_per_day, permit_cost, guide_cost_per_day, equipment_cost, miscellaneous_cost)
SELECT id, 'winter', 'standard', 'small', 'nepali',
    1200, 1200, 450, 100, 1300, 0, 150
FROM destinations WHERE name = 'Chitwan National Park Safari' LIMIT 1;

INSERT INTO costs (destination_id, season, accommodation_type, group_size_category, nationality,
    transportation_cost, accommodation_cost_per_day, food_cost_per_day, permit_cost, guide_cost_per_day, equipment_cost, miscellaneous_cost)
SELECT id, 'summer', 'standard', 'small', 'nepali',
    1000, 1000, 400, 100, 1200, 0, 150
FROM destinations WHERE name = 'Chitwan National Park Safari' LIMIT 1;

-- TOURIST
INSERT INTO costs (destination_id, season, accommodation_type, group_size_category, nationality,
    transportation_cost, accommodation_cost_per_day, food_cost_per_day, permit_cost, guide_cost_per_day, equipment_cost, miscellaneous_cost)
SELECT id, 'spring', 'standard', 'small', 'tourist',
    6000, 8000, 3500, 2000, 4500, 1000, 500
FROM destinations WHERE name = 'Chitwan National Park Safari' LIMIT 1;

INSERT INTO costs (destination_id, season, accommodation_type, group_size_category, nationality,
    transportation_cost, accommodation_cost_per_day, food_cost_per_day, permit_cost, guide_cost_per_day, equipment_cost, miscellaneous_cost)
SELECT id, 'autumn', 'standard', 'small', 'tourist',
    6000, 8000, 3500, 2000, 4500, 1000, 500
FROM destinations WHERE name = 'Chitwan National Park Safari' LIMIT 1;

INSERT INTO costs (destination_id, season, accommodation_type, group_size_category, nationality,
    transportation_cost, accommodation_cost_per_day, food_cost_per_day, permit_cost, guide_cost_per_day, equipment_cost, miscellaneous_cost)
SELECT id, 'winter', 'standard', 'small', 'tourist',
    5500, 7000, 3200, 2000, 4000, 1000, 450
FROM destinations WHERE name = 'Chitwan National Park Safari' LIMIT 1;

INSERT INTO costs (destination_id, season, accommodation_type, group_size_category, nationality,
    transportation_cost, accommodation_cost_per_day, food_cost_per_day, permit_cost, guide_cost_per_day, equipment_cost, miscellaneous_cost)
SELECT id, 'summer', 'standard', 'small', 'tourist',
    5000, 6500, 3000, 2000, 3800, 1000, 400
FROM destinations WHERE name = 'Chitwan National Park Safari' LIMIT 1;

-- =========================
-- BARDIA NATIONAL PARK SAFARI
-- =========================

-- NEPALI
INSERT INTO costs (destination_id, season, accommodation_type, group_size_category, nationality,
    transportation_cost, accommodation_cost_per_day, food_cost_per_day, permit_cost, guide_cost_per_day, equipment_cost, miscellaneous_cost)
SELECT id, 'spring', 'standard', 'small', 'nepali',
    3000, 1800, 500, 100, 1500, 0, 200
FROM destinations WHERE name = 'Bardia National Park Safari' LIMIT 1;

INSERT INTO costs (destination_id, season, accommodation_type, group_size_category, nationality,
    transportation_cost, accommodation_cost_per_day, food_cost_per_day, permit_cost, guide_cost_per_day, equipment_cost, miscellaneous_cost)
SELECT id, 'autumn', 'standard', 'small', 'nepali',
    3000, 1800, 500, 100, 1500, 0, 200
FROM destinations WHERE name = 'Bardia National Park Safari' LIMIT 1;

INSERT INTO costs (destination_id, season, accommodation_type, group_size_category, nationality,
    transportation_cost, accommodation_cost_per_day, food_cost_per_day, permit_cost, guide_cost_per_day, equipment_cost, miscellaneous_cost)
SELECT id, 'winter', 'standard', 'small', 'nepali',
    2500, 1500, 450, 100, 1300, 0, 180
FROM destinations WHERE name = 'Bardia National Park Safari' LIMIT 1;

-- TOURIST
INSERT INTO costs (destination_id, season, accommodation_type, group_size_category, nationality,
    transportation_cost, accommodation_cost_per_day, food_cost_per_day, permit_cost, guide_cost_per_day, equipment_cost, miscellaneous_cost)
SELECT id, 'spring', 'standard', 'small', 'tourist',
    12000, 9000, 3800, 2500, 5000, 1500, 600
FROM destinations WHERE name = 'Bardia National Park Safari' LIMIT 1;

INSERT INTO costs (destination_id, season, accommodation_type, group_size_category, nationality,
    transportation_cost, accommodation_cost_per_day, food_cost_per_day, permit_cost, guide_cost_per_day, equipment_cost, miscellaneous_cost)
SELECT id, 'autumn', 'standard', 'small', 'tourist',
    12000, 9000, 3800, 2500, 5000, 1500, 600
FROM destinations WHERE name = 'Bardia National Park Safari' LIMIT 1;

INSERT INTO costs (destination_id, season, accommodation_type, group_size_category, nationality,
    transportation_cost, accommodation_cost_per_day, food_cost_per_day, permit_cost, guide_cost_per_day, equipment_cost, miscellaneous_cost)
SELECT id, 'winter', 'standard', 'small', 'tourist',
    11000, 8000, 3500, 2500, 4500, 1500, 550
FROM destinations WHERE name = 'Bardia National Park Safari' LIMIT 1;

-- =========================
-- KOSHI TAPPU WILDLIFE RESERVE
-- =========================

-- NEPALI
INSERT INTO costs (destination_id, season, accommodation_type, group_size_category, nationality,
    transportation_cost, accommodation_cost_per_day, food_cost_per_day, permit_cost, guide_cost_per_day, equipment_cost, miscellaneous_cost)
SELECT id, 'spring', 'standard', 'small', 'nepali',
    2000, 1200, 400, 100, 1200, 500, 150
FROM destinations WHERE name = 'Koshi Tappu Wildlife Reserve' LIMIT 1;

INSERT INTO costs (destination_id, season, accommodation_type, group_size_category, nationality,
    transportation_cost, accommodation_cost_per_day, food_cost_per_day, permit_cost, guide_cost_per_day, equipment_cost, miscellaneous_cost)
SELECT id, 'autumn', 'standard', 'small', 'nepali',
    2000, 1200, 400, 100, 1200, 500, 150
FROM destinations WHERE name = 'Koshi Tappu Wildlife Reserve' LIMIT 1;

INSERT INTO costs (destination_id, season, accommodation_type, group_size_category, nationality,
    transportation_cost, accommodation_cost_per_day, food_cost_per_day, permit_cost, guide_cost_per_day, equipment_cost, miscellaneous_cost)
SELECT id, 'winter', 'standard', 'small', 'nepali',
    1800, 1000, 350, 100, 1000, 500, 120
FROM destinations WHERE name = 'Koshi Tappu Wildlife Reserve' LIMIT 1;

-- TOURIST
INSERT INTO costs (destination_id, season, accommodation_type, group_size_category, nationality,
    transportation_cost, accommodation_cost_per_day, food_cost_per_day, permit_cost, guide_cost_per_day, equipment_cost, miscellaneous_cost)
SELECT id, 'spring', 'standard', 'small', 'tourist',
    8000, 7000, 3000, 1500, 4000, 2000, 400
FROM destinations WHERE name = 'Koshi Tappu Wildlife Reserve' LIMIT 1;

INSERT INTO costs (destination_id, season, accommodation_type, group_size_category, nationality,
    transportation_cost, accommodation_cost_per_day, food_cost_per_day, permit_cost, guide_cost_per_day, equipment_cost, miscellaneous_cost)
SELECT id, 'autumn', 'standard', 'small', 'tourist',
    8000, 7000, 3000, 1500, 4000, 2000, 400
FROM destinations WHERE name = 'Koshi Tappu Wildlife Reserve' LIMIT 1;

INSERT INTO costs (destination_id, season, accommodation_type, group_size_category, nationality,
    transportation_cost, accommodation_cost_per_day, food_cost_per_day, permit_cost, guide_cost_per_day, equipment_cost, miscellaneous_cost)
SELECT id, 'winter', 'standard', 'small', 'tourist',
    7500, 6500, 2800, 1500, 3800, 2000, 350
FROM destinations WHERE name = 'Koshi Tappu Wildlife Reserve' LIMIT 1;

-- ========================================
-- ADVENTURE DESTINATION COSTS
-- ========================================

-- =========================
-- EVEREST BASE CAMP HELICOPTER TOUR
-- =========================

-- NEPALI (helicopter cost same but slightly less)
INSERT INTO costs (destination_id, season, accommodation_type, group_size_category, nationality,
    transportation_cost, accommodation_cost_per_day, food_cost_per_day, permit_cost, guide_cost_per_day, equipment_cost, miscellaneous_cost)
SELECT id, 'spring', 'standard', 'small', 'nepali',
    200000, 800, 500, 3000, 0, 0, 300
FROM destinations WHERE name = 'Everest Base Camp Helicopter Tour' LIMIT 1;

INSERT INTO costs (destination_id, season, accommodation_type, group_size_category, nationality,
    transportation_cost, accommodation_cost_per_day, food_cost_per_day, permit_cost, guide_cost_per_day, equipment_cost, miscellaneous_cost)
SELECT id, 'autumn', 'standard', 'small', 'nepali',
    200000, 800, 500, 3000, 0, 0, 300
FROM destinations WHERE name = 'Everest Base Camp Helicopter Tour' LIMIT 1;

-- TOURIST
INSERT INTO costs (destination_id, season, accommodation_type, group_size_category, nationality,
    transportation_cost, accommodation_cost_per_day, food_cost_per_day, permit_cost, guide_cost_per_day, equipment_cost, miscellaneous_cost)
SELECT id, 'spring', 'standard', 'small', 'tourist',
    300000, 5000, 3000, 30000, 0, 0, 1000
FROM destinations WHERE name = 'Everest Base Camp Helicopter Tour' LIMIT 1;

INSERT INTO costs (destination_id, season, accommodation_type, group_size_category, nationality,
    transportation_cost, accommodation_cost_per_day, food_cost_per_day, permit_cost, guide_cost_per_day, equipment_cost, miscellaneous_cost)
SELECT id, 'autumn', 'standard', 'small', 'tourist',
    300000, 5000, 3000, 30000, 0, 0, 1000
FROM destinations WHERE name = 'Everest Base Camp Helicopter Tour' LIMIT 1;

-- =========================
-- POKHARA PARAGLIDING
-- =========================

-- NEPALI (paragliding: NPR 5000-7000 for Nepali vs NPR 12000-15000 for tourist)
INSERT INTO costs (destination_id, season, accommodation_type, group_size_category, nationality,
    transportation_cost, accommodation_cost_per_day, food_cost_per_day, permit_cost, guide_cost_per_day, equipment_cost, miscellaneous_cost)
SELECT id, 'spring', 'standard', 'small', 'nepali',
    500, 600, 400, 0, 0, 5000, 100
FROM destinations WHERE name = 'Pokhara Paragliding' LIMIT 1;

INSERT INTO costs (destination_id, season, accommodation_type, group_size_category, nationality,
    transportation_cost, accommodation_cost_per_day, food_cost_per_day, permit_cost, guide_cost_per_day, equipment_cost, miscellaneous_cost)
SELECT id, 'autumn', 'standard', 'small', 'nepali',
    500, 600, 400, 0, 0, 5000, 100
FROM destinations WHERE name = 'Pokhara Paragliding' LIMIT 1;

-- TOURIST
INSERT INTO costs (destination_id, season, accommodation_type, group_size_category, nationality,
    transportation_cost, accommodation_cost_per_day, food_cost_per_day, permit_cost, guide_cost_per_day, equipment_cost, miscellaneous_cost)
SELECT id, 'spring', 'standard', 'small', 'tourist',
    1500, 3000, 2000, 0, 0, 15000, 200
FROM destinations WHERE name = 'Pokhara Paragliding' LIMIT 1;

INSERT INTO costs (destination_id, season, accommodation_type, group_size_category, nationality,
    transportation_cost, accommodation_cost_per_day, food_cost_per_day, permit_cost, guide_cost_per_day, equipment_cost, miscellaneous_cost)
SELECT id, 'autumn', 'standard', 'small', 'tourist',
    1500, 3000, 2000, 0, 0, 15000, 200
FROM destinations WHERE name = 'Pokhara Paragliding' LIMIT 1;

-- =========================
-- BUNGEE JUMPING BHOTE KOSHI
-- =========================

-- NEPALI (bungee: NPR 5000-6000 for Nepali)
INSERT INTO costs (destination_id, season, accommodation_type, group_size_category, nationality,
    transportation_cost, accommodation_cost_per_day, food_cost_per_day, permit_cost, guide_cost_per_day, equipment_cost, miscellaneous_cost)
SELECT id, 'spring', 'standard', 'small', 'nepali',
    1500, 500, 400, 0, 0, 5500, 100
FROM destinations WHERE name = 'Bungee Jumping Bhote Koshi' LIMIT 1;

INSERT INTO costs (destination_id, season, accommodation_type, group_size_category, nationality,
    transportation_cost, accommodation_cost_per_day, food_cost_per_day, permit_cost, guide_cost_per_day, equipment_cost, miscellaneous_cost)
SELECT id, 'autumn', 'standard', 'small', 'nepali',
    1500, 500, 400, 0, 0, 5500, 100
FROM destinations WHERE name = 'Bungee Jumping Bhote Koshi' LIMIT 1;

-- TOURIST
INSERT INTO costs (destination_id, season, accommodation_type, group_size_category, nationality,
    transportation_cost, accommodation_cost_per_day, food_cost_per_day, permit_cost, guide_cost_per_day, equipment_cost, miscellaneous_cost)
SELECT id, 'spring', 'standard', 'small', 'tourist',
    3000, 2000, 1500, 0, 0, 10000, 200
FROM destinations WHERE name = 'Bungee Jumping Bhote Koshi' LIMIT 1;

INSERT INTO costs (destination_id, season, accommodation_type, group_size_category, nationality,
    transportation_cost, accommodation_cost_per_day, food_cost_per_day, permit_cost, guide_cost_per_day, equipment_cost, miscellaneous_cost)
SELECT id, 'autumn', 'standard', 'small', 'tourist',
    3000, 2000, 1500, 0, 0, 10000, 200
FROM destinations WHERE name = 'Bungee Jumping Bhote Koshi' LIMIT 1;

-- =========================
-- WHITE WATER RAFTING TRISHULI
-- =========================

-- NEPALI
INSERT INTO costs (destination_id, season, accommodation_type, group_size_category, nationality,
    transportation_cost, accommodation_cost_per_day, food_cost_per_day, permit_cost, guide_cost_per_day, equipment_cost, miscellaneous_cost)
SELECT id, 'spring', 'standard', 'small', 'nepali',
    800, 400, 350, 0, 1000, 1500, 100
FROM destinations WHERE name = 'White Water Rafting Trishuli River' LIMIT 1;

INSERT INTO costs (destination_id, season, accommodation_type, group_size_category, nationality,
    transportation_cost, accommodation_cost_per_day, food_cost_per_day, permit_cost, guide_cost_per_day, equipment_cost, miscellaneous_cost)
SELECT id, 'autumn', 'standard', 'small', 'nepali',
    800, 400, 350, 0, 1000, 1500, 100
FROM destinations WHERE name = 'White Water Rafting Trishuli River' LIMIT 1;

-- TOURIST
INSERT INTO costs (destination_id, season, accommodation_type, group_size_category, nationality,
    transportation_cost, accommodation_cost_per_day, food_cost_per_day, permit_cost, guide_cost_per_day, equipment_cost, miscellaneous_cost)
SELECT id, 'spring', 'standard', 'small', 'tourist',
    2000, 1500, 1200, 500, 3000, 2000, 300
FROM destinations WHERE name = 'White Water Rafting Trishuli River' LIMIT 1;

INSERT INTO costs (destination_id, season, accommodation_type, group_size_category, nationality,
    transportation_cost, accommodation_cost_per_day, food_cost_per_day, permit_cost, guide_cost_per_day, equipment_cost, miscellaneous_cost)
SELECT id, 'autumn', 'standard', 'small', 'tourist',
    2000, 1500, 1200, 500, 3000, 2000, 300
FROM destinations WHERE name = 'White Water Rafting Trishuli River' LIMIT 1;

-- =========================
-- PEAK CLIMBING - ISLAND PEAK
-- =========================

-- NEPALI
INSERT INTO costs (destination_id, season, accommodation_type, group_size_category, nationality,
    transportation_cost, accommodation_cost_per_day, food_cost_per_day, permit_cost, guide_cost_per_day, equipment_cost, miscellaneous_cost)
SELECT id, 'spring', 'standard', 'small', 'nepali',
    5000, 900, 700, 5000, 3000, 8000, 300
FROM destinations WHERE name = 'Peak Climbing - Island Peak' LIMIT 1;

INSERT INTO costs (destination_id, season, accommodation_type, group_size_category, nationality,
    transportation_cost, accommodation_cost_per_day, food_cost_per_day, permit_cost, guide_cost_per_day, equipment_cost, miscellaneous_cost)
SELECT id, 'autumn', 'standard', 'small', 'nepali',
    5500, 1000, 750, 5000, 3000, 8000, 350
FROM destinations WHERE name = 'Peak Climbing - Island Peak' LIMIT 1;

-- TOURIST
INSERT INTO costs (destination_id, season, accommodation_type, group_size_category, nationality,
    transportation_cost, accommodation_cost_per_day, food_cost_per_day, permit_cost, guide_cost_per_day, equipment_cost, miscellaneous_cost)
SELECT id, 'spring', 'standard', 'small', 'tourist',
    20000, 2500, 2000, 25000, 6000, 25000, 1000
FROM destinations WHERE name = 'Peak Climbing - Island Peak' LIMIT 1;

INSERT INTO costs (destination_id, season, accommodation_type, group_size_category, nationality,
    transportation_cost, accommodation_cost_per_day, food_cost_per_day, permit_cost, guide_cost_per_day, equipment_cost, miscellaneous_cost)
SELECT id, 'autumn', 'standard', 'small', 'tourist',
    20000, 2500, 2000, 25000, 6000, 25000, 1000
FROM destinations WHERE name = 'Peak Climbing - Island Peak' LIMIT 1;

-- ========================================
-- PILGRIMAGE DESTINATION COSTS
-- ========================================

-- =========================
-- MUKTINATH PILGRIMAGE TOUR
-- =========================

-- NEPALI
INSERT INTO costs (destination_id, season, accommodation_type, group_size_category, nationality,
    transportation_cost, accommodation_cost_per_day, food_cost_per_day, permit_cost, guide_cost_per_day, equipment_cost, miscellaneous_cost)
SELECT id, 'spring', 'standard', 'small', 'nepali',
    3000, 500, 350, 100, 0, 500, 100
FROM destinations WHERE name = 'Muktinath Pilgrimage Tour' LIMIT 1;

INSERT INTO costs (destination_id, season, accommodation_type, group_size_category, nationality,
    transportation_cost, accommodation_cost_per_day, food_cost_per_day, permit_cost, guide_cost_per_day, equipment_cost, miscellaneous_cost)
SELECT id, 'autumn', 'standard', 'small', 'nepali',
    3000, 500, 350, 100, 0, 500, 100
FROM destinations WHERE name = 'Muktinath Pilgrimage Tour' LIMIT 1;

-- TOURIST
INSERT INTO costs (destination_id, season, accommodation_type, group_size_category, nationality,
    transportation_cost, accommodation_cost_per_day, food_cost_per_day, permit_cost, guide_cost_per_day, equipment_cost, miscellaneous_cost)
SELECT id, 'spring', 'standard', 'small', 'tourist',
    12000, 2000, 1500, 3000, 3000, 3000, 400
FROM destinations WHERE name = 'Muktinath Pilgrimage Tour' LIMIT 1;

INSERT INTO costs (destination_id, season, accommodation_type, group_size_category, nationality,
    transportation_cost, accommodation_cost_per_day, food_cost_per_day, permit_cost, guide_cost_per_day, equipment_cost, miscellaneous_cost)
SELECT id, 'autumn', 'standard', 'small', 'tourist',
    12000, 2000, 1500, 3000, 3000, 3000, 400
FROM destinations WHERE name = 'Muktinath Pilgrimage Tour' LIMIT 1;

-- =========================
-- GOSAINKUNDA LAKE PILGRIMAGE
-- =========================

-- NEPALI
INSERT INTO costs (destination_id, season, accommodation_type, group_size_category, nationality,
    transportation_cost, accommodation_cost_per_day, food_cost_per_day, permit_cost, guide_cost_per_day, equipment_cost, miscellaneous_cost)
SELECT id, 'spring', 'standard', 'small', 'nepali',
    1500, 500, 400, 200, 1000, 1000, 100
FROM destinations WHERE name = 'Gosainkunda Lake Pilgrimage' LIMIT 1;

INSERT INTO costs (destination_id, season, accommodation_type, group_size_category, nationality,
    transportation_cost, accommodation_cost_per_day, food_cost_per_day, permit_cost, guide_cost_per_day, equipment_cost, miscellaneous_cost)
SELECT id, 'autumn', 'standard', 'small', 'nepali',
    1800, 550, 450, 200, 1000, 1000, 120
FROM destinations WHERE name = 'Gosainkunda Lake Pilgrimage' LIMIT 1;

-- TOURIST
INSERT INTO costs (destination_id, season, accommodation_type, group_size_category, nationality,
    transportation_cost, accommodation_cost_per_day, food_cost_per_day, permit_cost, guide_cost_per_day, equipment_cost, miscellaneous_cost)
SELECT id, 'spring', 'standard', 'small', 'tourist',
    6000, 1600, 1300, 5000, 2800, 6000, 400
FROM destinations WHERE name = 'Gosainkunda Lake Pilgrimage' LIMIT 1;

INSERT INTO costs (destination_id, season, accommodation_type, group_size_category, nationality,
    transportation_cost, accommodation_cost_per_day, food_cost_per_day, permit_cost, guide_cost_per_day, equipment_cost, miscellaneous_cost)
SELECT id, 'autumn', 'standard', 'small', 'tourist',
    6500, 1700, 1400, 5000, 2800, 6000, 450
FROM destinations WHERE name = 'Gosainkunda Lake Pilgrimage' LIMIT 1;

-- =========================
-- PASHUPATINATH TEMPLE TOUR
-- =========================

-- NEPALI (free entry for Nepali citizens)
INSERT INTO costs (destination_id, season, accommodation_type, group_size_category, nationality,
    transportation_cost, accommodation_cost_per_day, food_cost_per_day, permit_cost, guide_cost_per_day, equipment_cost, miscellaneous_cost)
SELECT id, 'spring', 'standard', 'small', 'nepali',
    200, 600, 300, 0, 0, 0, 100
FROM destinations WHERE name = 'Pashupatinath Temple Tour' LIMIT 1;

INSERT INTO costs (destination_id, season, accommodation_type, group_size_category, nationality,
    transportation_cost, accommodation_cost_per_day, food_cost_per_day, permit_cost, guide_cost_per_day, equipment_cost, miscellaneous_cost)
SELECT id, 'autumn', 'standard', 'small', 'nepali',
    200, 600, 300, 0, 0, 0, 100
FROM destinations WHERE name = 'Pashupatinath Temple Tour' LIMIT 1;

-- TOURIST (NPR 1000 entry for foreigners)
INSERT INTO costs (destination_id, season, accommodation_type, group_size_category, nationality,
    transportation_cost, accommodation_cost_per_day, food_cost_per_day, permit_cost, guide_cost_per_day, equipment_cost, miscellaneous_cost)
SELECT id, 'spring', 'standard', 'small', 'tourist',
    500, 3000, 2000, 1000, 2500, 0, 200
FROM destinations WHERE name = 'Pashupatinath Temple Tour' LIMIT 1;

INSERT INTO costs (destination_id, season, accommodation_type, group_size_category, nationality,
    transportation_cost, accommodation_cost_per_day, food_cost_per_day, permit_cost, guide_cost_per_day, equipment_cost, miscellaneous_cost)
SELECT id, 'autumn', 'standard', 'small', 'tourist',
    500, 3000, 2000, 1000, 2500, 0, 200
FROM destinations WHERE name = 'Pashupatinath Temple Tour' LIMIT 1;

-- ========================================
-- BULK INSERT FOR REMAINING DESTINATIONS
-- ========================================

-- ==== NEPALI PRICING ====

-- Easy difficulty (Nepali) - all seasons
INSERT INTO costs (destination_id, season, accommodation_type, group_size_category, nationality,
    transportation_cost, accommodation_cost_per_day, food_cost_per_day, permit_cost, guide_cost_per_day, equipment_cost, miscellaneous_cost)
SELECT id, 'spring', 'standard', 'small', 'nepali', 1200, 400, 350, 100, 0, 500, 80
FROM destinations WHERE difficulty = 'easy' AND id NOT IN (SELECT destination_id FROM costs WHERE nationality = 'nepali');

INSERT INTO costs (destination_id, season, accommodation_type, group_size_category, nationality,
    transportation_cost, accommodation_cost_per_day, food_cost_per_day, permit_cost, guide_cost_per_day, equipment_cost, miscellaneous_cost)
SELECT id, 'autumn', 'standard', 'small', 'nepali', 1400, 450, 400, 100, 0, 500, 100
FROM destinations WHERE difficulty = 'easy' AND id NOT IN (SELECT destination_id FROM costs WHERE nationality = 'nepali' AND season = 'autumn');

INSERT INTO costs (destination_id, season, accommodation_type, group_size_category, nationality,
    transportation_cost, accommodation_cost_per_day, food_cost_per_day, permit_cost, guide_cost_per_day, equipment_cost, miscellaneous_cost)
SELECT id, 'winter', 'standard', 'small', 'nepali', 1000, 350, 300, 100, 0, 600, 70
FROM destinations WHERE difficulty = 'easy' AND id NOT IN (SELECT destination_id FROM costs WHERE nationality = 'nepali' AND season = 'winter');

INSERT INTO costs (destination_id, season, accommodation_type, group_size_category, nationality,
    transportation_cost, accommodation_cost_per_day, food_cost_per_day, permit_cost, guide_cost_per_day, equipment_cost, miscellaneous_cost)
SELECT id, 'summer', 'standard', 'small', 'nepali', 900, 300, 300, 100, 0, 500, 60
FROM destinations WHERE difficulty = 'easy' AND id NOT IN (SELECT destination_id FROM costs WHERE nationality = 'nepali' AND season = 'summer');

-- Moderate difficulty (Nepali) - all seasons
INSERT INTO costs (destination_id, season, accommodation_type, group_size_category, nationality,
    transportation_cost, accommodation_cost_per_day, food_cost_per_day, permit_cost, guide_cost_per_day, equipment_cost, miscellaneous_cost)
SELECT id, 'spring', 'standard', 'small', 'nepali', 2000, 600, 450, 200, 1200, 1500, 100
FROM destinations WHERE difficulty = 'moderate' AND id NOT IN (SELECT destination_id FROM costs WHERE nationality = 'nepali');

INSERT INTO costs (destination_id, season, accommodation_type, group_size_category, nationality,
    transportation_cost, accommodation_cost_per_day, food_cost_per_day, permit_cost, guide_cost_per_day, equipment_cost, miscellaneous_cost)
SELECT id, 'autumn', 'standard', 'small', 'nepali', 2200, 650, 500, 200, 1200, 1500, 120
FROM destinations WHERE difficulty = 'moderate' AND id NOT IN (SELECT destination_id FROM costs WHERE nationality = 'nepali' AND season = 'autumn');

INSERT INTO costs (destination_id, season, accommodation_type, group_size_category, nationality,
    transportation_cost, accommodation_cost_per_day, food_cost_per_day, permit_cost, guide_cost_per_day, equipment_cost, miscellaneous_cost)
SELECT id, 'winter', 'standard', 'small', 'nepali', 1800, 500, 400, 200, 1000, 2000, 90
FROM destinations WHERE difficulty = 'moderate' AND id NOT IN (SELECT destination_id FROM costs WHERE nationality = 'nepali' AND season = 'winter');

INSERT INTO costs (destination_id, season, accommodation_type, group_size_category, nationality,
    transportation_cost, accommodation_cost_per_day, food_cost_per_day, permit_cost, guide_cost_per_day, equipment_cost, miscellaneous_cost)
SELECT id, 'summer', 'standard', 'small', 'nepali', 1500, 450, 350, 200, 900, 1500, 80
FROM destinations WHERE difficulty = 'moderate' AND id NOT IN (SELECT destination_id FROM costs WHERE nationality = 'nepali' AND season = 'summer');

-- Challenging difficulty (Nepali) - all seasons
INSERT INTO costs (destination_id, season, accommodation_type, group_size_category, nationality,
    transportation_cost, accommodation_cost_per_day, food_cost_per_day, permit_cost, guide_cost_per_day, equipment_cost, miscellaneous_cost)
SELECT id, 'spring', 'standard', 'small', 'nepali', 3500, 700, 550, 500, 1800, 2500, 150
FROM destinations WHERE difficulty = 'challenging' AND id NOT IN (SELECT destination_id FROM costs WHERE nationality = 'nepali');

INSERT INTO costs (destination_id, season, accommodation_type, group_size_category, nationality,
    transportation_cost, accommodation_cost_per_day, food_cost_per_day, permit_cost, guide_cost_per_day, equipment_cost, miscellaneous_cost)
SELECT id, 'autumn', 'standard', 'small', 'nepali', 4000, 800, 600, 500, 1800, 2500, 180
FROM destinations WHERE difficulty = 'challenging' AND id NOT IN (SELECT destination_id FROM costs WHERE nationality = 'nepali' AND season = 'autumn');

INSERT INTO costs (destination_id, season, accommodation_type, group_size_category, nationality,
    transportation_cost, accommodation_cost_per_day, food_cost_per_day, permit_cost, guide_cost_per_day, equipment_cost, miscellaneous_cost)
SELECT id, 'winter', 'standard', 'small', 'nepali', 3000, 600, 500, 500, 1500, 3000, 130
FROM destinations WHERE difficulty = 'challenging' AND id NOT IN (SELECT destination_id FROM costs WHERE nationality = 'nepali' AND season = 'winter');

INSERT INTO costs (destination_id, season, accommodation_type, group_size_category, nationality,
    transportation_cost, accommodation_cost_per_day, food_cost_per_day, permit_cost, guide_cost_per_day, equipment_cost, miscellaneous_cost)
SELECT id, 'summer', 'standard', 'small', 'nepali', 2500, 550, 450, 500, 1300, 2500, 100
FROM destinations WHERE difficulty = 'challenging' AND id NOT IN (SELECT destination_id FROM costs WHERE nationality = 'nepali' AND season = 'summer');

-- Strenuous difficulty (Nepali) - all seasons
INSERT INTO costs (destination_id, season, accommodation_type, group_size_category, nationality,
    transportation_cost, accommodation_cost_per_day, food_cost_per_day, permit_cost, guide_cost_per_day, equipment_cost, miscellaneous_cost)
SELECT id, 'spring', 'standard', 'small', 'nepali', 4500, 800, 600, 3000, 2000, 3000, 200
FROM destinations WHERE difficulty = 'strenuous' AND id NOT IN (SELECT destination_id FROM costs WHERE nationality = 'nepali');

INSERT INTO costs (destination_id, season, accommodation_type, group_size_category, nationality,
    transportation_cost, accommodation_cost_per_day, food_cost_per_day, permit_cost, guide_cost_per_day, equipment_cost, miscellaneous_cost)
SELECT id, 'autumn', 'standard', 'small', 'nepali', 5000, 900, 700, 3000, 2000, 3000, 250
FROM destinations WHERE difficulty = 'strenuous' AND id NOT IN (SELECT destination_id FROM costs WHERE nationality = 'nepali' AND season = 'autumn');

INSERT INTO costs (destination_id, season, accommodation_type, group_size_category, nationality,
    transportation_cost, accommodation_cost_per_day, food_cost_per_day, permit_cost, guide_cost_per_day, equipment_cost, miscellaneous_cost)
SELECT id, 'winter', 'standard', 'small', 'nepali', 3500, 600, 500, 3000, 1800, 4000, 180
FROM destinations WHERE difficulty = 'strenuous' AND id NOT IN (SELECT destination_id FROM costs WHERE nationality = 'nepali' AND season = 'winter');

INSERT INTO costs (destination_id, season, accommodation_type, group_size_category, nationality,
    transportation_cost, accommodation_cost_per_day, food_cost_per_day, permit_cost, guide_cost_per_day, equipment_cost, miscellaneous_cost)
SELECT id, 'summer', 'standard', 'small', 'nepali', 3000, 550, 450, 3000, 1500, 3000, 150
FROM destinations WHERE difficulty = 'strenuous' AND id NOT IN (SELECT destination_id FROM costs WHERE nationality = 'nepali' AND season = 'summer');

-- ==== TOURIST PRICING ====

-- Easy difficulty (Tourist) - all seasons
INSERT INTO costs (destination_id, season, accommodation_type, group_size_category, nationality,
    transportation_cost, accommodation_cost_per_day, food_cost_per_day, permit_cost, guide_cost_per_day, equipment_cost, miscellaneous_cost)
SELECT id, 'spring', 'standard', 'small', 'tourist', 5000, 1200, 1000, 2000, 2500, 3000, 300
FROM destinations WHERE difficulty = 'easy' AND id NOT IN (SELECT destination_id FROM costs WHERE nationality = 'tourist');

INSERT INTO costs (destination_id, season, accommodation_type, group_size_category, nationality,
    transportation_cost, accommodation_cost_per_day, food_cost_per_day, permit_cost, guide_cost_per_day, equipment_cost, miscellaneous_cost)
SELECT id, 'autumn', 'standard', 'small', 'tourist', 5500, 1300, 1100, 2000, 2500, 3000, 350
FROM destinations WHERE difficulty = 'easy' AND id NOT IN (SELECT destination_id FROM costs WHERE nationality = 'tourist' AND season = 'autumn');

INSERT INTO costs (destination_id, season, accommodation_type, group_size_category, nationality,
    transportation_cost, accommodation_cost_per_day, food_cost_per_day, permit_cost, guide_cost_per_day, equipment_cost, miscellaneous_cost)
SELECT id, 'winter', 'standard', 'small', 'tourist', 4500, 1100, 900, 2000, 2300, 3500, 250
FROM destinations WHERE difficulty = 'easy' AND id NOT IN (SELECT destination_id FROM costs WHERE nationality = 'tourist' AND season = 'winter');

INSERT INTO costs (destination_id, season, accommodation_type, group_size_category, nationality,
    transportation_cost, accommodation_cost_per_day, food_cost_per_day, permit_cost, guide_cost_per_day, equipment_cost, miscellaneous_cost)
SELECT id, 'summer', 'standard', 'small', 'tourist', 4000, 1000, 900, 2000, 2200, 3000, 250
FROM destinations WHERE difficulty = 'easy' AND id NOT IN (SELECT destination_id FROM costs WHERE nationality = 'tourist' AND season = 'summer');

-- Moderate difficulty (Tourist) - all seasons
INSERT INTO costs (destination_id, season, accommodation_type, group_size_category, nationality,
    transportation_cost, accommodation_cost_per_day, food_cost_per_day, permit_cost, guide_cost_per_day, equipment_cost, miscellaneous_cost)
SELECT id, 'spring', 'standard', 'small', 'tourist', 8000, 1700, 1400, 5000, 3000, 7000, 500
FROM destinations WHERE difficulty = 'moderate' AND id NOT IN (SELECT destination_id FROM costs WHERE nationality = 'tourist');

INSERT INTO costs (destination_id, season, accommodation_type, group_size_category, nationality,
    transportation_cost, accommodation_cost_per_day, food_cost_per_day, permit_cost, guide_cost_per_day, equipment_cost, miscellaneous_cost)
SELECT id, 'autumn', 'standard', 'small', 'tourist', 9000, 1800, 1500, 5000, 3000, 7000, 550
FROM destinations WHERE difficulty = 'moderate' AND id NOT IN (SELECT destination_id FROM costs WHERE nationality = 'tourist' AND season = 'autumn');

INSERT INTO costs (destination_id, season, accommodation_type, group_size_category, nationality,
    transportation_cost, accommodation_cost_per_day, food_cost_per_day, permit_cost, guide_cost_per_day, equipment_cost, miscellaneous_cost)
SELECT id, 'winter', 'standard', 'small', 'tourist', 7000, 1500, 1200, 5000, 2800, 8000, 450
FROM destinations WHERE difficulty = 'moderate' AND id NOT IN (SELECT destination_id FROM costs WHERE nationality = 'tourist' AND season = 'winter');

INSERT INTO costs (destination_id, season, accommodation_type, group_size_category, nationality,
    transportation_cost, accommodation_cost_per_day, food_cost_per_day, permit_cost, guide_cost_per_day, equipment_cost, miscellaneous_cost)
SELECT id, 'summer', 'standard', 'small', 'tourist', 6500, 1400, 1100, 5000, 2700, 7000, 400
FROM destinations WHERE difficulty = 'moderate' AND id NOT IN (SELECT destination_id FROM costs WHERE nationality = 'tourist' AND season = 'summer');

-- Challenging difficulty (Tourist) - all seasons
INSERT INTO costs (destination_id, season, accommodation_type, group_size_category, nationality,
    transportation_cost, accommodation_cost_per_day, food_cost_per_day, permit_cost, guide_cost_per_day, equipment_cost, miscellaneous_cost)
SELECT id, 'spring', 'standard', 'small', 'tourist', 12000, 2000, 1700, 8000, 3500, 10000, 600
FROM destinations WHERE difficulty = 'challenging' AND id NOT IN (SELECT destination_id FROM costs WHERE nationality = 'tourist');

INSERT INTO costs (destination_id, season, accommodation_type, group_size_category, nationality,
    transportation_cost, accommodation_cost_per_day, food_cost_per_day, permit_cost, guide_cost_per_day, equipment_cost, miscellaneous_cost)
SELECT id, 'autumn', 'standard', 'small', 'tourist', 13000, 2200, 1800, 8000, 3500, 10000, 700
FROM destinations WHERE difficulty = 'challenging' AND id NOT IN (SELECT destination_id FROM costs WHERE nationality = 'tourist' AND season = 'autumn');

INSERT INTO costs (destination_id, season, accommodation_type, group_size_category, nationality,
    transportation_cost, accommodation_cost_per_day, food_cost_per_day, permit_cost, guide_cost_per_day, equipment_cost, miscellaneous_cost)
SELECT id, 'winter', 'standard', 'small', 'tourist', 10000, 1800, 1500, 8000, 3200, 11000, 550
FROM destinations WHERE difficulty = 'challenging' AND id NOT IN (SELECT destination_id FROM costs WHERE nationality = 'tourist' AND season = 'winter');

INSERT INTO costs (destination_id, season, accommodation_type, group_size_category, nationality,
    transportation_cost, accommodation_cost_per_day, food_cost_per_day, permit_cost, guide_cost_per_day, equipment_cost, miscellaneous_cost)
SELECT id, 'summer', 'standard', 'small', 'tourist', 9000, 1600, 1400, 8000, 3000, 10000, 500
FROM destinations WHERE difficulty = 'challenging' AND id NOT IN (SELECT destination_id FROM costs WHERE nationality = 'tourist' AND season = 'summer');

-- Strenuous difficulty (Tourist) - all seasons
INSERT INTO costs (destination_id, season, accommodation_type, group_size_category, nationality,
    transportation_cost, accommodation_cost_per_day, food_cost_per_day, permit_cost, guide_cost_per_day, equipment_cost, miscellaneous_cost)
SELECT id, 'spring', 'standard', 'small', 'tourist', 15000, 2200, 1900, 12000, 4000, 12000, 700
FROM destinations WHERE difficulty = 'strenuous' AND id NOT IN (SELECT destination_id FROM costs WHERE nationality = 'tourist');

INSERT INTO costs (destination_id, season, accommodation_type, group_size_category, nationality,
    transportation_cost, accommodation_cost_per_day, food_cost_per_day, permit_cost, guide_cost_per_day, equipment_cost, miscellaneous_cost)
SELECT id, 'autumn', 'standard', 'small', 'tourist', 16000, 2400, 2000, 12000, 4000, 12000, 800
FROM destinations WHERE difficulty = 'strenuous' AND id NOT IN (SELECT destination_id FROM costs WHERE nationality = 'tourist' AND season = 'autumn');

INSERT INTO costs (destination_id, season, accommodation_type, group_size_category, nationality,
    transportation_cost, accommodation_cost_per_day, food_cost_per_day, permit_cost, guide_cost_per_day, equipment_cost, miscellaneous_cost)
SELECT id, 'winter', 'standard', 'small', 'tourist', 13000, 2000, 1700, 12000, 3800, 13000, 650
FROM destinations WHERE difficulty = 'strenuous' AND id NOT IN (SELECT destination_id FROM costs WHERE nationality = 'tourist' AND season = 'winter');

INSERT INTO costs (destination_id, season, accommodation_type, group_size_category, nationality,
    transportation_cost, accommodation_cost_per_day, food_cost_per_day, permit_cost, guide_cost_per_day, equipment_cost, miscellaneous_cost)
SELECT id, 'summer', 'standard', 'small', 'tourist', 12000, 1800, 1600, 12000, 3600, 12000, 600
FROM destinations WHERE difficulty = 'strenuous' AND id NOT IN (SELECT destination_id FROM costs WHERE nationality = 'tourist' AND season = 'summer');