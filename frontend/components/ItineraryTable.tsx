"use client";


//this is the component called itinerary table that shows a day-by-day plan for the trip
import { Itinerary } from "@/lib/types";
import {
  Card,
  CardContent,
  CardDescription,
  CardHeader,
  CardTitle,
} from "../components/ui/card";
import {
  MapPin,
  Footprints,
  Clock,
  TrendingUp,
  Utensils,
  Home,
  CheckCircle2,
  Calendar,
} from "lucide-react";

interface ItineraryTableProps {
  itinerary: Itinerary;
}

export function ItineraryTable({ itinerary }: ItineraryTableProps) {
  return (
    <Card className="glass-effect border-white/5 elevation-shadow">
      <CardHeader>
        <div className="flex items-start justify-between">
          <div>
            <CardTitle className="text-3xl mb-2">
              Day-by-Day Itinerary
            </CardTitle>
            <CardDescription>
              Detailed plan for each day of your journey
            </CardDescription>
          </div>
          <div className="h-12 w-12 rounded-lg bg-accent/10 flex items-center justify-center">
            <Calendar className="h-6 w-6 text-accent" />
          </div>
        </div>

        {/* Summary Stats */}
        {(itinerary.totalDistance || itinerary.maxElevation) && (
          <div className="grid grid-cols-2 gap-4 mt-6">
            {itinerary.totalDistance && (
              <div className="p-4 rounded-lg bg-white/5 border border-white/10">
                <div className="flex items-center gap-2 mb-1">
                  <Footprints className="h-4 w-4 text-primary" />
                  <span className="text-xs text-muted-foreground">
                    Total Distance
                  </span>
                </div>
                <div className="text-xl font-semibold">
                  {itinerary.totalDistance}
                </div>
              </div>
            )}
            {itinerary.maxElevation && (
              <div className="p-4 rounded-lg bg-white/5 border border-white/10">
                <div className="flex items-center gap-2 mb-1">
                  <TrendingUp className="h-4 w-4 text-secondary" />
                  <span className="text-xs text-muted-foreground">
                    Max Elevation
                  </span>
                </div>
                <div className="text-xl font-semibold">
                  {itinerary.maxElevation}
                </div>
              </div>
            )}
          </div>
        )}
      </CardHeader>

      <CardContent>
        <div className="space-y-6">
          {itinerary.days.map((day, index) => (
            <div key={day.day} className="relative">
              {/* Connector Line */}
              {index < itinerary.days.length - 1 && (
                <div className="absolute left-5 top-12 bottom-0 w-0.5 bg-gradient-to-b from-primary to-transparent" />
              )}

              <div className="flex gap-4 group">
                {/* Day Number */}
                <div className="flex-shrink-0">
                  <div className="h-10 w-10 rounded-full bg-primary text-primary-foreground flex items-center justify-center font-bold text-sm relative z-10">
                    {day.day}
                  </div>
                </div>

                {/* Day Content */}
                <div className="flex-1 pb-6">
                  <div className="p-6 rounded-lg border border-white/10 bg-white/5 hover:bg-white/10 hover:border-primary/20 transition-all">
                    {/* Header */}
                    <div className="mb-4">
                      <h3 className="text-xl font-display font-semibold mb-2 group-hover:text-primary transition-colors">
                        {day.title}
                      </h3>
                      <div className="flex items-center gap-2 text-muted-foreground">
                        <MapPin className="h-4 w-4" />
                        <span className="text-sm">{day.location}</span>
                      </div>
                    </div>

                    {/* Details Grid */}
                    <div className="grid grid-cols-1 md:grid-cols-3 gap-3 mb-4">
                      {day.distance && (
                        <div className="flex items-center gap-2 text-sm">
                          <Footprints className="h-4 w-4 text-primary" />
                          <span className="text-muted-foreground">
                            Distance:
                          </span>
                          <span className="font-medium">{day.distance}</span>
                        </div>
                      )}
                      {day.duration && (
                        <div className="flex items-center gap-2 text-sm">
                          <Clock className="h-4 w-4 text-secondary" />
                          <span className="text-muted-foreground">
                            Duration:
                          </span>
                          <span className="font-medium">{day.duration}</span>
                        </div>
                      )}
                      {day.elevation && (
                        <div className="flex items-center gap-2 text-sm">
                          <TrendingUp className="h-4 w-4 text-accent" />
                          <span className="text-muted-foreground">
                            Elevation:
                          </span>
                          <span className="font-medium">{day.elevation}</span>
                        </div>
                      )}
                    </div>

                    {/* Activities */}
                    {day.activities && day.activities.length > 0 && (
                      <div className="mb-4">
                        <h4 className="text-sm font-semibold mb-2 flex items-center gap-2">
                          <CheckCircle2 className="h-4 w-4 text-primary" />
                          Activities
                        </h4>
                        <ul className="space-y-1">
                          {day.activities.map((activity, idx) => (
                            <li
                              key={idx}
                              className="flex items-start gap-2 text-sm text-muted-foreground"
                            >
                              <span className="h-1.5 w-1.5 rounded-full bg-primary/50 mt-1.5 flex-shrink-0" />
                              {activity}
                            </li>
                          ))}
                        </ul>
                      </div>
                    )}

                    {/* Highlights */}
                    {day.highlights && day.highlights.length > 0 && (
                      <div className="mb-4">
                        <h4 className="text-sm font-semibold mb-2">
                          Highlights
                        </h4>
                        <div className="flex flex-wrap gap-2">
                          {day.highlights.map((highlight, idx) => (
                            <span
                              key={idx}
                              className="px-2 py-1 rounded bg-accent/10 border border-accent/20 text-accent text-xs"
                            >
                              {highlight}
                            </span>
                          ))}
                        </div>
                      </div>
                    )}

                    {/* Accommodation & Meals */}
                    <div className="grid grid-cols-1 md:grid-cols-2 gap-3 pt-4 border-t border-white/10">
                      <div className="flex items-center gap-2 text-sm">
                        <Home className="h-4 w-4 text-green-500" />
                        <span className="text-muted-foreground">Stay:</span>
                        <span className="font-medium">{day.accommodation}</span>
                      </div>
                      <div className="flex items-center gap-2 text-sm">
                        <Utensils className="h-4 w-4 text-orange-500" />
                        <span className="text-muted-foreground">Meals:</span>
                        <span className="font-medium">{day.meals}</span>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          ))}
        </div>

        {/* End Marker */}
        <div className="flex items-center gap-4 mt-4">
          <div className="h-10 w-10 rounded-full bg-secondary text-secondary-foreground flex items-center justify-center">
            <CheckCircle2 className="h-5 w-5" />
          </div>
          <div className="text-lg font-semibold">Trip Complete!</div>
        </div>
      </CardContent>
    </Card>
  );
}
