/* eslint-disable @next/next/no-img-element */
// frontend/app/result/page.tsx
"use client";

import { useEffect, useState, useRef } from "react";
import { useRouter, useSearchParams } from "next/navigation";
import Link from "next/link";
import {
  Mountain,
  ArrowLeft,
  Download,
  Share2,
  RefreshCw,
  CheckCircle,
  MapPin,
  Calendar,
  Clock,
  TrendingUp,
  Wallet,
  Sparkles,
  X,
  ChevronDown,
  ChevronUp,
  Footprints,
  Home,
  Utensils,
  FileText,
  UserCheck,
  Backpack,
  MoreHorizontal,
  Bus,
  AlertTriangle,
  Star,
  Shield,
  Eye,
  Copy,
  Check,
  Printer,
} from "lucide-react";
import { Button } from "../../components/ui/button";
import {
  Card,
  CardContent,
  CardHeader,
  CardTitle,
} from "../../components/ui/card";
import { usePlanner } from "@/hooks/usePlanner";
import {
  formatCurrency,
  getDifficultyBadge,
  calculatePercentage,
} from "@/lib/utils";
import { ImageCarousel } from "../../components/ImageCarousel";

type DialogTab = "itinerary" | "budget" | "overview";

export default function ResultPage() {
  const router = useRouter();
  const searchParams = useSearchParams();
  const { response, formData, reset, goBack, getShareUrl, loadFromShareHash } =
    usePlanner();
  const [showSuccessMessage, setShowSuccessMessage] = useState(true);
  const [dialogOpen, setDialogOpen] = useState(false);
  const [activeTab, setActiveTab] = useState<DialogTab>("overview");
  const [expandedDay, setExpandedDay] = useState<number | null>(null);
  const [shareToast, setShareToast] = useState(false);
  const [linkCopied, setLinkCopied] = useState(false);
  const printRef = useRef<HTMLDivElement>(null);

  // Load from shared link if ?plan= param exists
  useEffect(() => {
    const planHash = searchParams.get("plan");
    if (planHash && !response) {
      loadFromShareHash(planHash);
    }
  }, [searchParams, response, loadFromShareHash]);

  useEffect(() => {
    if (!response) {
      const timer = setTimeout(() => {
        if (!response) {
          // Check URL param again before redirecting
          const planHash = searchParams.get("plan");
          if (!planHash) router.push("/planner");
        }
      }, 800);
      return () => clearTimeout(timer);
    }
  }, [response, router, searchParams]);

  useEffect(() => {
    const timer = setTimeout(() => setShowSuccessMessage(false), 5000);
    return () => clearTimeout(timer);
  }, []);

  useEffect(() => {
    const handler = (e: KeyboardEvent) => {
      if (e.key === "Escape") setDialogOpen(false);
    };
    window.addEventListener("keydown", handler);
    return () => window.removeEventListener("keydown", handler);
  }, []);

  useEffect(() => {
    if (dialogOpen) document.body.style.overflow = "hidden";
    else document.body.style.overflow = "";
    return () => {
      document.body.style.overflow = "";
    };
  }, [dialogOpen]);

  if (!response) {
    return (
      <div className="min-h-screen page-bg flex items-center justify-center">
        <div className="h-12 w-12 border-4 border-primary/30 border-t-primary rounded-full animate-spin" />
      </div>
    );
  }

  const {
    destination,
    costBreakdown,
    itinerary,
    recommendations,
    warnings,
    matchScore,
  } = response;
  const diffBadge = getDifficultyBadge(destination.difficulty);

  const handleNewPlan = () => {
    reset();
    router.push("/planner");
  };

  // ── PDF Download via print ──
  const handleDownload = () => {
    // Open all itinerary days for printing
    setExpandedDay(-1);
    setDialogOpen(false);
    // Wait for DOM update, then trigger print
    setTimeout(() => {
      window.print();
    }, 300);
  };

  // ── Share link ──
  const handleShare = async () => {
    const shareUrl = getShareUrl();
    if (!shareUrl) return;

    // Try native share first (mobile)
    if (navigator.share) {
      try {
        await navigator.share({
          title: `Smart Tour&Trek Planner - Trip to ${destination.name}`,
          text: `Check out my ${itinerary.days.length}-day trip plan to ${destination.name}! Budget: ${formatCurrency(costBreakdown.total)}`,
          url: shareUrl,
        });
        return;
      } catch {
        // User cancelled or not supported, fall through to copy
      }
    }

    // Fallback: copy to clipboard
    try {
      await navigator.clipboard.writeText(shareUrl);
      setLinkCopied(true);
      setShareToast(true);
      setTimeout(() => {
        setShareToast(false);
        setLinkCopied(false);
      }, 3000);
    } catch {
      // Final fallback: prompt
      prompt("Copy this link to share your plan:", shareUrl);
    }
  };

  const handleModifyPlan = () => {
    goBack();
    router.push("/planner");
  };

  const openDialog = (tab: DialogTab) => {
    setActiveTab(tab);
    setDialogOpen(true);
  };

  const costItems = [
    {
      label: "Transportation",
      amount: costBreakdown.transportation,
      icon: Bus,
      color: "text-blue-400",
    },
    {
      label: "Accommodation",
      amount: costBreakdown.accommodation,
      icon: Home,
      color: "text-green-400",
    },
    {
      label: "Food & Drinks",
      amount: costBreakdown.food,
      icon: Utensils,
      color: "text-orange-400",
    },
    {
      label: "Permits & Fees",
      amount: costBreakdown.permits,
      icon: FileText,
      color: "text-purple-400",
    },
    {
      label: "Guide & Porter",
      amount: costBreakdown.guide,
      icon: UserCheck,
      color: "text-cyan-400",
    },
    {
      label: "Equipment",
      amount: costBreakdown.equipment,
      icon: Backpack,
      color: "text-pink-400",
    },
    {
      label: "Miscellaneous",
      amount: costBreakdown.miscellaneous,
      icon: MoreHorizontal,
      color: "text-gray-400",
    },
  ];

  const budgetUsed = formData.budget
    ? calculatePercentage(costBreakdown.total, formData.budget)
    : 0;

  const heroImages =
    destination.images && destination.images.length > 0
      ? destination.images
      : [destination.imageUrl || "/assets/trek.jpg"];

  return (
    <>
      {/* Print-only stylesheet */}
      <style jsx global>{`
        @media print {
          body {
            background: white !important;
            color: black !important;
            -webkit-print-color-adjust: exact;
            print-color-adjust: exact;
          }
          nav,
          .no-print,
          .noise-texture {
            display: none !important;
          }
          .page-bg {
            background: white !important;
          }
          .glass-effect,
          .glass-effect-light {
            background: white !important;
            border-color: #ddd !important;
            backdrop-filter: none !important;
          }
          .text-white {
            color: black !important;
          }
          .text-muted-foreground {
            color: #555 !important;
          }
          .text-primary {
            color: #2d6a4f !important;
          }
          .bg-primary {
            background: #2d6a4f !important;
          }
          * {
            color-scheme: light !important;
          }
          .print-section {
            break-inside: avoid;
            page-break-inside: avoid;
            margin-bottom: 16px;
          }
          @page {
            margin: 1cm;
            size: A4;
          }
        }
      `}</style>

      <div className="min-h-screen page-bg" ref={printRef}>
        <div className="absolute inset-0 noise-texture" />

        {/* Navigation — hidden in print */}
        <nav className="fixed top-0 left-0 right-0 z-50 glass-effect border-b border-white/10 no-print">
          <div className="container mx-auto px-4 py-4">
            <div className="flex items-center justify-between">
              <Link
                href="/"
                className="flex items-center gap-2 hover:opacity-80 transition-opacity"
              >
                <Mountain className="h-8 w-8 text-primary" />
                <span className="text-xl font-display font-bold">
                  Smart Tour&Trek Planner
                </span>
              </Link>
              <div className="flex items-center gap-3">
                <Button
                  variant="ghost"
                  size="sm"
                  onClick={handleModifyPlan}
                  className="gap-2"
                >
                  <ArrowLeft className="h-4 w-4" />
                  Modify Plan
                </Button>
                <Button
                  variant="outline"
                  size="sm"
                  onClick={handleDownload}
                  className="gap-2"
                >
                  <Printer className="h-4 w-4" />
                  PDF
                </Button>
                <Button
                  variant="outline"
                  size="sm"
                  onClick={handleShare}
                  className="gap-2"
                >
                  {linkCopied ? (
                    <Check className="h-4 w-4" />
                  ) : (
                    <Share2 className="h-4 w-4" />
                  )}
                  {linkCopied ? "Copied!" : "Share"}
                </Button>
              </div>
            </div>
          </div>
        </nav>

        {/* Share Toast */}
        {shareToast && (
          <div className="fixed top-20 left-1/2 -translate-x-1/2 z-[200] animate-fade-in no-print">
            <div className="glass-effect px-6 py-3 rounded-lg border border-primary/20 bg-primary/10 flex items-center gap-3">
              <Copy className="h-5 w-5 text-primary" />
              <span className="text-sm font-medium">
                Share link copied to clipboard!
              </span>
            </div>
          </div>
        )}

        {/* Success Toast */}
        {showSuccessMessage && (
          <div className="fixed top-20 left-1/2 -translate-x-1/2 z-40 animate-fade-in no-print">
            <div className="glass-effect px-6 py-3 rounded-lg border border-emerald-500/20 bg-emerald-500/10 flex items-center gap-3">
              <CheckCircle className="h-5 w-5 text-emerald-400" />
              <span className="text-sm font-medium">
                Your trip plan has been generated successfully!
              </span>
            </div>
          </div>
        )}

        {/* Main Content */}
        <div className="container mx-auto px-4 pt-28 pb-16 relative z-10">
          <div className="max-w-6xl mx-auto">
            {/* ─── Print Header (only visible in print) ─── */}
            <div className="hidden print:block mb-8">
              <h1 className="text-3xl font-bold mb-2">
                {destination.name} — Trip Plan
              </h1>
              <p className="text-sm text-gray-600">
                {destination.region} Region | {itinerary.days.length} Days |{" "}
                {formatCurrency(costBreakdown.total)} | Match Score:{" "}
                {matchScore}%
              </p>
              <hr className="mt-4" />
            </div>

            {/* ─── Hero Destination Carousel ─── */}
            <div className="relative rounded-2xl overflow-hidden mb-10 animate-fade-in group print-section">
              <ImageCarousel
                images={heroImages}
                alt={destination.name}
                className="h-72 md:h-96"
                showArrows={true}
                showDots={true}
                autoPlay={5000}
                gradient={true}
              >
                {matchScore && (
                  <div className="absolute top-5 right-14 px-4 py-2 rounded-full glass-effect border border-primary/30 flex items-center gap-2 z-10 no-print">
                    <Sparkles className="h-4 w-4 text-primary" />
                    <span className="text-lg font-bold text-white">
                      {matchScore}%
                    </span>
                    <span className="text-xs text-white/70">Match</span>
                  </div>
                )}

                <div
                  className={`absolute top-5 left-5 px-3 py-1.5 rounded-full border backdrop-blur-sm z-10 ${diffBadge.bg} ${diffBadge.text} ${diffBadge.border}`}
                >
                  <span className="text-sm font-semibold capitalize">
                    {destination.difficulty}
                  </span>
                </div>

                <div className="absolute bottom-6 left-6 right-6 z-10">
                  <h1
                    className="text-4xl md:text-5xl font-display font-bold text-white mb-2"
                    style={{ textShadow: "0 2px 20px rgba(0,0,0,0.5)" }}
                  >
                    {destination.name}
                  </h1>
                  <div className="flex flex-wrap items-center gap-4 text-white/80">
                    <span className="flex items-center gap-1.5">
                      <MapPin className="h-4 w-4" />
                      {destination.region} Region
                    </span>
                    <span className="flex items-center gap-1.5">
                      <Clock className="h-4 w-4" />
                      {destination.minDuration}-{destination.maxDuration} days
                    </span>
                    <span className="flex items-center gap-1.5">
                      <TrendingUp className="h-4 w-4" />
                      {destination.elevation?.toLocaleString()}m
                    </span>
                    <span className="px-2 py-0.5 rounded bg-white/10 text-xs capitalize">
                      {destination.tripType}
                    </span>
                  </div>
                  <p className="text-white/70 mt-2 max-w-2xl text-sm md:text-base">
                    {destination.description}
                  </p>
                </div>
              </ImageCarousel>
            </div>

            {/* ─── Summary Cards Grid ─── */}
            <div className="grid grid-cols-1 md:grid-cols-3 gap-6 mb-10 print-section">
              <Card
                className="glass-effect-light border-white/5 hover:border-primary/30 transition-all duration-300 cursor-pointer group animate-fade-in"
                onClick={() => openDialog("itinerary")}
              >
                <CardHeader className="pb-3">
                  <div className="flex items-center justify-between">
                    <div className="h-11 w-11 rounded-lg bg-accent/10 flex items-center justify-center">
                      <Calendar className="h-5 w-5 text-accent" />
                    </div>
                    <Eye className="h-4 w-4 text-muted-foreground group-hover:text-primary transition-colors no-print" />
                  </div>
                  <CardTitle className="text-xl mt-3">
                    Day-by-Day Itinerary
                  </CardTitle>
                </CardHeader>
                <CardContent className="space-y-3">
                  <div className="flex items-center justify-between text-sm">
                    <span className="text-muted-foreground">Total Days</span>
                    <span className="font-semibold">
                      {itinerary.days.length} days
                    </span>
                  </div>
                  {itinerary.totalDistance && (
                    <div className="flex items-center justify-between text-sm">
                      <span className="text-muted-foreground">
                        Total Distance
                      </span>
                      <span className="font-semibold">
                        {itinerary.totalDistance}
                      </span>
                    </div>
                  )}
                  {itinerary.maxElevation && (
                    <div className="flex items-center justify-between text-sm">
                      <span className="text-muted-foreground">
                        Max Elevation
                      </span>
                      <span className="font-semibold">
                        {itinerary.maxElevation}
                      </span>
                    </div>
                  )}
                  <div className="pt-3 border-t border-white/10 space-y-2">
                    {itinerary.days.slice(0, 3).map((day) => (
                      <div key={day.day} className="flex items-center gap-3">
                        <div className="h-7 w-7 rounded-full bg-primary/20 text-primary text-xs font-bold flex items-center justify-center flex-shrink-0">
                          {day.day}
                        </div>
                        <span className="text-sm text-muted-foreground truncate">
                          {day.title}
                        </span>
                      </div>
                    ))}
                    {itinerary.days.length > 3 && (
                      <p className="text-xs text-primary font-medium no-print">
                        + {itinerary.days.length - 3} more days → Click to view
                        all
                      </p>
                    )}
                  </div>
                </CardContent>
              </Card>

              <Card
                className="glass-effect-light border-white/5 hover:border-secondary/30 transition-all duration-300 cursor-pointer group animate-fade-in"
                style={{ animationDelay: "100ms" }}
                onClick={() => openDialog("budget")}
              >
                <CardHeader className="pb-3">
                  <div className="flex items-center justify-between">
                    <div className="h-11 w-11 rounded-lg bg-primary/10 flex items-center justify-center">
                      <Wallet className="h-5 w-5 text-primary" />
                    </div>
                    <Eye className="h-4 w-4 text-muted-foreground group-hover:text-primary transition-colors no-print" />
                  </div>
                  <CardTitle className="text-xl mt-3">Budget Summary</CardTitle>
                </CardHeader>
                <CardContent className="space-y-3">
                  <div className="text-3xl font-display font-bold text-primary">
                    {formatCurrency(costBreakdown.total)}
                  </div>
                  {formData.budget && (
                    <>
                      <div className="w-full h-2 bg-white/10 rounded-full overflow-hidden">
                        <div
                          className={`h-full rounded-full transition-all ${budgetUsed > 100 ? "bg-red-500" : budgetUsed > 90 ? "bg-yellow-500" : "bg-primary"}`}
                          style={{ width: `${Math.min(budgetUsed, 100)}%` }}
                        />
                      </div>
                      <p className="text-xs text-muted-foreground">
                        {budgetUsed}% of {formatCurrency(formData.budget)}{" "}
                        budget
                      </p>
                    </>
                  )}
                  <div className="pt-3 border-t border-white/10 space-y-2">
                    {[...costItems]
                      .sort((a, b) => b.amount - a.amount)
                      .slice(0, 3)
                      .map((item) => (
                        <div
                          key={item.label}
                          className="flex items-center justify-between text-sm"
                        >
                          <span className="text-muted-foreground">
                            {item.label}
                          </span>
                          <span className="font-semibold">
                            {formatCurrency(item.amount)}
                          </span>
                        </div>
                      ))}
                    <p className="text-xs text-primary font-medium no-print">
                      Click for full breakdown →
                    </p>
                  </div>
                </CardContent>
              </Card>

              <Card
                className="glass-effect-light border-white/5 hover:border-accent/30 transition-all duration-300 cursor-pointer group animate-fade-in"
                style={{ animationDelay: "200ms" }}
                onClick={() => openDialog("overview")}
              >
                <CardHeader className="pb-3">
                  <div className="flex items-center justify-between">
                    <div className="h-11 w-11 rounded-lg bg-secondary/10 flex items-center justify-center">
                      <Star className="h-5 w-5 text-secondary" />
                    </div>
                    <Eye className="h-4 w-4 text-muted-foreground group-hover:text-primary transition-colors no-print" />
                  </div>
                  <CardTitle className="text-xl mt-3">
                    Trip Highlights
                  </CardTitle>
                </CardHeader>
                <CardContent className="space-y-3">
                  <div className="flex flex-wrap gap-1.5">
                    {destination.highlights?.slice(0, 4).map((h, i) => (
                      <span
                        key={i}
                        className="px-2 py-1 rounded-full bg-primary/10 border border-primary/20 text-primary text-xs"
                      >
                        {h}
                      </span>
                    ))}
                  </div>
                  <div className="flex items-center gap-2">
                    <Calendar className="h-3.5 w-3.5 text-accent" />
                    <span className="text-xs text-muted-foreground">Best:</span>
                    {destination.bestSeasons?.map((s) => (
                      <span
                        key={s}
                        className="px-2 py-0.5 rounded bg-accent/10 text-accent text-xs capitalize"
                      >
                        {s}
                      </span>
                    ))}
                  </div>
                  <div className="pt-3 border-t border-white/10 space-y-2">
                    {recommendations?.slice(0, 2).map((rec, i) => (
                      <div key={i} className="flex items-start gap-2 text-sm">
                        <CheckCircle className="h-3.5 w-3.5 text-emerald-400 mt-0.5 flex-shrink-0" />
                        <span className="text-muted-foreground text-xs line-clamp-2">
                          {rec}
                        </span>
                      </div>
                    ))}
                    <p className="text-xs text-primary font-medium no-print">
                      Click for all details →
                    </p>
                  </div>
                </CardContent>
              </Card>
            </div>

            {/* ─── Warnings ─── */}
            {warnings && warnings.filter(Boolean).length > 0 && (
              <div className="mb-10 p-5 rounded-xl glass-effect border border-amber-500/20 bg-amber-500/5 animate-fade-in print-section">
                <div className="flex items-center gap-2 mb-3">
                  <AlertTriangle className="h-5 w-5 text-amber-400" />
                  <h3 className="font-semibold text-amber-300">
                    Important Notes
                  </h3>
                </div>
                <div className="grid grid-cols-1 md:grid-cols-2 gap-2">
                  {warnings.filter(Boolean).map((w, i) => (
                    <div key={i} className="flex items-start gap-2">
                      <span className="h-1.5 w-1.5 rounded-full bg-amber-400 mt-1.5 flex-shrink-0" />
                      <span className="text-sm text-amber-200/80">{w}</span>
                    </div>
                  ))}
                </div>
              </div>
            )}

            {/* ─── Timeline ─── */}
            <div className="mb-10 animate-fade-in no-print">
              <div className="flex items-center justify-between mb-6">
                <h2 className="text-2xl font-display font-bold">
                  Itinerary Timeline
                </h2>
                <Button
                  variant="outline"
                  size="sm"
                  onClick={() => openDialog("itinerary")}
                  className="gap-2"
                >
                  <Eye className="h-4 w-4" />
                  View Full Details
                </Button>
              </div>
              <div className="relative">
                <div className="flex gap-3 overflow-x-auto pb-4 snap-x snap-mandatory scrollbar-thin">
                  {itinerary.days.map((day) => (
                    <div
                      key={day.day}
                      className="flex-shrink-0 w-56 snap-start cursor-pointer group/card"
                      onClick={() => {
                        setExpandedDay(day.day);
                        openDialog("itinerary");
                      }}
                    >
                      <div className="rounded-xl border border-white/10 bg-white/5 hover:bg-white/10 hover:border-primary/30 transition-all h-full overflow-hidden">
                        {(day.images?.[0] || day.imageUrl) && (
                          <div className="relative h-28 overflow-hidden">
                            <img
                              src={
                                day.images?.[0] ||
                                day.imageUrl ||
                                "/assets/trek.jpg"
                              }
                              alt={day.location}
                              className="absolute inset-0 w-full h-full object-cover group-hover/card:scale-105 transition-transform duration-500"
                              onError={(e) => {
                                (e.target as HTMLImageElement).src =
                                  "/assets/trek.jpg";
                              }}
                              loading="lazy"
                            />
                            <div className="absolute inset-0 bg-gradient-to-t from-black/60 to-transparent" />
                            <div className="absolute bottom-1.5 left-2 flex items-center gap-1 text-[10px] text-white/70">
                              <MapPin className="h-2.5 w-2.5" />
                              {day.location}
                            </div>
                          </div>
                        )}
                        <div className="p-3">
                          <div className="flex items-center gap-2 mb-1.5">
                            <div className="h-7 w-7 rounded-full bg-primary text-primary-foreground flex items-center justify-center text-xs font-bold">
                              {day.day}
                            </div>
                            <div className="text-[10px] text-muted-foreground">
                              Day {day.day}
                            </div>
                          </div>
                          <h4 className="font-semibold text-sm mb-1 line-clamp-2">
                            {day.title}
                          </h4>
                          {day.elevation && (
                            <div className="text-xs text-accent flex items-center gap-1">
                              <TrendingUp className="h-3 w-3" />
                              {day.elevation}
                            </div>
                          )}
                        </div>
                      </div>
                    </div>
                  ))}
                </div>
              </div>
            </div>

            {/* ─── Print-only: Full itinerary ─── */}
            <div className="hidden print:block">
              <h2 className="text-2xl font-bold mb-4">Full Itinerary</h2>
              {itinerary.days.map((day) => (
                <div
                  key={day.day}
                  className="mb-4 p-4 border border-gray-200 rounded-lg print-section"
                >
                  <div className="flex items-center gap-3 mb-2">
                    <strong>Day {day.day}:</strong> {day.title}
                  </div>
                  <div className="text-sm text-gray-600 mb-2">
                    📍 {day.location}
                    {day.elevation && <> | ⬆ {day.elevation}</>}
                    {day.distance && <> | 🚶 {day.distance}</>}
                    {day.duration && <> | ⏱ {day.duration}</>}
                  </div>
                  {day.activities && day.activities.length > 0 && (
                    <div className="text-sm mb-2">
                      <strong>Activities:</strong> {day.activities.join(", ")}
                    </div>
                  )}
                  <div className="text-sm text-gray-500">
                    🏨 {day.accommodation} | 🍽 {day.meals}
                  </div>
                </div>
              ))}

              <h2 className="text-2xl font-bold mb-4 mt-8">Cost Breakdown</h2>
              <table className="w-full text-sm border-collapse">
                <tbody>
                  {costItems.map((item) => (
                    <tr key={item.label} className="border-b border-gray-200">
                      <td className="py-2">{item.label}</td>
                      <td className="py-2 text-right font-semibold">
                        {formatCurrency(item.amount)}
                      </td>
                    </tr>
                  ))}
                  <tr className="font-bold text-lg">
                    <td className="py-3">Total</td>
                    <td className="py-3 text-right">
                      {formatCurrency(costBreakdown.total)}
                    </td>
                  </tr>
                </tbody>
              </table>

              {recommendations && recommendations.length > 0 && (
                <>
                  <h2 className="text-2xl font-bold mb-4 mt-8">
                    Recommendations
                  </h2>
                  <ul className="list-disc pl-5 text-sm space-y-1">
                    {recommendations.map((rec, i) => (
                      <li key={i}>{rec}</li>
                    ))}
                  </ul>
                </>
              )}

              <div className="mt-8 pt-4 border-t text-xs text-gray-400 text-center">
                Generated by TrekNepal — {new Date().toLocaleDateString()}
              </div>
            </div>

            {/* ─── Actions ─── */}
            <div className="flex flex-col sm:flex-row gap-4 justify-center items-center pt-8 border-t border-white/10 no-print">
              <Button size="lg" onClick={handleNewPlan} className="gap-2">
                <RefreshCw className="h-5 w-5" />
                Plan Another Trip
              </Button>
              <Button
                size="lg"
                variant="outline"
                onClick={handleDownload}
                className="gap-2"
              >
                <Download className="h-5 w-5" />
                Download as PDF
              </Button>
              <Button
                size="lg"
                variant="outline"
                onClick={handleShare}
                className="gap-2"
              >
                <Share2 className="h-5 w-5" />
                Share Plan
              </Button>
            </div>
          </div>
        </div>

        {/* ─────────── DETAIL DIALOG ─────────── */}
        {dialogOpen && (
          <div className="fixed inset-0 z-[100] no-print">
            <div
              className="absolute inset-0 bg-black/60 backdrop-blur-sm"
              onClick={() => setDialogOpen(false)}
            />

            <div className="absolute inset-4 md:inset-8 lg:inset-12 bg-[hsl(200,20%,10%)] rounded-2xl border border-white/10 flex flex-col overflow-hidden shadow-2xl animate-fade-in">
              <div className="flex items-center justify-between px-6 py-4 border-b border-white/10 flex-shrink-0">
                <div className="flex items-center gap-4">
                  <Mountain className="h-6 w-6 text-primary" />
                  <h2 className="text-xl font-display font-bold">
                    {destination.name}
                  </h2>
                </div>
                <div className="flex items-center gap-2">
                  <div className="hidden sm:flex bg-white/5 rounded-lg p-1 mr-4">
                    {[
                      {
                        key: "overview" as DialogTab,
                        label: "Overview",
                        icon: Star,
                      },
                      {
                        key: "itinerary" as DialogTab,
                        label: "Itinerary",
                        icon: Calendar,
                      },
                      {
                        key: "budget" as DialogTab,
                        label: "Budget",
                        icon: Wallet,
                      },
                    ].map((tab) => (
                      <button
                        key={tab.key}
                        onClick={() => setActiveTab(tab.key)}
                        className={`flex items-center gap-2 px-4 py-2 rounded-md text-sm font-medium transition-all ${activeTab === tab.key ? "bg-primary/20 text-primary" : "text-muted-foreground hover:text-foreground"}`}
                      >
                        <tab.icon className="h-4 w-4" />
                        {tab.label}
                      </button>
                    ))}
                  </div>
                  <button
                    onClick={() => setDialogOpen(false)}
                    className="h-10 w-10 rounded-lg bg-white/5 hover:bg-white/10 flex items-center justify-center transition-colors"
                  >
                    <X className="h-5 w-5" />
                  </button>
                </div>
              </div>

              <div className="sm:hidden flex border-b border-white/10 flex-shrink-0">
                {[
                  { key: "overview" as DialogTab, label: "Overview" },
                  { key: "itinerary" as DialogTab, label: "Itinerary" },
                  { key: "budget" as DialogTab, label: "Budget" },
                ].map((tab) => (
                  <button
                    key={tab.key}
                    onClick={() => setActiveTab(tab.key)}
                    className={`flex-1 py-3 text-sm font-medium transition-all border-b-2 ${activeTab === tab.key ? "border-primary text-primary" : "border-transparent text-muted-foreground"}`}
                  >
                    {tab.label}
                  </button>
                ))}
              </div>

              <div className="flex-1 overflow-y-auto p-6">
                {activeTab === "overview" && (
                  <div className="max-w-4xl mx-auto space-y-8">
                    <div className="rounded-xl overflow-hidden">
                      <ImageCarousel
                        images={heroImages}
                        alt={destination.name}
                        className="h-56 md:h-72"
                        showArrows={true}
                        showDots={true}
                        autoPlay={4000}
                        gradient={false}
                      />
                    </div>
                    <div className="grid grid-cols-2 md:grid-cols-4 gap-4">
                      <div className="p-4 rounded-xl bg-white/5 border border-white/10 text-center">
                        <TrendingUp className="h-5 w-5 text-primary mx-auto mb-2" />
                        <div className="text-2xl font-bold">
                          {destination.elevation?.toLocaleString()}m
                        </div>
                        <div className="text-xs text-muted-foreground">
                          Max Elevation
                        </div>
                      </div>
                      <div className="p-4 rounded-xl bg-white/5 border border-white/10 text-center">
                        <Clock className="h-5 w-5 text-secondary mx-auto mb-2" />
                        <div className="text-2xl font-bold">
                          {itinerary.days.length}
                        </div>
                        <div className="text-xs text-muted-foreground">
                          Days
                        </div>
                      </div>
                      <div className="p-4 rounded-xl bg-white/5 border border-white/10 text-center">
                        <Wallet className="h-5 w-5 text-accent mx-auto mb-2" />
                        <div className="text-2xl font-bold">
                          {formatCurrency(costBreakdown.total)}
                        </div>
                        <div className="text-xs text-muted-foreground">
                          Total Cost
                        </div>
                      </div>
                      <div className="p-4 rounded-xl bg-white/5 border border-white/10 text-center">
                        <Sparkles className="h-5 w-5 text-yellow-400 mx-auto mb-2" />
                        <div className="text-2xl font-bold">{matchScore}%</div>
                        <div className="text-xs text-muted-foreground">
                          Match Score
                        </div>
                      </div>
                    </div>
                    <div>
                      <h3 className="text-lg font-display font-semibold mb-3">
                        About This Trek
                      </h3>
                      <p className="text-muted-foreground leading-relaxed">
                        {destination.description}
                      </p>
                    </div>
                    {destination.highlights &&
                      destination.highlights.length > 0 && (
                        <div>
                          <h3 className="text-lg font-display font-semibold mb-3 flex items-center gap-2">
                            <Sparkles className="h-4 w-4 text-primary" />
                            Highlights
                          </h3>
                          <div className="grid grid-cols-1 md:grid-cols-2 gap-3">
                            {destination.highlights.map((h, i) => (
                              <div
                                key={i}
                                className="flex items-center gap-3 p-3 rounded-lg bg-white/5 border border-white/10"
                              >
                                <div className="h-8 w-8 rounded-full bg-primary/10 flex items-center justify-center flex-shrink-0">
                                  <CheckCircle className="h-4 w-4 text-primary" />
                                </div>
                                <span className="text-sm">{h}</span>
                              </div>
                            ))}
                          </div>
                        </div>
                      )}
                    <div>
                      <h3 className="text-lg font-display font-semibold mb-3 flex items-center gap-2">
                        <Calendar className="h-4 w-4 text-accent" />
                        Best Seasons
                      </h3>
                      <div className="flex flex-wrap gap-2">
                        {destination.bestSeasons?.map((s) => (
                          <span
                            key={s}
                            className="px-4 py-2 rounded-lg bg-accent/10 border border-accent/20 text-accent capitalize font-medium"
                          >
                            {s}
                          </span>
                        ))}
                      </div>
                    </div>
                    {recommendations && recommendations.length > 0 && (
                      <div>
                        <h3 className="text-lg font-display font-semibold mb-3 flex items-center gap-2">
                          <Shield className="h-4 w-4 text-emerald-400" />
                          Recommendations
                        </h3>
                        <div className="space-y-2">
                          {recommendations.map((rec, i) => (
                            <div
                              key={i}
                              className="flex items-start gap-3 p-3 rounded-lg bg-emerald-500/5 border border-emerald-500/10"
                            >
                              <CheckCircle className="h-4 w-4 text-emerald-400 mt-0.5 flex-shrink-0" />
                              <span className="text-sm text-muted-foreground">
                                {rec}
                              </span>
                            </div>
                          ))}
                        </div>
                      </div>
                    )}
                    {warnings && warnings.filter(Boolean).length > 0 && (
                      <div>
                        <h3 className="text-lg font-display font-semibold mb-3 flex items-center gap-2">
                          <AlertTriangle className="h-4 w-4 text-amber-400" />
                          Important Notes
                        </h3>
                        <div className="space-y-2">
                          {warnings.filter(Boolean).map((w, i) => (
                            <div
                              key={i}
                              className="flex items-start gap-3 p-3 rounded-lg bg-amber-500/5 border border-amber-500/10"
                            >
                              <AlertTriangle className="h-4 w-4 text-amber-400 mt-0.5 flex-shrink-0" />
                              <span className="text-sm text-amber-200/80">
                                {w}
                              </span>
                            </div>
                          ))}
                        </div>
                      </div>
                    )}
                  </div>
                )}

                {activeTab === "itinerary" && (
                  <div className="max-w-4xl mx-auto space-y-4">
                    <div className="flex flex-wrap gap-4 mb-6 p-4 rounded-xl bg-white/5 border border-white/10">
                      <div className="flex items-center gap-2 text-sm">
                        <Footprints className="h-4 w-4 text-primary" />
                        <span className="text-muted-foreground">
                          Total Distance:
                        </span>
                        <span className="font-semibold">
                          {itinerary.totalDistance || "N/A"}
                        </span>
                      </div>
                      <div className="flex items-center gap-2 text-sm">
                        <TrendingUp className="h-4 w-4 text-secondary" />
                        <span className="text-muted-foreground">
                          Max Elevation:
                        </span>
                        <span className="font-semibold">
                          {itinerary.maxElevation || "N/A"}
                        </span>
                      </div>
                      <div className="flex items-center gap-2 text-sm">
                        <Calendar className="h-4 w-4 text-accent" />
                        <span className="text-muted-foreground">
                          Total Days:
                        </span>
                        <span className="font-semibold">
                          {itinerary.days.length}
                        </span>
                      </div>
                    </div>
                    <div className="flex justify-end">
                      <button
                        onClick={() =>
                          setExpandedDay(expandedDay === -1 ? null : -1)
                        }
                        className="text-xs text-primary hover:underline"
                      >
                        {expandedDay === -1 ? "Collapse all" : "Expand all"}
                      </button>
                    </div>

                    {itinerary.days.map((day) => {
                      const isOpen =
                        expandedDay === day.day || expandedDay === -1;
                      const dayImages =
                        day.images && day.images.length > 0
                          ? day.images
                          : day.imageUrl
                            ? [day.imageUrl]
                            : [];
                      return (
                        <div
                          key={day.day}
                          className="rounded-xl border border-white/10 overflow-hidden"
                        >
                          <button
                            onClick={() =>
                              setExpandedDay(
                                isOpen && expandedDay !== -1 ? null : day.day,
                              )
                            }
                            className="w-full flex items-center gap-4 p-4 hover:bg-white/5 transition-colors text-left"
                          >
                            <div className="h-10 w-10 rounded-full bg-primary text-primary-foreground flex items-center justify-center font-bold text-sm flex-shrink-0">
                              {day.day}
                            </div>
                            <div className="flex-1 min-w-0">
                              <h4 className="font-semibold truncate">
                                {day.title}
                              </h4>
                              <div className="flex items-center gap-3 text-xs text-muted-foreground mt-0.5">
                                <span className="flex items-center gap-1">
                                  <MapPin className="h-3 w-3" />
                                  {day.location}
                                </span>
                                {day.elevation && (
                                  <span className="flex items-center gap-1">
                                    <TrendingUp className="h-3 w-3" />
                                    {day.elevation}
                                  </span>
                                )}
                                {day.distance && (
                                  <span className="flex items-center gap-1">
                                    <Footprints className="h-3 w-3" />
                                    {day.distance}
                                  </span>
                                )}
                              </div>
                            </div>
                            {isOpen ? (
                              <ChevronUp className="h-5 w-5 text-muted-foreground" />
                            ) : (
                              <ChevronDown className="h-5 w-5 text-muted-foreground" />
                            )}
                          </button>
                          {isOpen && (
                            <div className="border-t border-white/10 bg-white/[0.02]">
                              {dayImages.length > 0 && (
                                <ImageCarousel
                                  images={dayImages}
                                  alt={`Day ${day.day} - ${day.location}`}
                                  className="h-48 md:h-56"
                                  showArrows={true}
                                  showDots={dayImages.length > 1}
                                  autoPlay={0}
                                  gradient={true}
                                >
                                  <div className="absolute bottom-3 left-4 flex items-center gap-1.5 text-sm font-medium text-white z-10">
                                    <MapPin className="h-3.5 w-3.5" />
                                    {day.location}
                                  </div>
                                </ImageCarousel>
                              )}
                              <div className="p-5 space-y-4">
                                <div className="flex flex-wrap gap-4">
                                  {day.duration && (
                                    <div className="flex items-center gap-2 text-sm px-3 py-1.5 rounded-lg bg-white/5">
                                      <Clock className="h-4 w-4 text-secondary" />
                                      <span className="text-muted-foreground">
                                        Duration:
                                      </span>
                                      <span className="font-medium">
                                        {day.duration}
                                      </span>
                                    </div>
                                  )}
                                  {day.distance && (
                                    <div className="flex items-center gap-2 text-sm px-3 py-1.5 rounded-lg bg-white/5">
                                      <Footprints className="h-4 w-4 text-primary" />
                                      <span className="text-muted-foreground">
                                        Distance:
                                      </span>
                                      <span className="font-medium">
                                        {day.distance}
                                      </span>
                                    </div>
                                  )}
                                  {day.elevation && (
                                    <div className="flex items-center gap-2 text-sm px-3 py-1.5 rounded-lg bg-white/5">
                                      <TrendingUp className="h-4 w-4 text-accent" />
                                      <span className="text-muted-foreground">
                                        Elevation:
                                      </span>
                                      <span className="font-medium">
                                        {day.elevation}
                                      </span>
                                    </div>
                                  )}
                                </div>
                                {day.activities &&
                                  day.activities.length > 0 && (
                                    <div>
                                      <h5 className="text-sm font-semibold mb-2 flex items-center gap-2">
                                        <CheckCircle className="h-4 w-4 text-primary" />
                                        Activities
                                      </h5>
                                      <ul className="space-y-1.5 ml-6">
                                        {day.activities.map((a, i) => (
                                          <li
                                            key={i}
                                            className="flex items-start gap-2 text-sm text-muted-foreground"
                                          >
                                            <span className="h-1.5 w-1.5 rounded-full bg-primary/50 mt-1.5 flex-shrink-0" />
                                            {a}
                                          </li>
                                        ))}
                                      </ul>
                                    </div>
                                  )}
                                {day.highlights &&
                                  day.highlights.length > 0 && (
                                    <div>
                                      <h5 className="text-sm font-semibold mb-2">
                                        Highlights
                                      </h5>
                                      <div className="flex flex-wrap gap-2">
                                        {day.highlights.map((h, i) => (
                                          <span
                                            key={i}
                                            className="px-2 py-1 rounded bg-accent/10 border border-accent/20 text-accent text-xs"
                                          >
                                            {h}
                                          </span>
                                        ))}
                                      </div>
                                    </div>
                                  )}
                                <div className="grid grid-cols-1 md:grid-cols-2 gap-3 pt-3 border-t border-white/10">
                                  <div className="flex items-center gap-2 text-sm">
                                    <Home className="h-4 w-4 text-green-400" />
                                    <span className="text-muted-foreground">
                                      Stay:
                                    </span>
                                    <span className="font-medium">
                                      {day.accommodation}
                                    </span>
                                  </div>
                                  <div className="flex items-center gap-2 text-sm">
                                    <Utensils className="h-4 w-4 text-orange-400" />
                                    <span className="text-muted-foreground">
                                      Meals:
                                    </span>
                                    <span className="font-medium">
                                      {day.meals}
                                    </span>
                                  </div>
                                </div>
                              </div>
                            </div>
                          )}
                        </div>
                      );
                    })}
                    <div className="flex items-center gap-4 pt-4">
                      <div className="h-10 w-10 rounded-full bg-secondary text-secondary-foreground flex items-center justify-center">
                        <CheckCircle className="h-5 w-5" />
                      </div>
                      <span className="text-lg font-display font-semibold">
                        Trip Complete!
                      </span>
                    </div>
                  </div>
                )}

                {activeTab === "budget" && (
                  <div className="max-w-4xl mx-auto space-y-8">
                    <div className="p-6 rounded-xl bg-gradient-to-br from-primary/20 to-secondary/20 border border-primary/20">
                      <div className="flex items-center justify-between mb-2">
                        <span className="text-sm text-muted-foreground">
                          Total Estimated Cost
                        </span>
                        {formData.budget && (
                          <span className="text-xs text-muted-foreground">
                            {budgetUsed}% of budget
                          </span>
                        )}
                      </div>
                      <div className="text-4xl font-display font-bold text-primary mb-3">
                        {formatCurrency(costBreakdown.total)}
                      </div>
                      {formData.budget && (
                        <>
                          <div className="w-full h-2.5 bg-black/20 rounded-full overflow-hidden mb-2">
                            <div
                              className={`h-full rounded-full transition-all ${budgetUsed > 100 ? "bg-red-500" : budgetUsed > 90 ? "bg-yellow-500" : "bg-primary"}`}
                              style={{ width: `${Math.min(budgetUsed, 100)}%` }}
                            />
                          </div>
                          <div
                            className={`inline-flex items-center gap-2 px-3 py-1.5 rounded-lg text-sm font-medium ${budgetUsed > 100 ? "bg-red-500/10 text-red-400" : budgetUsed > 90 ? "bg-yellow-500/10 text-yellow-400" : "bg-green-500/10 text-green-400"}`}
                          >
                            <TrendingUp className="h-4 w-4" />
                            {budgetUsed > 100
                              ? `Over budget by ${formatCurrency(costBreakdown.total - formData.budget!)}`
                              : `${formatCurrency(formData.budget! - costBreakdown.total)} remaining`}
                          </div>
                        </>
                      )}
                    </div>
                    <div className="space-y-4">
                      <h3 className="text-lg font-display font-semibold">
                        Cost Breakdown
                      </h3>
                      {costItems.map((item) => {
                        const pct = calculatePercentage(
                          item.amount,
                          costBreakdown.total,
                        );
                        const Icon = item.icon;
                        return (
                          <div
                            key={item.label}
                            className="p-4 rounded-xl bg-white/5 border border-white/10"
                          >
                            <div className="flex items-center justify-between mb-3">
                              <div className="flex items-center gap-3">
                                <div className="h-10 w-10 rounded-lg bg-white/5 flex items-center justify-center">
                                  <Icon className={`h-5 w-5 ${item.color}`} />
                                </div>
                                <div>
                                  <div className="font-medium">
                                    {item.label}
                                  </div>
                                  <div className="text-xs text-muted-foreground">
                                    {pct}% of total
                                  </div>
                                </div>
                              </div>
                              <div className="text-xl font-semibold">
                                {formatCurrency(item.amount)}
                              </div>
                            </div>
                            <div className="w-full h-1.5 bg-white/5 rounded-full overflow-hidden">
                              <div
                                className={`h-full ${item.color.replace("text-", "bg-")} rounded-full`}
                                style={{ width: `${pct}%` }}
                              />
                            </div>
                          </div>
                        );
                      })}
                    </div>
                    <div className="p-4 rounded-xl bg-white/5 border border-white/10">
                      <p className="text-xs text-muted-foreground">
                        * Costs are estimates and may vary based on season,
                        availability, and personal choices. Actual expenses
                        might differ by ±10-15%.
                      </p>
                    </div>
                  </div>
                )}
              </div>
            </div>
          </div>
        )}
      </div>
    </>
  );
}
