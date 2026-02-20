// backend/src/utils/itinerary.js

const generateItinerary = (
  destination,
  templateDays,
  requestedDuration,
  pace = "moderate",
) => {
  if (!templateDays || templateDays.length === 0) {
    return generateBasicItinerary(destination, requestedDuration);
  }

  const sortedDays = templateDays.sort((a, b) => a.day_number - b.day_number);

  const templateDuration = sortedDays.length;

  let adjustedDays;

  if (requestedDuration === templateDuration) {
    adjustedDays = sortedDays;
  } else if (requestedDuration < templateDuration) {
    adjustedDays = compressItinerary(sortedDays, requestedDuration, pace);
  } else {
    adjustedDays = extendedItinerary(sortedDays, requestedDuration, pace);
  }

  const formattedDays = adjustedDays.map((day, index) => ({
    day: index + 1,
    title: day.title,
    location: day.location,
    activities: Array.isArray(day.activities)
      ? day.activities
      : JSON.parse(day.activities || "[]"),
    accommodation: day.accommodation,
    meals: day.meals,
    distance: day.distance,
    elevation: day.elevation,
    duration: day.duration,
    highlights: Array.isArray(day.highlights)
      ? day.highlights
      : JSON.parse(day.highlights || "[]"),
  }));

  const totals = calculateTotals(formattedDays);

  return {
    days: formattedDays,
    totalDistance: totals.distance,
    maxElevation: totals.maxElevation,
  };
};

const compressItinerary = (templateDays, targetDuration, pace) => {
  const compressionRatio = targetDuration / templateDays.length;

  if (compressionRatio >= 0.8) {
    return removeRestDays(templateDays, targetDuration);
  } else {
    return combineDays(templateDays, targetDuration, pace);
  }
};

const extendedItinerary = (templateDays, targetDuration, pace) => {
  const extraDays = targetDuration - templateDays.length;
  const extensionRatio = extraDays / templateDays.length;

  if (extensionRatio <= 0.3) {
    return addRestDays(templateDays, extraDays, pace);
  } else {
    return addSideTrips(templateDays, extraDays);
  }
};

const removeRestDays = (days, targetDuration) => {
  const daysToRemove = days.length - targetDuration;
  const restDaysIndices = days
    .map((day, index) => ({ day, index }))
    .filter(
      ({ day }) =>
        day.title.toLowerCase().includes("rest") ||
        day.title.toLowerCase().includes("acclimatization"),
    )
    .map(({ index }) => index);

  const indicesToRemove = restDaysIndices.slice(0, daysToRemove);
  return days.filter((_, index) => !indicesToRemove.includes(index));
};

const combineDays = (days, targetDuration, pace) => {
  const ratio = Math.floor(days.length / targetDuration);

  const combined = [];

  for (let i = 0; i < days.length; i += ratio) {
    const daysToCombine = days.slice(i, i + ratio);

    if (daysToCombine.length === 1) {
      combined.push(daysToCombine[0]);
    } else {
      combined.push({
        title: `${daysToCombine[0].title} to ${daysToCombine[daysToCombine.length - 1].location}`,
        location: daysToCombine[daysToCombine.length - 1].location,
        activities: daysToCombine
          .flatMap((d) =>
            Array.isArray(d.activities)
              ? d.activities
              : JSON.parse(d.activities || "[]"),
          )
          .slice(0, 5),
        accommodation: daysToCombine[daysToCombine.length - 1].accommodation,
        meals: "Breakfast, Lunch, Dinner",
        distance: calculateCombinedDistance(daysToCombine),
        elevation: daysToCombine[daysToCombine.length - 1].elevation,
        duration: calculateCombinedDuration(daysToCombine),
        highlights: daysToCombine
          .flatMap((d) =>
            Array.isArray(d.highlights)
              ? d.highlights
              : JSON.parse(d.highlights || "[]"),
          )
          .slice(0, 3),
      });
    }
  }

  return combined.slice(0, targetDuration);
};

const addRestDays = (days, extraDays, pace) => {
  const extended = [...days];
  const highAltitudeDays = days
    .map((day, index) => ({ day, index }))
    .filter(({ day }) => {
      const elevation = parseInt(day.elevation) || 0;
      return elevation > 3000;
    })
    .map(({ index }) => index);

  let insertionPoints = highAltitudeDays.slice(0, extraDays);

  while (insertionPoints.length < extraDays) {
    const interval = Math.floor(
      days.length / (extraDays - insertionPoints.length + 1),
    );
    insertionPoints.push(interval * (insertionPoints.length + 1));
  }

  insertionPoints.sort((a, b) => b - a);
  insertionPoints.forEach((index) => {
    const safeIndex = Math.min(index, days.length - 1);
    const restDay = {
      title: `Rest and Exploration Day at ${days[safeIndex].location}`,
      location: days[safeIndex].location,
      activities: JSON.stringify([
        "Rest and acclimatization",
        "Short walks around the area",
        "Explore local culture and nearby viewpoints",
        "Visit a local tea house or monastery if nearby",
        "Hydrate well and eat nutritious meals",
        "Prepare gear for the next day",
      ]),
      accommodation: days[safeIndex].accommodation,
      meals: "Breakfast, Lunch, Dinner",
      distance: "0 km",
      elevation: days[safeIndex].elevation,
      duration: "Rest day",
      highlights: JSON.stringify([
        "Rest and recovery",
        "Cultural exploration",
        "Acclimatization",
      ]),
    };
    extended.splice(safeIndex + 1, 0, restDay);
  });

  return extended;
};

const addSideTrips = (days, extraDays) => {
  const extended = [...days];

  const sideTripTemplates = [
    {
      title: "Side Trip and Local Exploration",
      activities: [
        "Morning hike to a nearby viewpoint for sunrise or panoramic views",
        "Visit a local village and interact with residents",
        "Explore local trails and hidden spots recommended by your guide",
        "Photography session at scenic locations",
        "Try local snacks and tea at a village tea house",
        "Return to base for dinner and rest",
      ],
      duration: "Full day",
    },
    {
      title: "Cultural Immersion Day",
      activities: [
        "Morning visit to a nearby monastery or temple",
        "Participate in a prayer ceremony or meditation session if available",
        "Walk through traditional villages and learn about local customs",
        "Try a local cooking session or taste traditional food",
        "Afternoon free time: read, journal, or explore",
        "Evening group dinner with cultural stories from the guide",
      ],
      duration: "Full day",
    },
    {
      title: "Scenic Nature Exploration",
      activities: [
        "Early morning bird watching walk with binoculars",
        "Nature walk through forest trails - look for wildlife",
        "Visit a waterfall, river, or lake nearby",
        "Landscape photography from different angles and elevations",
        "Picnic lunch at a scenic spot",
        "Afternoon rest and preparation for the next stage",
      ],
      duration: "Full day",
    },
  ];

  const interval = Math.floor(days.length / (extraDays + 1));

  for (let i = 0; i < extraDays; i++) {
    const insertIndex = (i + 1) * interval + i;
    const template = sideTripTemplates[i % sideTripTemplates.length];
    const baseDay = days[Math.min(insertIndex, days.length - 1)];

    const sideTrip = {
      title: template.title,
      location: baseDay.location,
      activities: JSON.stringify(template.activities),
      accommodation: baseDay.accommodation,
      meals: "Breakfast, Lunch, Dinner",
      distance: "5-10 km",
      elevation: baseDay.elevation,
      duration: template.duration,
      highlights: JSON.stringify([
        "Local exploration",
        "Cultural experience",
        "Scenic beauty",
      ]),
    };

    extended.splice(Math.min(insertIndex, extended.length), 0, sideTrip);
  }

  return extended;
};

// ── Trip-type-aware templates for destinations without itinerary data ──

const TRIP_TYPE_TEMPLATES = {
  trekking: {
    arrivalTitle: (dest) => `Arrival in Kathmandu / Transfer to ${dest.region}`,
    arrivalActivities: [
      "Arrive at Tribhuvan International Airport or bus station",
      "Taxi to hotel in Thamel (NPR 500-800, 30 min)",
      "Check in, freshen up, and rest",
      "Afternoon: Visit permit office for trekking permits (TIMS + conservation area permit)",
      "Gear check at hotel - last-minute purchases from Thamel trekking shops",
      "Trip briefing with guide - route, safety, daily plan",
      "Welcome dinner at a local restaurant - try dal bhat or Newari cuisine",
      "Pack and prepare for early morning departure",
    ],
    dayTitle: (dest, i) => `${dest.name} - Day ${i + 1}`,
    dayActivities: [
      "Early breakfast at tea house (7:00 AM)",
      "Begin morning trek through scenic landscapes and villages",
      "Tea break at a small village along the trail",
      "Lunch at a tea house (dal bhat, noodle soup, or fried rice)",
      "Afternoon trek - gradual ascent through changing vegetation",
      "Arrive at next tea house by 3:00-4:00 PM",
      "Rest, explore the village, and take photos",
      "Dinner at tea house - hydrate well, drink plenty of water and hot drinks",
    ],
    dayHighlights: ["Mountain views", "Local culture", "Natural beauty"],
    accommodation: "Tea house / Lodge",
    departureTitle: "Return to Kathmandu / Departure",
    departureActivities: [
      "Breakfast and final pack-up",
      "Morning trek or drive back to trailhead",
      "Local bus or jeep to nearest town (NPR 300-1000)",
      "Transfer to Kathmandu by bus, jeep, or flight",
      "Taxi to Thamel hotel (NPR 500-800)",
      "Hot shower, clean clothes, rest",
      "Farewell dinner with guide and team - tip distribution",
      "Optional: Thamel shopping for souvenirs (pashmina, singing bowls, spices)",
    ],
  },
  cultural: {
    arrivalTitle: (dest) => `Arrival and Introduction to ${dest.region}`,
    arrivalActivities: [
      "Arrive at airport or bus station",
      "Taxi to hotel (NPR 400-800)",
      "Check in and freshen up",
      "Orientation and cultural briefing with guide",
      "Short walk to explore the nearest heritage area",
      "Welcome dinner with traditional local cuisine",
      "Evening walk through the old town streets",
    ],
    dayTitle: (dest, i) => `${dest.name} - Exploration Day ${i + 1}`,
    dayActivities: [
      "Breakfast at hotel (8:00 AM)",
      "Morning visit to major heritage sites and monuments",
      "Guided tour of temples, palaces, and traditional architecture",
      "Walk through local markets - spices, handicrafts, daily life",
      "Lunch at a traditional restaurant - try local specialties",
      "Afternoon: Visit museums, craft workshops, or secondary sites",
      "Interact with artisans and learn about traditional crafts",
      "Evening free to explore or attend cultural performances",
    ],
    dayHighlights: ["Heritage sites", "Local cuisine", "Traditional arts"],
    accommodation: "Hotel / Heritage Stay",
    departureTitle: "Final Exploration and Departure",
    departureActivities: [
      "Breakfast at hotel",
      "Morning visit to any remaining sites",
      "Souvenir shopping: handicrafts, paintings, textiles",
      "Lunch at a favorite local restaurant",
      "Transfer to airport or bus station by taxi",
      "Farewell and departure",
    ],
  },
  wildlife: {
    arrivalTitle: (dest) => `Arrival at ${dest.region} / Check-in`,
    arrivalActivities: [
      "Travel to national park area by bus or private vehicle",
      "Taxi or resort pickup from bus stand to lodge (NPR 200-500)",
      "Check into jungle lodge or resort",
      "Safari briefing by resident naturalist - safety rules, what to expect",
      "Afternoon nature walk around the lodge grounds - first bird sightings",
      "Sunset by the river near the park boundary",
      "Dinner at lodge, listen to jungle sounds",
    ],
    dayTitle: (dest, i) => `${dest.name} - Safari Day ${i + 1}`,
    dayActivities: [
      "5:30 AM: Wake up for dawn bird watching walk",
      "Return for breakfast at lodge",
      "Morning jungle activity: jeep safari, canoe ride, or guided walk",
      "Spot wildlife: deer, rhino, monkeys, crocodiles, exotic birds",
      "Lunch at lodge",
      "Afternoon activity: elephant safari, bird hide, or nature trail",
      "Evening wildlife documentary and discussion with naturalist",
      "Dinner at lodge",
    ],
    dayHighlights: ["Wildlife sighting", "Bird watching", "Nature walks"],
    accommodation: "Safari Lodge",
    departureTitle: "Final Safari and Departure",
    departureActivities: [
      "5:00 AM: Optional sunrise walk - mist over the river, bird calls",
      "Breakfast at lodge",
      "Final short safari or nature walk (2 hours)",
      "Pack and check out",
      "Board bus or vehicle for return journey",
      "Lunch en-route at a highway restaurant",
      "Arrive at destination city by evening",
    ],
  },
  adventure: {
    arrivalTitle: (dest) => `Arrival and Preparation for ${dest.name}`,
    arrivalActivities: [
      "Travel to activity location by bus or private vehicle",
      "Check into hotel or camp near the activity base",
      "Meet the adventure operator and team",
      "Safety briefing: rules, signals, emergency procedures",
      "Equipment check and fitting: harness, helmet, gear",
      "Practice session or orientation activity",
      "Dinner and rest - prepare for the main adventure",
    ],
    dayTitle: (dest, i) => `${dest.name} - Adventure Day ${i + 1}`,
    dayActivities: [
      "Early breakfast and gear up",
      "Transport to the main activity site",
      "Safety recap and final equipment check",
      "Main adventure activity with professional guides",
      "Break for refreshments and snacks",
      "Second session or optional add-on activity",
      "Lunch at a local restaurant near the site",
      "Afternoon free to explore the area or relax",
      "Return to accommodation, evening relaxation and dinner",
    ],
    dayHighlights: [
      "Thrilling experience",
      "Scenic views",
      "Professional guides",
    ],
    accommodation: "Hotel / Camp",
    departureTitle: "Wrap-up and Departure",
    departureActivities: [
      "Breakfast at accommodation",
      "Free morning or optional secondary activity",
      "Pack and check out",
      "Transfer back to Kathmandu or next destination by bus or vehicle",
      "Arrive by evening, farewell",
    ],
  },
  pilgrimage: {
    arrivalTitle: (dest) => `Arrival and Spiritual Preparation`,
    arrivalActivities: [
      "Travel to pilgrimage site by bus, taxi, or flight",
      "Check into hotel or guest house near the temple",
      "Freshen up and change into appropriate clothing",
      "Evening visit to nearby shrines for initial darshan",
      "Evening prayers or meditation",
      "Dinner at local restaurant - try vegetarian food near temples",
      "Rest and spiritual preparation for main pilgrimage",
    ],
    dayTitle: (dest, i) => `${dest.name} - Pilgrimage Day ${i + 1}`,
    dayActivities: [
      "Early morning prayers and darshan at the main temple (5:00-7:00 AM is best)",
      "Breakfast at hotel or temple area",
      "Guided tour of the temple complex and sacred sites",
      "Participate in rituals: puja, aarti, offerings",
      "Visit associated shrines, monasteries, or ashrams nearby",
      "Lunch at a local restaurant or temple kitchen (prasad)",
      "Afternoon meditation or quiet contemplation at a peaceful spot",
      "Evening aarti or butter lamp ceremony",
      "Dinner and rest",
    ],
    dayHighlights: [
      "Sacred sites",
      "Spiritual experience",
      "Religious rituals",
    ],
    accommodation: "Hotel / Guest house",
    departureTitle: "Final Prayers and Departure",
    departureActivities: [
      "Early morning final darshan and prayers",
      "Collect blessings and prasad from the temple",
      "Breakfast at hotel",
      "Buy religious items and souvenirs: prayer beads, religious books, photos",
      "Transfer to bus station or airport by taxi",
      "Departure for Kathmandu or next destination",
    ],
  },
};

// ── Detailed single-day activity templates by trip type ──

const SINGLE_DAY_ACTIVITIES = {
  adventure: [
    "7:00 AM: Breakfast at hotel",
    "8:00 AM: Pickup from hotel by operator vehicle or taxi to activity site",
    "Arrive at activity location, registration and waiver signing",
    "Safety briefing by certified instructor - rules, signals, emergency procedures",
    "Gear fitting: harness, helmet, safety equipment as needed",
    "Main activity session with professional guides",
    "Break for refreshments and snacks",
    "Second session or optional add-on activity",
    "Lunch at a local restaurant near the activity site",
    "Free afternoon to explore the surrounding area or relax",
    "Return to hotel by arranged transport or taxi",
  ],
  pilgrimage: [
    "7:00 AM: Breakfast at hotel",
    "7:30 AM: Taxi or local bus from hotel to temple site (NPR 100-500)",
    "Arrive at the sacred site, remove shoes at entrance",
    "Morning darshan and prayers at the main temple or shrine",
    "Walk around the temple complex, observe rituals and ceremonies",
    "Interact respectfully with priests, receive blessings and prasad",
    "Visit nearby associated shrines, monasteries, or sacred spots",
    "Lunch at a local restaurant near the temple area",
    "Afternoon: Explore the surrounding town, markets, or secondary sites",
    "Buy religious souvenirs: prayer beads, incense, religious items",
    "Return to hotel by taxi or local bus",
  ],
  cultural: [
    "7:30 AM: Breakfast at hotel",
    "8:00 AM: Taxi or local bus to the heritage site (NPR 100-800)",
    "Arrive and buy entry ticket (prices vary: NPR 100-1800)",
    "Guided walking tour of the main attractions: temples, palaces, squares",
    "Explore narrow medieval lanes, traditional architecture, carved windows",
    "Visit local craft workshops - watch artisans at work",
    "Walk through local markets - spices, pottery, textiles, daily life",
    "Lunch at a traditional local restaurant - try regional specialties",
    "Afternoon: Visit museums, secondary sites, or lesser-known temples",
    "Buy handicrafts and souvenirs from local shops",
    "Return to hotel by taxi or local bus",
  ],
  wildlife: [
    "5:30 AM: Wake up for dawn nature walk at park boundary",
    "Spot early morning birds: kingfishers, eagles, storks, hornbills",
    "Return for breakfast at lodge",
    "8:00 AM: Guided safari or jungle exploration with naturalist",
    "Spot wildlife: deer, monkeys, rhinos, crocodiles, wild boar",
    "Packed lunch in the field or return to lodge",
    "Afternoon: Secondary activity - canoe ride, bird hide, or nature trail",
    "Return to lodge by sunset",
    "Evening: Wildlife debrief with naturalist",
  ],
  trekking: [
    "6:30 AM: Early breakfast at hotel",
    "7:00 AM: Transport to trailhead by local bus or jeep (NPR 200-1000)",
    "Arrive at trailhead, meet guide if arranged",
    "Begin day hike with packed lunch and plenty of water",
    "Trek through varied terrain: forest, ridgeline, or valley",
    "Reach the viewpoint, summit, or destination - take photos and rest",
    "Lunch break at a clearing, tea house, or scenic spot",
    "Begin return descent on the same or alternate trail",
    "Arrive at trailhead by mid-afternoon",
    "Transport back to hotel",
    "Evening free to rest and explore",
  ],
};

const generateBasicItinerary = (destination, duration) => {
  const tripType = destination.trip_type || "trekking";
  const template =
    TRIP_TYPE_TEMPLATES[tripType] || TRIP_TYPE_TEMPLATES.trekking;
  const days = [];

  // For single-day activities (adventure, pilgrimage day trips, etc.)
  if (duration === 1) {
    const activities =
      SINGLE_DAY_ACTIVITIES[tripType] || SINGLE_DAY_ACTIVITIES.adventure;
    const destHighlights = destination.highlights || template.dayHighlights;

    days.push({
      day: 1,
      title: template.dayTitle(destination, 0),
      location: destination.region,
      activities,
      accommodation: template.accommodation,
      meals: "Breakfast, Lunch",
      distance: null,
      elevation: `${destination.elevation}m`,
      duration: "Full day",
      highlights: Array.isArray(destHighlights)
        ? destHighlights.slice(0, 5)
        : template.dayHighlights,
    });

    return {
      days,
      totalDistance: null,
      maxElevation: `${destination.elevation}m`,
    };
  }

  // Day 1: Arrival
  days.push({
    day: 1,
    title: template.arrivalTitle(destination),
    location: destination.region,
    activities: template.arrivalActivities,
    accommodation: template.accommodation,
    meals: "Dinner",
    distance: null,
    elevation: tripType === "trekking" ? "1,400m" : `${destination.elevation}m`,
    duration: "Arrival day",
    highlights: ["Trip preparation", "Meet the team", "Local exploration"],
  });

  // Middle days
  const middleDays = duration - 2;
  const highlights = destination.highlights || template.dayHighlights;

  for (let i = 0; i < middleDays; i++) {
    // Rotate through destination highlights for variety
    const dayHighlights =
      highlights.length > 0
        ? [
            highlights[i % highlights.length],
            ...(template.dayHighlights || []).slice(0, 2),
          ]
        : template.dayHighlights;

    days.push({
      day: i + 2,
      title: template.dayTitle(destination, i),
      location: destination.region,
      activities: template.dayActivities,
      accommodation: template.accommodation,
      meals: "Breakfast, Lunch, Dinner",
      distance: tripType === "trekking" ? "10-15 km" : null,
      elevation:
        tripType === "trekking"
          ? `${Math.min(destination.elevation, 1500 + i * 500)}m`
          : `${destination.elevation}m`,
      duration: tripType === "trekking" ? "5-7 hours" : "Full day",
      highlights: dayHighlights,
    });
  }

  // Last day: Departure
  days.push({
    day: duration,
    title: template.departureTitle,
    location: destination.region,
    activities: template.departureActivities,
    accommodation: template.accommodation,
    meals: "Breakfast, Lunch",
    distance: null,
    elevation: tripType === "trekking" ? "1,400m" : `${destination.elevation}m`,
    duration: "Full day",
    highlights: ["Trip completion", "Memories"],
  });

  const totalDist =
    tripType === "trekking" ? `${middleDays * 12} km (approx)` : null;

  return {
    days,
    totalDistance: totalDist,
    maxElevation: `${destination.elevation}m`,
  };
};

const calculateCombinedDistance = (days) => {
  const totalKm = days.reduce((sum, day) => {
    const distance = parseFloat(day.distance) || 0;
    return sum + distance;
  }, 0);
  return totalKm > 0 ? `${totalKm.toFixed(1)} km` : null;
};

const calculateCombinedDuration = (days) => {
  const totalHours = days.reduce((sum, day) => {
    const hours = parseFloat(day.duration) || 0;
    return sum + hours;
  }, 0);
  if (totalHours > 0) {
    return `${totalHours.toFixed(0)}-${(totalHours + 2).toFixed(0)} hours`;
  }
  return "Full day";
};

const calculateTotals = (days) => {
  let totalDistance = 0;
  let maxElevation = 0;

  days.forEach((day) => {
    if (day.distance) {
      const distStr =
        typeof day.distance === "string" ? day.distance : String(day.distance);
      const distance = parseFloat(distStr.replace(/[^\d.]/g, ""));
      if (!isNaN(distance)) {
        totalDistance += distance;
      }
    }

    if (day.elevation) {
      const elevStr =
        typeof day.elevation === "string"
          ? day.elevation
          : String(day.elevation);
      const elevation = parseInt(elevStr.replace(/[^\d]/g, ""));
      if (!isNaN(elevation) && elevation > maxElevation) {
        maxElevation = elevation;
      }
    }
  });

  return {
    distance:
      totalDistance > 0 ? `${totalDistance.toFixed(0)} km (approx)` : null,
    maxElevation: maxElevation > 0 ? `${maxElevation.toLocaleString()}m` : null,
  };
};

export { generateItinerary };
export default generateItinerary;
