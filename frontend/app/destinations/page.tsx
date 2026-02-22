"use client";

import { useEffect, useState } from "react";
import Link from "next/link";
import {
  Mountain,
  ArrowLeft,
  Search,
  MapPin,
  TrendingUp,
  Clock,
  Calendar,
  Sparkles,
  Filter,
  Loader2,
} from "lucide-react";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import { Card, CardContent } from "@/components/ui/card";
import { Destination, Season, Difficulty, TripType } from "@/lib/types";
import { apiClient } from "@/lib/api";
import { getDifficultyBadge } from "@/lib/utils";
import { SEASONS, DIFFICULTIES, TRIP_TYPES } from "@/lib/constant";
import { ImageCarousel } from "../../components/ImageCarousel";

export default function DestinationsPage() {
  const [destinations, setDestinations] = useState<Destination[]>([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);
  const [searchQuery, setSearchQuery] = useState("");

  // Filters
  const [selectedSeason, setSelectedSeason] = useState<string>("");
  const [selectedDifficulty, setSelectedDifficulty] = useState<string>("");
  const [selectedTripType, setSelectedTripType] = useState<string>("");

  const [expandedId, setExpandedId] = useState<string | null>(null);

  useEffect(() => {
    fetchDestinations();
  }, [selectedSeason, selectedDifficulty, selectedTripType]);

  const fetchDestinations = async () => {
    setLoading(true);
    setError(null);
    try {
      const filters: Record<string, string> = {};
      if (selectedSeason) filters.season = selectedSeason;
      if (selectedDifficulty) filters.difficulty = selectedDifficulty;
      if (selectedTripType) filters.tripType = selectedTripType;

      const data = await apiClient.getDestinations(filters);
      setDestinations(data);
    } catch (err) {
      setError("Failed to load destinations. Please try again.");
      console.error(err);
    } finally {
      setLoading(false);
    }
  };

  const filteredDestinations = destinations.filter((d) => {
    if (!searchQuery) return true;
    const q = searchQuery.toLowerCase();
    return (
      d.name.toLowerCase().includes(q) ||
      d.region.toLowerCase().includes(q) ||
      d.description?.toLowerCase().includes(q)
    );
  });

  const clearFilters = () => {
    setSelectedSeason("");
    setSelectedDifficulty("");
    setSelectedTripType("");
    setSearchQuery("");
  };

  const hasFilters =
    selectedSeason || selectedDifficulty || selectedTripType || searchQuery;

  return (
    <div className="min-h-screen page-bg">
      <div className="absolute inset-0 noise-texture" />

      {/* Navigation */}
      <nav className="fixed top-0 left-0 right-0 z-50 glass-effect border-b border-white/10">
        <div className="container mx-auto px-4 py-4">
          <div className="flex items-center justify-between">
            <Link
              href="/"
              className="flex items-center gap-2 hover:opacity-80 transition-opacity"
            >
              <Mountain className="h-8 w-8 text-primary" />
              <span className="text-xl font-display font-bold">TrekNepal</span>
            </Link>
            <div className="flex items-center gap-3">
              <Link href="/">
                <Button variant="ghost" size="sm" className="gap-2">
                  <ArrowLeft className="h-4 w-4" />
                  Home
                </Button>
              </Link>
              <Link href="/planner">
                <Button size="sm" className="gap-2">
                  <Sparkles className="h-4 w-4" />
                  Plan a Trip
                </Button>
              </Link>
            </div>
          </div>
        </div>
      </nav>

      {/* Main Content */}
      <div className="container mx-auto px-4 pt-32 pb-16 relative z-10">
        <div className="max-w-7xl mx-auto">
          {/* Header */}
          <div className="text-center mb-12 animate-fade-in">
            <h1 className="text-5xl md:text-6xl font-display font-bold mb-4">
              Explore{" "}
              <span className="text-transparent bg-clip-text bg-gradient-to-r from-primary via-emerald-400 to-accent">
                Destinations
              </span>
            </h1>
            <p className="text-xl text-muted-foreground max-w-2xl mx-auto">
              Discover amazing trekking and travel destinations across Nepal
            </p>
          </div>

          {/* Search & Filters */}
          <div className="mb-10 space-y-6 animate-fade-in-delay">
            <div className="relative max-w-xl mx-auto">
              <Search className="absolute left-4 top-1/2 -translate-y-1/2 h-5 w-5 text-muted-foreground" />
              <Input
                type="text"
                placeholder="Search destinations by name, region..."
                value={searchQuery}
                onChange={(e) => setSearchQuery(e.target.value)}
                className="pl-12 h-12 bg-white/5 border-white/10 text-lg"
              />
            </div>

            <div className="flex flex-wrap gap-4 justify-center">
              <div className="flex items-center gap-2">
                <Filter className="h-4 w-4 text-muted-foreground" />
                <span className="text-sm text-muted-foreground">Filters:</span>
              </div>

              <div className="flex flex-wrap gap-2">
                {SEASONS.map((s) => (
                  <button
                    key={s.value}
                    onClick={() =>
                      setSelectedSeason(
                        selectedSeason === s.value ? "" : s.value,
                      )
                    }
                    className={`px-3 py-1.5 rounded-full text-sm transition-all border ${
                      selectedSeason === s.value
                        ? "bg-primary/20 border-primary/40 text-primary"
                        : "bg-white/5 border-white/10 text-muted-foreground hover:border-white/20"
                    }`}
                  >
                    {s.label}
                  </button>
                ))}
              </div>

              <div className="flex flex-wrap gap-2">
                {DIFFICULTIES.map((d) => (
                  <button
                    key={d.value}
                    onClick={() =>
                      setSelectedDifficulty(
                        selectedDifficulty === d.value ? "" : d.value,
                      )
                    }
                    className={`px-3 py-1.5 rounded-full text-sm transition-all border ${
                      selectedDifficulty === d.value
                        ? "bg-secondary/20 border-secondary/40 text-secondary"
                        : "bg-white/5 border-white/10 text-muted-foreground hover:border-white/20"
                    }`}
                  >
                    {d.label}
                  </button>
                ))}
              </div>

              <div className="flex flex-wrap gap-2">
                {TRIP_TYPES.map((t) => (
                  <button
                    key={t.value}
                    onClick={() =>
                      setSelectedTripType(
                        selectedTripType === t.value ? "" : t.value,
                      )
                    }
                    className={`px-3 py-1.5 rounded-full text-sm transition-all border ${
                      selectedTripType === t.value
                        ? "bg-accent/20 border-accent/40 text-accent"
                        : "bg-white/5 border-white/10 text-muted-foreground hover:border-white/20"
                    }`}
                  >
                    {t.icon} {t.label}
                  </button>
                ))}
              </div>

              {hasFilters && (
                <button
                  onClick={clearFilters}
                  className="px-3 py-1.5 rounded-full text-sm text-destructive border border-destructive/20 hover:bg-destructive/10 transition-all"
                >
                  Clear All
                </button>
              )}
            </div>
          </div>

          {/* Loading */}
          {loading && (
            <div className="flex items-center justify-center py-20">
              <Loader2 className="h-8 w-8 text-primary animate-spin" />
              <span className="ml-3 text-muted-foreground">
                Loading destinations...
              </span>
            </div>
          )}

          {/* Error */}
          {error && (
            <div className="text-center py-20">
              <p className="text-destructive mb-4">{error}</p>
              <Button onClick={fetchDestinations} variant="outline">
                Try Again
              </Button>
            </div>
          )}

          {/* No Results */}
          {!loading && !error && filteredDestinations.length === 0 && (
            <div className="text-center py-20">
              <Mountain className="h-16 w-16 text-muted-foreground mx-auto mb-4" />
              <h3 className="text-2xl font-display font-semibold mb-2">
                No destinations found
              </h3>
              <p className="text-muted-foreground mb-4">
                Try adjusting your filters or search query
              </p>
              <Button onClick={clearFilters} variant="outline">
                Clear Filters
              </Button>
            </div>
          )}

          {/* Destination Grid */}
          {!loading && !error && filteredDestinations.length > 0 && (
            <>
              <p className="text-sm text-muted-foreground mb-6">
                Showing {filteredDestinations.length} destination
                {filteredDestinations.length !== 1 ? "s" : ""}
              </p>

              <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">
                {filteredDestinations.map((destination) => {
                  const badge = getDifficultyBadge(destination.difficulty);
                  const isExpanded = expandedId === destination.id;

                  return (
                    <Card
                      key={destination.id}
                      className="glass-effect-light border-white/5 overflow-hidden hover:border-primary/30 transition-all duration-300 group cursor-pointer"
                      onClick={() =>
                        setExpandedId(isExpanded ? null : destination.id)
                      }
                    >
                      {/* Image Carousel Header */}
                      <ImageCarousel
                        images={
                          destination.images || [
                            destination.imageUrl || "/assets/trek.jpg",
                          ]
                        }
                        alt={destination.name}
                        className="h-48"
                        showArrows={true}
                        showDots={true}
                        autoPlay={0}
                        gradient={true}
                      >
                        {/* Difficulty Badge */}
                        <div
                          className={`absolute top-3 left-3 px-2.5 py-1 rounded-full border text-xs font-semibold capitalize backdrop-blur-sm z-10 ${badge.bg} ${badge.text} ${badge.border}`}
                        >
                          {destination.difficulty}
                        </div>

                        {/* Trip Type Badge */}
                        <div className="absolute top-3 right-10 px-2.5 py-1 rounded-full bg-black/40 backdrop-blur-sm border border-white/10 text-xs text-white capitalize z-10">
                          {destination.tripType}
                        </div>

                        {/* Name overlay */}
                        <div className="absolute bottom-3 left-3 right-3 z-10">
                          <h3 className="text-xl font-display font-bold text-white drop-shadow-lg">
                            {destination.name}
                          </h3>
                          <div className="flex items-center gap-1.5 text-white/80 mt-1">
                            <MapPin className="h-3.5 w-3.5" />
                            <span className="text-xs">
                              {destination.region} Region
                            </span>
                          </div>
                        </div>
                      </ImageCarousel>

                      <CardContent className="pt-4 space-y-4">
                        {/* Quick Stats */}
                        <div className="grid grid-cols-3 gap-3">
                          <div className="text-center">
                            <div className="flex items-center justify-center gap-1 mb-1">
                              <TrendingUp className="h-3.5 w-3.5 text-primary" />
                            </div>
                            <div className="text-sm font-semibold">
                              {destination.elevation.toLocaleString()}m
                            </div>
                            <div className="text-[10px] text-muted-foreground">
                              Elevation
                            </div>
                          </div>
                          <div className="text-center">
                            <div className="flex items-center justify-center gap-1 mb-1">
                              <Clock className="h-3.5 w-3.5 text-secondary" />
                            </div>
                            <div className="text-sm font-semibold">
                              {destination.minDuration}-
                              {destination.maxDuration}
                            </div>
                            <div className="text-[10px] text-muted-foreground">
                              Days
                            </div>
                          </div>
                          <div className="text-center">
                            <div className="flex items-center justify-center gap-1 mb-1">
                              <Calendar className="h-3.5 w-3.5 text-accent" />
                            </div>
                            <div className="text-sm font-semibold">
                              {destination.bestSeasons?.length || 0}
                            </div>
                            <div className="text-[10px] text-muted-foreground">
                              Seasons
                            </div>
                          </div>
                        </div>

                        {/* Expanded Details */}
                        {isExpanded && (
                          <div className="space-y-4 pt-4 border-t border-white/10 animate-fade-in">
                            {destination.description && (
                              <p className="text-sm text-muted-foreground leading-relaxed">
                                {destination.description}
                              </p>
                            )}

                            {destination.bestSeasons &&
                              destination.bestSeasons.length > 0 && (
                                <div>
                                  <h4 className="text-xs font-semibold mb-2 flex items-center gap-1.5">
                                    <Calendar className="h-3.5 w-3.5 text-accent" />
                                    Best Seasons
                                  </h4>
                                  <div className="flex flex-wrap gap-1.5">
                                    {destination.bestSeasons.map((season) => (
                                      <span
                                        key={season}
                                        className="px-2 py-0.5 rounded-full bg-accent/10 border border-accent/20 text-accent text-xs capitalize"
                                      >
                                        {season}
                                      </span>
                                    ))}
                                  </div>
                                </div>
                              )}

                            {destination.highlights &&
                              destination.highlights.length > 0 && (
                                <div>
                                  <h4 className="text-xs font-semibold mb-2 flex items-center gap-1.5">
                                    <Sparkles className="h-3.5 w-3.5 text-primary" />
                                    Highlights
                                  </h4>
                                  <ul className="space-y-1">
                                    {destination.highlights.map((h, i) => (
                                      <li
                                        key={i}
                                        className="flex items-start gap-1.5 text-xs text-muted-foreground"
                                      >
                                        <span className="h-1 w-1 rounded-full bg-primary mt-1.5 flex-shrink-0" />
                                        {h}
                                      </li>
                                    ))}
                                  </ul>
                                </div>
                              )}

                            <Link href="/planner" className="block">
                              <Button
                                size="sm"
                                className="w-full gap-2 mt-2"
                                onClick={(e) => e.stopPropagation()}
                              >
                                <Sparkles className="h-4 w-4" />
                                Plan a Trip Here
                              </Button>
                            </Link>
                          </div>
                        )}

                        {!isExpanded && (
                          <p className="text-xs text-center text-muted-foreground">
                            Click to see details
                          </p>
                        )}
                      </CardContent>
                    </Card>
                  );
                })}
              </div>
            </>
          )}
        </div>
      </div>
    </div>
  );
}
