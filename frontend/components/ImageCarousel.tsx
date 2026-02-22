"use client";

import { useState, useCallback, useRef, useEffect } from "react";
import { ChevronLeft, ChevronRight } from "lucide-react";

interface ImageCarouselProps {
  images: string[];
  alt: string;
  className?: string;
  showArrows?: boolean;
  showDots?: boolean;
  autoPlay?: number;
  gradient?: boolean;
  children?: React.ReactNode;
}

export function ImageCarousel({
  images,
  alt,
  className = "h-64",
  showArrows = true,
  showDots = true,
  autoPlay = 0,
  gradient = true,
  children,
}: ImageCarouselProps) {
  const [currentIndex, setCurrentIndex] = useState(0);
  const [failedImages, setFailedImages] = useState<Set<number>>(new Set());
  const [isHovered, setIsHovered] = useState(false);
  const touchStartX = useRef<number | null>(null);
  const touchEndX = useRef<number | null>(null);
  const autoPlayRef = useRef<ReturnType<typeof setInterval> | null>(null);

  const validImages = images.length > 0 ? images : ["/assets/trek.jpg"];
  const total = validImages.length;

  useEffect(() => {
    if (autoPlay > 0 && total > 1) {
      autoPlayRef.current = setInterval(() => {
        setCurrentIndex((prev) => (prev + 1) % total);
      }, autoPlay);
      return () => {
        if (autoPlayRef.current) clearInterval(autoPlayRef.current);
      };
    }
  }, [autoPlay, total]);

  const goTo = useCallback(
    (index: number) => {
      if (autoPlayRef.current) {
        clearInterval(autoPlayRef.current);
        autoPlayRef.current = null;
      }
      setCurrentIndex(((index % total) + total) % total);
    },
    [total],
  );

  const goNext = useCallback(
    () => goTo(currentIndex + 1),
    [goTo, currentIndex],
  );
  const goPrev = useCallback(
    () => goTo(currentIndex - 1),
    [goTo, currentIndex],
  );

  const onTouchStart = (e: React.TouchEvent) => {
    touchStartX.current = e.targetTouches[0].clientX;
    touchEndX.current = null;
  };

  const onTouchMove = (e: React.TouchEvent) => {
    touchEndX.current = e.targetTouches[0].clientX;
  };

  const onTouchEnd = () => {
    if (touchStartX.current === null || touchEndX.current === null) return;
    const diff = touchStartX.current - touchEndX.current;
    if (Math.abs(diff) > 50) {
      if (diff > 0) goNext();
      else goPrev();
    }
    touchStartX.current = null;
    touchEndX.current = null;
  };

  const handleImageError = (index: number) => {
    setFailedImages((prev) => new Set(prev).add(index));
  };

  return (
    <div
      className={`relative overflow-hidden select-none ${className}`}
      onTouchStart={onTouchStart}
      onTouchMove={onTouchMove}
      onTouchEnd={onTouchEnd}
      onMouseEnter={() => setIsHovered(true)}
      onMouseLeave={() => setIsHovered(false)}
    >
      {/* Images */}
      <div
        className="flex h-full transition-transform duration-500 ease-out"
        style={{ transform: `translateX(-${currentIndex * 100}%)` }}
      >
        {validImages.map((src, i) => (
          <div key={i} className="w-full h-full flex-shrink-0 relative">
            {/* eslint-disable-next-line @next/next/no-img-element */}
            <img
              src={failedImages.has(i) ? "/assets/trek.jpg" : src}
              alt={`${alt} ${i + 1}`}
              className="absolute inset-0 w-full h-full object-cover"
              loading={i === 0 ? "eager" : "lazy"}
              onError={() => handleImageError(i)}
              draggable={false}
            />
          </div>
        ))}
      </div>

      {/* Gradient overlay */}
      {gradient && (
        <div className="absolute inset-0 bg-gradient-to-t from-black/70 via-black/20 to-transparent pointer-events-none" />
      )}

      {/* Overlay children */}
      {children}

      {/* Arrow buttons — use state-based visibility instead of group-hover */}
      {showArrows && total > 1 && (
        <>
          <button
            onClick={(e) => {
              e.stopPropagation();
              goPrev();
            }}
            className={`absolute left-2 top-1/2 -translate-y-1/2 h-8 w-8 rounded-full bg-black/40 hover:bg-black/60 backdrop-blur-sm flex items-center justify-center transition-all z-10 ${
              isHovered ? "opacity-100" : "opacity-0"
            }`}
            aria-label="Previous image"
          >
            <ChevronLeft className="h-4 w-4 text-white" />
          </button>
          <button
            onClick={(e) => {
              e.stopPropagation();
              goNext();
            }}
            className={`absolute right-2 top-1/2 -translate-y-1/2 h-8 w-8 rounded-full bg-black/40 hover:bg-black/60 backdrop-blur-sm flex items-center justify-center transition-all z-10 ${
              isHovered ? "opacity-100" : "opacity-0"
            }`}
            aria-label="Next image"
          >
            <ChevronRight className="h-4 w-4 text-white" />
          </button>
        </>
      )}

      {/* Dot indicators */}
      {showDots && total > 1 && (
        <div className="absolute bottom-2 left-1/2 -translate-x-1/2 flex items-center gap-1.5 z-10">
          {validImages.map((_, i) => (
            <button
              key={i}
              onClick={(e) => {
                e.stopPropagation();
                goTo(i);
              }}
              className={`rounded-full transition-all ${
                i === currentIndex
                  ? "w-6 h-2 bg-white"
                  : "w-2 h-2 bg-white/40 hover:bg-white/60"
              }`}
              aria-label={`Go to image ${i + 1}`}
            />
          ))}
        </div>
      )}

      {/* Image counter */}
      {total > 1 && (
        <div className="absolute top-2 right-2 px-2 py-0.5 rounded-full bg-black/50 backdrop-blur-sm text-[10px] text-white/70 z-10">
          {currentIndex + 1}/{total}
        </div>
      )}
    </div>
  );
}
