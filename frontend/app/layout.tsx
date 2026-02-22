import type { Metadata } from "next";
import { Playfair_Display, Outfit } from "next/font/google";
import "./globals.css";  

//this is the root layout file that sets up global styles and fonts for the application
const playfair = Playfair_Display({
  subsets: ["latin"],
  variable: "--font-display",
  weight: ["400", "500", "600", "700", "800", "900"],
});

const outfit = Outfit({
  subsets: ["latin"],
  variable: "--font-body",
  weight: ["300", "400", "500", "600", "700"],
});

export const metadata: Metadata = {
  title: "Smart Trek & Travel Planner - Nepal",
  description:
    "AI-powered trek and travel planning system for Nepal. Get personalized itineraries, budget estimates, and destination recommendations.",
  keywords: [
    "Nepal",
    "trekking",
    "travel planner",
    "Everest",
    "Annapurna",
    "budget travel",
    "itinerary",
  ],
};

export default function RootLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  return (
    <html lang="en" className="dark">
      <body className={`${playfair.variable} ${outfit.variable} antialiased`}>
        {children}
      </body>
    </html>
  );
}
