
import csv
import re
import json
from collections import defaultdict

DIFFICULTY_MAP = {
    'easy': 'easy',
    'easy to moderate': 'easy',
    'light': 'easy',
    'moderate': 'moderate',
    'moderate+demanding': 'moderate',
    'moderate-hard': 'challenging',
    'demanding': 'challenging',
    'strenuous': 'strenuous',
    'demanding+challenging': 'strenuous',
    'challenging': 'challenging',
}

SEASON_MAP = {
    'jan': 'winter',
    'feb': 'winter',
    'march': 'spring',
    'april': 'spring',
    'may': 'spring',
    'june': 'summer',
    'july': 'summer',
    'august': 'summer',
    'sept': 'autumn',
    'oct': 'autumn',
    'nov': 'autumn',
    'dec': 'winter',
}

REGION_MAP = {
    'everest': 'Khumbu',
    'annapurna': 'Annapurna',
    'langtang': 'Langtang',
    'manaslu': 'Manaslu',
    'mustang': 'Mustang',
    'dolpo': 'Dolpo',
    'makalu': 'Makalu',
    'kanchenjunga': 'Kanchenjunga',
    'rara': 'Rara',
    'helambu': 'Helambu',
    'tamang': 'Langtang',
    'tsum': 'Manaslu',
    'mardi': 'Annapurna',
    'gokyo': 'Khumbu',
    'nar phu': 'Annapurna',
    'khopra': 'Annapurna',
}

def clean_cost(cost_str):
    """Extract numeric cost from string and convert to NPR"""
    cost_str = cost_str.replace('$', '').replace('USD', '').replace(',', '').strip()
    try:
        usd = float(cost_str)
        return int(usd * 132)
    except:
        return 50000 

def clean_duration(duration_str):
    """Extract number of days from duration string"""
    match = re.search(r'(\d+)', duration_str)
    if match:
        return int(match.group(1))
    return 10 
def clean_elevation(elevation_str):
    """Extract elevation in meters"""
    elevation_str = elevation_str.replace(',', '').replace('m', '').strip()
    try:
        return int(float(elevation_str))
    except:
        return 3000  

def normalize_difficulty(difficulty_str):
    """Normalize difficulty to our standard categories"""
    difficulty_str = difficulty_str.lower().strip()
    for key, value in DIFFICULTY_MAP.items():
        if key in difficulty_str:
            return value
    return 'moderate'  

def extract_seasons(season_str):
    """Extract list of best seasons from season string"""
    season_str = season_str.lower()
    seasons = set()
    
    for month, season in SEASON_MAP.items():
        if month in season_str:
            seasons.add(season)
    
    if not seasons:
        seasons = {'spring', 'autumn'}
    
    return list(seasons)

def determine_region(trek_name):
    """Determine region based on trek name"""
    trek_lower = trek_name.lower()
    
    for key, region in REGION_MAP.items():
        if key in trek_lower:
            return region
    
    return 'Other' 

def determine_trip_type(trek_name, description=''):
    """Determine trip type based on trek name and description"""
    name_lower = (trek_name + ' ' + description).lower()
    
    if any(word in name_lower for word in ['culture', 'heritage', 'monastery', 'temple']):
        return 'cultural'
    elif any(word in name_lower for word in ['wildlife', 'safari', 'jungle']):
        return 'wildlife'
    elif any(word in name_lower for word in ['pilgrimage', 'spiritual']):
        return 'pilgrimage'
    elif any(word in name_lower for word in ['rafting', 'paragliding', 'bungee']):
        return 'adventure'
    else:
        return 'trekking'  # Default

def generate_highlights(trek_name, region, elevation):
    """Generate highlights based on trek characteristics"""
    highlights = []
    name_lower = trek_name.lower()
    
    if region == 'Khumbu':
        highlights.extend(['Sagarmatha National Park', 'Sherpa culture and monasteries'])
    elif region == 'Annapurna':
        highlights.extend(['Annapurna Conservation Area', 'Diverse landscapes'])
    elif region == 'Langtang':
        highlights.extend(['Langtang National Park', 'Tamang culture'])
    elif region == 'Manaslu':
        highlights.extend(['Manaslu Conservation Area', 'Remote mountain villages'])
    elif region == 'Mustang':
        highlights.extend(['Ancient Tibetan culture', 'Desert landscapes'])
    
    if elevation > 5000:
        highlights.append('High altitude adventure')
        highlights.append('Panoramic mountain views')
    elif elevation > 4000:
        highlights.append('Stunning Himalayan views')
    
    if 'base camp' in name_lower:
        highlights.append('Trek to iconic base camp')
    if 'pass' in name_lower or 'la' in name_lower:
        highlights.append('High mountain pass crossing')
    if 'lake' in name_lower:
        highlights.append('Sacred mountain lakes')
    if 'circuit' in name_lower:
        highlights.append('Complete circuit trek')
    
    return highlights[:5]  

def generate_description(trek_name, region, elevation, duration, difficulty):
    """Generate description based on trek characteristics"""
    descriptions = {
        'Khumbu': f"Journey through the Khumbu region reaching {elevation}m elevation. This {difficulty} {duration}-day trek offers stunning views of the world's highest peaks.",
        'Annapurna': f"Explore the diverse landscapes of the Annapurna region on this {difficulty} {duration}-day adventure to {elevation}m.",
        'Langtang': f"Discover the beautiful Langtang valley on this {difficulty} trek, reaching {elevation}m with rich cultural experiences.",
        'Manaslu': f"Circuit the majestic Manaslu massif on this {difficulty} {duration}-day journey to {elevation}m through remote villages.",
        'Mustang': f"Experience the ancient kingdom of Mustang on this {difficulty} trek through desert landscapes to {elevation}m.",
    }
    
    return descriptions.get(region, f"Experience Nepal's Himalayas on this {difficulty} {duration}-day trek to {elevation}m elevation.")

destinations_data = []
seen_treks = set()

print("Processing trek data...")

with open('/mnt/user-data/uploads/Trek_Data.csv', 'r', encoding='utf-8') as f:
    reader = csv.DictReader(f)
    
    for row in reader:
        if not row.get('Trek'):
            continue
            
        trek_name = row['Trek'].strip()
        
        if trek_name in seen_treks:
            continue
        seen_treks.add(trek_name)
        
        cost_npr = clean_cost(row.get('Cost', '50000'))
        duration = clean_duration(row.get('Time', '10'))
        elevation = clean_elevation(row.get('Max Altitude', '3000'))
        difficulty = normalize_difficulty(row.get('Trip Grade', 'moderate'))
        accommodation = row.get('Accomodation', 'Hotel/Guesthouse').strip()
        seasons = extract_seasons(row.get('Best Travel Time', 'March-May'))
        
        region = determine_region(trek_name)
        trip_type = determine_trip_type(trek_name)
        highlights = generate_highlights(trek_name, region, elevation)
        description = generate_description(trek_name, region, elevation, duration, difficulty)
        
        min_duration = max(duration - 2, 1)
        max_duration = duration + 3
        
        dest_data = {
            'name': trek_name,
            'region': region,
            'description': description,
            'difficulty': difficulty,
            'min_duration': min_duration,
            'max_duration': max_duration,
            'elevation': elevation,
            'trip_type': trip_type,
            'highlights': highlights,
            'base_cost_npr': cost_npr,
            'accommodation_type': accommodation,
            'seasons': seasons
        }
        
        destinations_data.append(dest_data)

destinations_data = destinations_data[:50]

print(f"Processed {len(destinations_data)} unique destinations")

# Generate SQL
with open('/home/claude/trek-planner-database/seed/001_destinations_seed.sql', 'w', encoding='utf-8') as f:
    f.write("-- =====================================================\n")
    f.write("-- DESTINATIONS SEED DATA\n")
    f.write("-- Generated from trek dataset\n")
    f.write("-- =====================================================\n\n")
    
    for dest in destinations_data:
        name = dest['name'].replace("'", "''")
        description = dest['description'].replace("'", "''")
        
        highlights_str = "ARRAY[" + ", ".join([f"'{h.replace(chr(39), chr(39)+chr(39))}'" for h in dest['highlights']]) + "]"
        
        sql = f"""INSERT INTO destinations (
    name, region, description, difficulty, min_duration, max_duration,
    elevation, trip_type, highlights, base_cost_usd, accommodation_type
) VALUES (
    '{name}',
    '{dest["region"]}',
    '{description}',
    '{dest["difficulty"]}',
    {dest["min_duration"]},
    {dest["max_duration"]},
    {dest["elevation"]},
    '{dest["trip_type"]}',
    {highlights_str},
    {dest["base_cost_npr"] / 132:.2f},
    '{dest["accommodation_type"]}'
) ON CONFLICT (name) DO NOTHING;\n\n"""
        
        f.write(sql)

print("Generated destinations seed file")

# Generate seasons seed
with open('/home/claude/trek-planner-database/seed/002_seasons_seed.sql', 'w', encoding='utf-8') as f:
    f.write("-- =====================================================\n")
    f.write("-- SEASONS SEED DATA\n")
    f.write("-- =====================================================\n\n")
    
    for dest in destinations_data:
        name = dest['name'].replace("'", "''")
        
        for season in dest['seasons']:
            # Score based on season
            if season in ['spring', 'autumn']:
                score = 9
                crowd = 'high'
            elif season == 'winter':
                score = 6
                crowd = 'low'
            else:  # summer
                score = 5
                crowd = 'medium'
            
            sql = f"""INSERT INTO destination_seasons (destination_id, season, suitability_score, crowd_level)
SELECT id, '{season}', {score}, '{crowd}'
FROM destinations WHERE name = '{name}';\n\n"""
            
            f.write(sql)

print("Generated seasons seed file")
print("Seed files created successfully!")