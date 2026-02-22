"use client";


//this is the component called budget summary that shows a breakdown of costs
import { CostBreakdown } from "@/lib/types";
import {
  Card,
  CardContent,
  CardDescription,
  CardHeader,
  CardTitle,
} from "../components/ui/card";
import { formatCurrency, calculatePercentage } from "@/lib/utils";
import {
  Bus,
  Home,
  Utensils,
  FileText,
  UserCheck,
  Backpack,
  MoreHorizontal,
  TrendingUp,
  Wallet,
} from "lucide-react";

interface BudgetSummaryProps {
  costBreakdown: CostBreakdown;
  userBudget?: number;
}

export function BudgetSummary({
  costBreakdown,
  userBudget,
}: BudgetSummaryProps) {
  const budgetUtilization = userBudget
    ? calculatePercentage(costBreakdown.total, userBudget)
    : 100;

  const costItems = [
    {
      label: "Transportation",
      amount: costBreakdown.transportation,
      icon: Bus,
      color: "text-blue-500",
      bgColor: "bg-blue-500/10",
    },
    {
      label: "Accommodation",
      amount: costBreakdown.accommodation,
      icon: Home,
      color: "text-green-500",
      bgColor: "bg-green-500/10",
    },
    {
      label: "Food & Drinks",
      amount: costBreakdown.food,
      icon: Utensils,
      color: "text-orange-500",
      bgColor: "bg-orange-500/10",
    },
    {
      label: "Permits & Fees",
      amount: costBreakdown.permits,
      icon: FileText,
      color: "text-purple-500",
      bgColor: "bg-purple-500/10",
    },
    {
      label: "Guide & Porter",
      amount: costBreakdown.guide,
      icon: UserCheck,
      color: "text-cyan-500",
      bgColor: "bg-cyan-500/10",
    },
    {
      label: "Equipment",
      amount: costBreakdown.equipment,
      icon: Backpack,
      color: "text-pink-500",
      bgColor: "bg-pink-500/10",
    },
    {
      label: "Miscellaneous",
      amount: costBreakdown.miscellaneous,
      icon: MoreHorizontal,
      color: "text-gray-500",
      bgColor: "bg-gray-500/10",
    },
  ];

  return (
    <Card className="glass-effect border-white/5 elevation-shadow">
      <CardHeader>
        <div className="flex items-start justify-between">
          <div>
            <CardTitle className="text-3xl mb-2">Budget Summary</CardTitle>
            <CardDescription>
              Detailed cost breakdown for your trip
            </CardDescription>
          </div>
          <div className="h-12 w-12 rounded-lg bg-primary/10 flex items-center justify-center">
            <Wallet className="h-6 w-6 text-primary" />
          </div>
        </div>
      </CardHeader>

      <CardContent className="space-y-6">
        {/* Total Cost */}
        <div className="p-6 rounded-lg bg-gradient-to-br from-primary/20 to-secondary/20 border border-primary/20">
          <div className="flex items-center justify-between mb-2">
            <span className="text-sm text-muted-foreground">
              Total Estimated Cost
            </span>
            {userBudget && (
              <span className="text-xs text-muted-foreground">
                {budgetUtilization}% of budget
              </span>
            )}
          </div>
          <div className="text-4xl font-display font-bold text-primary mb-2">
            {formatCurrency(costBreakdown.total)}
          </div>
          {userBudget && (
            <div className="w-full h-2 bg-black/20 rounded-full overflow-hidden">
              <div
                className={`h-full rounded-full transition-all ${
                  budgetUtilization > 100
                    ? "bg-destructive"
                    : budgetUtilization > 90
                      ? "bg-yellow-500"
                      : "bg-primary"
                }`}
                style={{ width: `${Math.min(budgetUtilization, 100)}%` }}
              />
            </div>
          )}
        </div>

        {/* Budget Status */}
        {userBudget && (
          <div
            className={`p-4 rounded-lg border ${
              budgetUtilization > 100
                ? "bg-destructive/10 border-destructive/20"
                : budgetUtilization > 90
                  ? "bg-yellow-500/10 border-yellow-500/20"
                  : "bg-green-500/10 border-green-500/20"
            }`}
          >
            <div className="flex items-center gap-2 mb-1">
              <TrendingUp
                className={`h-4 w-4 ${
                  budgetUtilization > 100
                    ? "text-destructive"
                    : budgetUtilization > 90
                      ? "text-yellow-500"
                      : "text-green-500"
                }`}
              />
              <span className="text-sm font-semibold">
                {budgetUtilization > 100
                  ? "Over Budget"
                  : budgetUtilization > 90
                    ? "Near Budget Limit"
                    : "Within Budget"}
              </span>
            </div>
            <p className="text-xs text-muted-foreground">
              {budgetUtilization > 100
                ? `Exceeds your budget by ${formatCurrency(costBreakdown.total - userBudget)}`
                : `${formatCurrency(userBudget - costBreakdown.total)} remaining from your budget`}
            </p>
          </div>
        )}

        {/* Cost Breakdown */}
        <div className="space-y-3">
          <h4 className="font-semibold text-lg mb-4">Cost Breakdown</h4>
          {costItems.map((item) => {
            const percentage = calculatePercentage(
              item.amount,
              costBreakdown.total,
            );
            const Icon = item.icon;

            return (
              <div key={item.label} className="group">
                <div className="flex items-center justify-between mb-2">
                  <div className="flex items-center gap-3">
                    <div
                      className={`h-8 w-8 rounded-md ${item.bgColor} flex items-center justify-center`}
                    >
                      <Icon className={`h-4 w-4 ${item.color}`} />
                    </div>
                    <span className="text-sm font-medium">{item.label}</span>
                  </div>
                  <div className="text-right">
                    <div className="font-semibold">
                      {formatCurrency(item.amount)}
                    </div>
                    <div className="text-xs text-muted-foreground">
                      {percentage}%
                    </div>
                  </div>
                </div>
                <div className="w-full h-1.5 bg-white/5 rounded-full overflow-hidden">
                  <div
                    className={`h-full ${item.color.replace("text-", "bg-")} rounded-full transition-all duration-500 group-hover:opacity-80`}
                    style={{ width: `${percentage}%` }}
                  />
                </div>
              </div>
            );
          })}
        </div>

        {/* Notes */}
        <div className="pt-4 border-t border-white/10">
          <p className="text-xs text-muted-foreground">
            * Costs are estimates and may vary based on season, availability,
            and personal choices. Actual expenses might differ by ±10-15%.
          </p>
        </div>
      </CardContent>
    </Card>
  );
}
