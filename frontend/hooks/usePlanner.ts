/* eslint-disable react-hooks/set-state-in-effect */
// frontend/hooks/usePlanner.ts
"use client";

import { useState, useCallback, useEffect } from "react";
import { PlannerFormData, PlannerResponse, PlannerRequest } from "@/lib/types";
import { apiClient, ApiError } from "@/lib/api";
import { ERROR_MESSAGES } from "@/lib/constant";

interface UsePlannerState {
  formData: Partial<PlannerFormData>;
  response: PlannerResponse | null;
  loading: boolean;
  error: string | null;
  step: "form" | "processing" | "result";
}

interface UsePlannerReturn extends UsePlannerState {
  updateFormData: (data: Partial<PlannerFormData>) => void;
  submitPlan: () => Promise<void>;
  reset: () => void;
  goBack: () => void;
  getShareUrl: () => string;
  loadFromShareHash: (hash: string) => boolean;
}

const STORAGE_KEY = "treknepal_plan_response";
const FORM_STORAGE_KEY = "treknepal_form_data";

const initialState: UsePlannerState = {
  formData: {
    groupSize: 2,
    duration: 7,
    budget: 50000,
    nationality: "nepali", 
  },
  response: null,
  loading: false,
  error: null,
  step: "form",
};
function loadStoredResponse(): PlannerResponse | null {
  if (typeof window === "undefined") return null;
  try {
    const stored = sessionStorage.getItem(STORAGE_KEY);
    return stored ? JSON.parse(stored) : null;
  } catch {
    return null;
  }
}

function loadStoredFormData(): Partial<PlannerFormData> | null {
  if (typeof window === "undefined") return null;
  try {
    const stored = sessionStorage.getItem(FORM_STORAGE_KEY);
    return stored ? JSON.parse(stored) : null;
  } catch {
    return null;
  }
}

function encodeShareData(
  response: PlannerResponse,
  formData: Partial<PlannerFormData>,
): string {
  try {
    const data = JSON.stringify({ r: response, f: formData });
    return btoa(encodeURIComponent(data));
  } catch {
    return "";
  }
}

function decodeShareData(
  hash: string,
): { r: PlannerResponse; f: Partial<PlannerFormData> } | null {
  try {
    const json = decodeURIComponent(atob(hash));
    return JSON.parse(json);
  } catch {
    return null;
  }
}

export function usePlanner(): UsePlannerReturn {
  const [state, setState] = useState<UsePlannerState>(initialState);

  useEffect(() => {
    const storedResponse = loadStoredResponse();
    const storedForm = loadStoredFormData();
    if (storedResponse) {
      setState((prev) => ({
        ...prev,
        response: storedResponse,
        formData: storedForm || prev.formData,
        step: "result",
      }));
    } else if (storedForm) {
      setState((prev) => ({
        ...prev,
        formData: storedForm,
      }));
    }
  }, []);

  const updateFormData = useCallback((data: Partial<PlannerFormData>) => {
    setState((prev) => {
      const newFormData = { ...prev.formData, ...data };
      if (typeof window !== "undefined") {
        sessionStorage.setItem(FORM_STORAGE_KEY, JSON.stringify(newFormData));
      }
      return {
        ...prev,
        formData: newFormData,
        error: null,
      };
    });
  }, []);

  const validateFormData = (data: Partial<PlannerFormData>): string | null => {
    if (!data.budget || data.budget < 10000) {
      return "Budget must be at least NPR 10,000";
    }
    if (!data.duration || data.duration < 1 || data.duration > 30) {
      return "Duration must be between 1 and 30 days";
    }
    if (!data.season) {
      return "Please select a season";
    }
    if (!data.difficulty) {
      return "Please select difficulty level";
    }
    if (!data.tripType) {
      return "Please select trip type";
    }
    if (!data.groupSize || data.groupSize < 1) {
      return "Group size must be at least 1";
    }
    return null;
  };

  const submitPlan = useCallback(async () => {
    const validationError = validateFormData(state.formData);
    if (validationError) {
      setState((prev) => ({ ...prev, error: validationError }));
      return;
    }

    setState((prev) => ({
      ...prev,
      loading: true,
      error: null,
      step: "processing",
    }));

    try {
      const request: PlannerRequest = {
        budget: state.formData.budget!,
        duration: state.formData.duration!,
        season: state.formData.season!,
        difficulty: state.formData.difficulty!,
        tripType: state.formData.tripType!,
        groupSize: state.formData.groupSize!,
        startDate: state.formData.startDate,
        nationality: state.formData.nationality || "nepali",
      };

      const response = await apiClient.generatePlan(request);

      if (typeof window !== "undefined") {
        sessionStorage.setItem(STORAGE_KEY, JSON.stringify(response));
        sessionStorage.setItem(
          FORM_STORAGE_KEY,
          JSON.stringify(state.formData),
        );
      }

      setState((prev) => ({
        ...prev,
        response,
        loading: false,
        step: "result",
      }));
    } catch (err) {
      const errorMessage =
        err instanceof ApiError ? err.message : ERROR_MESSAGES.generic;

      setState((prev) => ({
        ...prev,
        error: errorMessage,
        loading: false,
        step: "form",
      }));
    }
  }, [state.formData]);

  const reset = useCallback(() => {
    if (typeof window !== "undefined") {
      sessionStorage.removeItem(STORAGE_KEY);
      sessionStorage.removeItem(FORM_STORAGE_KEY);
    }
    setState(initialState);
  }, []);

  // goBack: clear response but KEEP form data so fields stay filled
  const goBack = useCallback(() => {
    if (typeof window !== "undefined") {
      sessionStorage.removeItem(STORAGE_KEY);
      // Keep FORM_STORAGE_KEY so planner page restores previous selections
    }
    setState((prev) => ({
      ...prev,
      response: null,
      step: "form",
      error: null,
    }));
  }, []);

  const getShareUrl = useCallback((): string => {
    if (!state.response || typeof window === "undefined") return "";
    const hash = encodeShareData(state.response, state.formData);
    return `${window.location.origin}/result?plan=${hash}`;
  }, [state.response, state.formData]);

  const loadFromShareHash = useCallback((hash: string): boolean => {
    const data = decodeShareData(hash);
    if (!data || !data.r) return false;

    if (typeof window !== "undefined") {
      sessionStorage.setItem(STORAGE_KEY, JSON.stringify(data.r));
      if (data.f) {
        sessionStorage.setItem(FORM_STORAGE_KEY, JSON.stringify(data.f));
      }
    }

    setState((prev) => ({
      ...prev,
      response: data.r,
      formData: data.f || prev.formData,
      step: "result",
    }));
    return true;
  }, []);

  return {
    ...state,
    updateFormData,
    submitPlan,
    reset,
    goBack,
    getShareUrl,
    loadFromShareHash,
  };
}

export function useCostEstimate() {
  const [estimatedCost, setEstimatedCost] = useState<number | null>(null);
  const [loading, setLoading] = useState(false);

  const estimate = useCallback(
    async (budget: number, duration: number, groupSize: number) => {
      if (!budget || !duration || !groupSize) return;

      setLoading(true);
      try {
        const result = await apiClient.getCostEstimate({
          budget,
          duration,
          groupSize,
        });
        setEstimatedCost(result.estimatedCost);
      } catch (error) {
        console.error("Cost estimate error:", error);
      } finally {
        setLoading(false);
      }
    },
    [],
  );

  return { estimatedCost, loading, estimate };
}
