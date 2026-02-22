import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns
import warnings
warnings.filterwarnings('ignore')


"""ml module for performing comprehensive exploratory data analysis (EDA) on the trek dataset"""

# Set style
sns.set_style('whitegrid')
plt.rcParams['figure.figsize'] = (12, 6)

class TrekDataEDA:
    """Perform comprehensive EDA on trek dataset"""
    
    def __init__(self, df):
        self.df = df
        self.numeric_cols = df.select_dtypes(include=[np.number]).columns.tolist()
        self.categorical_cols = df.select_dtypes(include=['object']).columns.tolist()
    
    def basic_info(self):
        """Display basic dataset information"""
        print("=" * 80)
        print("DATASET OVERVIEW")
        print("=" * 80)
        print(f"\nDataset Shape: {self.df.shape[0]} rows × {self.df.shape[1]} columns")
        print(f"\nData Types:\n{self.df.dtypes.value_counts()}")
        print(f"\nMemory Usage: {self.df.memory_usage(deep=True).sum() / 1024:.2f} KB")
        
        print("\n" + "-" * 80)
        print("MISSING VALUES")
        print("-" * 80)
        missing = self.df.isnull().sum()
        if missing.sum() > 0:
            print(missing[missing > 0])
        else:
            print("✅ No missing values!")
        
        print("\n" + "-" * 80)
        print("DUPLICATE ROWS")
        print("-" * 80)
        duplicates = self.df.duplicated().sum()
        print(f"Number of duplicate rows: {duplicates}")
    
    def descriptive_stats(self):
        """Display descriptive statistics"""
        print("\n" + "=" * 80)
        print("DESCRIPTIVE STATISTICS - NUMERIC FEATURES")
        print("=" * 80)
        print(self.df[self.numeric_cols].describe().round(2))
        
        print("\n" + "=" * 80)
        print("DESCRIPTIVE STATISTICS - CATEGORICAL FEATURES")
        print("=" * 80)
        for col in ['region', 'trip_type', 'elevation_category', 'duration_category']:
            if col in self.df.columns:
                print(f"\n{col.upper()}:")
                print(self.df[col].value_counts())
    
    def correlation_analysis(self):
        """Analyze correlations between numeric features"""
        print("\n" + "=" * 80)
        print("CORRELATION ANALYSIS")
        print("=" * 80)
        
        # Select relevant numeric columns
        corr_cols = ['cost_npr', 'duration_days', 'elevation_meters', 
                     'difficulty_numeric', 'cost_per_day', 'popularity_score', 
                     'num_seasons', 'region_encoded', 'trip_type_encoded']
        
        corr_cols = [col for col in corr_cols if col in self.df.columns]
        corr_matrix = self.df[corr_cols].corr()
        
        print("\nTop Positive Correlations:")
        # Get upper triangle of correlation matrix
        upper = corr_matrix.where(
            np.triu(np.ones(corr_matrix.shape), k=1).astype(bool)
        )
        correlations = upper.stack().sort_values(ascending=False)
        print(correlations.head(10))
        
        print("\nTop Negative Correlations:")
        print(correlations.tail(10))
        
        # Create correlation heatmap
        plt.figure(figsize=(14, 10))
        sns.heatmap(corr_matrix, annot=True, cmap='coolwarm', center=0,
                    fmt='.2f', linewidths=0.5, square=True)
        plt.title('Feature Correlation Heatmap', fontsize=16, fontweight='bold')
        plt.tight_layout()
        plt.savefig('correlation_heatmap.png', dpi=300, bbox_inches='tight')
        print("\n✅ Correlation heatmap saved to: correlation_heatmap.png")
        plt.close()
    
    def distribution_plots(self):
        """Create distribution plots for key features"""
        print("\n" + "=" * 80)
        print("DISTRIBUTION ANALYSIS")
        print("=" * 80)
        
        # Cost distribution
        fig, axes = plt.subplots(2, 2, figsize=(14, 10))
        
        # 1. Cost distribution
        axes[0, 0].hist(self.df['cost_npr'], bins=20, edgecolor='black', alpha=0.7, color='skyblue')
        axes[0, 0].axvline(self.df['cost_npr'].mean(), color='red', linestyle='--', linewidth=2, label='Mean')
        axes[0, 0].axvline(self.df['cost_npr'].median(), color='green', linestyle='--', linewidth=2, label='Median')
        axes[0, 0].set_xlabel('Cost (NPR)', fontsize=12)
        axes[0, 0].set_ylabel('Frequency', fontsize=12)
        axes[0, 0].set_title('Cost Distribution', fontsize=14, fontweight='bold')
        axes[0, 0].legend()
        axes[0, 0].grid(alpha=0.3)
        
        # 2. Duration distribution
        axes[0, 1].hist(self.df['duration_days'], bins=15, edgecolor='black', alpha=0.7, color='lightcoral')
        axes[0, 1].axvline(self.df['duration_days'].mean(), color='red', linestyle='--', linewidth=2, label='Mean')
        axes[0, 1].set_xlabel('Duration (Days)', fontsize=12)
        axes[0, 1].set_ylabel('Frequency', fontsize=12)
        axes[0, 1].set_title('Trek Duration Distribution', fontsize=14, fontweight='bold')
        axes[0, 1].legend()
        axes[0, 1].grid(alpha=0.3)
        
        # 3. Elevation distribution
        axes[1, 0].hist(self.df['elevation_meters'], bins=20, edgecolor='black', alpha=0.7, color='lightgreen')
        axes[1, 0].axvline(self.df['elevation_meters'].mean(), color='red', linestyle='--', linewidth=2, label='Mean')
        axes[1, 0].set_xlabel('Max Elevation (m)', fontsize=12)
        axes[1, 0].set_ylabel('Frequency', fontsize=12)
        axes[1, 0].set_title('Elevation Distribution', fontsize=14, fontweight='bold')
        axes[1, 0].legend()
        axes[1, 0].grid(alpha=0.3)
        
        # 4. Difficulty distribution
        difficulty_counts = self.df['difficulty_numeric'].value_counts().sort_index()
        axes[1, 1].bar(difficulty_counts.index, difficulty_counts.values, edgecolor='black', alpha=0.7, color='gold')
        axes[1, 1].set_xlabel('Difficulty Level', fontsize=12)
        axes[1, 1].set_ylabel('Number of Treks', fontsize=12)
        axes[1, 1].set_title('Difficulty Distribution', fontsize=14, fontweight='bold')
        axes[1, 1].set_xticks(difficulty_counts.index)
        axes[1, 1].grid(alpha=0.3, axis='y')
        
        plt.tight_layout()
        plt.savefig('distributions.png', dpi=300, bbox_inches='tight')
        print("✅ Distribution plots saved to: distributions.png")
        plt.close()
    
    def categorical_analysis(self):
        """Analyze categorical features"""
        print("\n" + "=" * 80)
        print("CATEGORICAL FEATURE ANALYSIS")
        print("=" * 80)
        
        fig, axes = plt.subplots(2, 2, figsize=(14, 10))
        
        # 1. Region distribution
        region_counts = self.df['region'].value_counts()
        axes[0, 0].barh(region_counts.index, region_counts.values, edgecolor='black', alpha=0.7, color='steelblue')
        axes[0, 0].set_xlabel('Number of Treks', fontsize=12)
        axes[0, 0].set_title('Treks by Region', fontsize=14, fontweight='bold')
        axes[0, 0].grid(alpha=0.3, axis='x')
        
        # 2. Trip type distribution
        trip_type_counts = self.df['trip_type'].value_counts()
        axes[0, 1].pie(trip_type_counts.values, labels=trip_type_counts.index, autopct='%1.1f%%',
                       startangle=90, colors=sns.color_palette('pastel'))
        axes[0, 1].set_title('Trip Type Distribution', fontsize=14, fontweight='bold')
        
        # 3. Elevation category
        if 'elevation_category' in self.df.columns:
            elev_counts = self.df['elevation_category'].value_counts()
            axes[1, 0].bar(elev_counts.index, elev_counts.values, edgecolor='black', alpha=0.7, color='salmon')
            axes[1, 0].set_xlabel('Elevation Category', fontsize=12)
            axes[1, 0].set_ylabel('Number of Treks', fontsize=12)
            axes[1, 0].set_title('Treks by Elevation Category', fontsize=14, fontweight='bold')
            axes[1, 0].grid(alpha=0.3, axis='y')
        
        # 4. Duration category
        if 'duration_category' in self.df.columns:
            dur_counts = self.df['duration_category'].value_counts()
            axes[1, 1].bar(dur_counts.index, dur_counts.values, edgecolor='black', alpha=0.7, color='mediumpurple')
            axes[1, 1].set_xlabel('Duration Category', fontsize=12)
            axes[1, 1].set_ylabel('Number of Treks', fontsize=12)
            axes[1, 1].set_title('Treks by Duration Category', fontsize=14, fontweight='bold')
            axes[1, 1].grid(alpha=0.3, axis='y')
        
        plt.tight_layout()
        plt.savefig('categorical_analysis.png', dpi=300, bbox_inches='tight')
        print("✅ Categorical analysis plots saved to: categorical_analysis.png")
        plt.close()
    
    def relationship_plots(self):
        """Create plots showing relationships between features"""
        print("\n" + "=" * 80)
        print("FEATURE RELATIONSHIP ANALYSIS")
        print("=" * 80)
        
        fig, axes = plt.subplots(2, 2, figsize=(14, 10))
        
        # 1. Cost vs Duration
        axes[0, 0].scatter(self.df['duration_days'], self.df['cost_npr'], 
                          alpha=0.6, s=50, c=self.df['difficulty_numeric'],
                          cmap='viridis', edgecolors='black')
        axes[0, 0].set_xlabel('Duration (Days)', fontsize=12)
        axes[0, 0].set_ylabel('Cost (NPR)', fontsize=12)
        axes[0, 0].set_title('Cost vs Duration (colored by difficulty)', fontsize=14, fontweight='bold')
        axes[0, 0].grid(alpha=0.3)
        
        # 2. Cost vs Elevation
        axes[0, 1].scatter(self.df['elevation_meters'], self.df['cost_npr'],
                          alpha=0.6, s=50, c=self.df['difficulty_numeric'],
                          cmap='viridis', edgecolors='black')
        axes[0, 1].set_xlabel('Max Elevation (m)', fontsize=12)
        axes[0, 1].set_ylabel('Cost (NPR)', fontsize=12)
        axes[0, 1].set_title('Cost vs Elevation (colored by difficulty)', fontsize=14, fontweight='bold')
        axes[0, 1].grid(alpha=0.3)
        
        # 3. Cost by Region
        region_order = self.df.groupby('region')['cost_npr'].median().sort_values(ascending=False).index
        sns.boxplot(data=self.df, y='region', x='cost_npr', order=region_order, ax=axes[1, 0], palette='Set2')
        axes[1, 0].set_xlabel('Cost (NPR)', fontsize=12)
        axes[1, 0].set_ylabel('Region', fontsize=12)
        axes[1, 0].set_title('Cost Distribution by Region', fontsize=14, fontweight='bold')
        axes[1, 0].grid(alpha=0.3, axis='x')
        
        # 4. Duration by Difficulty
        sns.boxplot(data=self.df, x='difficulty_numeric', y='duration_days', ax=axes[1, 1], palette='Set3')
        axes[1, 1].set_xlabel('Difficulty Level', fontsize=12)
        axes[1, 1].set_ylabel('Duration (Days)', fontsize=12)
        axes[1, 1].set_title('Duration vs Difficulty', fontsize=14, fontweight='bold')
        axes[1, 1].grid(alpha=0.3, axis='y')
        
        plt.tight_layout()
        plt.savefig('relationships.png', dpi=300, bbox_inches='tight')
        print("✅ Relationship plots saved to: relationships.png")
        plt.close()
    
    def season_analysis(self):
        """Analyze seasonal patterns"""
        print("\n" + "=" * 80)
        print("SEASONAL ANALYSIS")
        print("=" * 80)
        
        # Create season columns presence matrix
        season_cols = [col for col in self.df.columns if col.startswith('season_')]
        
        if season_cols:
            fig, axes = plt.subplots(1, 2, figsize=(14, 5))
            
            # Count treks by season
            season_counts = {
                'Spring': self.df['season_spring'].sum(),
                'Summer': self.df['season_summer'].sum(),
                'Autumn': self.df['season_autumn'].sum(),
                'Winter': self.df['season_winter'].sum(),
            }
            
            axes[0].bar(season_counts.keys(), season_counts.values(), 
                       edgecolor='black', alpha=0.7, color=['#90EE90', '#FFD700', '#FF6347', '#87CEEB'])
            axes[0].set_ylabel('Number of Treks', fontsize=12)
            axes[0].set_title('Treks by Best Season', fontsize=14, fontweight='bold')
            axes[0].grid(alpha=0.3, axis='y')
            
            # Average cost by season
            season_avg_costs = {}
            for season_name, season_col in [('Spring', 'season_spring'), ('Summer', 'season_summer'),
                                            ('Autumn', 'season_autumn'), ('Winter', 'season_winter')]:
                if season_col in self.df.columns:
                    season_avg_costs[season_name] = self.df[self.df[season_col] == 1]['cost_npr'].mean()
            
            axes[1].bar(season_avg_costs.keys(), season_avg_costs.values(),
                       edgecolor='black', alpha=0.7, color=['#90EE90', '#FFD700', '#FF6347', '#87CEEB'])
            axes[1].set_ylabel('Average Cost (NPR)', fontsize=12)
            axes[1].set_title('Average Trek Cost by Season', fontsize=14, fontweight='bold')
            axes[1].grid(alpha=0.3, axis='y')
            
            plt.tight_layout()
            plt.savefig('season_analysis.png', dpi=300, bbox_inches='tight')
            print("✅ Season analysis plots saved to: season_analysis.png")
            plt.close()
    
    def outlier_detection(self):
        """Detect and visualize outliers"""
        print("\n" + "=" * 80)
        print("OUTLIER DETECTION")
        print("=" * 80)
        
        # Using IQR method
        numeric_features = ['cost_npr', 'duration_days', 'elevation_meters', 'cost_per_day']
        
        fig, axes = plt.subplots(2, 2, figsize=(14, 10))
        axes = axes.ravel()
        
        for idx, col in enumerate(numeric_features):
            if col in self.df.columns:
                Q1 = self.df[col].quantile(0.25)
                Q3 = self.df[col].quantile(0.75)
                IQR = Q3 - Q1
                lower_bound = Q1 - 1.5 * IQR
                upper_bound = Q3 + 1.5 * IQR
                
                outliers = self.df[(self.df[col] < lower_bound) | (self.df[col] > upper_bound)]
                
                print(f"\n{col}:")
                print(f"  Lower bound: {lower_bound:.2f}")
                print(f"  Upper bound: {upper_bound:.2f}")
                print(f"  Number of outliers: {len(outliers)} ({len(outliers)/len(self.df)*100:.1f}%)")
                
                # Box plot
                axes[idx].boxplot(self.df[col].dropna(), vert=True)
                axes[idx].set_ylabel(col.replace('_', ' ').title(), fontsize=12)
                axes[idx].set_title(f'{col.replace("_", " ").title()} - Outliers: {len(outliers)}',
                                   fontsize=12, fontweight='bold')
                axes[idx].grid(alpha=0.3, axis='y')
        
        plt.tight_layout()
        plt.savefig('outliers.png', dpi=300, bbox_inches='tight')
        print("\n✅ Outlier detection plots saved to: outliers.png")
        plt.close()
    
    def generate_insights(self):
        """Generate key insights from the data"""
        print("\n" + "=" * 80)
        print("KEY INSIGHTS")
        print("=" * 80)
        
        insights = []
        
        # 1. Most expensive region
        region_avg_cost = self.df.groupby('region')['cost_npr'].mean().sort_values(ascending=False)
        insights.append(f"1. Most expensive region: {region_avg_cost.index[0].title()} (Avg: NPR {region_avg_cost.values[0]:,.0f})")
        
        # 2. Most common difficulty
        most_common_difficulty = self.df['difficulty_numeric'].mode()[0]
        difficulty_map_reverse = {1: 'Easy', 1.5: 'Easy-Moderate', 2: 'Moderate', 
                                  2.5: 'Moderate-Hard', 3: 'Challenging', 3.5: 'Strenuous'}
        insights.append(f"2. Most common difficulty: {difficulty_map_reverse.get(most_common_difficulty, 'Moderate')}")
        
        # 3. Average cost per day
        avg_cost_per_day = self.df['cost_per_day'].mean()
        insights.append(f"3. Average cost per day: NPR {avg_cost_per_day:,.0f}")
        
        # 4. Duration sweet spot
        median_duration = self.df['duration_days'].median()
        insights.append(f"4. Median trek duration: {median_duration:.0f} days")
        
        # 5. Elevation insights
        high_altitude_treks = len(self.df[self.df['elevation_meters'] > 5000])
        insights.append(f"5. High altitude treks (>5000m): {high_altitude_treks} ({high_altitude_treks/len(self.df)*100:.1f}%)")
        
        # 6. Best value treks
        self.df['value_score'] = self.df['popularity_score'] / (self.df['cost_npr'] / 100000)
        best_value = self.df.nlargest(3, 'value_score')[['trek', 'cost_npr', 'duration_days', 'popularity_score']]
        insights.append(f"6. Best value treks:\n{best_value.to_string(index=False)}")
        
        # 7. Correlation insight
        if 'popularity_score' in self.df.columns and 'difficulty_numeric' in self.df.columns:
            corr = self.df['popularity_score'].corr(self.df['difficulty_numeric'])
            insights.append(f"7. Popularity vs Difficulty correlation: {corr:.3f} ({'negative' if corr < 0 else 'positive'})")
        
        for insight in insights:
            print(f"\n{insight}")
    
    def run_complete_eda(self):
        """Run complete EDA pipeline"""
        print("\n" + "🔍" * 40)
        print(" " * 20 + "TREK PLANNER - EXPLORATORY DATA ANALYSIS")
        print("🔍" * 40 + "\n")
        
        self.basic_info()
        self.descriptive_stats()
        self.correlation_analysis()
        self.distribution_plots()
        self.categorical_analysis()
        self.relationship_plots()
        self.season_analysis()
        self.outlier_detection()
        self.generate_insights()
        
        print("\n" + "=" * 80)
        print("✅ EDA COMPLETE! All visualizations saved")
        print("=" * 80)



if __name__ == "__main__":
    INPUT_FILE = '../data/Processed_Trek_Data.csv'   
    print("Loading processed trek data...")
    df = pd.read_csv(INPUT_FILE)
    
    eda = TrekDataEDA(df)
    eda.run_complete_eda()