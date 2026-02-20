CREATE EXTENSION IF NOT EXISTS "uuid-ossp";


CREATE TABLE IF NOT EXISTS destinations (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    name VARCHAR(255) NOT NULL UNIQUE,
    region VARCHAR(100) NOT NULL,
    description TEXT,
    difficulty VARCHAR(50) NOT NULL CHECK (difficulty IN ('easy', 'moderate', 'challenging', 'strenuous')),
    min_duration INTEGER NOT NULL CHECK (min_duration > 0),
    max_duration INTEGER NOT NULL CHECK (max_duration >= min_duration),
    elevation INTEGER NOT NULL CHECK (elevation > 0),
    trip_type VARCHAR(50) NOT NULL CHECK (trip_type IN ('trekking', 'cultural', 'wildlife', 'adventure', 'pilgrimage')),
    image_url TEXT,
    highlights TEXT[],
    base_cost_usd DECIMAL(10, 2),
    accommodation_type VARCHAR(100),
    is_active BOOLEAN DEFAULT true,
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW()
);

CREATE INDEX IF NOT EXISTS idx_destinations_difficulty ON destinations(difficulty);
CREATE INDEX IF NOT EXISTS idx_destinations_trip_type ON destinations(trip_type);
CREATE INDEX IF NOT EXISTS idx_destinations_region ON destinations(region);
CREATE INDEX IF NOT EXISTS idx_destinations_is_active ON destinations(is_active);
CREATE INDEX IF NOT EXISTS idx_destinations_elevation ON destinations(elevation);
CREATE INDEX IF NOT EXISTS idx_destinations_duration ON destinations(min_duration, max_duration);


CREATE TABLE IF NOT EXISTS destination_seasons (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    destination_id UUID NOT NULL REFERENCES destinations(id) ON DELETE CASCADE,
    season VARCHAR(20) NOT NULL CHECK (season IN ('spring', 'summer', 'autumn', 'winter')),
    suitability_score INTEGER CHECK (suitability_score BETWEEN 1 AND 10),
    weather_notes TEXT,
    crowd_level VARCHAR(20) CHECK (crowd_level IN ('low', 'medium', 'high')),
    created_at TIMESTAMP DEFAULT NOW(),
    UNIQUE(destination_id, season)
);

CREATE INDEX IF NOT EXISTS idx_destination_seasons_dest ON destination_seasons(destination_id);
CREATE INDEX IF NOT EXISTS idx_destination_seasons_season ON destination_seasons(season);
CREATE INDEX IF NOT EXISTS idx_destination_seasons_score ON destination_seasons(suitability_score);


CREATE TABLE IF NOT EXISTS costs (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    destination_id UUID NOT NULL REFERENCES destinations(id) ON DELETE CASCADE,
    season VARCHAR(20) NOT NULL CHECK (season IN ('spring', 'summer', 'autumn', 'winter')),
    accommodation_type VARCHAR(20) NOT NULL CHECK (accommodation_type IN ('basic', 'standard', 'luxury')),
    group_size_category VARCHAR(20) NOT NULL CHECK (group_size_category IN ('solo', 'small', 'medium', 'large')),
    nationality VARCHAR(10) NOT NULL DEFAULT 'nepali' CHECK (nationality IN ('nepali', 'tourist')),

    transportation_cost INTEGER NOT NULL DEFAULT 0,
    accommodation_cost_per_day INTEGER NOT NULL DEFAULT 0,
    food_cost_per_day INTEGER NOT NULL DEFAULT 0,
    permit_cost INTEGER NOT NULL DEFAULT 0,
    guide_cost_per_day INTEGER NOT NULL DEFAULT 0,
    equipment_cost INTEGER NOT NULL DEFAULT 0,
    miscellaneous_cost INTEGER NOT NULL DEFAULT 0,

    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW(),

    UNIQUE(destination_id, season, accommodation_type, group_size_category, nationality)
);

CREATE INDEX IF NOT EXISTS idx_costs_destination ON costs(destination_id);
CREATE INDEX IF NOT EXISTS idx_costs_season ON costs(season);
CREATE INDEX IF NOT EXISTS idx_costs_accommodation ON costs(accommodation_type);
CREATE INDEX IF NOT EXISTS idx_costs_nationality ON costs(nationality);


CREATE TABLE IF NOT EXISTS itinerary_templates (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    destination_id UUID NOT NULL REFERENCES destinations(id) ON DELETE CASCADE,
    day_number INTEGER NOT NULL CHECK (day_number > 0),
    title VARCHAR(255) NOT NULL,
    location VARCHAR(255) NOT NULL,
    activities JSONB DEFAULT '[]'::jsonb,
    accommodation VARCHAR(255),
    meals VARCHAR(100),
    distance VARCHAR(50),
    elevation VARCHAR(50),
    duration VARCHAR(50),
    highlights JSONB DEFAULT '[]'::jsonb,
    created_at TIMESTAMP DEFAULT NOW(),

    UNIQUE(destination_id, day_number)
);

CREATE INDEX IF NOT EXISTS idx_itinerary_dest ON itinerary_templates(destination_id);
CREATE INDEX IF NOT EXISTS idx_itinerary_day ON itinerary_templates(day_number);


CREATE TABLE IF NOT EXISTS locations (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    name VARCHAR(255) NOT NULL,
    country VARCHAR(100) DEFAULT 'Nepal',
    province VARCHAR(100),
    district VARCHAR(100),
    longitude DECIMAL(10, 7),
    latitude DECIMAL(10, 7),
    altitude INTEGER,
    description TEXT,
    created_at TIMESTAMP DEFAULT NOW()
);

CREATE INDEX IF NOT EXISTS idx_locations_name ON locations(name);
CREATE INDEX IF NOT EXISTS idx_locations_province ON locations(province);
CREATE INDEX IF NOT EXISTS idx_locations_coords ON locations(longitude, latitude);


CREATE TABLE IF NOT EXISTS search_analytics (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    season VARCHAR(20),
    difficulty VARCHAR(50),
    trip_type VARCHAR(50),
    budget INTEGER,
    duration INTEGER,
    group_size INTEGER,
    nationality VARCHAR(10),
    created_at TIMESTAMP DEFAULT NOW()
);

CREATE INDEX IF NOT EXISTS idx_search_analytics_date ON search_analytics(created_at);

CREATE TABLE IF NOT EXISTS plan_analytics (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    destination_id UUID REFERENCES destinations(id),
    season VARCHAR(20),
    difficulty VARCHAR(50),
    budget INTEGER,
    duration INTEGER,
    group_size INTEGER,
    nationality VARCHAR(10),
    total_cost INTEGER,
    match_score INTEGER,
    created_at TIMESTAMP DEFAULT NOW()
);

CREATE INDEX IF NOT EXISTS idx_plan_analytics_dest ON plan_analytics(destination_id);
CREATE INDEX IF NOT EXISTS idx_plan_analytics_date ON plan_analytics(created_at);


CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = NOW();
    RETURN NEW;
END;
$$ language 'plpgsql';

DROP TRIGGER IF EXISTS update_destinations_updated_at ON destinations;
CREATE TRIGGER update_destinations_updated_at
    BEFORE UPDATE ON destinations
    FOR EACH ROW
    EXECUTE FUNCTION update_updated_at_column();

DROP TRIGGER IF EXISTS update_costs_updated_at ON costs;
CREATE TRIGGER update_costs_updated_at
    BEFORE UPDATE ON costs
    FOR EACH ROW
    EXECUTE FUNCTION update_updated_at_column();


COMMENT ON TABLE destinations IS 'Trek and travel destinations in Nepal';
COMMENT ON TABLE destination_seasons IS 'Best seasons and suitability scores for each destination';
COMMENT ON TABLE costs IS 'Detailed cost breakdowns by destination, season, group size, and nationality';
COMMENT ON TABLE itinerary_templates IS 'Day-by-day itinerary templates for destinations';
COMMENT ON TABLE locations IS 'Geographic locations and waypoints';
COMMENT ON TABLE search_analytics IS 'User search patterns for ML training';
COMMENT ON TABLE plan_analytics IS 'Generated trip plans for ML improvement';


GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO postgres;
GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA public TO postgres;
GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA public TO postgres;