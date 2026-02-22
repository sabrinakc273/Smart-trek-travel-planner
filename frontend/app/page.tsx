"use client";
//this is the root layout file that sets up global styles and fonts for the application
import Link from "next/link";
import { Mountain, Compass, Wallet, Map, Calendar, Users } from "lucide-react";
import { Button } from "@/components/ui/button";
import {
  Card,
  CardContent,
  CardDescription,
  CardHeader,
  CardTitle,
} from "@/components/ui/card";

export default function LandingPage() {
  return (
    <div className="min-h-screen bg-background">
      {/* Navigation */}
      <nav className="fixed top-0 left-0 right-0 z-50 glass-effect border-b border-white/10">
        <div className="container mx-auto px-4 py-4">
          <div className="flex items-center justify-between">
            <div className="flex items-center gap-2">
              <Mountain className="h-8 w-8 text-primary" />
              <span className="text-xl font-display font-bold">
                Smart Tour&Trek Planner
              </span>
            </div>
            <Link href="/planner">
              <Button size="lg">Start Planning</Button>
            </Link>
          </div>
        </div>
      </nav>

      {/* Hero Section — trek.jpg background */}
      <section className="relative min-h-screen flex items-center justify-center overflow-hidden hero-bg">
        <div className="absolute inset-0 noise-texture" />

        <div className="container mx-auto px-4 py-32 relative z-10">
          <div className="max-w-4xl mx-auto text-center space-y-8 animate-fade-in">
            <div className="inline-block">
              <div className="inline-flex items-center gap-2 px-4 py-2 rounded-full glass-effect border border-primary/30 mb-6">
                <span className="text-sm text-primary font-medium">
                  AI-Powered Planning
                </span>
              </div>
            </div>

            <h1
              className="text-6xl md:text-7xl lg:text-8xl font-display font-bold leading-tight text-white"
              style={{
                textShadow:
                  "0 2px 20px rgba(0,0,0,0.6), 0 4px 40px rgba(0,0,0,0.4)",
              }}
            >
              Plan Your Perfect
              <span
                className="block text-transparent bg-clip-text bg-gradient-to-r from-primary via-emerald-400 to-accent"
                style={{ filter: "drop-shadow(0 2px 10px rgba(0,0,0,0.5))" }}
              >
                Nepal Adventure
              </span>
            </h1>

            <p
              className="text-xl md:text-2xl text-white/90 max-w-2xl mx-auto leading-relaxed"
              style={{ textShadow: "0 1px 8px rgba(0,0,0,0.5)" }}
            >
              Get personalized trekking and travel itineraries with budget
              optimization, powered by machine learning and local expertise.
            </p>

            <div className="flex flex-col sm:flex-row gap-4 justify-center items-center pt-8">
              <Link href="/planner">
                <Button size="lg" className="gap-2 group text-base px-8 py-6">
                  <Compass className="h-5 w-5 group-hover:rotate-45 transition-transform" />
                  Start Planning Now
                </Button>
              </Link>
              <Link href="/planner">
                <Button
                  size="lg"
                  variant="outline"
                  className="gap-2 text-base px-8 py-6 border-white/20 hover:bg-white/10"
                >
                  <Map className="h-5 w-5" />
                  Explore Destinations
                </Button>
              </Link>
            </div>
          </div>
        </div>

        {/* Scroll Indicator */}
        <div className="absolute bottom-8 left-1/2 -translate-x-1/2 animate-float">
          <div className="w-6 h-10 border-2 border-primary/50 rounded-full flex items-start justify-center p-2">
            <div className="w-1.5 h-3 bg-primary rounded-full animate-pulse" />
          </div>
        </div>
      </section>

      {/* Features Section */}
      <section className="py-24 relative">
        <div className="absolute inset-0 gradient-mesh opacity-10" />
        <div className="container mx-auto px-4 relative z-10">
          <div className="text-center mb-16 animate-fade-in-delay">
            <h2 className="text-4xl md:text-5xl font-display font-bold mb-4">
              Smart Planning Features
            </h2>
            <p className="text-xl text-muted-foreground max-w-2xl mx-auto">
              Everything you need to plan your Nepal adventure in one place
            </p>
          </div>

          <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">
            {features.map((feature, index) => (
              <Card
                key={feature.title}
                className="glass-effect-light border-white/5 hover:border-primary/30 transition-all duration-300 group hover:-translate-y-1"
                style={{ animationDelay: `${index * 100}ms` }}
              >
                <CardHeader>
                  <div className="h-12 w-12 rounded-lg bg-primary/10 flex items-center justify-center mb-4 group-hover:bg-primary/20 transition-colors">
                    <feature.icon className="h-6 w-6 text-primary" />
                  </div>
                  <CardTitle className="text-2xl">{feature.title}</CardTitle>
                  <CardDescription className="text-base">
                    {feature.description}
                  </CardDescription>
                </CardHeader>
              </Card>
            ))}
          </div>
        </div>
      </section>

      {/* How It Works — pilgrim.webp background */}
      <section className="py-24 relative pilgrim-bg">
        <div className="absolute inset-0 noise-texture" />
        <div className="container mx-auto px-4 relative z-10">
          <div className="text-center mb-16">
            <h2
              className="text-4xl md:text-5xl font-display font-bold mb-4 text-white"
              style={{ textShadow: "0 2px 16px rgba(0,0,0,0.5)" }}
            >
              How It Works
            </h2>
            <p className="text-xl text-white/70">
              Three simple steps to your perfect trip
            </p>
          </div>

          <div className="max-w-4xl mx-auto space-y-8">
            {steps.map((step, index) => (
              <div key={step.title} className="flex gap-6 items-start group">
                <div className="flex-shrink-0 w-12 h-12 rounded-full bg-primary text-primary-foreground flex items-center justify-center text-xl font-bold shadow-lg shadow-primary/25">
                  {index + 1}
                </div>
                <div className="flex-1 glass-effect p-6 rounded-xl">
                  <h3 className="text-2xl font-display font-semibold mb-2 group-hover:text-primary transition-colors">
                    {step.title}
                  </h3>
                  <p className="text-white/70 text-lg">{step.description}</p>
                </div>
              </div>
            ))}
          </div>

          <div className="text-center mt-12">
            <Link href="/planner">
              <Button
                size="lg"
                className="gap-2 text-base px-8 py-6 shadow-lg shadow-primary/20"
              >
                Get Started
                <Compass className="h-5 w-5" />
              </Button>
            </Link>
          </div>
        </div>
      </section>

      {/* Footer */}
      <footer className="py-12 border-t border-white/10">
        <div className="container mx-auto px-4">
          <div className="flex flex-col md:flex-row justify-between items-center gap-4">
            <div className="flex items-center gap-2">
              <Mountain className="h-6 w-6 text-primary" />
              <span className="font-display font-bold">Smart Trek Planner</span>
            </div>
            <p className="text-sm text-muted-foreground">
              © 2026 Smart Trek & Travel Planner. A Minor Project for Computer
              Engineering, Lalitpur Engineering College.
            </p>
          </div>
        </div>
      </footer>
    </div>
  );
}

const features = [
  {
    title: "Budget Optimization",
    description:
      "Get accurate cost estimates and optimize your spending for the best experience within your budget.",
    icon: Wallet,
  },
  {
    title: "AI Recommendations",
    description:
      "Machine learning algorithms analyze your preferences to suggest perfect destinations.",
    icon: Compass,
  },
  {
    title: "Custom Itineraries",
    description:
      "Receive detailed day-by-day itineraries tailored to your duration and fitness level.",
    icon: Calendar,
  },
  {
    title: "Group Planning",
    description:
      "Plan trips for solo adventures or groups with adjusted costs and logistics.",
    icon: Users,
  },
  {
    title: "Seasonal Guidance",
    description:
      "Get recommendations based on the best seasons for your chosen destination.",
    icon: Mountain,
  },
  {
    title: "Detailed Maps",
    description:
      "Access route information, elevation profiles, and distance details for your trek.",
    icon: Map,
  },
];

const steps = [
  {
    title: "Enter Your Preferences",
    description:
      "Tell us about your budget, available time, preferred season, difficulty level, and trip type.",
  },
  {
    title: "Get AI Recommendations",
    description:
      "Our machine learning system analyzes thousands of data points to find destinations that match your criteria.",
  },
  {
    title: "Review Your Plan",
    description:
      "Receive a detailed itinerary with day-by-day breakdown, cost estimates, and practical recommendations.",
  },
];
