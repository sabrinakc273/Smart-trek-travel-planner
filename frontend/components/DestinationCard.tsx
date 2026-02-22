"use client";


//this is the component called destination card that shows details about a travel destination
import { Destination } from "@/lib/types";
import {
  Card,
  CardContent,
  CardDescription,
  CardHeader,
  CardTitle,
} from "../components/ui/card";
import {
  Mountain,
  MapPin,
  Calendar,
  TrendingUp,
  Sparkles,
  Clock,
} from "lucide-react";
import { getDifficultyBadge } from "@/lib/utils";

interface DestinationCardProps {
  destination: Destination;
  matchScore?: number;
}

export function DestinationCard({
  destination,
  matchScore,
}: DestinationCardProps) {
  const difficultyBadge = getDifficultyBadge(destination.difficulty);

  return (
    <Card className="glass-effect border-white/5 elevation-shadow overflow-hidden">
      {/* Header Image — real trek image */}
      <div className="relative h-64 overflow-hidden">
        <img
          src="/assets/trek.jpg"
          alt={destination.name}
          className="absolute inset-0 w-full h-full object-cover"
        />
        <div className="absolute inset-0 bg-gradient-to-t from-black/70 via-black/30 to-transparent" />

        {/* Match Score Badge */}
        {matchScore && (
          <div className="absolute top-4 right-4 px-3 py-1.5 rounded-full glass-effect border border-primary/30 flex items-center gap-2">
            <Sparkles className="h-4 w-4 text-primary" />
            <span className="text-sm font-semibold text-white">
              {matchScore}% Match
            </span>
          </div>
        )}

        {/* Difficulty Badge */}
        <div
          className={`absolute top-4 left-4 px-3 py-1.5 rounded-full border ${difficultyBadge.bg} ${difficultyBadge.text} ${difficultyBadge.border} backdrop-blur-sm`}
        >
          <span className="text-sm font-semibold capitalize">
            {destination.difficulty}
          </span>
        </div>

        {/* Title overlay on image */}
        <div className="absolute bottom-4 left-4 right-4">
          <h3 className="text-2xl font-display font-bold text-white drop-shadow-lg">
            {destination.name}
          </h3>
          <div className="flex items-center gap-2 text-white/80 mt-1">
            <MapPin className="h-4 w-4" />
            <span className="text-sm">{destination.region} Region</span>
          </div>
        </div>
      </div>

      <CardHeader className="pt-4">
        <CardTitle className="text-3xl">{destination.name}</CardTitle>
        <CardDescription className="flex items-center gap-2 text-base">
          <MapPin className="h-4 w-4" />
          {destination.region} Region
        </CardDescription>
      </CardHeader>

      <CardContent className="space-y-6">
        {/* Description */}
        <p className="text-muted-foreground leading-relaxed">
          {destination.description}
        </p>

        {/* Key Details */}
        <div className="grid grid-cols-2 gap-4">
          <div className="p-4 rounded-lg bg-white/5 border border-white/10">
            <div className="flex items-center gap-2 mb-2">
              <TrendingUp className="h-4 w-4 text-primary" />
              <span className="text-xs text-muted-foreground">
                Max Elevation
              </span>
            </div>
            <div className="text-xl font-semibold">
              {destination.elevation.toLocaleString()}m
            </div>
          </div>

          <div className="p-4 rounded-lg bg-white/5 border border-white/10">
            <div className="flex items-center gap-2 mb-2">
              <Clock className="h-4 w-4 text-secondary" />
              <span className="text-xs text-muted-foreground">Duration</span>
            </div>
            <div className="text-xl font-semibold">
              {destination.minDuration}-{destination.maxDuration} days
            </div>
          </div>
        </div>

        {/* Best Seasons */}
        <div>
          <h4 className="text-sm font-semibold mb-3 flex items-center gap-2">
            <Calendar className="h-4 w-4 text-accent" />
            Best Seasons
          </h4>
          <div className="flex flex-wrap gap-2">
            {destination.bestSeasons.map((season) => (
              <span
                key={season}
                className="px-3 py-1 rounded-full bg-accent/10 border border-accent/20 text-accent text-sm capitalize"
              >
                {season}
              </span>
            ))}
          </div>
        </div>

        {/* Highlights */}
        <div>
          <h4 className="text-sm font-semibold mb-3 flex items-center gap-2">
            <Sparkles className="h-4 w-4 text-primary" />
            Highlights
          </h4>
          <ul className="space-y-2">
            {destination.highlights.map((highlight, index) => (
              <li
                key={index}
                className="flex items-start gap-2 text-sm text-muted-foreground"
              >
                <span className="h-1.5 w-1.5 rounded-full bg-primary mt-1.5 flex-shrink-0" />
                {highlight}
              </li>
            ))}
          </ul>
        </div>

        {/* Trip Type */}
        <div className="pt-4 border-t border-white/10">
          <div className="flex items-center gap-2">
            <span className="text-xs text-muted-foreground">Trip Type:</span>
            <span className="px-2 py-1 rounded bg-secondary/10 border border-secondary/20 text-secondary text-xs font-medium capitalize">
              {destination.tripType}
            </span>
          </div>
        </div>
      </CardContent>
    </Card>
  );
}
