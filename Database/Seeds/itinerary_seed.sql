\set ON_ERROR_STOP on

-- ========================================
-- TREKKING ITINERARIES
-- ========================================

-- =========================
-- Everest Base Camp Trek (14 days)
-- =========================

INSERT INTO itinerary_templates (destination_id, day_number, title, location, activities, accommodation, meals, distance, elevation, duration, highlights)
SELECT id, 1, 'Arrival in Kathmandu', 'Kathmandu',
    '["Arrive at Tribhuvan International Airport", "Hotel transfer via pre-arranged taxi (30 min to Thamel, ~NPR 800)", "Check in to hotel in Thamel area", "Afternoon: Visit Nepal Tourism Board for TIMS card and Sagarmatha permit", "Evening: Trip briefing with guide, gear check at hotel", "Dinner at a Thamel restaurant - try dal bhat", "Pack for early morning Lukla flight"]'::jsonb,
    'Hotel in Thamel', 'Dinner', NULL, '1,400m', 'Arrival day',
    '["Trip preparation", "Permit arrangements", "Thamel exploration", "Gear check"]'::jsonb
FROM destinations WHERE name = 'Everest Base Camp Trek' LIMIT 1;

INSERT INTO itinerary_templates (destination_id, day_number, title, location, activities, accommodation, meals, distance, elevation, duration, highlights)
SELECT id, 2, 'Fly to Lukla, Trek to Phakding', 'Phakding',
    '["Early morning: Taxi from Thamel to Tribhuvan domestic terminal (NPR 500, 20 min)", "Board scenic mountain flight to Lukla Tenzing-Hillary Airport (35 min)", "Land at one of world''s most thrilling airstrips (2,860m)", "Meet porters and organize gear at Lukla", "Begin trek: Walk through Lukla village past shops and lodges", "Descend gradually along the Dudh Koshi River valley", "Pass through Cheplung village - small tea stop", "Cross first suspension bridges over Dudh Koshi", "Pass through Ghat village", "Arrive at Phakding, check into tea house", "Evening: Short walk along the river, rest"]'::jsonb,
    'Tea house', 'Breakfast, Lunch, Dinner', '8 km', '2,610m', '3-4 hours',
    '["Thrilling Lukla flight", "First day of trekking", "Dudh Koshi River valley", "Suspension bridges"]'::jsonb
FROM destinations WHERE name = 'Everest Base Camp Trek' LIMIT 1;

INSERT INTO itinerary_templates (destination_id, day_number, title, location, activities, accommodation, meals, distance, elevation, duration, highlights)
SELECT id, 3, 'Trek to Namche Bazaar', 'Namche Bazaar',
    '["Early breakfast at tea house", "Trek along Dudh Koshi River through pine and rhododendron forest", "Cross multiple suspension bridges including the famous Hillary Bridge (highest suspension bridge on the trail)", "Enter Sagarmatha National Park at checkpoint - show permits", "First views of Everest through the trees (weather permitting)", "Steep uphill climb (600m gain) through switchbacks to Namche", "Arrive at Namche Bazaar - the Sherpa capital (3,440m)", "Explore the amphitheatre-shaped town: bakeries, gear shops, ATMs", "Visit Namche Monastery if time permits", "Early dinner and rest - hydrate well"]'::jsonb,
    'Tea house', 'Breakfast, Lunch, Dinner', '11 km', '3,440m', '5-6 hours',
    '["Hillary Bridge", "Sagarmatha National Park entry", "First Everest views", "Namche Bazaar - Sherpa capital"]'::jsonb
FROM destinations WHERE name = 'Everest Base Camp Trek' LIMIT 1;

INSERT INTO itinerary_templates (destination_id, day_number, title, location, activities, accommodation, meals, distance, elevation, duration, highlights)
SELECT id, 4, 'Acclimatization Day in Namche', 'Namche Bazaar',
    '["Breakfast at tea house", "Morning hike to Everest View Hotel viewpoint (3,880m) - 2 hour uphill", "Stunning panorama: Everest, Lhotse, Ama Dablam, Thamserku", "Continue to Khumjung village - visit Hillary School and Yeti skull at monastery", "Return to Namche via Syangboche airstrip", "Afternoon: Explore Namche - visit Sherpa Culture Museum (NPR 200 entry)", "Browse Saturday market if it''s market day (Saturdays)", "Visit local bakeries for apple pie and coffee", "Rest, hydrate, and prepare for next day"]'::jsonb,
    'Tea house', 'Breakfast, Lunch, Dinner', '5 km', '3,880m', '4-5 hours',
    '["Acclimatization hike", "Everest View Hotel panorama", "Khumjung village", "Sherpa Culture Museum"]'::jsonb
FROM destinations WHERE name = 'Everest Base Camp Trek' LIMIT 1;

INSERT INTO itinerary_templates (destination_id, day_number, title, location, activities, accommodation, meals, distance, elevation, duration, highlights)
SELECT id, 5, 'Trek to Tengboche', 'Tengboche',
    '["Breakfast and depart Namche", "Descend to Dudh Koshi River (lose ~300m elevation)", "Pass through Phunki Tenga village - water-driven prayer wheels", "Steep 2-hour climb through rhododendron and birch forest", "Arrive at Tengboche Monastery - largest monastery in Khumbu (3,860m)", "Visit the monastery: stunning Ama Dablam backdrop", "Attend afternoon/evening prayer ceremony (3:00-4:00 PM)", "Explore the small settlement around the monastery", "Clear evening views of Ama Dablam, Everest, Nuptse, Lhotse"]'::jsonb,
    'Tea house', 'Breakfast, Lunch, Dinner', '10 km', '3,860m', '5-6 hours',
    '["Tengboche Monastery", "Ama Dablam close views", "Buddhist prayer ceremony", "Rhododendron forest"]'::jsonb
FROM destinations WHERE name = 'Everest Base Camp Trek' LIMIT 1;

INSERT INTO itinerary_templates (destination_id, day_number, title, location, activities, accommodation, meals, distance, elevation, duration, highlights)
SELECT id, 6, 'Trek to Dingboche', 'Dingboche',
    '["Breakfast with monastery views", "Descend through forest to Deboche", "Cross suspension bridge over Imja Khola", "Pass through Pangboche village - oldest monastery in Khumbu", "Walk through the wide Imja Valley with mountain views on both sides", "Vegetation thins as you gain altitude - entering alpine zone", "Arrive at Dingboche (4,410m) - stone-walled yak pastures", "Afternoon rest - important to hydrate and eat well", "Short evening walk to view Island Peak and Ama Dablam"]'::jsonb,
    'Tea house', 'Breakfast, Lunch, Dinner', '12 km', '4,410m', '5-6 hours',
    '["High altitude entry", "Island Peak views", "Imja Valley", "Pangboche monastery"]'::jsonb
FROM destinations WHERE name = 'Everest Base Camp Trek' LIMIT 1;

INSERT INTO itinerary_templates (destination_id, day_number, title, location, activities, accommodation, meals, distance, elevation, duration, highlights)
SELECT id, 7, 'Acclimatization in Dingboche', 'Dingboche',
    '["Breakfast at tea house", "Morning hike to Nagarjun Hill (5,100m) - 3 hour round trip", "360-degree panorama: Makalu, Island Peak, Ama Dablam, Lhotse South Face", "Return to Dingboche for lunch", "Afternoon: Rest and read, play cards, or explore the village", "Watch yaks grazing in the stone-walled pastures", "Drink plenty of fluids - garlic soup is excellent for altitude", "Early dinner and sleep - tomorrow is a big climb"]'::jsonb,
    'Tea house', 'Breakfast, Lunch, Dinner', '4 km', '5,100m', '3-4 hours',
    '["Nagarjun Hill 360° views", "Makalu and Lhotse views", "Critical acclimatization", "Rest day"]'::jsonb
FROM destinations WHERE name = 'Everest Base Camp Trek' LIMIT 1;

INSERT INTO itinerary_templates (destination_id, day_number, title, location, activities, accommodation, meals, distance, elevation, duration, highlights)
SELECT id, 8, 'Trek to Lobuche', 'Lobuche',
    '["Breakfast and depart Dingboche", "Trek across the valley floor to Thukla/Dugla (4,620m)", "Steep climb up the Thukla Pass/Dugla hill", "Visit the Chukpi Lhara memorial area - stone cairns honoring fallen climbers", "See memorials to Scott Fischer, Babu Chhiri Sherpa, and others", "Walk along the lateral moraine of Khumbu Glacier", "Stunning views of Nuptse wall, Pumori, and Changtse", "Arrive at Lobuche (4,940m) - small settlement", "Rest well, stay warm - temperatures drop significantly at night"]'::jsonb,
    'Tea house', 'Breakfast, Lunch, Dinner', '8 km', '4,940m', '5-6 hours',
    '["Climber memorial cairns", "Khumbu Glacier moraine", "Nuptse wall views", "High altitude camp"]'::jsonb
FROM destinations WHERE name = 'Everest Base Camp Trek' LIMIT 1;

INSERT INTO itinerary_templates (destination_id, day_number, title, location, activities, accommodation, meals, distance, elevation, duration, highlights)
SELECT id, 9, 'Trek to Gorak Shep & Everest Base Camp', 'Gorak Shep',
    '["Very early breakfast (6:00 AM)", "Trek across rocky terrain along Khumbu Glacier", "Arrive at Gorak Shep (5,164m) - last settlement, drop bags", "Lunch and rest briefly", "Afternoon: Trek to Everest Base Camp (5,364m) - 3 hours round trip", "Walk over Khumbu Glacier moraine - rocky, undulating terrain", "Reach EBC: see the Khumbu Icefall, prayer flags, expedition tents (in season)", "Take photos, soak in the achievement", "Return to Gorak Shep before dark", "Celebrate at tea house - hot drinks and early sleep"]'::jsonb,
    'Tea house', 'Breakfast, Lunch, Dinner', '13 km', '5,364m', '7-8 hours',
    '["Everest Base Camp reached!", "Khumbu Icefall", "Prayer flags at EBC", "Lifetime achievement"]'::jsonb
FROM destinations WHERE name = 'Everest Base Camp Trek' LIMIT 1;

INSERT INTO itinerary_templates (destination_id, day_number, title, location, activities, accommodation, meals, distance, elevation, duration, highlights)
SELECT id, 10, 'Kala Patthar Sunrise, Trek to Pheriche', 'Pheriche',
    '["Pre-dawn start: Wake at 4:00 AM, depart by 4:30 AM with headlamp", "Climb Kala Patthar (5,545m) - steep 1.5 hour hike in the dark", "Witness sunrise over Everest, Lhotse, Nuptse, Changtse - best views of the trek", "Highest point of the entire trek", "Descend to Gorak Shep for breakfast and pack up", "Long descent: Gorak Shep → Lobuche → Pheriche", "Enjoy breathing easier as you lose altitude", "Arrive at Pheriche (4,280m) - larger village with HRA aid post", "Rest and celebrate the accomplishment"]'::jsonb,
    'Tea house', 'Breakfast, Lunch, Dinner', '16 km', '5,545m', '8-9 hours',
    '["Kala Patthar summit", "Sunrise on Everest", "Highest point of trek", "Rapid descent"]'::jsonb
FROM destinations WHERE name = 'Everest Base Camp Trek' LIMIT 1;

INSERT INTO itinerary_templates (destination_id, day_number, title, location, activities, accommodation, meals, distance, elevation, duration, highlights)
SELECT id, 11, 'Trek to Namche Bazaar', 'Namche Bazaar',
    '["Breakfast and depart Pheriche", "Descend through Pangboche - visit the old monastery if missed earlier", "Pass through Tengboche - last views of Ama Dablam from the monastery", "Descend to Phunki Tenga and cross the river", "Climb back up to Namche Bazaar", "Enjoy the relative luxury of Namche: hot showers, bakeries, WiFi", "Celebration dinner at one of the nicer restaurants", "Last night in the mountains"]'::jsonb,
    'Tea house', 'Breakfast, Lunch, Dinner', '20 km', '3,440m', '6-7 hours',
    '["Long descent day", "Revisit Tengboche", "Namche comforts", "Celebration dinner"]'::jsonb
FROM destinations WHERE name = 'Everest Base Camp Trek' LIMIT 1;

INSERT INTO itinerary_templates (destination_id, day_number, title, location, activities, accommodation, meals, distance, elevation, duration, highlights)
SELECT id, 12, 'Trek to Lukla', 'Lukla',
    '["Breakfast and final departure from Namche", "Retrace steps through Monjo and Jorsalle", "Exit Sagarmatha National Park", "Cross the Hillary Bridge one last time", "Pass through Phakding and continue to Lukla", "Final day of trekking - bittersweet", "Arrive at Lukla by mid-afternoon", "Celebration dinner with porter and guide team", "Tip distribution ceremony", "Pack for morning flight"]'::jsonb,
    'Tea house', 'Breakfast, Lunch, Dinner', '19 km', '2,860m', '6-7 hours',
    '["Final trek day", "Hillary Bridge farewell", "Trek completion celebration", "Tip ceremony"]'::jsonb
FROM destinations WHERE name = 'Everest Base Camp Trek' LIMIT 1;

INSERT INTO itinerary_templates (destination_id, day_number, title, location, activities, accommodation, meals, distance, elevation, duration, highlights)
SELECT id, 13, 'Fly Back to Kathmandu', 'Kathmandu',
    '["Early morning: Be ready by 6:00 AM (flights often delayed by weather)", "Board return flight to Kathmandu (35 min)", "Taxi from domestic terminal to Thamel hotel (NPR 500)", "Hotel check-in, hot shower, rest", "Afternoon: Free time for shopping - Thamel for souvenirs, pashmina, singing bowls", "Visit Kathmandu Durbar Square if time permits", "Farewell group dinner"]'::jsonb,
    'Hotel in Thamel', 'Breakfast, Dinner', NULL, '1,400m', '35 min flight',
    '["Return flight", "Hot shower!", "Thamel shopping", "Farewell dinner"]'::jsonb
FROM destinations WHERE name = 'Everest Base Camp Trek' LIMIT 1;

INSERT INTO itinerary_templates (destination_id, day_number, title, location, activities, accommodation, meals, distance, elevation, duration, highlights)
SELECT id, 14, 'Departure Day', 'Kathmandu',
    '["Breakfast at hotel", "Free morning: last-minute shopping or sightseeing", "Optional visit to Swayambhunath (Monkey Temple) or Boudhanath Stupa", "Taxi to Tribhuvan International Airport (NPR 600-800 from Thamel, 30 min)", "International departure"]'::jsonb,
    'Day use hotel', 'Breakfast', NULL, '1,400m', 'Departure',
    '["Final memories", "Airport transfer", "Departure"]'::jsonb
FROM destinations WHERE name = 'Everest Base Camp Trek' LIMIT 1;

-- =========================
-- Annapurna Base Camp Trek (12 days)
-- =========================

INSERT INTO itinerary_templates (destination_id, day_number, title, location, activities, accommodation, meals, distance, elevation, duration, highlights)
SELECT id, 1, 'Drive to Pokhara', 'Pokhara',
    '["Option A: Tourist bus from Kathmandu Sorakhutte bus park (NPR 800-1200, 7 hrs, departs 7:00 AM)", "Option B: Micro-bus from Kalanki (NPR 1000-1500, 6 hrs)", "Option C: Flight from Tribhuvan to Pokhara Airport (25 min, NPR 4000-8000)", "Arrive Pokhara - taxi from bus park to Lakeside (NPR 300-500)", "Check into hotel at Lakeside area", "Afternoon: Walk along Phewa Lake, visit Barahi Temple island", "Evening: Explore Lakeside restaurants, try Thakali dal bhat", "Trip briefing with guide, gear check", "Early sleep - trekking starts tomorrow"]'::jsonb,
    'Hotel in Lakeside', 'Lunch, Dinner', '200 km', '822m', '6-7 hours drive',
    '["Journey to Pokhara", "Lake Phewa sunset", "Lakeside exploration", "Trek preparation"]'::jsonb
FROM destinations WHERE name = 'Annapurna Base Camp Trek' LIMIT 1;

INSERT INTO itinerary_templates (destination_id, day_number, title, location, activities, accommodation, meals, distance, elevation, duration, highlights)
SELECT id, 2, 'Drive to Nayapul, Trek to Tikhedhunga', 'Tikhedhunga',
    '["Morning: Private jeep or local bus from Pokhara to Nayapul (1.5 hours, NPR 300-500)", "Register at ACAP check post at Birethanti", "Cross the Modi Khola suspension bridge at Birethanti", "Trek along the north bank through terraced rice paddies", "Pass through Sudame and Hile villages", "Gradual climb through sal and rhododendron forest", "Arrive at Tikhedhunga by mid-afternoon", "Settle into tea house, explore the small village", "Watch sunset over the valley"]'::jsonb,
    'Tea house', 'Breakfast, Lunch, Dinner', '6 km', '1,540m', '3-4 hours',
    '["Trek begins", "Modi Khola river crossing", "Terraced fields", "Village life"]'::jsonb
FROM destinations WHERE name = 'Annapurna Base Camp Trek' LIMIT 1;

INSERT INTO itinerary_templates (destination_id, day_number, title, location, activities, accommodation, meals, distance, elevation, duration, highlights)
SELECT id, 3, 'Trek to Ghorepani', 'Ghorepani',
    '["Early breakfast at tea house", "Begin the famous Ulleri stone staircase - 3,700 hand-cut stone steps", "Steep 2-hour climb from Tikhedhunga to Ulleri (2,070m)", "Tea break at Ulleri - spectacular views open up behind you", "Continue through dense rhododendron forest (best in March-April with blooms)", "Pass through Nangethanti and Banthanti villages", "Arrive at Ghorepani (2,860m) - a lively trekking village", "Afternoon: Short walk to the village edge for Dhaulagiri sunset views", "Hot dinner at tea house, prepare for 4:30 AM Poon Hill start"]'::jsonb,
    'Tea house', 'Breakfast, Lunch, Dinner', '11 km', '2,860m', '6-7 hours',
    '["Ulleri stone staircase", "Rhododendron forest", "Ghorepani village", "Dhaulagiri sunset"]'::jsonb
FROM destinations WHERE name = 'Annapurna Base Camp Trek' LIMIT 1;

INSERT INTO itinerary_templates (destination_id, day_number, title, location, activities, accommodation, meals, distance, elevation, duration, highlights)
SELECT id, 4, 'Poon Hill Sunrise, Trek to Tadapani', 'Tadapani',
    '["4:30 AM: Depart for Poon Hill with headlamp (45 min steep climb)", "Reach Poon Hill viewpoint (3,210m) - watch the sunrise unfold", "Panoramic views: Dhaulagiri (8,167m), Annapurna South, Annapurna I, Machapuchare (Fishtail)", "Photography time - golden light on snow peaks", "Descend to Ghorepani for hot breakfast", "Depart for Tadapani through dense forest", "Rhododendron, oak, and bamboo forest - may see langur monkeys", "Arrive at Tadapani (2,630m) - quiet ridge settlement", "Clear evening views of Machapuchare and Annapurna South"]'::jsonb,
    'Tea house', 'Breakfast, Lunch, Dinner', '12 km', '2,630m', '6-7 hours',
    '["Poon Hill sunrise!", "Himalayan panorama", "Forest trail with wildlife", "Machapuchare views"]'::jsonb
FROM destinations WHERE name = 'Annapurna Base Camp Trek' LIMIT 1;

INSERT INTO itinerary_templates (destination_id, day_number, title, location, activities, accommodation, meals, distance, elevation, duration, highlights)
SELECT id, 5, 'Trek to Chhomrong', 'Chhomrong',
    '["Breakfast with sunrise on Machapuchare", "Descend steeply through forest to Chhomrong Khola river", "Cross the suspension bridge over the river", "Long steep climb (1,500 stone steps) up to Chhomrong (2,170m)", "Chhomrong is the gateway to Annapurna Sanctuary - last major village", "Lunch with incredible close-up Machapuchare views", "Afternoon: Explore the Gurung village - traditional stone houses", "Visit the small Gurung museum", "Stock up on snacks and batteries - limited supplies ahead", "Register at ACAP checkpoint"]'::jsonb,
    'Tea house', 'Breakfast, Lunch, Dinner', '10 km', '2,170m', '5-6 hours',
    '["Machapuchare close-up", "Gurung village culture", "Gateway to Sanctuary", "Chhomrong steps"]'::jsonb
FROM destinations WHERE name = 'Annapurna Base Camp Trek' LIMIT 1;

INSERT INTO itinerary_templates (destination_id, day_number, title, location, activities, accommodation, meals, distance, elevation, duration, highlights)
SELECT id, 6, 'Trek to Himalaya Hotel', 'Himalaya Hotel',
    '["Breakfast at Chhomrong", "Descend 2,000+ stone steps to Chhomrong Khola riverbed", "Cross the river and begin climbing into the Sanctuary", "Enter dense bamboo forest - possible red panda habitat", "Pass through Sinuwa village (last permanent settlement)", "Continue through thick bamboo forest to Bamboo (2,310m)", "Lunch at Bamboo", "Afternoon climb through thinning forest to Himalaya Hotel (2,920m)", "Arrive at small lodge settlement in a narrow valley", "Listen to avalanches rumbling from surrounding peaks"]'::jsonb,
    'Tea house', 'Breakfast, Lunch, Dinner', '10 km', '2,920m', '5-6 hours',
    '["Bamboo forest", "Entering the Sanctuary", "Deep valley setting", "Avalanche sounds"]'::jsonb
FROM destinations WHERE name = 'Annapurna Base Camp Trek' LIMIT 1;

INSERT INTO itinerary_templates (destination_id, day_number, title, location, activities, accommodation, meals, distance, elevation, duration, highlights)
SELECT id, 7, 'Trek to Machapuchare Base Camp', 'MBC',
    '["Breakfast and depart", "Climb through thinning vegetation - transition to alpine zone", "Pass Hinku Cave (natural rock overhang shelter)", "Deurali (3,230m) - tea stop with expanding mountain views", "Continue along the Modi Khola riverbed", "Vegetation gives way to moraine and rock", "Spectacular mountain views open up on all sides", "Arrive at Machapuchare Base Camp (3,700m)", "360° amphitheater: Machapuchare, Annapurna III, Gangapurna, Hiunchuli", "Beautiful sunset on the peaks, early dinner and sleep"]'::jsonb,
    'Tea house', 'Breakfast, Lunch, Dinner', '9 km', '3,700m', '4-5 hours',
    '["Machapuchare Base Camp", "Alpine zone entry", "Mountain amphitheater", "Stunning sunset"]'::jsonb
FROM destinations WHERE name = 'Annapurna Base Camp Trek' LIMIT 1;

INSERT INTO itinerary_templates (destination_id, day_number, title, location, activities, accommodation, meals, distance, elevation, duration, highlights)
SELECT id, 8, 'Trek to Annapurna Base Camp', 'ABC',
    '["Early breakfast at MBC", "Short but spectacular trek along the glacial moraine", "Watch the sun slowly light up surrounding peaks", "Enter the Annapurna Sanctuary - a natural amphitheater of giants", "Arrive at Annapurna Base Camp (4,130m) - prayer flags and stone markers", "Surrounded by: Annapurna I (8,091m), Annapurna South, Machapuchare, Hiunchuli, Gangapurna", "Explore the base camp area, take photos", "Rest and acclimatize at this altitude", "Watch avalanches on the south face of Annapurna I", "Golden sunset on the peaks, stargazing at night (no light pollution)"]'::jsonb,
    'Tea house', 'Breakfast, Lunch, Dinner', '3 km', '4,130m', '2-3 hours',
    '["Annapurna Base Camp!", "Annapurna Sanctuary", "Mountain amphitheater", "Stargazing"]'::jsonb
FROM destinations WHERE name = 'Annapurna Base Camp Trek' LIMIT 1;

INSERT INTO itinerary_templates (destination_id, day_number, title, location, activities, accommodation, meals, distance, elevation, duration, highlights)
SELECT id, 9, 'Trek to Bamboo', 'Bamboo',
    '["Early sunrise at ABC - watch peaks glow pink and gold", "Last photos at base camp", "Descend to MBC for short tea break", "Continue long descent past Deurali and Hinku Cave", "Re-enter bamboo forest zone", "Arrive at Bamboo (2,310m) by afternoon", "Rest aching knees - downhill is harder than it seems", "Enjoy the warmer temperatures at lower altitude"]'::jsonb,
    'Tea house', 'Breakfast, Lunch, Dinner', '15 km', '2,310m', '6-7 hours',
    '["Final ABC sunrise", "Long descent", "Back to bamboo forest", "Warmer temperatures"]'::jsonb
FROM destinations WHERE name = 'Annapurna Base Camp Trek' LIMIT 1;

INSERT INTO itinerary_templates (destination_id, day_number, title, location, activities, accommodation, meals, distance, elevation, duration, highlights)
SELECT id, 10, 'Trek to Jhinu Danda Hot Springs', 'Jhinu Danda',
    '["Breakfast at Bamboo", "Climb back up to Sinuwa and continue to Chhomrong", "From Chhomrong, descend to Jhinu Danda (1,780m)", "Afternoon: Walk 20 minutes downhill to the natural hot springs on Modi Khola", "Soak in the hot springs (NPR 100 entry) - incredible relief for tired muscles", "Natural rock pools beside the rushing river", "Return to tea house for dinner", "Celebrate completion of the Sanctuary trek", "Last night in the mountains"]'::jsonb,
    'Tea house', 'Breakfast, Lunch, Dinner', '12 km', '1,780m', '5-6 hours',
    '["Natural hot springs!", "Muscle recovery", "Modi Khola river pools", "Trek celebration"]'::jsonb
FROM destinations WHERE name = 'Annapurna Base Camp Trek' LIMIT 1;

INSERT INTO itinerary_templates (destination_id, day_number, title, location, activities, accommodation, meals, distance, elevation, duration, highlights)
SELECT id, 11, 'Trek to Nayapul, Drive to Pokhara', 'Pokhara',
    '["Breakfast at Jhinu Danda", "Final day of trekking - descend through villages", "Pass through Birethanti, complete ACAP check-out", "Arrive at Nayapul trailhead by noon", "Hire jeep or local bus from Nayapul to Pokhara (1.5 hrs, NPR 300-500)", "Arrive Pokhara Lakeside, check into hotel", "Hot shower and clean clothes!", "Celebration dinner at Lakeside - choose from Italian, Korean, Nepali restaurants", "Evening walk along the lake"]'::jsonb,
    'Hotel in Lakeside', 'Breakfast, Lunch, Dinner', '10 km', '822m', '4-5 hours + 1.5 hour drive',
    '["Trek completion!", "Return to Pokhara", "Hot shower celebration", "Lakeside dinner"]'::jsonb
FROM destinations WHERE name = 'Annapurna Base Camp Trek' LIMIT 1;

INSERT INTO itinerary_templates (destination_id, day_number, title, location, activities, accommodation, meals, distance, elevation, duration, highlights)
SELECT id, 12, 'Return to Kathmandu', 'Kathmandu',
    '["Option A: Tourist bus from Pokhara bus park (NPR 800-1200, 7 hrs, departs 7:00 AM)", "Option B: Flight from Pokhara Airport (25 min, NPR 4000-8000)", "Free morning in Pokhara: Optional boating on Phewa Lake, visit Peace Pagoda", "Travel to Kathmandu", "Hotel check-in at Thamel", "Farewell dinner - share memories with the group", "Evening: Optional visit to Thamel nightlife"]'::jsonb,
    'Hotel in Thamel', 'Breakfast, Dinner', '200 km', '1,400m', '6-7 hours drive or 25 min flight',
    '["Return journey", "Pokhara morning", "Farewell celebration", "Trip completion"]'::jsonb
FROM destinations WHERE name = 'Annapurna Base Camp Trek' LIMIT 1;

-- ========================================
-- CULTURAL TOUR ITINERARIES
-- ========================================

-- =========================
-- Kathmandu Valley Cultural Tour (4 days)
-- =========================

INSERT INTO itinerary_templates (destination_id, day_number, title, location, activities, accommodation, meals, distance, elevation, duration, highlights)
SELECT id, 1, 'Swayambhunath and Thamel Exploration', 'Kathmandu',
    '["Arrive at Tribhuvan Airport, taxi to Thamel hotel (NPR 800, 30 min)", "Check in and freshen up", "Late morning: Taxi to Swayambhunath Stupa - Monkey Temple (NPR 300 from Thamel, 15 min)", "Climb 365 stone steps to the stupa (or drive to the back entrance)", "Explore the ancient stupa complex - prayer wheels, Buddha eyes, monkey troops", "Panoramic Kathmandu Valley views from the hilltop", "Entry fee: NPR 200 (Nepali free)", "Lunch at a rooftop restaurant near Swayambhu", "Afternoon: Walk back through local neighborhoods to Thamel", "Explore Thamel: Jhochhen (Freak Street), Asan Tole spice market, Indra Chowk bead market", "Evening: Welcome dinner - try Newari cuisine (choyla, bara, aila)"]'::jsonb,
    'Hotel', 'Lunch, Dinner', '15 km', '1,400m', 'Full day',
    '["Swayambhunath Stupa", "Valley panorama", "Asan Tole market", "Newari cuisine"]'::jsonb
FROM destinations WHERE name = 'Kathmandu Valley Cultural Tour' LIMIT 1;

INSERT INTO itinerary_templates (destination_id, day_number, title, location, activities, accommodation, meals, distance, elevation, duration, highlights)
SELECT id, 2, 'Bhaktapur and Patan Heritage Day', 'Kathmandu',
    '["Breakfast at hotel", "Morning: Local bus from Ratna Park to Bhaktapur (NPR 30, 45 min) or taxi (NPR 800)", "Enter Bhaktapur Durbar Square (NPR 500 Nepali / NPR 1800 tourist - valid for 1 week)", "Explore: 55-Window Palace, Golden Gate, Vatsala Temple, Big Bell", "Visit Pottery Square - watch potters at work, buy handmade pottery", "Walk to Nyatapola Temple - tallest temple in Nepal (5-storey pagoda)", "Lunch: Try juju dhau (king curd) and Newari feast at a local restaurant", "Walk to Dattatreya Square - Peacock Window", "Afternoon: Bus/taxi to Patan (NPR 400, 30 min)", "Patan Durbar Square (NPR 250 Nepali / NPR 1000 tourist)", "Explore: Krishna Temple, Golden Temple (Hiranya Varna Mahavihar), Mahabouddha Temple", "Visit Patan Museum - finest museum in Nepal (inside the palace)", "Return to Thamel by taxi or local bus (NPR 200-400)", "Dinner in Thamel"]'::jsonb,
    'Hotel', 'Breakfast, Lunch, Dinner', '30 km', '1,400m', 'Full day',
    '["Bhaktapur Durbar Square", "Nyatapola Temple", "Patan Durbar Square", "Newari feast"]'::jsonb
FROM destinations WHERE name = 'Kathmandu Valley Cultural Tour' LIMIT 1;

INSERT INTO itinerary_templates (destination_id, day_number, title, location, activities, accommodation, meals, distance, elevation, duration, highlights)
SELECT id, 3, 'Pashupatinath and Boudhanath', 'Kathmandu',
    '["Breakfast at hotel", "Morning: Taxi to Pashupatinath Temple (NPR 400 from Thamel, 20 min)", "Pashupatinath entry: NPR 1000 for tourists (Nepali/SAARC free)", "Observe Hindu cremation ceremonies at the ghats along Bagmati River", "Walk through the temple complex - sadhus (holy men), shrines, deer park", "Visit the hilltop area - Gorakhnath Temple, ancient lingams", "Walk or taxi to Boudhanath Stupa (10 min, NPR 200)", "Boudhanath entry: NPR 400 tourist (Nepali free)", "Circumambulate the massive stupa clockwise - spin prayer wheels", "Explore surrounding Tibetan monasteries: Ka-Nying Shedrub Ling, Kopan vicinity", "Lunch at a rooftop restaurant overlooking the stupa (great momos!)", "Browse Tibetan handicraft shops: singing bowls, thangka paintings, prayer flags", "Evening: Attend butter lamp lighting ceremony at the stupa (5:00-6:00 PM)", "Return to Thamel (NPR 400 taxi or local bus from Chabahil)"]'::jsonb,
    'Hotel', 'Breakfast, Lunch, Dinner', '20 km', '1,400m', 'Full day',
    '["Pashupatinath cremation ghats", "Sadhus", "Boudhanath Stupa", "Tibetan monasteries"]'::jsonb
FROM destinations WHERE name = 'Kathmandu Valley Cultural Tour' LIMIT 1;

INSERT INTO itinerary_templates (destination_id, day_number, title, location, activities, accommodation, meals, distance, elevation, duration, highlights)
SELECT id, 4, 'Kathmandu Durbar Square and Departure', 'Kathmandu',
    '["Breakfast at hotel", "Walk to Kathmandu Durbar Square from Thamel (15 min walk)", "Entry: NPR 200 Nepali / NPR 1000 tourist", "Explore: Hanuman Dhoka Palace, Taleju Temple, Kal Bhairav statue", "See the Kumari Ghar - residence of the Living Goddess Kumari (may appear at window)", "Visit Kasthamandap - the wooden pavilion Kathmandu is named after", "Walk through Indra Chowk and Asan Tole - vibrant local markets", "Buy souvenirs: pashmina shawls, Kukri knives, singing bowls, thangka art", "Lunch at heritage restaurant (Krishnarpan or similar)", "Taxi to Tribhuvan Airport (NPR 600-800, 30 min)", "Departure"]'::jsonb,
    'Day use', 'Breakfast', '10 km', '1,400m', 'Half day',
    '["Kathmandu Durbar Square", "Living Goddess Kumari", "Souvenir shopping", "Departure"]'::jsonb
FROM destinations WHERE name = 'Kathmandu Valley Cultural Tour' LIMIT 1;

-- ========================================
-- WILDLIFE SAFARI ITINERARIES
-- ========================================

-- =========================
-- Chitwan National Park Safari (3 days)
-- =========================

INSERT INTO itinerary_templates (destination_id, day_number, title, location, activities, accommodation, meals, distance, elevation, duration, highlights)
SELECT id, 1, 'Travel to Chitwan, Evening Cultural Program', 'Chitwan',
    '["Option A: Tourist bus from Kathmandu Sorakhutte (NPR 600-800, 5-6 hrs, departs 7:00 AM)", "Option B: Private vehicle or jeep (NPR 8000-12000, 4-5 hrs)", "Option C: From Pokhara - bus from Prithvi Chowk (NPR 400-600, 4 hrs)", "Arrive at Sauraha (main tourist hub near Chitwan NP)", "Taxi or resort pickup from bus park to lodge (NPR 200-500)", "Check into jungle lodge/resort along Rapti River", "Lunch at lodge", "Afternoon: Walk through Sauraha village - Tharu houses with mud walls and thatched roofs", "Visit Tharu Cultural Museum (NPR 100)", "Evening: Cross the river to community hall for Tharu Stick Dance performance (NPR 500)", "Stunning traditional dance depicting hunting and farming", "Dinner at lodge - traditional Tharu food", "Night sounds: listen to jungle from your room"]'::jsonb,
    'Jungle Lodge', 'Lunch, Dinner', '180 km', '200m', '5-6 hours drive',
    '["Journey to the jungle", "Tharu village walk", "Tharu Stick Dance", "Rapti River sunset"]'::jsonb
FROM destinations WHERE name = 'Chitwan National Park Safari' LIMIT 1;

INSERT INTO itinerary_templates (destination_id, day_number, title, location, activities, accommodation, meals, distance, elevation, duration, highlights)
SELECT id, 2, 'Full Day Jungle Safari Activities', 'Chitwan',
    '["5:30 AM: Wake up for early morning bird watching walk along Rapti River", "Spot: kingfishers, hornbills, eagles, storks - 700+ bird species in the park", "Return for breakfast", "8:00 AM: Canoe ride on Rapti River (1 hour) - spot crocodiles (mugger and gharial), otters, water birds", "9:30 AM: Guided jungle walk (3-4 hours) with trained naturalist", "Walk through sal forest and grasslands - look for rhino, deer, wild boar", "Safety briefing: what to do if you encounter a rhino or sloth bear", "Lunch at lodge", "2:00 PM: Jeep safari into the park interior (3-4 hours, NPR 2500-4000)", "Spot: one-horned rhinoceros (almost guaranteed), spotted deer, sambar, monkeys", "Possible sighting: Bengal tiger, sloth bear, wild elephant (rare but possible)", "Visit elephant breeding center (NPR 200) - see baby elephants", "Return to lodge by sunset", "Evening: Wildlife documentary and discussion with naturalist", "Dinner at lodge"]'::jsonb,
    'Jungle Lodge', 'Breakfast, Lunch, Dinner', '20 km', '200m', 'Full day',
    '["Dawn bird watching", "Canoe safari - crocodiles", "Jungle walk - rhinos", "Jeep safari", "Elephant breeding center"]'::jsonb
FROM destinations WHERE name = 'Chitwan National Park Safari' LIMIT 1;

INSERT INTO itinerary_templates (destination_id, day_number, title, location, activities, accommodation, meals, distance, elevation, duration, highlights)
SELECT id, 3, 'Morning Safari and Return Journey', 'Chitwan',
    '["5:00 AM: Optional sunrise walk to Rapti River - mist over the river, bird calls", "Return for breakfast", "8:00 AM: Final jeep safari or elephant-back nature walk (2 hours)", "Last chance wildlife spotting", "Pack up and check out of lodge", "11:00 AM: Depart Sauraha", "Option A: Tourist bus to Kathmandu (5-6 hrs, NPR 600-800)", "Option B: Tourist bus to Pokhara (4 hrs, NPR 400-600)", "Option C: Private vehicle to Kathmandu/Pokhara", "Lunch en-route at a highway restaurant", "Arrive at destination by evening"]'::jsonb,
    'En-route', 'Breakfast, Lunch', '180 km', '200m', 'Half day safari + drive',
    '["Final safari", "Last wildlife sighting", "Return journey", "Trip completion"]'::jsonb
FROM destinations WHERE name = 'Chitwan National Park Safari' LIMIT 1;

-- ========================================
-- ONE-DAY ADVENTURE ITINERARIES
-- ========================================

-- =========================
-- Pokhara Paragliding (1 day)
-- =========================

INSERT INTO itinerary_templates (destination_id, day_number, title, location, activities, accommodation, meals, distance, elevation, duration, highlights)
SELECT id, 1, 'Paragliding Over Pokhara Valley', 'Pokhara',
    '["7:00 AM: Breakfast at your Lakeside hotel", "8:00 AM: Pickup from hotel by paragliding company vehicle", "8:30 AM: Drive up to Sarangkot launch site (30 min uphill drive, 1,592m)", "9:00 AM: Safety briefing by certified tandem pilot", "Gear up: harness, helmet, flight suit", "Wait for thermal conditions (wind and thermals must be right)", "9:30-10:30 AM: Launch! Running takeoff from the hillside", "Tandem flight: 30-45 minutes soaring over Pokhara Valley", "Aerial views: Phewa Lake below, Annapurna range, Machapuchare (Fishtail), Dhaulagiri", "Pilot performs acrobatic maneuvers on request (spirals, wing-overs)", "GoPro photos and video available (NPR 2000-3000 extra)", "Smooth landing at Lakeside landing zone near Phewa Lake", "11:30 AM: Free time - walk along Phewa Lake, visit Barahi Temple by boat", "1:00 PM: Lunch at Lakeside restaurant", "Afternoon options: Boating on Phewa Lake (NPR 500/hr), visit World Peace Pagoda (hike or taxi), explore Davis Falls (NPR 50-100) and Gupteshwor Cave (NPR 100)", "5:00 PM: Walk to Phewa Lake for sunset views", "Evening: Dinner at Lakeside - try the local fish from Phewa Lake"]'::jsonb,
    'Hotel', 'Breakfast', '15 km', '1,592m', '30-45 min flight',
    '["Tandem paragliding!", "Aerial Himalayan views", "Phewa Lake from above", "Sarangkot launch", "Lakeside afternoon"]'::jsonb
FROM destinations WHERE name = 'Pokhara Paragliding' LIMIT 1;

-- =========================
-- Bungee Jumping Bhote Koshi (1 day)
-- =========================

INSERT INTO itinerary_templates (destination_id, day_number, title, location, activities, accommodation, meals, distance, elevation, duration, highlights)
SELECT id, 1, 'Bungee Jump at The Last Resort', 'Sindhupalchok',
    '["6:00 AM: Early breakfast at Kathmandu hotel", "6:30 AM: Depart by bus/jeep from Kathmandu towards Kodari Highway (arranged by operator)", "Alternative: Public bus from Kathmandu Ratna Park bus stand to Barabise (NPR 300, then taxi)", "9:00 AM: Arrive at The Last Resort, Bhote Koshi gorge (3 hrs from Kathmandu)", "Cross the suspension bridge to the resort - 160m above the raging Bhote Koshi River", "Registration, weigh-in, and safety briefing", "Watch others jump first if you need courage!", "10:00-11:00 AM: Your turn - walk to the jump platform at the bridge center", "160m freefall bungee jump - one of the world''s highest!", "Freefall for 5-6 seconds before the cord catches you", "Bounce multiple times above the Bhote Koshi River", "Video and photos available (NPR 2000-3000)", "11:30 AM: Optional add-on: Canyon Swing (giant swing from the bridge, NPR 4000-6000)", "12:00 PM: Lunch at The Last Resort with stunning gorge views", "1:00 PM: Optional: Short hike along the Bhote Koshi gorge or relax at the resort", "2:00 PM: Depart for Kathmandu", "5:00 PM: Arrive back in Kathmandu", "Celebrate your achievement - you just did one of the world''s highest bungee jumps!"]'::jsonb,
    'Hotel', 'Breakfast', '85 km', '160m', 'Full day',
    '["160m bungee jump!", "Bhote Koshi gorge", "Canyon swing option", "Adrenaline rush"]'::jsonb
FROM destinations WHERE name = 'Bungee Jumping Bhote Koshi' LIMIT 1;

-- =========================
-- White Water Rafting Trishuli River (1 day)
-- =========================

INSERT INTO itinerary_templates (destination_id, day_number, title, location, activities, accommodation, meals, distance, elevation, duration, highlights)
SELECT id, 1, 'Trishuli River Rafting Adventure', 'Trishuli',
    '["6:30 AM: Breakfast at Kathmandu hotel", "7:00 AM: Pickup by rafting company bus from Thamel", "Drive along Prithvi Highway towards Pokhara (2.5-3 hours)", "10:00 AM: Arrive at put-in point near Charaudi/Kurintar", "Safety briefing: paddle commands, what to do if you fall out", "Gear up: life jacket, helmet, paddle, wetsuit (winter)", "11:00 AM: Launch! Start paddling into the Trishuli River", "Grade 3-4 rapids: Ladies Delight, Upset, Monsoon, Twin Rocks", "Professional river guide commands from the back of each raft", "Calm sections: swim in the warm river, enjoy cliffside views", "12:30 PM: Beach lunch on a sandy riverside bank - dal bhat and snacks", "1:30 PM: Continue rafting - afternoon rapids and calm stretches", "Pass through scenic gorge with jungle-covered hillsides", "3:00 PM: Take-out point at Fishling/Muglin", "Change into dry clothes", "3:30 PM: Board bus back to Kathmandu (3 hrs) or continue to Pokhara (3 hrs)", "Option: Combine with Chitwan trip - continue south to Chitwan NP from here", "6:30 PM: Arrive back in Kathmandu"]'::jsonb,
    'Hotel', 'Breakfast, Lunch', '75 km', '500m', 'Full day',
    '["Grade 3-4 rapids!", "Trishuli River adventure", "Beach lunch", "Professional guides", "Scenic gorge"]'::jsonb
FROM destinations WHERE name = 'White Water Rafting Trishuli River' LIMIT 1;

-- =========================
-- Everest Base Camp Helicopter Tour (1 day)
-- =========================

INSERT INTO itinerary_templates (destination_id, day_number, title, location, activities, accommodation, meals, distance, elevation, duration, highlights)
SELECT id, 1, 'Helicopter Tour to Everest Base Camp', 'Khumbu',
    '["5:00 AM: Early morning pickup from Kathmandu hotel", "5:30 AM: Arrive at Tribhuvan Airport domestic terminal", "6:00 AM: Board helicopter (typically 5-6 passengers per flight)", "Fly east along the Himalayan range - window seat guaranteed", "Aerial views of Langtang, Gaurishankar, and Khumbu peaks", "7:00 AM: Land at Lukla for refueling and passenger swap (if group sharing)", "Continue flying deeper into Khumbu valley", "Aerial views: Namche Bazaar, Tengboche Monastery, Ama Dablam", "7:30 AM: Land at Kala Patthar area or EBC viewpoint (5,545m)", "15-20 minutes on the ground: take photos with Everest, Lhotse, Nuptse backdrop", "Experience the thin air at 5,500m - stay close to helicopter", "8:00 AM: Fly to Hotel Everest View or Syangboche for breakfast", "Breakfast with panoramic Himalayan views (included in package)", "8:45 AM: Board helicopter for return to Kathmandu", "Scenic return flight along the range", "10:00 AM: Land at Tribhuvan Airport, transfer to hotel", "Rest of the day free: Explore Kathmandu, shopping, sightseeing", "You just saw Everest up close without 14 days of trekking!"]'::jsonb,
    'Hotel', 'Breakfast', NULL, '5,545m', '3-4 hours total',
    '["Everest up close!", "Kala Patthar landing", "Breakfast at Hotel Everest View", "Khumbu aerial views", "No trekking required"]'::jsonb
FROM destinations WHERE name = 'Everest Base Camp Helicopter Tour' LIMIT 1;

-- =========================
-- Rock Climbing Nagarjun (1 day)
-- =========================

INSERT INTO itinerary_templates (destination_id, day_number, title, location, activities, accommodation, meals, distance, elevation, duration, highlights)
SELECT id, 1, 'Rock Climbing at Nagarjun Forest', 'Kathmandu',
    '["7:00 AM: Breakfast at hotel", "8:00 AM: Taxi from Thamel to Nagarjun (Balaju entrance), 20 min, NPR 400", "Nagarjun National Park entry: NPR 100 Nepali / NPR 500 tourist", "Meet climbing instructor at the base", "8:30 AM: Warm-up exercises and safety briefing", "Gear fitting: climbing shoes, harness, helmet, belay device", "Learn basic techniques: foot placement, handholds, belaying", "9:30 AM: Start climbing on natural rock faces (limestone cliffs)", "Multiple routes for different skill levels: beginner to intermediate", "Top-rope climbing with experienced belayer", "Take breaks between climbs, enjoy forest setting", "12:00 PM: Packed lunch in the forest clearing", "1:00 PM: Afternoon climbing session - try harder routes", "Optional: Rappelling practice on the rock face", "3:00 PM: Short nature hike in Nagarjun forest - spot monkeys, birds", "4:00 PM: Pack up gear, group debrief", "Return to Thamel by taxi (NPR 400)", "Evening free"]'::jsonb,
    'Hotel', 'Breakfast, Lunch', '10 km', '1,400m', 'Full day',
    '["Natural rock climbing", "Forest setting", "All skill levels", "Nagarjun forest hike"]'::jsonb
FROM destinations WHERE name = 'Rock Climbing Nagarjun' LIMIT 1;

-- =========================
-- Canyoning Adventure Sundarijal (1 day)
-- =========================

INSERT INTO itinerary_templates (destination_id, day_number, title, location, activities, accommodation, meals, distance, elevation, duration, highlights)
SELECT id, 1, 'Canyoning at Sundarijal Waterfalls', 'Kathmandu',
    '["7:00 AM: Breakfast at hotel", "7:30 AM: Pickup from Thamel by operator vehicle", "8:15 AM: Arrive at Sundarijal (45 min drive from Thamel, NPR 300 if by local bus from Ratna Park)", "Enter Shivapuri National Park (NPR 100 Nepali / NPR 500 tourist)", "Meet canyoning guides, registration and waiver", "Gear up: wetsuit, helmet, harness, canyoning shoes", "9:00 AM: Safety briefing - rappelling technique, water entry, signals", "9:30 AM: Trek 30 minutes uphill to the top of the canyon", "Begin descent through the canyon: waterfall rappelling!", "Rappel down 3-4 waterfalls of varying heights (10-40m)", "Slide down natural water slides", "Jump into clear pools (optional, 2-5m jumps)", "Swim through narrow canyon sections", "12:00 PM: Reach the bottom - celebration!", "Lunch at a local restaurant in Sundarijal village", "1:30 PM: Optional short hike to Sundarijal waterfall viewpoint", "2:30 PM: Return to Kathmandu by operator vehicle or local bus (45 min)", "Afternoon free in Kathmandu"]'::jsonb,
    'Hotel', 'Breakfast, Lunch', '12 km', '1,450m', 'Full day',
    '["Waterfall rappelling!", "Natural water slides", "Canyon swimming", "Shivapuri forest"]'::jsonb
FROM destinations WHERE name = 'Canyoning Adventure Sundarijal' LIMIT 1;

-- =========================
-- Zip-lining Pokhara (1 day)
-- =========================

INSERT INTO itinerary_templates (destination_id, day_number, title, location, activities, accommodation, meals, distance, elevation, duration, highlights)
SELECT id, 1, 'Zip-Lining - One of World''s Steepest', 'Pokhara',
    '["7:30 AM: Breakfast at Lakeside hotel", "8:30 AM: Pickup from hotel by ZipFlyer operator vehicle", "9:00 AM: Drive to Sarangkot hilltop launch station (30 min)", "Registration, safety briefing, gear fitting: harness, gloves, helmet", "9:30 AM: Launch! Fly down the 1.8 km zipline at speeds up to 120 km/h", "500m vertical drop - one of the steepest and longest ziplines in the world", "Incredible views of Phewa Lake, Pokhara city, and Annapurna range during the ride", "Land at the base station in Hemja", "Collect your GoPro video (NPR 1500-2000)", "10:30 AM: Shuttle back to Lakeside (15 min)", "Rest of the day free in Pokhara:", "11:30 AM: Visit Davis Falls (Devi''s Fall) - waterfall disappearing underground (NPR 50/100)", "12:00 PM: Gupteshwor Cave right opposite - stalactite cave with underground waterfall (NPR 100)", "12:30 PM: Lunch at Lakeside restaurant", "2:00 PM: Boat ride on Phewa Lake to Barahi Temple island (NPR 500-800/hr)", "3:30 PM: Visit International Mountain Museum (NPR 100/500) - learn about Himalayan peaks", "5:00 PM: Walk along Lakeside Dam Side for sunset views", "Evening: Dinner at Lakeside"]'::jsonb,
    'Hotel', 'Breakfast', '15 km', '1,600m', 'Full day',
    '["World''s steepest zipline!", "120 km/h speed", "Phewa Lake aerial view", "Davis Falls", "Boat ride"]'::jsonb
FROM destinations WHERE name = 'Zip-lining Pokhara' LIMIT 1;

-- =========================
-- Ultralight Flight Pokhara (1 day)
-- =========================

INSERT INTO itinerary_templates (destination_id, day_number, title, location, activities, accommodation, meals, distance, elevation, duration, highlights)
SELECT id, 1, 'Ultralight Flight Over Annapurna Range', 'Pokhara',
    '["7:00 AM: Breakfast at Lakeside hotel", "8:00 AM: Taxi to Pokhara Airport area - Avia Club Nepal (NPR 200, 10 min from Lakeside)", "Registration and safety briefing", "Choose flight duration: 15 min (NPR 12000), 30 min (NPR 18000), or 60 min (NPR 30000)", "8:30 AM: Board the ultralight aircraft (open cockpit, 2-seater)", "Takeoff from Pokhara runway", "Fly over Phewa Lake, Begnas Lake, Rupa Lake", "Approach the Annapurna range: Machapuchare, Annapurna II, III, IV, Lamjung Himal", "Incredible mountain panorama from small aircraft - much closer than a normal plane", "Photo opportunities from open cockpit - pilot helps with camera angles", "Return and land at Pokhara Airport", "10:00 AM: Free for the rest of the day", "Visit World Peace Pagoda: Take a boat across Phewa Lake (NPR 400), then 30 min uphill hike", "Panoramic views from the Peace Pagoda of lake, city, and mountains", "Lunch at a lakeside restaurant", "Afternoon: Visit Seti River Gorge (free, near Mahendra Pool) - deep narrow canyon in the city", "Bindhyabasini Temple - oldest temple in Pokhara", "5:00 PM: Sunset boating on Phewa Lake", "Dinner at Lakeside"]'::jsonb,
    'Hotel', 'Breakfast', '30 km', '900m', '15-60 min flight',
    '["Open cockpit ultralight!", "Annapurna range close-up", "Phewa Lake from above", "World Peace Pagoda", "Seti Gorge"]'::jsonb
FROM destinations WHERE name = 'Ultralight Flight Pokhara' LIMIT 1;

-- =========================
-- Mountain Biking Kathmandu Valley (1 day)
-- =========================

INSERT INTO itinerary_templates (destination_id, day_number, title, location, activities, accommodation, meals, distance, elevation, duration, highlights)
SELECT id, 1, 'Mountain Biking Around Kathmandu Valley Rim', 'Kathmandu',
    '["6:30 AM: Breakfast at hotel", "7:00 AM: Meet guide at bike shop in Thamel - bike fitting and safety check", "Gear: mountain bike, helmet, gloves, water bottle", "7:30 AM: Ride through early morning Kathmandu streets (less traffic)", "Head north through Budhanilkantha to Shivapuri foothills", "Climb uphill through terraced farmland - switchback dirt roads", "10:00 AM: Reach the valley rim viewpoint - panoramic views of Kathmandu below", "Chai break at a local village tea house", "10:30 AM: Ride along the ridge trail through pine and rhododendron forest", "Spot monkeys, birds, butterflies in the forest", "12:00 PM: Descend to Nagarkot or Changunarayan area", "Lunch at a ridge-top restaurant with Himalayan views", "1:30 PM: Visit Changu Narayan Temple - oldest Hindu temple in the valley (UNESCO site)", "2:30 PM: Ride downhill through Bhaktapur outskirts", "Quick stop at Bhaktapur for juju dhau (king curd)", "3:30 PM: Ride back to Kathmandu via Thimi pottery village", "4:30 PM: Return bike at shop in Thamel", "Evening free"]'::jsonb,
    'Hotel', 'Breakfast, Lunch', '40 km', '1,600m', 'Full day',
    '["Valley rim ride", "Mountain views", "Changu Narayan Temple", "Village trails", "Bhaktapur detour"]'::jsonb
FROM destinations WHERE name = 'Mountain Biking Kathmandu Valley' LIMIT 1;

-- ========================================
-- ONE-DAY PILGRIMAGE ITINERARIES
-- ========================================

-- =========================
-- Pashupatinath Temple Tour (1 day)
-- =========================

INSERT INTO itinerary_templates (destination_id, day_number, title, location, activities, accommodation, meals, distance, elevation, duration, highlights)
SELECT id, 1, 'Pashupatinath Temple and Surrounding Shrines', 'Kathmandu',
    '["7:00 AM: Breakfast at hotel", "7:30 AM: Taxi from Thamel to Pashupatinath (NPR 400, 20 min) or local bus from Ratna Park (NPR 20)", "Arrive at Pashupatinath Temple complex - Nepal''s holiest Hindu temple (UNESCO site)", "Entry: Free for Nepali/SAARC, NPR 1000 for other tourists", "Non-Hindus cannot enter the main pagoda but can view everything else", "8:00 AM: Start at the main entrance - observe the golden pagoda and Nandi bull", "Walk along Bagmati River: Arya Ghat and Surya Ghat - cremation ceremonies", "Silently observe Hindu cremation rituals - a profound cultural experience", "Cross the bridge to the east bank - view the ghats from across the river", "9:00 AM: Explore the Pandra Shivalinga (15 Shiva lingams) along the river", "Climb the hill on east bank to Gorakhnath Temple complex", "See colorful sadhus (holy men) - many will pose for photos (small tip expected NPR 100-200)", "Visit the deer park and cremation-related shrines", "10:30 AM: Walk north to Guhyeshwari Temple (ancient tantric temple)", "11:00 AM: Walk or taxi to Boudhanath Stupa (10 min walk, NPR 200 taxi)", "Boudhanath entry: NPR 400 tourist / Free for Nepali", "Circumambulate the massive stupa, spin prayer wheels, visit monasteries", "12:30 PM: Lunch at a rooftop cafe overlooking Boudhanath - try Tibetan thukpa and momos", "Browse shops: singing bowls, prayer beads, thangka paintings", "2:00 PM: Optional - visit Kopan Monastery (20 min walk uphill) for meditation session", "3:30 PM: Return to Thamel by taxi (NPR 500) or local bus from Chabahil (NPR 25)", "Afternoon free: optional visit to Garden of Dreams in Thamel (NPR 200)"]'::jsonb,
    'Hotel', 'Breakfast', '10 km', '1,400m', 'Full day',
    '["Pashupatinath cremation ghats", "Sadhus", "Boudhanath Stupa", "Tibetan momos", "Spiritual immersion"]'::jsonb
FROM destinations WHERE name = 'Pashupatinath Temple Tour' LIMIT 1;

-- =========================
-- Swayambhunath Stupa Tour (1 day)
-- =========================

INSERT INTO itinerary_templates (destination_id, day_number, title, location, activities, accommodation, meals, distance, elevation, duration, highlights)
SELECT id, 1, 'Swayambhunath (Monkey Temple) and Surroundings', 'Kathmandu',
    '["7:00 AM: Breakfast at hotel", "7:30 AM: Walk from Thamel towards Swayambhunath (30 min walk through local streets) or taxi (NPR 300, 10 min)", "Arrive at the eastern staircase - the traditional entrance", "Climb 365 ancient stone steps through forest - watch for playful monkeys!", "Entry: NPR 200 for tourists / Free for Nepali", "Reach the top - the ancient Buddhist stupa with iconic Buddha eyes", "Walk clockwise around the stupa, spin brass prayer wheels", "Visit the small museums and temples in the complex", "Tibetan monastery inside the complex - may see monks chanting", "Hindu temples also present - Harati Devi (goddess of smallpox)", "9:00 AM: Panoramic view of entire Kathmandu Valley from the hilltop", "Photography time: stupa with Himalayan backdrop on clear mornings", "Walk down the western steps through the quieter side gardens", "10:00 AM: Walk or taxi to the nearby Natural History Museum (NPR 100)", "10:30 AM: Taxi to Kathmandu Durbar Square (NPR 300, 15 min)", "Entry: NPR 200 Nepali / NPR 1000 tourist", "Explore: Kumari Ghar (Living Goddess), Hanuman Dhoka, Taleju Temple", "12:00 PM: Walk through Asan Tole market - spices, vegetables, daily life", "Lunch at a heritage restaurant in the old city", "1:30 PM: Walk through Indra Chowk (bead market), Basantapur Square", "2:30 PM: Walk back to Thamel, explore shops for souvenirs", "Afternoon: Visit Garden of Dreams (NPR 200) - peaceful neo-classical garden in Thamel"]'::jsonb,
    'Hotel', 'Breakfast', '8 km', '1,400m', 'Full day',
    '["365 steps to stupa", "Monkey Temple", "Valley panorama", "Durbar Square", "Asan Tole market"]'::jsonb
FROM destinations WHERE name = 'Swayambhunath Stupa Tour' LIMIT 1;

-- =========================
-- Boudhanath Stupa Exploration (1 day)
-- =========================

INSERT INTO itinerary_templates (destination_id, day_number, title, location, activities, accommodation, meals, distance, elevation, duration, highlights)
SELECT id, 1, 'Boudhanath: Heart of Tibetan Buddhism in Nepal', 'Kathmandu',
    '["7:00 AM: Breakfast at hotel", "7:30 AM: Taxi from Thamel to Boudhanath (NPR 400, 25 min) or local bus from Ratna Park → Chabahil (NPR 25)", "Arrive at Boudhanath Stupa - one of the largest Buddhist stupas in the world (UNESCO)", "Entry: NPR 400 tourist / Free for Nepali", "8:00 AM: Morning kora (circumambulation) - walk clockwise with locals and monks", "Spin the large prayer wheels embedded in the base of the stupa", "Observe monks, nuns, and Tibetan devotees performing morning prayers", "9:00 AM: Visit Ka-Nying Shedrub Ling Monastery (White Monastery) on the north side", "See beautiful murals, prayer halls, and possibly observe monk debates", "10:00 AM: Visit Guru Lhakhang (Tamang Gompa) on the east side", "Explore Tibetan handicraft shops around the stupa: thangka paintings, singing bowls, prayer beads, ritual items", "11:00 AM: Climb to a rooftop cafe for aerial view of the stupa - great photos", "Lunch at one of the rooftop restaurants (try Tibetan thukpa, sha-phaley, momos)", "12:30 PM: Visit the Boudha area''s smaller monasteries and shops", "1:30 PM: Optional: Take taxi to Kopan Monastery (15 min, NPR 300) on the hilltop above Boudha", "Afternoon meditation session or garden walk at Kopan (check schedule)", "3:30 PM: Return to Boudhanath for the evening butter lamp ceremony", "Watch monks and devotees light hundreds of butter lamps as dusk falls", "5:00 PM: Return to Thamel by taxi (NPR 400) or local bus"]'::jsonb,
    'Hotel', 'Breakfast', '8 km', '1,400m', 'Full day',
    '["Boudhanath kora", "Tibetan monasteries", "Prayer wheels", "Butter lamp ceremony", "Thangka shopping"]'::jsonb
FROM destinations WHERE name = 'Boudhanath Stupa Exploration' LIMIT 1;

-- =========================
-- Manakamana Temple Tour (1 day)
-- =========================

INSERT INTO itinerary_templates (destination_id, day_number, title, location, activities, accommodation, meals, distance, elevation, duration, highlights)
SELECT id, 1, 'Cable Car to Manakamana Wish-Fulfilling Temple', 'Gorkha',
    '["6:00 AM: Breakfast at Kathmandu hotel", "6:30 AM: Depart by bus from Kathmandu New Bus Park/Gongabu (NPR 500-700, 3.5 hrs to Kurintar)", "Alternative: Private vehicle (NPR 6000-8000, 3 hrs via Prithvi Highway)", "9:30 AM: Arrive at Kurintar/Manakamana cable car station at the highway", "Buy cable car ticket: NPR 500 round trip Nepali / NPR 800 tourist", "10:00 AM: Board cable car (10 min ride up to 1,302m)", "Stunning views: terraced hillsides, Trishuli River gorge, distant Himalayas", "10:15 AM: Arrive at hilltop station, walk to Manakamana Temple (10 min)", "Visit the Bhagwati Temple - wish-fulfilling goddess", "Hindu devotees offer animal sacrifice (goats, pigeons) - be prepared for this", "Make your wish and offer prayers", "Walk around the temple complex - small shops selling puja items, flowers, coconuts", "Panoramic mountain views from the temple hilltop", "12:00 PM: Lunch at one of the hilltop restaurants - try local food with views", "Walk through the nearby Bakreshwor Mahadev Temple", "Optional: Short nature walk around the hilltop (30 min)", "1:30 PM: Cable car back down to Kurintar", "2:00 PM: Board return bus to Kathmandu (3.5 hrs)", "Alternative: Continue to Pokhara by bus (3 hrs from Kurintar)", "5:30 PM: Arrive Kathmandu"]'::jsonb,
    'Hotel', 'Breakfast, Lunch', '100 km', '1,302m', 'Full day',
    '["Manakamana cable car", "Wish-fulfilling temple", "Mountain panorama", "Hindu pilgrimage"]'::jsonb
FROM destinations WHERE name = 'Manakamana Temple Tour' LIMIT 1;

-- =========================
-- Dakshinkali Temple Tour (1 day)
-- =========================

INSERT INTO itinerary_templates (destination_id, day_number, title, location, activities, accommodation, meals, distance, elevation, duration, highlights)
SELECT id, 1, 'Dakshinkali Temple and Pharping Circuit', 'Kathmandu',
    '["7:00 AM: Breakfast at hotel (best to visit on Tuesday or Saturday - main sacrifice days)", "7:30 AM: Local bus from Ratna Park to Dakshinkali (NPR 50, 1.5 hrs) or taxi (NPR 1500, 45 min)", "Winding road through Kathmandu outskirts, Chapagaon, and forested hills", "9:00 AM: Arrive at Dakshinkali Temple (southern edge of Kathmandu Valley)", "Free entry for all nationalities", "Dedicated to Goddess Kali - one of the most important Tantric temples in Nepal", "Observe animal sacrifice rituals (goats, roosters) - culturally significant Hindu practice", "Walk along the riverside shrine area", "10:00 AM: Short walk to the picnic area above the temple - local families gather here", "10:30 AM: Drive/walk to nearby Pharping (2 km)", "Visit Pharping village - important Buddhist pilgrimage site", "Guru Rinpoche (Padmasambhava) cave - where Buddhism is said to have entered Tibet", "Visit Dakshinkali Vajrayogini Temple", "See the self-arising Ganesh and Tara images in the rock", "12:00 PM: Lunch at a local restaurant in Pharping or at the Dakshinkali picnic area", "1:00 PM: Visit Sheshnarayan (Vishnu temple) nearby - beautiful forest setting", "2:00 PM: Return to Kathmandu", "Optional stop: Kirtipur ancient Newari town on the way back (30 min detour)", "Explore Kirtipur: Bagh Bhairav Temple, Uma Maheshwar Temple, Newari streets", "4:00 PM: Back in Kathmandu"]'::jsonb,
    'Hotel', 'Breakfast, Lunch', '22 km', '1,400m', 'Full day',
    '["Dakshinkali Kali temple", "Animal sacrifice ritual", "Pharping Buddhist caves", "Guru Rinpoche cave"]'::jsonb
FROM destinations WHERE name = 'Dakshinkali Temple Tour' LIMIT 1;

-- ========================================
-- ONE-DAY CULTURAL ITINERARIES
-- ========================================

-- =========================
-- Bhaktapur Heritage Walk (1 day)
-- =========================

INSERT INTO itinerary_templates (destination_id, day_number, title, location, activities, accommodation, meals, distance, elevation, duration, highlights)
SELECT id, 1, 'Bhaktapur - The City of Devotees', 'Kathmandu Valley',
    '["7:00 AM: Breakfast at hotel", "7:30 AM: Local bus from Ratna Park/Kamal Pokhari to Bhaktapur (NPR 30-40, 45 min) or taxi (NPR 800, 30 min)", "8:15 AM: Enter through Bhaktapur gate", "Entry: NPR 500 Nepali / NPR 1800 tourist (ticket valid for 1 week)", "8:30 AM: Start at Bhaktapur Durbar Square", "55-Window Palace - stunning carved wooden windows", "Golden Gate (Sundhoka) - finest piece of art in the valley", "Vatsala Temple with the famous Big Bell", "Statue of Bhupatindra Malla on stone pillar", "9:30 AM: Walk to Taumadhi Square", "Nyatapola Temple - five-storey pagoda, tallest in Nepal (30m)", "Bhairavnath Temple opposite - fierce deity masks", "10:30 AM: Walk to Pottery Square (Tachupal Tole)", "Watch potters working on traditional wheels, making pots by hand", "Buy handmade pottery as souvenirs (NPR 200-1000)", "Walk through narrow medieval lanes with carved wooden buildings", "11:30 AM: Dattatreya Square", "Dattatreya Temple - oldest surviving temple in the area", "Peacock Window (Pujari Math) - most photographed window in Nepal", "Woodcarving Museum (NPR 50/100)", "12:30 PM: Lunch - MUST try juju dhau (king curd) and Newari feast: bara, choyla, chatamari", "Try local Aila (rice liquor) and tongba if adventurous", "1:30 PM: Walk to Suryamadhi area - less touristy, authentic neighborhood life", "Visit Bhaktapur''s local temples and bahals (courtyards)", "2:30 PM: Visit Changu Narayan if time permits (7 km, taxi NPR 400) - oldest Hindu temple in Nepal", "4:00 PM: Return bus or taxi to Kathmandu", "Evening free in Thamel"]'::jsonb,
    'Hotel', 'Breakfast, Lunch', '15 km', '1,400m', 'Full day',
    '["55-Window Palace", "Nyatapola Temple", "Pottery Square", "Juju Dhau", "Peacock Window"]'::jsonb
FROM destinations WHERE name = 'Bhaktapur Heritage Walk' LIMIT 1;

-- =========================
-- Patan Cultural Tour (1 day)
-- =========================

INSERT INTO itinerary_templates (destination_id, day_number, title, location, activities, accommodation, meals, distance, elevation, duration, highlights)
SELECT id, 1, 'Patan - The City of Fine Arts', 'Kathmandu Valley',
    '["7:30 AM: Breakfast at hotel", "8:00 AM: Taxi from Thamel to Patan Durbar Square (NPR 500, 25 min) or local bus from Ratna Park (NPR 25)", "Cross Bagmati River bridge - Patan (Lalitpur) is just south of Kathmandu", "8:30 AM: Enter Patan Durbar Square", "Entry: NPR 250 Nepali / NPR 1000 tourist", "Krishna Temple - stone temple with scenes from Mahabharata", "Bhimsen Temple - three-storey temple to the god of traders", "Manga Hiti - intricately carved sunken water spout (6th century)", "Visit Patan Museum - inside the old palace, finest museum in Nepal (NPR 250/500)", "Exquisite collection of bronzes, stone sculptures, and woodcarvings", "10:30 AM: Walk to Golden Temple (Hiranya Varna Mahavihar) - 5 min from Durbar Square", "Entry: NPR 50 - stunning golden-roofed Buddhist monastery", "See unique tradition: 12-year-old boy serves as temporary monk", "11:00 AM: Walk to Mahabouddha Temple (Temple of 1000 Buddhas)", "Terracotta temple covered with Buddha images - hidden in narrow lanes", "11:30 AM: Explore Patan''s metalwork and handicraft shops", "Patan is Nepal''s center for fine metalwork, especially Buddhist statues", "Watch artisans at work in their workshops (Mahabouddha area)", "12:30 PM: Lunch at a courtyard restaurant - try Newari thali set", "1:30 PM: Walk south to Ashoka Stupa (one of four in Patan, built ~250 BC)", "2:00 PM: Visit Rudra Varna Mahavihar - ancient Buddhist monastery with courtyard", "3:00 PM: Walk through Nakabahil and Swotha areas - traditional Newari neighborhoods", "See local life: spice grinding, basket weaving, children playing in courtyards", "4:00 PM: Return to Kathmandu by taxi or local bus"]'::jsonb,
    'Hotel', 'Breakfast, Lunch', '12 km', '1,300m', 'Full day',
    '["Patan Durbar Square", "Patan Museum", "Golden Temple", "Temple of 1000 Buddhas", "Metalwork artisans"]'::jsonb
FROM destinations WHERE name = 'Patan Cultural Tour' LIMIT 1;

-- =========================
-- Bandipur Village Tour (1 day)
-- =========================

INSERT INTO itinerary_templates (destination_id, day_number, title, location, activities, accommodation, meals, distance, elevation, duration, highlights)
SELECT id, 1, 'Bandipur - Preserved Hilltop Newari Village', 'Tanahu',
    '["5:30 AM: Breakfast at Kathmandu hotel", "6:00 AM: Board bus from New Bus Park/Gongabu to Dumre (NPR 500-700, 4.5 hrs on Prithvi Highway)", "Alternative: Private vehicle (3.5 hrs to Dumre)", "10:30 AM: Arrive at Dumre (highway junction)", "Take local jeep or bus from Dumre up to Bandipur (30 min, steep winding road, NPR 150)", "11:00 AM: Arrive at Bandipur - a perfectly preserved hilltop Newari bazaar town", "No vehicles allowed in the main bazaar - walk along the stone-paved pedestrian street", "Admire traditional Newari shophouses with carved wooden windows and balconies", "Visit Bindabasini Temple at the north end of the bazaar", "11:30 AM: Walk to Tundikhel - the open meadow with panoramic Himalayan views", "On clear days: see Dhaulagiri, Annapurna, Manaslu, Ganesh Himal, Langtang", "One of the best mountain panoramas in Nepal without trekking", "12:30 PM: Lunch at Old Inn or local restaurant - traditional food with mountain views", "1:30 PM: Walk to Siddha Gufa (Siddha Cave) - 30 min downhill walk", "One of the largest caves in Nepal - explore with a flashlight", "Bats, stalactites, underground streams", "3:00 PM: Return to Bandipur bazaar", "Optional: Walk up to Thani Mai Temple viewpoint above town", "Buy local honey, organic coffee, or handwoven textiles", "4:00 PM: Jeep down to Dumre, catch bus to Kathmandu (4.5 hrs) or continue to Pokhara (2.5 hrs)", "Bandipur also makes a great overnight stop between Kathmandu and Pokhara"]'::jsonb,
    'Hotel', 'Breakfast, Lunch', '140 km', '1,030m', 'Full day (long day trip)',
    '["Preserved Newari bazaar", "Himalayan panorama from Tundikhel", "Siddha Cave", "Pedestrian village", "No vehicles"]'::jsonb
FROM destinations WHERE name = 'Bandipur Village Tour' LIMIT 1;

-- =========================
-- Gorkha Palace and Museum (1 day)
-- =========================

INSERT INTO itinerary_templates (destination_id, day_number, title, location, activities, accommodation, meals, distance, elevation, duration, highlights)
SELECT id, 1, 'Gorkha - Birthplace of Modern Nepal', 'Gorkha',
    '["6:00 AM: Breakfast at Kathmandu hotel", "6:30 AM: Board bus from New Bus Park to Gorkha (NPR 400-600, 4-5 hrs via Prithvi Highway then Abu Khaireni)", "Alternative: Private vehicle (3.5 hrs)", "11:00 AM: Arrive at Gorkha bazaar town", "Walk through the town - historic gateway where Prithvi Narayan Shah unified Nepal", "11:30 AM: Begin the 30-minute uphill hike to Gorkha Durbar (palace fortress)", "Steep stone steps through forest - the palace sits on a ridge at 1,140m", "12:00 PM: Reach Gorkha Durbar - formidable medieval hilltop palace", "Entry: NPR 100 Nepali / NPR 300 tourist", "Non-Hindus cannot enter the Kalika Temple inside", "Walk around the palace complex - impressive stone and woodwork", "Visit Gorakhnath Cave behind the palace - the spiritual foundation of the Gorkha dynasty", "Panoramic views: Manaslu (8,163m), Himalchuli, Ganesh Himal", "Views of the entire Gorkha valley below", "1:00 PM: Descend back to town for lunch at a local restaurant", "2:00 PM: Visit the Gorkha Museum (free/nominal entry) - history of the Shah dynasty", "Weapons, documents, and artifacts from the unification era", "2:45 PM: Walk through old Gorkha bazaar - traditional architecture", "3:30 PM: Board return bus to Kathmandu", "Alternative: Continue to Bandipur (1 hr) or Pokhara (3 hrs)", "7:30 PM: Arrive Kathmandu"]'::jsonb,
    'Hotel', 'Breakfast, Lunch', '140 km', '1,140m', 'Full day (long day trip)',
    '["Gorkha Durbar palace", "Birthplace of Prithvi Narayan Shah", "Manaslu views", "Gorakhnath Cave"]'::jsonb
FROM destinations WHERE name = 'Gorkha Palace and Museum' LIMIT 1;

-- =========================
-- Shivapuri Nagarjun National Park Wildlife (1 day)
-- =========================

INSERT INTO itinerary_templates (destination_id, day_number, title, location, activities, accommodation, meals, distance, elevation, duration, highlights)
SELECT id, 1, 'Shivapuri Day Hike and Wildlife Spotting', 'Kathmandu',
    '["6:00 AM: Early breakfast at hotel", "6:30 AM: Taxi from Thamel to Budhanilkantha (NPR 500, 30 min) or to Sundarijal gate (NPR 600, 40 min)", "Alternative: Local bus from Ratna Park to Budhanilkantha (NPR 30, 45 min)", "7:00 AM: Enter Shivapuri Nagarjun National Park at Budhanilkantha gate", "Entry: NPR 100 Nepali / NPR 500 tourist", "Begin the hike uphill through mixed forest: oak, rhododendron, maple, pine", "Keep eyes open for: leopard tracks, Himalayan black bear signs, barking deer, langur monkeys", "Excellent bird watching: over 300 species recorded", "Look for: sunbirds, minivets, laughingthrushes, forktails near streams", "9:30 AM: Reach viewpoint areas - Kathmandu Valley spread below", "Continue up towards Shivapuri Peak (2,563m) - 3-4 hours from gate", "11:00 AM: Reach Shivapuri Peak or Nagi Gompa (Buddhist nunnery at 2,100m)", "360° views from the peak: Langtang, Ganesh Himal, Gaurishankar on clear days", "12:00 PM: Packed lunch at the peak or Nagi Gompa", "Visit Nagi Gompa if on that route - peaceful nunnery in the forest", "1:00 PM: Begin descent - different route if possible (loop trail)", "Spot wildlife more actively in the afternoon", "3:00 PM: Reach Budhanilkantha", "Visit Budhanilkantha Temple - reclining Vishnu statue in water (free entry)", "3:30 PM: Taxi or bus back to Thamel", "Rest of afternoon free"]'::jsonb,
    'Hotel', 'Breakfast, Lunch', '15 km', '2,563m', 'Full day',
    '["Shivapuri Peak hike", "Bird watching", "Leopard habitat", "Nagi Gompa nunnery", "Valley panorama"]'::jsonb
FROM destinations WHERE name = 'Shivapuri Nagarjun National Park' LIMIT 1;

-- ========================================
-- MUKTINATH PILGRIMAGE TOUR (7 days)
-- ========================================

INSERT INTO itinerary_templates (destination_id, day_number, title, location, activities, accommodation, meals, distance, elevation, duration, highlights)
SELECT id, 1, 'Travel to Pokhara', 'Pokhara',
    '["Option A: Tourist bus from Kathmandu Sorakhutte (NPR 800-1200, 7 hrs, departs 7:00 AM)", "Option B: Micro-bus from Kalanki (NPR 1000-1500, 6 hrs)", "Option C: Flight (25 min, NPR 4000-8000)", "Arrive Pokhara, taxi from bus park to Lakeside (NPR 300-500)", "Check into hotel at Lakeside", "Afternoon: Walk along Phewa Lake, boat to Barahi Temple island", "Visit World Peace Pagoda if time permits (boat + hike)", "Evening: Dinner at Lakeside, early sleep for long drive tomorrow"]'::jsonb,
    'Hotel', 'Lunch, Dinner', '200 km', '822m', '6-7 hours',
    '["Journey to Pokhara", "Lake Phewa", "Lakeside evening", "Trip preparation"]'::jsonb
FROM destinations WHERE name = 'Muktinath Pilgrimage Tour' LIMIT 1;

INSERT INTO itinerary_templates (destination_id, day_number, title, location, activities, accommodation, meals, distance, elevation, duration, highlights)
SELECT id, 2, 'Drive to Jomsom via Kali Gandaki', 'Jomsom',
    '["5:30 AM: Early breakfast at Pokhara hotel", "6:00 AM: Board jeep or bus from Pokhara bus park to Jomsom (NPR 1200-2000)", "Drive through Beni (stop for tea), Tatopani, Dana, Ghasa", "Pass through the deepest gorge in the world: Kali Gandaki (between Dhaulagiri 8,167m and Annapurna 8,091m)", "Incredible varied landscape: subtropical → temperate → arid desert", "Stop at scenic points for photos", "2:00 PM: Arrive at Jomsom (2,720m) - wind-swept town in the Mustang valley", "Check into hotel", "Afternoon: Walk along the Kali Gandaki riverbed - flat stones everywhere", "Collect ammonite fossils (shaligram) - 140-million-year-old marine fossils!", "Visit small Jomsom market", "Evening: Dinner at hotel - try apple brandy (Jomsom is famous for apples)"]'::jsonb,
    'Hotel', 'Breakfast, Lunch, Dinner', '150 km', '2,720m', '8-9 hours',
    '["Kali Gandaki deepest gorge", "Changing landscapes", "Ammonite fossils", "Apple country"]'::jsonb
FROM destinations WHERE name = 'Muktinath Pilgrimage Tour' LIMIT 1;

INSERT INTO itinerary_templates (destination_id, day_number, title, location, activities, accommodation, meals, distance, elevation, duration, highlights)
SELECT id, 3, 'Muktinath Temple Visit', 'Muktinath',
    '["7:00 AM: Breakfast at Jomsom hotel", "7:30 AM: Jeep or pony ride from Jomsom to Muktinath (1.5 hrs, NPR 1500-3000 by jeep)", "Alternative: Trek from Jomsom via Kagbeni to Muktinath (6-7 hours walk)", "Pass through Eklebhatti village", "Arrive at Ranipauwa/Muktinath village (3,800m)", "Walk to Muktinath Temple (Chumig Gyatsa in Tibetan) - 15 min uphill", "Entry: Free (donations welcome)", "Sacred to both Hindus (Lord Vishnu) and Buddhists (Guru Rinpoche)", "Ritual bath under 108 stone water spouts (bring change of clothes!)", "Water is icy cold but spiritually cleansing - each spout has a name", "Visit the eternal flame: natural gas flame burning behind a small waterfall", "This is what makes it mukti (liberation) nath (god) - fire, water, earth, air together", "Prayers and offerings at the main temple", "Walk around the temple complex: Jwala Mai temple with the eternal flame", "Visit the nearby Buddhist monastery", "Lunch at Ranipauwa with incredible mountain views - Dhaulagiri dominates", "Afternoon: Return to Jomsom by jeep or walk", "Evening: Celebrate the pilgrimage at Jomsom hotel"]'::jsonb,
    'Hotel', 'Breakfast, Lunch, Dinner', '40 km', '3,800m', 'Full day',
    '["Muktinath Temple!", "108 water spouts ritual bath", "Eternal flame", "Hindu-Buddhist sacred site", "Mountain panorama"]'::jsonb
FROM destinations WHERE name = 'Muktinath Pilgrimage Tour' LIMIT 1;

INSERT INTO itinerary_templates (destination_id, day_number, title, location, activities, accommodation, meals, distance, elevation, duration, highlights)
SELECT id, 4, 'Explore Kagbeni and Surroundings', 'Jomsom',
    '["8:00 AM: Breakfast at hotel", "8:30 AM: Walk or jeep to Kagbeni (1.5 hrs walk, 30 min jeep, NPR 500)", "Kagbeni - ancient medieval village at the gateway to Upper Mustang", "Wander through narrow mud-walled alleys", "Visit Kagbeni Gompa (Buddhist monastery) - 500+ years old", "See the red-walled fortress-like buildings", "View of the barren Mustang landscape to the north", "This is the checkpoint to Upper Mustang (restricted area, special permit needed)", "11:00 AM: Tea and apple pie at a Kagbeni cafe", "Walk back to Jomsom along the Kali Gandaki riverbed (afternoon winds!)", "Look for more ammonite fossils", "Afternoon free in Jomsom: explore the airport, market, apple orchards", "Visit Eco Museum if open", "Evening: Dinner at hotel"]'::jsonb,
    'Hotel', 'Breakfast, Lunch, Dinner', '20 km', '2,804m', 'Half day',
    '["Medieval Kagbeni village", "Ancient monastery", "Upper Mustang gateway", "Apple pie!", "Desert landscape"]'::jsonb
FROM destinations WHERE name = 'Muktinath Pilgrimage Tour' LIMIT 1;

INSERT INTO itinerary_templates (destination_id, day_number, title, location, activities, accommodation, meals, distance, elevation, duration, highlights)
SELECT id, 5, 'Return to Pokhara', 'Pokhara',
    '["7:00 AM: Breakfast at hotel", "7:30 AM: Board jeep from Jomsom to Pokhara (NPR 1200-2000, 8-9 hrs)", "Alternative: Fly from Jomsom to Pokhara (20 min, NPR 4000-6000 - weather dependent)", "Retrace the Kali Gandaki route with different light and perspective", "Lunch stop at Tatopani (natural hot springs if time permits, NPR 100)", "Continue through Beni to Pokhara", "4:00 PM: Arrive Pokhara Lakeside", "Check into hotel", "Relax: massage, hot shower after days in the mountains", "Evening: Lakeside dinner - celebrate the pilgrimage completion"]'::jsonb,
    'Hotel', 'Breakfast, Lunch, Dinner', '150 km', '822m', '8-9 hours',
    '["Return journey", "Tatopani hot springs", "Kali Gandaki re-visit", "Pokhara rest"]'::jsonb
FROM destinations WHERE name = 'Muktinath Pilgrimage Tour' LIMIT 1;

INSERT INTO itinerary_templates (destination_id, day_number, title, location, activities, accommodation, meals, distance, elevation, duration, highlights)
SELECT id, 6, 'Pokhara Sightseeing', 'Pokhara',
    '["5:00 AM: Taxi to Sarangkot viewpoint (NPR 500, 30 min)", "Watch sunrise over Annapurna range, Machapuchare, Dhaulagiri - unforgettable!", "Return to hotel for breakfast", "9:00 AM: Visit Davis Falls (Devi''s Fall) - waterfall disappearing underground (NPR 50/100)", "Walk across to Gupteshwor Cave - stalactite cave with underground waterfall (NPR 100)", "10:30 AM: Visit Seti River Gorge at Mahendra Pool - deep, narrow canyon in the city center", "11:00 AM: International Mountain Museum (NPR 100/500) - exhibits on all 8,000m peaks", "12:30 PM: Lunch at Lakeside", "2:00 PM: Hire a boat on Phewa Lake (NPR 500-800/hr)", "Row to Barahi Temple island in the middle of the lake", "Continue to the far shore, hike up to World Peace Pagoda (30-45 min)", "Panoramic views from the stupa - lake + city + mountains", "4:00 PM: Return by boat", "5:00 PM: Walk along Lakeside, browse shops", "Evening: Farewell dinner at a terrace restaurant"]'::jsonb,
    'Hotel', 'Breakfast, Lunch, Dinner', '40 km', '822m', 'Full day',
    '["Sarangkot sunrise!", "Davis Falls and cave", "Phewa Lake boating", "World Peace Pagoda"]'::jsonb
FROM destinations WHERE name = 'Muktinath Pilgrimage Tour' LIMIT 1;

INSERT INTO itinerary_templates (destination_id, day_number, title, location, activities, accommodation, meals, distance, elevation, duration, highlights)
SELECT id, 7, 'Return to Kathmandu', 'Kathmandu',
    '["7:00 AM: Breakfast at hotel", "Option A: Tourist bus to Kathmandu (NPR 800-1200, 7 hrs, departs 7:30 AM)", "Option B: Flight to Kathmandu (25 min, NPR 4000-8000)", "Free morning in Pokhara if taking afternoon bus: Phewa Lake walk, last-minute shopping", "Arrive Kathmandu", "Hotel check-in at Thamel", "Farewell dinner", "Pilgrimage complete!"]'::jsonb,
    'Hotel', 'Breakfast, Dinner', '200 km', '1,400m', '6-7 hours',
    '["Return journey", "Pilgrimage completion", "Final farewell"]'::jsonb
FROM destinations WHERE name = 'Muktinath Pilgrimage Tour' LIMIT 1;

-- ========================================
-- POON HILL TREK (5 days)
-- ========================================

INSERT INTO itinerary_templates (destination_id, day_number, title, location, activities, accommodation, meals, distance, elevation, duration, highlights)
SELECT id, 1, 'Drive to Nayapul, Trek to Tikhedhunga', 'Tikhedhunga',
    '["6:00 AM: Breakfast at Pokhara hotel (or arrive Pokhara from Kathmandu a day before)", "7:00 AM: Jeep/bus from Pokhara to Nayapul (1.5 hrs, NPR 300-500)", "Register at ACAP checkpoint in Birethanti", "Cross suspension bridge and begin trek along Modi Khola", "Walk through Sudame, Hile villages on gentle trail", "Arrive Tikhedhunga by afternoon", "Settle into tea house, explore village", "Early dinner and sleep"]'::jsonb,
    'Tea house', 'Breakfast, Lunch, Dinner', '6 km', '1,540m', '3-4 hours',
    '["Trek begins", "Modi Khola valley", "Gurung villages", "Tea house experience"]'::jsonb
FROM destinations WHERE name = 'Poon Hill Trek' LIMIT 1;

INSERT INTO itinerary_templates (destination_id, day_number, title, location, activities, accommodation, meals, distance, elevation, duration, highlights)
SELECT id, 2, 'Trek to Ghorepani via Ulleri', 'Ghorepani',
    '["Early breakfast", "Tackle the famous Ulleri stone staircase - 3,700 steps uphill", "2-hour steep climb to Ulleri village (2,070m) - incredible views behind you", "Continue through rhododendron forest (stunning blooms March-April)", "Pass Nangethanti and Banthanti", "Arrive Ghorepani (2,860m) by mid-afternoon", "Sunset views of Dhaulagiri from village edge", "Hot dinner, prepare for 4:30 AM start tomorrow"]'::jsonb,
    'Tea house', 'Breakfast, Lunch, Dinner', '11 km', '2,860m', '6-7 hours',
    '["Ulleri stone staircase", "Rhododendron forest", "Dhaulagiri sunset", "Ghorepani village"]'::jsonb
FROM destinations WHERE name = 'Poon Hill Trek' LIMIT 1;

INSERT INTO itinerary_templates (destination_id, day_number, title, location, activities, accommodation, meals, distance, elevation, duration, highlights)
SELECT id, 3, 'Poon Hill Sunrise, Trek to Tadapani', 'Tadapani',
    '["4:30 AM: Climb to Poon Hill (3,210m) with headlamp - 45 min steep climb", "Watch sunrise paint the Himalayas golden: Dhaulagiri, Annapurna South, Machapuchare, Annapurna I", "This is the highlight of the entire trek!", "Return to Ghorepani for breakfast", "Trek through forest to Tadapani (2,630m)", "Arrive by afternoon, rest with Machapuchare views"]'::jsonb,
    'Tea house', 'Breakfast, Lunch, Dinner', '12 km', '2,630m', '6-7 hours',
    '["Poon Hill sunrise!", "Himalayan panorama", "Machapuchare views", "Forest trail"]'::jsonb
FROM destinations WHERE name = 'Poon Hill Trek' LIMIT 1;

INSERT INTO itinerary_templates (destination_id, day_number, title, location, activities, accommodation, meals, distance, elevation, duration, highlights)
SELECT id, 4, 'Trek to Ghandruk', 'Ghandruk',
    '["Breakfast at Tadapani", "Descend through forest", "Arrive at Ghandruk - classic Gurung village (1,940m)", "One of the most beautiful villages in Nepal", "Stone houses, slate roofs, cobblestone paths", "Visit the Gurung Museum and old monastery", "Spectacular Annapurna South and Machapuchare views", "Afternoon free: explore the village, talk to locals"]'::jsonb,
    'Tea house', 'Breakfast, Lunch, Dinner', '7 km', '1,940m', '3-4 hours',
    '["Ghandruk Gurung village", "Mountain views", "Gurung Museum", "Traditional architecture"]'::jsonb
FROM destinations WHERE name = 'Poon Hill Trek' LIMIT 1;

INSERT INTO itinerary_templates (destination_id, day_number, title, location, activities, accommodation, meals, distance, elevation, duration, highlights)
SELECT id, 5, 'Trek to Nayapul, Drive to Pokhara', 'Pokhara',
    '["Breakfast with mountain views", "Descend stone steps from Ghandruk to Kimche or Nayapul", "Short drive from Kimche to Nayapul if taking the shorter route", "ACAP check-out at Birethanti", "Jeep or bus from Nayapul to Pokhara (1.5 hrs, NPR 300-500)", "Arrive Pokhara Lakeside", "Hot shower and clean clothes!", "Celebration lunch", "Afternoon free: boating, shopping, massage", "Connect to Kathmandu bus (7 hrs) or flight (25 min) if departing today"]'::jsonb,
    'Hotel', 'Breakfast, Lunch', '10 km', '822m', '4-5 hours + drive',
    '["Trek completion!", "Return to Pokhara", "Celebration", "Lakeside comfort"]'::jsonb
FROM destinations WHERE name = 'Poon Hill Trek' LIMIT 1;

-- ========================================
-- LUMBINI BUDDHIST PILGRIMAGE (2 days)
-- ========================================

INSERT INTO itinerary_templates (destination_id, day_number, title, location, activities, accommodation, meals, distance, elevation, duration, highlights)
SELECT id, 1, 'Travel to Lumbini, Explore Sacred Garden', 'Lumbini',
    '["6:00 AM: Breakfast at Kathmandu hotel", "Option A: Domestic flight to Bhairahawa/Siddharthanagar (35 min, NPR 5000-8000), then taxi to Lumbini (22 km, NPR 1000, 30 min)", "Option B: Tourist bus to Bhairahawa (NPR 800-1200, 8-9 hrs via Mugling-Narayanghat), then taxi/bus to Lumbini", "Option C: Private vehicle direct to Lumbini (7-8 hrs)", "Arrive Lumbini by early afternoon", "Check into hotel near the sacred garden", "2:00 PM: Enter Lumbini Sacred Garden (no entry fee)", "Visit Maya Devi Temple - exact birthplace of Lord Buddha (563 BC)", "See the marker stone indicating the exact birth spot", "Sacred bathing pool (Puskarini) where Maya Devi bathed before giving birth", "Ashoka Pillar (249 BC) - the oldest known inscription in Nepal", "Walk through the ancient ruins in the Sacred Garden", "4:00 PM: Rent a bicycle (NPR 300-500/day) or take a rickshaw to explore", "Visit monasteries in the East Monastic Zone:", "Myanmar Golden Temple, Royal Thai Monastery, Chinese Zhong Hua Monastery", "5:30 PM: Walk to World Peace Flame - eternal peace flame", "Evening meditation at one of the monastery gardens", "Dinner at hotel"]'::jsonb,
    'Hotel', 'Lunch, Dinner', '280 km', '150m', '7-8 hours travel + half day exploring',
    '["Maya Devi Temple - Buddha''s birthplace", "Ashoka Pillar", "Sacred bathing pool", "International monasteries"]'::jsonb
FROM destinations WHERE name = 'Lumbini Buddhist Pilgrimage' LIMIT 1;

INSERT INTO itinerary_templates (destination_id, day_number, title, location, activities, accommodation, meals, distance, elevation, duration, highlights)
SELECT id, 2, 'Full Lumbini Exploration and Return', 'Lumbini',
    '["6:00 AM: Early morning meditation at the Sacred Garden (most peaceful time)", "Breakfast at hotel", "8:00 AM: Visit West Monastic Zone by bicycle:", "Korean Dae Sung Shakya Temple, German Lumbini International Research Institute", "Vietnam Phat Quoc Tu, France Namo Buddha Vihara", "Cambodia, India, and Nepal temples", "Each monastery represents its country''s unique Buddhist architecture", "10:30 AM: Visit Lumbini Museum (NPR 50/200) - artifacts, photos, historical context", "11:00 AM: Walk to Lumbini Crane Sanctuary (winter months) - endangered sarus cranes", "11:30 AM: Visit the World Peace Pagoda (Japanese-built white stupa)", "12:00 PM: Lunch near the canal area", "1:00 PM: Final visit to Sacred Garden - quiet contemplation at Maya Devi Temple", "2:00 PM: Depart for return journey", "Option A: Taxi to Bhairahawa, flight to Kathmandu", "Option B: Bus from Bhairahawa to Kathmandu (8-9 hrs)", "Option C: Continue to Chitwan (4 hrs by bus) for safari combo trip", "Evening: Arrive back or at next destination"]'::jsonb,
    'Hotel', 'Breakfast, Lunch', '280 km', '150m', 'Full day + travel',
    '["Morning meditation", "International monasteries by bicycle", "World Peace Pagoda", "Lumbini Museum", "Return journey"]'::jsonb
FROM destinations WHERE name = 'Lumbini Buddhist Pilgrimage' LIMIT 1;

-- ========================================
-- JANAKI TEMPLE JANAKPUR (1 day)
-- ========================================

INSERT INTO itinerary_templates (destination_id, day_number, title, location, activities, accommodation, meals, distance, elevation, duration, highlights)
SELECT id, 1, 'Janakpur - Birthplace of Goddess Sita', 'Janakpur',
    '["Very early morning: Flight from Kathmandu to Janakpur (30 min, NPR 4000-6000)", "Alternative: Night bus from Kathmandu New Bus Park (NPR 800-1000, 8-9 hrs, arrives early morning)", "Arrive Janakpur - cultural capital of the Terai", "Taxi or rickshaw from airport/bus park to Janaki Mandir (NPR 100-200)", "8:00 AM: Visit Janaki Mandir - stunning Mughal-style marble temple (free entry)", "Dedicated to Goddess Sita (Janaki) - her birthplace according to Hindu mythology", "Walk around the temple, observe morning prayers (aarti ceremony)", "9:00 AM: Visit Ram Mandir nearby - connected to the Ramayana story", "Vivah Mandap - where Ram and Sita''s wedding is believed to have taken place", "10:00 AM: Explore Janakpur''s sacred ponds (Dhanush Sagar, Ganga Sagar)", "Traditional bathing ghats, colorful temples around each pond", "11:00 AM: Take a cycle rickshaw tour of the town (NPR 500 for 2 hrs)", "Visit Mithila Art Institute - Mithila/Madhubani paintings (women''s art tradition)", "See artists painting on walls, paper, and fabric with natural colors", "12:00 PM: Lunch at a local restaurant - try Maithili cuisine", "1:00 PM: Visit the Ram Sita Bibah Mandap and surrounding temples", "Explore the vibrant market with Maithili handicrafts, bangles, paintings", "Buy Mithila paintings as souvenirs (NPR 500-5000)", "3:00 PM: Flight back to Kathmandu (30 min) or board a bus (8-9 hrs)"]'::jsonb,
    'Hotel', 'Breakfast, Lunch', '350 km', '74m', 'Full day',
    '["Janaki Mandir marble temple", "Sita''s birthplace", "Sacred ponds", "Mithila art tradition", "Rickshaw tour"]'::jsonb
FROM destinations WHERE name = 'Janaki Temple Janakpur' LIMIT 1;

-- ========================================
-- BULK ITINERARY GENERATION
-- ========================================
-- Generate Day 1 (Arrival) for all remaining destinations that don't have itinerary templates yet

INSERT INTO itinerary_templates (destination_id, day_number, title, location, activities, accommodation, meals, distance, elevation, duration, highlights)
SELECT
    d.id,
    1,
    'Arrival and Preparation',
    CASE
        WHEN d.region LIKE '%Khumbu%' OR d.name LIKE '%Everest%' THEN 'Kathmandu'
        WHEN d.region LIKE '%Annapurna%' OR d.name LIKE '%Annapurna%' OR d.region = 'Pokhara' THEN 'Pokhara'
        WHEN d.name LIKE '%Chitwan%' THEN 'Kathmandu'
        ELSE 'Kathmandu'
    END,
    CASE
        WHEN d.trip_type = 'trekking' THEN '["Arrive at Tribhuvan Airport or bus station", "Taxi to hotel in Thamel or Lakeside (NPR 500-800)", "Check in and freshen up", "Visit permit office for trekking permits (TIMS + conservation area)", "Gear check and last-minute purchases from trekking shops", "Trip briefing with guide", "Welcome dinner at a local restaurant", "Pack and prepare for early morning departure"]'::jsonb
        WHEN d.trip_type = 'cultural' THEN '["Arrive in Kathmandu, taxi to Thamel hotel (NPR 500-800)", "Check in and freshen up", "Cultural orientation with guide", "Short walk to explore the nearest heritage site", "Welcome dinner with traditional Nepali cuisine", "Evening briefing about tomorrow''s itinerary"]'::jsonb
        WHEN d.trip_type = 'wildlife' THEN '["Travel to national park area by bus or private vehicle", "Check into jungle lodge or resort", "Safari briefing by resident naturalist", "Afternoon nature walk around the lodge grounds", "Learn about wildlife safety protocols", "Dinner at lodge, listen to jungle sounds"]'::jsonb
        WHEN d.trip_type = 'adventure' THEN '["Arrive at activity base location", "Hotel or camp check-in", "Safety briefing and equipment fitting", "Practice session or orientation activity", "Dinner and preparation for the main adventure"]'::jsonb
        WHEN d.trip_type = 'pilgrimage' THEN '["Travel to temple/pilgrimage site area", "Hotel check-in near the sacred site", "Evening visit to nearby shrine for darshan", "Dinner and spiritual preparation for main pilgrimage"]'::jsonb
        ELSE '["Arrival and check-in", "Area orientation", "Welcome dinner", "Rest and preparation"]'::jsonb
    END,
    CASE
        WHEN d.trip_type IN ('cultural', 'pilgrimage') THEN 'Hotel'
        WHEN d.trip_type = 'wildlife' THEN 'Lodge'
        ELSE 'Hotel'
    END,
    'Dinner',
    NULL,
    '1,400m',
    'Arrival day',
    '["Trip preparation", "Orientation", "Meet the team", "Local exploration"]'::jsonb
FROM destinations d
WHERE d.id NOT IN (SELECT DISTINCT destination_id FROM itinerary_templates WHERE day_number = 1)
  AND d.min_duration > 1;

-- Generate Mid-point highlight day for remaining destinations
INSERT INTO itinerary_templates (destination_id, day_number, title, location, activities, accommodation, meals, distance, elevation, duration, highlights)
SELECT
    d.id,
    CAST((d.min_duration + d.max_duration) / 2 AS INTEGER),
    'Highlight Day - ' || SUBSTRING(d.name FROM 1 FOR 30),
    d.region,
    CASE
        WHEN d.trip_type = 'trekking' THEN '["Early morning start for the key section of the trek", "Ascend towards the highest point or main viewpoint", "Take regular breaks for photos and acclimatization", "Reach the highlight destination: pass, base camp, or viewpoint", "Celebrate the achievement with your team", "Afternoon descent or rest at high camp", "Evening reflection and hot dinner at tea house"]'::jsonb
        WHEN d.trip_type = 'wildlife' THEN '["Dawn safari - best time for wildlife sighting", "Full morning game drive through core forest area", "Spot the park''s flagship species: rhino, tiger, or rare birds", "Packed lunch in the field", "Afternoon walking safari or canoe ride", "Evening: wildlife presentation and photo review"]'::jsonb
        WHEN d.trip_type = 'cultural' THEN '["Full day exploring the most significant heritage site", "Guided tour with local historian", "Participate in a traditional craft workshop", "Local cuisine cooking class or food tour", "Visit lesser-known local temples and neighborhoods", "Interact with residents and learn traditions"]'::jsonb
        WHEN d.trip_type = 'pilgrimage' THEN '["Early morning prayers at the main sacred site", "Ritual bathing or offering ceremonies", "Circumambulation of the temple or stupa", "Meditation session at a quiet shrine", "Visit associated temples and monasteries", "Evening aarti or butter lamp ceremony"]'::jsonb
        ELSE '["Main activity of the trip", "Guided exploration", "Photography and exploration", "Achievement celebration"]'::jsonb
    END,
    CASE
        WHEN d.trip_type = 'trekking' THEN 'Tea house'
        WHEN d.trip_type = 'wildlife' THEN 'Jungle Lodge'
        WHEN d.trip_type = 'cultural' THEN 'Heritage hotel'
        ELSE 'Lodge'
    END,
    'Breakfast, Lunch, Dinner',
    CASE WHEN d.trip_type = 'trekking' THEN '10-15 km' ELSE NULL END,
    CAST(d.elevation AS TEXT) || 'm',
    CASE WHEN d.trip_type = 'trekking' THEN '6-8 hours' ELSE 'Full day' END,
    CASE
        WHEN d.trip_type = 'trekking' THEN '["High point reached", "Mountain panorama", "Trek achievement", "Photography"]'::jsonb
        WHEN d.trip_type = 'wildlife' THEN '["Wildlife encounter", "Safari highlight", "Nature immersion", "Photography"]'::jsonb
        WHEN d.trip_type = 'cultural' THEN '["Cultural highlight", "Historic site", "Local interaction", "Traditional craft"]'::jsonb
        WHEN d.trip_type = 'pilgrimage' THEN '["Temple visit", "Spiritual experience", "Prayers and offerings", "Inner peace"]'::jsonb
        ELSE '["Main highlight", "Achievement", "Memorable moment"]'::jsonb
    END
FROM destinations d
WHERE d.id NOT IN (
    SELECT DISTINCT destination_id FROM itinerary_templates
    WHERE day_number > 2
)
  AND d.min_duration >= 4;

-- Generate final day (Departure) for multi-day trips
INSERT INTO itinerary_templates (destination_id, day_number, title, location, activities, accommodation, meals, distance, elevation, duration, highlights)
SELECT
    d.id,
    d.max_duration,
    'Return Journey and Departure',
    'Kathmandu',
    '["Breakfast at accommodation", "Pack up and check out", "Travel back to Kathmandu: bus from local bus park or pre-arranged vehicle", "Alternatively fly back if available (check Kathmandu, Pokhara, Bhairahawa flights)", "Arrive Kathmandu, taxi to Thamel hotel (NPR 500-800)", "Free time for souvenir shopping: pashmina, singing bowls, thangka paintings, spices", "Optional sightseeing if energy permits: Swayambhunath or Boudhanath", "Farewell dinner at a Thamel restaurant", "Taxi to Tribhuvan International Airport (NPR 600-800, 30 min)"]'::jsonb,
    'Day use hotel',
    'Breakfast',
    NULL,
    '1,400m',
    'Departure day',
    '["Trip completion", "Souvenir shopping", "Farewell dinner", "Safe travels"]'::jsonb
FROM destinations d
WHERE d.id NOT IN (
    SELECT DISTINCT destination_id FROM itinerary_templates
    WHERE day_number = (SELECT MAX(day_number) FROM itinerary_templates it2 WHERE it2.destination_id = d.id)
)
  AND d.min_duration > 2;