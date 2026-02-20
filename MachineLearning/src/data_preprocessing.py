
import pandas as pd
import numpy as np
import re
import warnings
warnings.filterwarnings('ignore')

class TrekDataPreprocessor:
    """Clean and preprocess trek dataset"""
    
    def __init__(self):
        self.difficulty_map = {
            'easy': 1,
            'easy to moderate': 1.5,
            'light': 1,
            'moderate': 2,
            'moderate+demanding': 2.5,
            'moderate-hard': 2.5,
            'demanding': 3,
            'strenuous': 3.5,
            'demanding+challenging': 3.5,
            'challenging': 3,
        }
        
        # Season mapping
        self.season_map = {
            'spring': 1,
            'summer': 2,
            'autumn': 3,
            'winter': 4,
        }
        
        # Trip type mapping
        self.trip_type_map = {
            'trekking': 1,
            'cultural': 2,
            'wildlife': 3,
            'adventure': 4,
            'pilgrimage': 5,
        }
        
        # Region mapping
        self.region_map = {
            'khumbu': 1,
            'annapurna': 2,
            'langtang': 3,
            'manaslu': 4,
            'mustang': 5,
            'dolpo': 6,
            'makalu': 7,
            'kanchenjunga': 8,
            'rara': 9,
            'helambu': 10,
            'other': 0,
        }
    
    def clean_cost(self, cost_str):
        """Extract numeric cost from string and convert to NPR"""
        if pd.isna(cost_str):
            return np.nan
        
        # Remove everything except numbers and commas
        cost_str = str(cost_str).replace('$', '').replace('USD', '').replace(',', '').strip()
        try:
            usd = float(cost_str)
            # Convert USD to NPR (1 USD = 132 NPR)
            return int(usd * 132)
        except:
            return np.nan
    
    def clean_duration(self, duration_str):
        """Extract number of days from duration string"""
        if pd.isna(duration_str):
            return np.nan
        
        match = re.search(r'(\d+)', str(duration_str))
        if match:
            return int(match.group(1))
        return np.nan
    
    def clean_elevation(self, elevation_str):
        """Extract elevation in meters"""
        if pd.isna(elevation_str):
            return np.nan
        
        elevation_str = str(elevation_str).replace(',', '').replace('m', '').strip()
        try:
            return int(float(elevation_str))
        except:
            return np.nan
    
    def normalize_difficulty(self, difficulty_str):
        """Normalize difficulty to numeric scale"""
        if pd.isna(difficulty_str):
            return 2  # Default to moderate
        
        difficulty_str = str(difficulty_str).lower().strip()
        for key, value in self.difficulty_map.items():
            if key in difficulty_str:
                return value
        return 2  # Default
    
    def extract_seasons(self, season_str):
        """Extract list of best seasons from season string"""
        if pd.isna(season_str):
            return ['spring', 'autumn']  # Default
        
        season_str = str(season_str).lower()
        seasons = []
        
        month_to_season = {
            'jan': 'winter', 'feb': 'winter',
            'march': 'spring', 'april': 'spring', 'may': 'spring',
            'june': 'summer', 'july': 'summer', 'august': 'summer',
            'sept': 'autumn', 'oct': 'autumn', 'nov': 'autumn',
            'dec': 'winter',
        }
        
        for month, season in month_to_season.items():
            if month in season_str and season not in seasons:
                seasons.append(season)
        
        return seasons if seasons else ['spring', 'autumn']
    
    def determine_region(self, trek_name):
        """Determine region from trek name"""
        if pd.isna(trek_name):
            return 'other'
        
        trek_lower = str(trek_name).lower()
        
        region_keywords = {
            'everest': 'khumbu',
            'khumbu': 'khumbu',
            'annapurna': 'annapurna',
            'langtang': 'langtang',
            'manaslu': 'manaslu',
            'mustang': 'mustang',
            'dolpo': 'dolpo',
            'makalu': 'makalu',
            'kanchenjunga': 'kanchenjunga',
            'rara': 'rara',
            'helambu': 'helambu',
            'tamang': 'langtang',
            'tsum': 'manaslu',
            'mardi': 'annapurna',
            'gokyo': 'khumbu',
        }
        
        for keyword, region in region_keywords.items():
            if keyword in trek_lower:
                return region
        
        return 'other'
    
    def determine_trip_type(self, trek_name):
        """Determine trip type from trek name"""
        if pd.isna(trek_name):
            return 'trekking'
        
        name_lower = str(trek_name).lower()
        
        if any(word in name_lower for word in ['culture', 'heritage', 'monastery', 'temple']):
            return 'cultural'
        elif any(word in name_lower for word in ['wildlife', 'safari', 'jungle']):
            return 'wildlife'
        elif any(word in name_lower for word in ['pilgrimage', 'spiritual']):
            return 'pilgrimage'
        elif any(word in name_lower for word in ['rafting', 'paragliding', 'bungee']):
            return 'adventure'
        else:
            return 'trekking'
    
    def calculate_popularity_score(self, trek_name, cost, difficulty):
        """Calculate popularity score based on trek characteristics"""
        score = 50  # Base score
        
        name_lower = str(trek_name).lower() if not pd.isna(trek_name) else ''
        
        # Popular destinations get higher scores
        if 'everest base camp' in name_lower and 'short' not in name_lower:
            score += 30
        elif 'annapurna base camp' in name_lower:
            score += 25
        elif 'annapurna circuit' in name_lower:
            score += 20
        elif 'langtang' in name_lower:
            score += 15
        elif 'manaslu' in name_lower:
            score += 10
        
        # Difficulty adjustment
        if difficulty <= 1.5:  # Easy
            score += 10
        elif difficulty >= 3:  # Challenging/Strenuous
            score -= 5
        
        # Cost adjustment (lower cost = more popular)
        if not pd.isna(cost):
            if cost < 100000:  # Less than NPR 100k
                score += 10
            elif cost > 200000:  # More than NPR 200k
                score -= 10
        
        return min(max(score, 0), 100)  # Clamp between 0-100
    
    def preprocess_dataset(self, df):
        """Complete preprocessing pipeline"""
        print("=" * 60)
        print("TREK DATA PREPROCESSING PIPELINE")
        print("=" * 60)
        
        # Create a copy
        df_clean = df.copy()
        
        print(f"\n1. Initial dataset shape: {df_clean.shape}")
        print(f"   Columns: {list(df_clean.columns)}")
        
        # Clean column names
        df_clean.columns = df_clean.columns.str.strip().str.lower().str.replace(' ', '_')
        
        # Drop unnamed columns
        df_clean = df_clean[[col for col in df_clean.columns if 'unnamed' not in col.lower()]]
        
        # Remove duplicates based on trek name
        initial_rows = len(df_clean)
        df_clean = df_clean.drop_duplicates(subset=['trek'], keep='first')
        print(f"\n2. Removed {initial_rows - len(df_clean)} duplicate treks")
        
        # Clean individual fields
        print("\n3. Cleaning fields...")
        
        df_clean['cost_npr'] = df_clean['cost'].apply(self.clean_cost)
        df_clean['duration_days'] = df_clean['time'].apply(self.clean_duration)
        df_clean['elevation_meters'] = df_clean['max_altitude'].apply(self.clean_elevation)
        df_clean['difficulty_numeric'] = df_clean['trip_grade'].apply(self.normalize_difficulty)
        df_clean['region'] = df_clean['trek'].apply(self.determine_region)
        df_clean['trip_type'] = df_clean['trek'].apply(self.determine_trip_type)
        
        # Extract seasons
        df_clean['best_seasons'] = df_clean['best_travel_time'].apply(self.extract_seasons)
        df_clean['num_seasons'] = df_clean['best_seasons'].apply(len)
        
        # Calculate additional features
        df_clean['cost_per_day'] = df_clean['cost_npr'] / df_clean['duration_days']
        df_clean['elevation_category'] = pd.cut(
            df_clean['elevation_meters'],
            bins=[0, 3000, 4000, 5000, 10000],
            labels=['low', 'medium', 'high', 'extreme']
        )
        
        df_clean['duration_category'] = pd.cut(
            df_clean['duration_days'],
            bins=[0, 7, 14, 21, 100],
            labels=['short', 'medium', 'long', 'extended']
        )
        
        # Calculate popularity score
        df_clean['popularity_score'] = df_clean.apply(
            lambda x: self.calculate_popularity_score(
                x['trek'], x['cost_npr'], x['difficulty_numeric']
            ),
            axis=1
        )
        
        # Handle missing values
        print("\n4. Handling missing values...")
        
        # Fill missing costs with median by difficulty
        for difficulty in df_clean['difficulty_numeric'].unique():
            mask = (df_clean['difficulty_numeric'] == difficulty) & (df_clean['cost_npr'].isna())
            if mask.sum() > 0:
                median_cost = df_clean[df_clean['difficulty_numeric'] == difficulty]['cost_npr'].median()
                df_clean.loc[mask, 'cost_npr'] = median_cost
        
        # Fill missing durations with median by difficulty
        for difficulty in df_clean['difficulty_numeric'].unique():
            mask = (df_clean['difficulty_numeric'] == difficulty) & (df_clean['duration_days'].isna())
            if mask.sum() > 0:
                median_duration = df_clean[df_clean['difficulty_numeric'] == difficulty]['duration_days'].median()
                df_clean.loc[mask, 'duration_days'] = median_duration
        
        # Fill missing elevations with median by region
        for region in df_clean['region'].unique():
            mask = (df_clean['region'] == region) & (df_clean['elevation_meters'].isna())
            if mask.sum() > 0:
                median_elevation = df_clean[df_clean['region'] == region]['elevation_meters'].median()
                df_clean.loc[mask, 'elevation_meters'] = median_elevation
        
        # Final missing value fill with overall medians
        df_clean['cost_npr'].fillna(df_clean['cost_npr'].median(), inplace=True)
        df_clean['duration_days'].fillna(df_clean['duration_days'].median(), inplace=True)
        df_clean['elevation_meters'].fillna(df_clean['elevation_meters'].median(), inplace=True)
        
        # Recalculate cost_per_day after filling
        df_clean['cost_per_day'] = df_clean['cost_npr'] / df_clean['duration_days']
        
        # Add encoded features for ML
        df_clean['region_encoded'] = df_clean['region'].map(self.region_map).fillna(0)
        df_clean['trip_type_encoded'] = df_clean['trip_type'].map(self.trip_type_map).fillna(1)
        
        # One-hot encode seasons (create binary columns for each season)
        for season in ['spring', 'summer', 'autumn', 'winter']:
            df_clean[f'season_{season}'] = df_clean['best_seasons'].apply(
                lambda x: 1 if season in x else 0
            )
        
        print(f"\n5. Final dataset shape: {df_clean.shape}")
        print(f"   Missing values:\n{df_clean.isnull().sum()[df_clean.isnull().sum() > 0]}")
        
        # Summary statistics
        print("\n6. Summary Statistics:")
        print(f"   Cost range: NPR {df_clean['cost_npr'].min():.0f} - {df_clean['cost_npr'].max():.0f}")
        print(f"   Duration range: {df_clean['duration_days'].min():.0f} - {df_clean['duration_days'].max():.0f} days")
        print(f"   Elevation range: {df_clean['elevation_meters'].min():.0f}m - {df_clean['elevation_meters'].max():.0f}m")
        print(f"   Difficulty range: {df_clean['difficulty_numeric'].min():.1f} - {df_clean['difficulty_numeric'].max():.1f}")
        print(f"   Regions: {df_clean['region'].value_counts().to_dict()}")
        print(f"   Trip types: {df_clean['trip_type'].value_counts().to_dict()}")
        
        return df_clean
    
    def save_processed_data(self, df, output_path):
        """Save processed data to CSV"""
        df.to_csv(output_path, index=False)
        print(f"\n✅ Processed data saved to: {output_path}")


# ============================================================================
# MAIN EXECUTION
# ============================================================================

if __name__ == "__main__":
   
    INPUT_FILE_1 = '../data/Data.csv'
    INPUT_FILE_2 = '../data/Trek Data.csv'
    INPUT_FILE_3 = '../data/Trekking Trails Dataset - Locations.csv'\
        
    print("Loading Data.csv...")
    df_data = pd.read_csv(INPUT_FILE_1)
    print(f"Data.csv: {df_data.shape} columns: {list(df_data.columns)}")

    print("\nLoading Trek Data.csv...")
    df_trek = pd.read_csv(INPUT_FILE_2)
    print(f"Trek Data.csv: {df_trek.shape} columns: {list(df_trek.columns)}")

    print("\nLoading Trekking Trails Dataset - Locations.csv...")
    df_locations = pd.read_csv(INPUT_FILE_3)
    print(f"Trekking Trails Dataset - Locations.csv: {df_locations.shape} columns: {list(df_locations.columns)}")

    # Preprocess Trek Data.csv as before
    preprocessor = TrekDataPreprocessor()
    df_processed = preprocessor.preprocess_dataset(df_trek)
    
    OUTPUT_FILE = '../data/Processed_Trek_Data.csv'
    preprocessor.save_processed_data(df_processed, OUTPUT_FILE)

    print("\nSAMPLE PROCESSED DATA")
    print(df_processed[['trek', 'cost_npr', 'duration_days', 'elevation_meters', 
                        'difficulty_numeric', 'region', 'trip_type', 'popularity_score']].head(10))
