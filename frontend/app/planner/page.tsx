"use client";

import { useRouter } from "next/navigation";
import Link from "next/link";
import { Mountain, ArrowLeft } from "lucide-react";
import { Button } from "../../components/ui/button";
import { PlannerForm } from "@/components/PlannerForm";
import { usePlanner } from "@/hooks/usePlanner";
import { useEffect } from "react";

export default function PlannerPage() {
  const router = useRouter();
  const { formData, updateFormData, submitPlan, loading, error, step } =
    usePlanner();

  // Only redirect to results when step transitions to "result" after a NEW submission
  // (step is "result" when submitPlan succeeds, not after goBack which sets step to "form")
  useEffect(() => {
    if (step === "result") {
      router.push("/result");
    }
  }, [step, router]);

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
              <span className="text-xl font-display font-bold">
                Smart Tour&Trek Planner
              </span>
            </Link>
            <Link href="/">
              <Button variant="ghost" size="sm" className="gap-2">
                <ArrowLeft className="h-4 w-4" />
                Back to Home
              </Button>
            </Link>
          </div>
        </div>
      </nav>

      {/* Main Content */}
      <div className="container mx-auto px-4 pt-32 pb-16 relative z-10">
        <div className="max-w-5xl mx-auto">
          {/* Header */}
          <div className="text-center mb-12 animate-fade-in">
            <div className="inline-block mb-4">
              <div className="inline-flex items-center gap-2 px-4 py-2 rounded-full glass-effect border border-primary/20">
                <span className="text-sm text-primary">Step 1 of 2</span>
              </div>
            </div>
            <h1 className="text-5xl md:text-6xl font-display font-bold mb-4">
              Plan Your{" "}
              <span className="text-transparent bg-clip-text bg-gradient-to-r from-primary via-emerald-400 to-accent">
                Adventure
              </span>
            </h1>
            <p className="text-xl text-muted-foreground max-w-2xl mx-auto">
              Tell us about your preferences and we&apos;ll create a
              personalized itinerary with budget estimates
            </p>
          </div>

          {/* Form Card */}
          <div className="animate-fade-in-delay">
            <PlannerForm
              formData={formData}
              onUpdate={updateFormData}
              onSubmit={submitPlan}
              loading={loading}
              error={error}
            />
          </div>

          {loading && (
            <div className="fixed inset-0 bg-background/80 backdrop-blur-sm z-50 flex items-center justify-center">
              <div className="glass-effect p-8 rounded-lg max-w-md text-center space-y-4">
                <div className="h-16 w-16 border-4 border-primary/30 border-t-primary rounded-full animate-spin mx-auto" />
                <h3 className="text-2xl font-display font-bold">
                  Generating Your Plan
                </h3>
                <p className="text-muted-foreground">
                  Our AI is analyzing your preferences and finding the perfect
                  destination...
                </p>
              </div>
            </div>
          )}
        </div>
      </div>
    </div>
  );
}
