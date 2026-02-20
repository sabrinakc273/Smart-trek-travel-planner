-- =========================
-- RESET TABLE FOR CLEAN SEED
-- =========================
TRUNCATE destination_seasons RESTART IDENTITY CASCADE;

-- =========================
-- SPRING SEASON
-- =========================
INSERT INTO destination_seasons (destination_id, season, suitability_score, weather_notes, crowd_level)
SELECT id, 'spring', 
    CASE 
        WHEN trip_type = 'trekking' AND elevation > 4000 THEN 9
        WHEN trip_type = 'trekking' AND elevation <= 4000 THEN 9
        WHEN trip_type = 'cultural' THEN 8
        WHEN trip_type = 'wildlife' AND region IN ('Chitwan', 'Bardia') THEN 7
        WHEN trip_type = 'wildlife' THEN 8
        WHEN trip_type = 'adventure' THEN 9
        WHEN trip_type = 'pilgrimage' THEN 8
        ELSE 8
    END,
    CASE 
        WHEN trip_type = 'trekking' AND elevation > 4000 THEN 'Clear skies, warm days, blooming rhododendrons. Perfect mountain views. Snow melting at high passes.'
        WHEN trip_type = 'trekking' THEN 'Pleasant weather, colorful rhododendron forests, clear mountain views, comfortable temperatures'
        WHEN trip_type = 'cultural' THEN 'Warm and pleasant, ideal for sightseeing, clear visibility, occasional rain showers'
        WHEN trip_type = 'wildlife' AND region IN ('Chitwan', 'Bardia') THEN 'Hot weather, tall grass reduces visibility, good for bird watching'
        WHEN trip_type = 'wildlife' THEN 'Mild temperatures, clear weather, active wildlife, good visibility'
        WHEN trip_type = 'adventure' THEN 'Perfect weather for outdoor activities, clear skies, comfortable temperatures'
        WHEN trip_type = 'pilgrimage' THEN 'Pleasant weather for temple visits, clear skies, comfortable for long walks'
        ELSE 'Good weather conditions, comfortable temperatures'
    END,
    CASE 
        WHEN name LIKE '%Everest%' THEN 'high'
        WHEN name LIKE '%Annapurna%' THEN 'high'
        WHEN difficulty = 'easy' AND trip_type = 'cultural' THEN 'high'
        WHEN difficulty = 'easy' THEN 'medium'
        ELSE 'medium'
    END
FROM destinations;

-- =========================
-- AUTUMN SEASON
-- =========================
INSERT INTO destination_seasons (destination_id, season, suitability_score, weather_notes, crowd_level)
SELECT id, 'autumn', 
    CASE 
        WHEN trip_type = 'trekking' THEN 10
        WHEN trip_type = 'cultural' THEN 9
        WHEN trip_type = 'wildlife' AND region IN ('Chitwan', 'Bardia') THEN 10
        WHEN trip_type = 'wildlife' THEN 9
        WHEN trip_type = 'adventure' THEN 10
        WHEN trip_type = 'pilgrimage' THEN 9
        ELSE 9
    END,
    CASE 
        WHEN trip_type = 'trekking' THEN 'Perfect trekking weather, crystal clear mountain views, stable weather, comfortable temperatures, post-monsoon freshness'
        WHEN trip_type = 'cultural' THEN 'Ideal weather for sightseeing, clear skies, comfortable temperatures, festival season'
        WHEN trip_type = 'wildlife' AND region IN ('Chitwan', 'Bardia') THEN 'Best wildlife viewing season, short grass, animals near water sources, perfect temperatures'
        WHEN trip_type = 'wildlife' THEN 'Excellent wildlife viewing, clear weather, active animals, comfortable conditions'
        WHEN trip_type = 'adventure' THEN 'Best season for all adventure activities, stable weather, clear skies, ideal temperatures'
        WHEN trip_type = 'pilgrimage' THEN 'Ideal for religious tours, clear weather, major festivals like Dashain and Tihar'
        ELSE 'Excellent weather conditions, peak season'
    END,
    CASE 
        WHEN name LIKE '%Everest%' THEN 'high'
        WHEN name LIKE '%Annapurna%' THEN 'high'
        WHEN difficulty = 'easy' AND trip_type IN ('cultural', 'wildlife') THEN 'high'
        WHEN trip_type = 'trekking' THEN 'high'
        ELSE 'medium'
    END
FROM destinations;

-- =========================
-- WINTER SEASON
-- =========================
INSERT INTO destination_seasons (destination_id, season, suitability_score, weather_notes, crowd_level)
SELECT id, 'winter', 
    CASE 
        WHEN trip_type = 'trekking' AND elevation > 4500 THEN 4
        WHEN trip_type = 'trekking' AND elevation > 3500 THEN 6
        WHEN trip_type = 'trekking' AND elevation <= 3500 THEN 7
        WHEN trip_type = 'cultural' AND region = 'Kathmandu Valley' THEN 7
        WHEN trip_type = 'cultural' THEN 6
        WHEN trip_type = 'wildlife' AND region IN ('Chitwan', 'Bardia') THEN 9
        WHEN trip_type = 'wildlife' THEN 6
        WHEN trip_type = 'adventure' AND region = 'Pokhara' THEN 7
        WHEN trip_type = 'adventure' THEN 5
        WHEN trip_type = 'pilgrimage' AND elevation < 2000 THEN 7
        WHEN trip_type = 'pilgrimage' THEN 5
        ELSE 6
    END,
    CASE 
        WHEN trip_type = 'trekking' AND elevation > 4500 THEN 'cold, heavy snow at high passes, difficult conditions, experienced trekkers only, some tea houses closed'
        WHEN trip_type = 'trekking' AND elevation > 3500 THEN 'Cold but clear, some snow, fewer crowds, stable weather, warm clothing essential'
        WHEN trip_type = 'trekking' AND elevation <= 3500 THEN 'Cool and clear, pleasant daytime temperatures, cold nights, less crowded trails'
        WHEN trip_type = 'cultural' THEN 'Cool weather, clear skies, morning fog possible, comfortable for sightseeing'
        WHEN trip_type = 'wildlife' AND region IN ('Chitwan', 'Bardia') THEN 'Excellent wildlife viewing, cool weather, short grass, animals easily visible'
        WHEN trip_type = 'wildlife' THEN 'Cold at higher altitudes, good visibility, less active wildlife'
        WHEN trip_type = 'adventure' THEN 'Cold temperatures, weather-dependent activities, clear skies when stable'
        WHEN trip_type = 'pilgrimage' AND elevation < 2000 THEN 'Cool and pleasant, clear weather, good for temple visits'
        WHEN trip_type = 'pilgrimage' THEN 'Cold weather, may affect high altitude pilgrimages'
        ELSE 'Cold but clear weather, less crowded'
    END,
    CASE 
        WHEN elevation > 4000 THEN 'low'
        WHEN trip_type = 'wildlife' THEN 'medium'
        WHEN trip_type = 'cultural' AND elevation < 2000 THEN 'medium'
        ELSE 'low'
    END
FROM destinations;

-- =========================
-- SUMMER/MONSOON SEASON
-- =========================
INSERT INTO destination_seasons (destination_id, season, suitability_score, weather_notes, crowd_level)
SELECT id, 'summer', 
    CASE 
        WHEN trip_type = 'trekking' AND region IN ('Mustang', 'Dolpo') THEN 8
        WHEN trip_type = 'trekking' AND elevation > 4000 THEN 5
        WHEN trip_type = 'trekking' THEN 4
        WHEN trip_type = 'cultural' AND region = 'Kathmandu Valley' THEN 5
        WHEN trip_type = 'cultural' THEN 5
        WHEN trip_type = 'wildlife' THEN 4
        WHEN trip_type = 'adventure' AND name LIKE '%Rafting%' THEN 9
        WHEN trip_type = 'adventure' THEN 5
        WHEN trip_type = 'pilgrimage' AND region = 'Kathmandu Valley' THEN 5
        WHEN trip_type = 'pilgrimage' THEN 4
        ELSE 5
    END,
    CASE 
        WHEN trip_type = 'trekking' AND region IN ('Mustang', 'Dolpo') THEN 'Rain-shadow areas remain dry, good trekking conditions, fewer tourists, dramatic landscapes'
        WHEN trip_type = 'trekking' AND elevation > 4000 THEN 'Monsoon season, cloudy weather, afternoon rain, muddy trails, views obscured, leeches at lower elevations'
        WHEN trip_type = 'trekking' THEN 'Heavy monsoon, wet trails, leeches, landslide risk, poor visibility, not recommended'
        WHEN trip_type = 'cultural' THEN 'Monsoon season, frequent rain, humid weather, indoor activities preferred, lush green landscapes'
        WHEN trip_type = 'wildlife' THEN 'Monsoon season, wet conditions, thick vegetation, difficult wildlife viewing, closed areas possible'
        WHEN trip_type = 'adventure' AND name LIKE '%Rafting%' THEN 'Best rafting season, high water levels, exciting rapids, experienced guides essential'
        WHEN trip_type = 'adventure' THEN 'Monsoon affects most activities, weather-dependent, some adventures cancelled'
        WHEN trip_type = 'pilgrimage' THEN 'Rainy season, wet conditions, slippery paths, indoor temple visits better'
        ELSE 'Monsoon season, frequent rain, humid conditions'
    END,
    CASE 
        WHEN name LIKE '%Rafting%' THEN 'high'
        WHEN region IN ('Mustang', 'Dolpo') THEN 'low'
        ELSE 'low'
    END
FROM destinations;

-- =========================
-- SPECIAL UPDATES
-- =========================
-- Rain-shadow regions for summer
UPDATE destination_seasons 
SET suitability_score = 8,
    weather_notes = 'Rain-shadow area, relatively dry during monsoon, unique trekking season with fewer crowds, cooler temperatures'
WHERE season = 'summer' 
  AND destination_id IN (SELECT id FROM destinations WHERE region IN ('Mustang', 'Dolpo'));

-- Winter wildlife
UPDATE destination_seasons 
SET suitability_score = 10,
    weather_notes = 'Best wildlife viewing season, excellent visibility, cool comfortable weather, short grass, animals concentrated near water'
WHERE season = 'winter' 
  AND destination_id IN (SELECT id FROM destinations WHERE name LIKE '%Chitwan%' OR name LIKE '%Bardia%');

-- Cultural valley tours
UPDATE destination_seasons 
SET suitability_score = suitability_score + 1
WHERE destination_id IN (SELECT id FROM destinations WHERE trip_type = 'cultural' AND region = 'Kathmandu Valley' AND elevation < 1500);

-- Pilgrimage sites
UPDATE destination_seasons 
SET suitability_score = CASE WHEN season IN ('spring','autumn') THEN 9 WHEN season = 'winter' THEN 7 ELSE 6 END
WHERE destination_id IN (SELECT id FROM destinations WHERE trip_type = 'pilgrimage' AND elevation < 2000 AND name NOT LIKE '%Trek%');

-- Helicopter tours
UPDATE destination_seasons 
SET suitability_score = CASE WHEN season IN ('spring','autumn') THEN 10 WHEN season = 'winter' THEN 8 ELSE 6 END,
    weather_notes = CASE WHEN season IN ('spring','autumn') THEN 'Perfect flying conditions, clear skies, excellent visibility, best mountain views' WHEN season = 'winter' THEN 'Clear weather but cold, good visibility, morning flights recommended' ELSE 'Weather-dependent, monsoon clouds may affect flights, morning flights more reliable' END
WHERE destination_id IN (SELECT id FROM destinations WHERE name LIKE '%Helicopter%' OR name LIKE '%Heli%');

-- Paragliding/Ultralight
UPDATE destination_seasons 
SET suitability_score = CASE WHEN season IN ('spring','autumn') THEN 10 WHEN season = 'winter' THEN 7 ELSE 5 END,
    weather_notes = CASE WHEN season IN ('spring','autumn') THEN 'Perfect conditions, stable weather, excellent thermals, clear skies' WHEN season = 'winter' THEN 'Good flying conditions but cold, stable weather, less thermal activity' ELSE 'Monsoon season, weather-dependent, flights may be cancelled' END
WHERE destination_id IN (SELECT id FROM destinations WHERE name LIKE '%Paragliding%' OR name LIKE '%Ultralight%');

-- Rafting
UPDATE destination_seasons 
SET suitability_score = 10,
    weather_notes = 'Best rafting season! High water levels, thrilling rapids, exciting adventure, expert guides essential'
WHERE season = 'summer' AND destination_id IN (SELECT id FROM destinations WHERE name LIKE '%Rafting%');

UPDATE destination_seasons 
SET suitability_score = 9,
    weather_notes = 'Excellent rafting conditions, moderate water levels, comfortable weather, good for beginners'
WHERE season = 'spring' AND destination_id IN (SELECT id FROM destinations WHERE name LIKE '%Rafting%');

-- Bungee jumping
UPDATE destination_seasons 
SET suitability_score = CASE WHEN season IN ('spring','autumn') THEN 10 WHEN season = 'winter' THEN 8 ELSE 7 END,
    weather_notes = CASE WHEN season IN ('spring','autumn') THEN 'Perfect conditions, comfortable temperatures, clear weather, stunning views' WHEN season = 'winter' THEN 'Cold but clear, comfortable during day, beautiful weather' ELSE 'Monsoon season, jumps weather-dependent, stunning gorge views after rain' END
WHERE destination_id IN (SELECT id FROM destinations WHERE name LIKE '%Bungee%');

-- Peak climbing
UPDATE destination_seasons 
SET suitability_score = CASE WHEN season IN ('spring','autumn') THEN 10 WHEN season = 'winter' THEN 3 ELSE 2 END,
    weather_notes = CASE WHEN season IN ('spring','autumn') THEN 'Prime climbing season, stable weather, good snow conditions, safe climbing' WHEN season = 'winter' THEN 'Extremely difficult, cold, dangerous conditions, not recommended' ELSE 'Monsoon season, unsafe conditions, avalanche risk, poor visibility' END
WHERE destination_id IN (SELECT id FROM destinations WHERE name LIKE '%Peak Climbing%' OR name LIKE '%Island Peak%' OR name LIKE '%Mera Peak%');

-- Gosainkunda pilgrimage
UPDATE destination_seasons 
SET suitability_score = 8,
    weather_notes = 'Janai Purnima festival season, many pilgrims, spiritual atmosphere, monsoon rain but significant cultural experience'
WHERE season = 'summer' AND destination_id IN (SELECT id FROM destinations WHERE name LIKE '%Gosainkunda%');
