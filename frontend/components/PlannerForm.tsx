"use client";


//this is the component called planner form that allows users to input their trip preferences
import { useState } from "react";
import { Calendar, Users, Wallet, Mountain, Gauge, Globe } from "lucide-react";
import { Button } from "../components/ui/button";
import { Input } from "../components/ui/input";
import { Select } from "../components/ui/select";
import { Label } from "../components/ui/label";
import {
  Card,
  CardContent,
  CardDescription,
  CardHeader,
  CardTitle,
} from "@/components/ui/card";
import { PlannerFormData } from "@/lib/types";
import {
  SEASONS,
  DIFFICULTIES,
  TRIP_TYPES,
  BUDGET_RANGES,
  NATIONALITIES,
  DURATION_RANGES,
  GROUP_SIZE_RANGES,
} from "@/lib/constant";
import { formatCurrency } from "@/lib/utils";

interface PlannerFormProps {
  formData: Partial<PlannerFormData>;
  onUpdate: (data: Partial<PlannerFormData>) => void;
  onSubmit: () => void;
  loading?: boolean;
  error?: string | null;
}

export function PlannerForm({
  formData,
  onUpdate,
  onSubmit,
  loading,
  error,
}: PlannerFormProps) {
  const [showAdvanced, setShowAdvanced] = useState(false);

  const handleSubmit = (e: React.FormEvent) => {
    e.preventDefault();
    onSubmit();
  };

  return (
    <form onSubmit={handleSubmit} className="space-y-6">
      {/* Budget and Duration */}
      <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
        <Card className="glass-effect border-white/5">
          <CardHeader>
            <div className="flex items-center gap-3 mb-2">
              <div className="h-10 w-10 rounded-lg bg-primary/10 flex items-center justify-center">
                <Wallet className="h-5 w-5 text-primary" />
              </div>
              <div>
                <CardTitle>Budget</CardTitle>
                <CardDescription>Total available budget in NPR</CardDescription>
              </div>
            </div>
          </CardHeader>
          <CardContent className="space-y-4">
            <div className="space-y-2">
              <div className="flex justify-between items-center">
                <Label htmlFor="budget">Amount</Label>
                <span className="text-sm text-primary font-semibold">
                  {formatCurrency(formData.budget || BUDGET_RANGES.default)}
                </span>
              </div>
              <Input
                id="budget"
                type="range"
                min={BUDGET_RANGES.min}
                max={BUDGET_RANGES.max}
                step={BUDGET_RANGES.step}
                value={formData.budget || BUDGET_RANGES.default}
                onChange={(e) => onUpdate({ budget: parseInt(e.target.value) })}
                className="cursor-pointer"
              />
              <div className="flex justify-between text-xs text-muted-foreground">
                <span>{formatCurrency(BUDGET_RANGES.min)}</span>
                <span>{formatCurrency(BUDGET_RANGES.max)}</span>
              </div>
            </div>
          </CardContent>
        </Card>

        <Card className="glass-effect border-white/5">
          <CardHeader>
            <div className="flex items-center gap-3 mb-2">
              <div className="h-10 w-10 rounded-lg bg-secondary/10 flex items-center justify-center">
                <Calendar className="h-5 w-5 text-secondary" />
              </div>
              <div>
                <CardTitle>Duration</CardTitle>
                <CardDescription>Number of days for the trip</CardDescription>
              </div>
            </div>
          </CardHeader>
          <CardContent className="space-y-4">
            <div className="space-y-2">
              <div className="flex justify-between items-center">
                <Label htmlFor="duration">Days</Label>
                <span className="text-sm text-secondary font-semibold">
                  {formData.duration || DURATION_RANGES.default} days
                </span>
              </div>
              <Input
                id="duration"
                type="range"
                min={DURATION_RANGES.min}
                max={DURATION_RANGES.max}
                step={DURATION_RANGES.step}
                value={formData.duration || DURATION_RANGES.default}
                onChange={(e) =>
                  onUpdate({ duration: parseInt(e.target.value) })
                }
                className="cursor-pointer"
              />
              <div className="flex justify-between text-xs text-muted-foreground">
                <span>{DURATION_RANGES.min} day</span>
                <span>{DURATION_RANGES.max} days</span>
              </div>
            </div>
          </CardContent>
        </Card>
      </div>

      {/* Season Selection */}
      <Card className="glass-effect border-white/5">
        <CardHeader>
          <CardTitle>When are you planning to travel?</CardTitle>
          <CardDescription>Select the season for your trip</CardDescription>
        </CardHeader>
        <CardContent>
          <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-4">
            {SEASONS.map((season) => (
              <button
                key={season.value}
                type="button"
                onClick={() => onUpdate({ season: season.value })}
                className={`p-4 rounded-lg border-2 transition-all text-left ${
                  formData.season === season.value
                    ? "border-primary bg-primary/10"
                    : "border-white/10 hover:border-white/20"
                }`}
              >
                <div className="font-semibold mb-1">{season.label}</div>
                <div className="text-xs text-muted-foreground mb-2">
                  {season.months}
                </div>
                <div className="text-xs">{season.description}</div>
              </button>
            ))}
          </div>
        </CardContent>
      </Card>

      {/* Difficulty Level */}
      <Card className="glass-effect border-white/5">
        <CardHeader>
          <div className="flex items-center gap-3">
            <Gauge className="h-5 w-5 text-primary" />
            <div>
              <CardTitle>Difficulty Level</CardTitle>
              <CardDescription>
                Choose based on your fitness and experience
              </CardDescription>
            </div>
          </div>
        </CardHeader>
        <CardContent>
          <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-4">
            {DIFFICULTIES.map((difficulty) => (
              <button
                key={difficulty.value}
                type="button"
                onClick={() => onUpdate({ difficulty: difficulty.value })}
                className={`p-4 rounded-lg border-2 transition-all text-left ${
                  formData.difficulty === difficulty.value
                    ? "border-primary bg-primary/10"
                    : "border-white/10 hover:border-white/20"
                }`}
              >
                <div className="font-semibold mb-1">{difficulty.label}</div>
                <div className="text-xs text-muted-foreground">
                  {difficulty.description}
                </div>
              </button>
            ))}
          </div>
        </CardContent>
      </Card>

      <Card className="glass-effect border-white/5">
        <CardHeader>
          <div className="flex items-center gap-3">
            <Globe className="h-5 w-5 text-primary" />
            <div>
              <CardTitle>Are you Nepali or a Tourist?</CardTitle>
              <CardDescription>
                Pricing differs significantly — permits, park entries, and
                services cost much less for Nepali citizens
              </CardDescription>
            </div>
          </div>
        </CardHeader>
        <CardContent>
          <div className="grid grid-cols-1 sm:grid-cols-2 gap-4">
            {NATIONALITIES.map((nat) => (
              <button
                key={nat.value}
                type="button"
                onClick={() => onUpdate({ nationality: nat.value })}
                className={`p-5 rounded-lg border-2 transition-all text-left ${
                  formData.nationality === nat.value
                    ? "border-primary bg-primary/10"
                    : "border-white/10 hover:border-white/20"
                }`}
              >
                <div className="flex items-center gap-3 mb-2">
                  <span className="text-3xl">{nat.icon}</span>
                  <span className="font-semibold text-lg">{nat.label}</span>
                </div>
                <div className="text-xs text-muted-foreground">
                  {nat.description}
                </div>
              </button>
            ))}
          </div>
        </CardContent>
      </Card>
      {/* Trip Type */}
      <Card className="glass-effect border-white/5">
        <CardHeader>
          <div className="flex items-center gap-3">
            <Mountain className="h-5 w-5 text-secondary" />
            <div>
              <CardTitle>Trip Type</CardTitle>
              <CardDescription>
                What kind of experience are you looking for?
              </CardDescription>
            </div>
          </div>
        </CardHeader>
        <CardContent>
          <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-5 gap-4">
            {TRIP_TYPES.map((type) => (
              <button
                key={type.value}
                type="button"
                onClick={() => onUpdate({ tripType: type.value })}
                className={`p-4 rounded-lg border-2 transition-all text-center ${
                  formData.tripType === type.value
                    ? "border-secondary bg-secondary/10"
                    : "border-white/10 hover:border-white/20"
                }`}
              >
                <div className="text-3xl mb-2">{type.icon}</div>
                <div className="font-semibold mb-1 text-sm">{type.label}</div>
                <div className="text-xs text-muted-foreground">
                  {type.description}
                </div>
              </button>
            ))}
          </div>
        </CardContent>
      </Card>

      {/* Group Size */}
      <Card className="glass-effect border-white/5">
        <CardHeader>
          <div className="flex items-center gap-3">
            <Users className="h-5 w-5 text-accent" />
            <div>
              <CardTitle>Group Size</CardTitle>
              <CardDescription>How many people are traveling?</CardDescription>
            </div>
          </div>
        </CardHeader>
        <CardContent>
          <div className="space-y-2">
            <div className="flex justify-between items-center">
              <Label htmlFor="groupSize">Number of travelers</Label>
              <span className="text-sm text-accent font-semibold">
                {formData.groupSize || GROUP_SIZE_RANGES.default}{" "}
                {formData.groupSize === 1 ? "person" : "people"}
              </span>
            </div>
            <Input
              id="groupSize"
              type="range"
              min={GROUP_SIZE_RANGES.min}
              max={GROUP_SIZE_RANGES.max}
              step={GROUP_SIZE_RANGES.step}
              value={formData.groupSize || GROUP_SIZE_RANGES.default}
              onChange={(e) =>
                onUpdate({ groupSize: parseInt(e.target.value) })
              }
              className="cursor-pointer"
            />
            <div className="flex justify-between text-xs text-muted-foreground">
              <span>Solo</span>
              <span>Large Group ({GROUP_SIZE_RANGES.max}+)</span>
            </div>
          </div>
        </CardContent>
      </Card>

      {/* Optional Start Date */}
      <Card className="glass-effect border-white/5">
        <CardHeader>
          <CardTitle className="text-lg">Start Date (Optional)</CardTitle>
          <CardDescription>
            When do you plan to start your trip?
          </CardDescription>
        </CardHeader>
        <CardContent>
          <Input
            type="date"
            value={formData.startDate || ""}
            onChange={(e) => onUpdate({ startDate: e.target.value })}
            min={new Date().toISOString().split("T")[0]}
          />
        </CardContent>
      </Card>

      {/* Error Message */}
      {error && (
        <div className="p-4 rounded-lg bg-destructive/10 border border-destructive/20 text-destructive">
          <p className="text-sm font-medium">{error}</p>
        </div>
      )}

      {/* Submit Button */}
      <Button
        type="submit"
        size="lg"
        className="w-full gap-2"
        disabled={loading}
      >
        {loading ? (
          <>
            <div className="h-5 w-5 border-2 border-primary-foreground/30 border-t-primary-foreground rounded-full animate-spin" />
            Generating Your Plan...
          </>
        ) : (
          <>
            <Mountain className="h-5 w-5" />
            Generate My Trip Plan
          </>
        )}
      </Button>
    </form>
  );
}
