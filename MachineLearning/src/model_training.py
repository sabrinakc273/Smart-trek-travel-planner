#!/usr/bin/env python3
"""
Feature Engineering and Model Training for Trek Recommendation System
Trains only Logistic Regression and saves the model
"""

import pandas as pd
import numpy as np
import joblib
import warnings
from typing import Optional, List

warnings.filterwarnings("ignore")

from sklearn.model_selection import train_test_split
from sklearn.preprocessing import StandardScaler, LabelEncoder
from sklearn.linear_model import LogisticRegression
from sklearn.metrics import accuracy_score, classification_report, confusion_matrix
import matplotlib.pyplot as plt
import seaborn as sns


class TrekRecommendationModel:
    """Train ML model for trek recommendation using Logistic Regression"""

    def __init__(self, df: pd.DataFrame):
        self.df: pd.DataFrame = df
        self.X_train: Optional[np.ndarray] = None
        self.X_test: Optional[np.ndarray] = None
        self.y_train: Optional[np.ndarray] = None
        self.y_test: Optional[np.ndarray] = None
        self.scaler = StandardScaler()
        self.label_encoder = LabelEncoder()
        self.best_model: Optional[LogisticRegression] = None
        self.feature_names: Optional[List[str]] = None

    def engineer_features(self) -> pd.DataFrame:
        """Create additional features for better prediction"""
        df_features = self.df.copy()

        # Interaction features
        df_features["cost_duration_ratio"] = (
            df_features["cost_npr"] / df_features["duration_days"]
        )
        df_features["elevation_difficulty_score"] = (
            df_features["elevation_meters"] * df_features["difficulty_numeric"]
        )
        df_features["cost_elevation_ratio"] = (
            df_features["cost_npr"] / (df_features["elevation_meters"] + 1)
        )

        # Boolean features
        df_features["is_high_altitude"] = (
            df_features["elevation_meters"] > 5000
        ).astype(int)
        df_features["is_long_trek"] = (
            df_features["duration_days"] > 14
        ).astype(int)
        df_features["is_expensive"] = (
            df_features["cost_npr"] > df_features["cost_npr"].median()
        ).astype(int)
        df_features["is_challenging"] = (
            df_features["difficulty_numeric"] >= 3
        ).astype(int)

        # Seasonal flexibility
        season_cols = [
            "season_spring",
            "season_summer",
            "season_autumn",
            "season_winter",
        ]

        for col in season_cols:
            if col not in df_features.columns:
                df_features[col] = 0

        df_features["seasonal_flexibility"] = df_features[season_cols].sum(axis=1)

        # Value score
        df_features["value_score"] = (
            df_features["popularity_score"] / (df_features["cost_npr"] / 100000)
        )

        # Experience required score
        df_features["experience_required"] = (
            df_features["difficulty_numeric"] * 0.4
            + (df_features["elevation_meters"] / 1000) * 0.3
            + (df_features["duration_days"] / 10) * 0.3
        )

        return df_features

    def prepare_training_data(
        self, df_features: pd.DataFrame, target_col: str = "difficulty_numeric"
    ) -> None:
        """Prepare features and target for training"""

        feature_columns = [
            "cost_npr",
            "duration_days",
            "elevation_meters",
            "cost_per_day",
            "popularity_score",
            "num_seasons",
            "trip_type_encoded",
            "region_encoded",
            "season_spring",
            "season_summer",
            "season_autumn",
            "season_winter",
            "cost_duration_ratio",
            "elevation_difficulty_score",
            "cost_elevation_ratio",
            "is_high_altitude",
            "is_long_trek",
            "is_expensive",
            "is_challenging",
            "seasonal_flexibility",
            "value_score",
            "experience_required",
        ]

        feature_columns = [
            col for col in feature_columns if col in df_features.columns
        ]

        self.feature_names = feature_columns

        X = df_features[feature_columns].values

        # Create classification target
        difficulty_bins = [0, 1.5, 2.5, 4]
        difficulty_labels = ["easy", "moderate", "challenging"]

        df_features["difficulty_class"] = pd.cut(
            df_features[target_col], bins=difficulty_bins, labels=difficulty_labels
        )

        y = df_features["difficulty_class"].astype(str).values
        y_encoded = self.label_encoder.fit_transform(y)

        X_train, X_test, y_train, y_test = train_test_split(
            X, y_encoded, test_size=0.25, random_state=42
        )

        self.X_train = self.scaler.fit_transform(X_train)
        self.X_test = self.scaler.transform(X_test)
        self.y_train = y_train
        self.y_test = y_test

    def train_model(self) -> None:
        """Train Logistic Regression model"""
        if self.X_train is None or self.y_train is None:
            raise ValueError("Training data not prepared.")

        self.best_model = LogisticRegression(max_iter=1000, random_state=42)
        self.best_model.fit(self.X_train, self.y_train)

        train_acc = accuracy_score(
            self.y_train, self.best_model.predict(self.X_train)
        )
        test_acc = accuracy_score(
            self.y_test, self.best_model.predict(self.X_test)
        )

        print(f"Train Accuracy: {train_acc:.4f}")
        print(f"Test Accuracy:  {test_acc:.4f}")

    def evaluate_model(self) -> None:
        """Evaluate trained model"""
        if (
            self.best_model is None
            or self.X_test is None
            or self.y_test is None
        ):
            return

        y_pred = self.best_model.predict(self.X_test)

        print("\nClassification Report:")
        print(
            classification_report(
                self.y_test,
                y_pred,
                target_names=list(self.label_encoder.classes_),
                zero_division=0,
            )
        )

        cm = confusion_matrix(self.y_test, y_pred)

        plt.figure(figsize=(8, 6))
        sns.heatmap(
            cm,
            annot=True,
            fmt="d",
            cmap="Blues",
            xticklabels=list(self.label_encoder.classes_),
            yticklabels=list(self.label_encoder.classes_),
        )
        plt.title("Confusion Matrix")
        plt.xlabel("Predicted")
        plt.ylabel("True")
        plt.savefig("confusion_matrix.png", dpi=300, bbox_inches="tight")
        plt.close()

    def save_model(self) -> None:
        """Save model and preprocessing objects"""
        if self.best_model is None:
            return

        joblib.dump(self.best_model, "recommendation_model.pkl")
        joblib.dump(self.scaler, "scaler.pkl")
        joblib.dump(self.label_encoder, "label_encoder.pkl")
        joblib.dump(self.feature_names, "feature_names.pkl")

        metadata = {
            "model_type": "LogisticRegression",
            "num_features": len(self.feature_names)
            if self.feature_names
            else 0,
            "feature_names": self.feature_names,
            "num_classes": len(self.label_encoder.classes_),
            "classes": list(self.label_encoder.classes_),
        }

        joblib.dump(metadata, "model_metadata.pkl")


def main() -> None:
    print("🚀 TREK RECOMMENDATION MODEL TRAINING 🚀")

    df = pd.read_csv("../data/Processed_Trek_Data.csv")

    trainer = TrekRecommendationModel(df)

    df_features = trainer.engineer_features()
    trainer.prepare_training_data(df_features)
    trainer.train_model()
    trainer.evaluate_model()
    trainer.save_model()

    print("✅ MODEL TRAINING COMPLETE!")


if __name__ == "__main__":
    main()
