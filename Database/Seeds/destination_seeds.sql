

-- ========================================
-- TREKKING DESTINATIONS
-- ========================================

-- Everest Region Treks
INSERT INTO destinations (name, region, description, difficulty, min_duration, max_duration, elevation, trip_type, highlights, base_cost_usd, accommodation_type, is_active)
VALUES 
('Everest Base Camp Trek', 'Khumbu', 'Classic trek to the base of the world''s highest mountain', 'challenging', 12, 14, 5364, 'trekking', 
 '{"Everest Base Camp","Kala Patthar viewpoint","Sherpa culture","Namche Bazaar"}', 1420, 'Tea house', true),

('Everest Base Camp Short Trek', 'Khumbu', 'Shorter version of classic EBC trek', 'challenging', 10, 12, 5364, 'trekking',
 '{"Everest Base Camp","Kala Patthar","Namche Bazaar","Quick adventure"}', 1295, 'Tea house', true),

('Everest Three Passes Trek', 'Khumbu', 'Advanced trek crossing three high passes', 'strenuous', 18, 20, 5545, 'trekking',
 '{"Renjo La Pass","Cho La Pass","Kongma La Pass","Gokyo Lakes"}', 2100, 'Tea house', true),

('Gokyo Lakes Trek', 'Khumbu', 'Beautiful trek to pristine glacial lakes', 'challenging', 12, 14, 5357, 'trekking',
 '{"Gokyo Lakes","Gokyo Ri viewpoint","Ngozumpa Glacier","Cho Oyu views"}', 1350, 'Tea house', true),

('Everest Panorama Trek', 'Khumbu', 'Short trek with stunning Everest views', 'easy', 5, 7, 3860, 'trekking',
 '{"Everest views","Namche Bazaar","Sherpa culture","Tengboche monastery"}', 1150, 'Tea house', true),

('Everest View Trek', 'Khumbu', 'Easy trek to Everest viewpoint', 'easy', 7, 9, 3860, 'trekking',
 '{"Everest View Hotel","Namche Bazaar","Sherpa villages","Mountain panorama"}', 1100, 'Tea house', true),

-- Annapurna Region Treks
('Annapurna Base Camp Trek', 'Annapurna', 'Trek into the heart of Annapurna sanctuary', 'moderate', 10, 14, 4130, 'trekking',
 '{"Annapurna Base Camp","Machapuchare Base Camp","Poon Hill sunrise","Hot springs"}', 1090, 'Tea house', true),

('Annapurna Base Camp Short Trek', 'Annapurna', 'Faster route to ABC', 'moderate', 8, 11, 4130, 'trekking',
 '{"Annapurna Base Camp","Machapuchare views","Himalayan sanctuary"}', 1090, 'Tea house', true),

('Annapurna Circuit Trek', 'Annapurna', 'Classic circuit around Annapurna massif', 'challenging', 15, 19, 5416, 'trekking',
 '{"Thorong La Pass","Muktinath Temple","Tilicho Lake","Diverse landscapes"}', 1250, 'Tea house', true),

('Annapurna Circuit Short Trek', 'Annapurna', 'Condensed circuit experience', 'challenging', 12, 14, 5416, 'trekking',
 '{"Thorong La Pass","Manang valley","Muktinath","Mountain scenery"}', 1250, 'Tea house', true),

('Poon Hill Trek', 'Annapurna', 'Short trek with stunning mountain views', 'easy', 4, 5, 3210, 'trekking',
 '{"Poon Hill sunrise","Dhaulagiri views","Rhododendron forests","Ghorepani"}', 450, 'Tea house', true),

('Mardi Himal Trek', 'Annapurna', 'Off-the-beaten-path trek with close mountain views', 'moderate', 5, 9, 4500, 'trekking',
 '{"Mardi Himal Base Camp","Close Machapuchare views","Rhododendron forests","Ridge walking"}', 850, 'Tea house', true),

('Khopra Ridge Trek', 'Annapurna', 'Community-run trek with spectacular views', 'moderate', 8, 10, 3660, 'trekking',
 '{"Khopra Ridge","Khayer Lake","Annapurna South views","Community lodges"}', 890, 'Community lodge', true),

('Annapurna Tilicho Lake Trek', 'Annapurna', 'Trek to world''s highest lake', 'strenuous', 15, 17, 5416, 'trekking',
 '{"Tilicho Lake","Thorong La Pass","High altitude","Stunning landscapes"}', 1450, 'Tea house', true),

-- Langtang Region Treks
('Langtang Valley Trek', 'Langtang', 'Beautiful valley trek close to Kathmandu', 'moderate', 7, 11, 4984, 'trekking',
 '{"Kyanjin Gompa","Tserko Ri viewpoint","Tamang culture","Langtang Lirung"}', 750, 'Tea house', true),

('Langtang Gosainkunda Trek', 'Langtang', 'Combined trek to valley and sacred lakes', 'challenging', 12, 16, 4984, 'trekking',
 '{"Gosainkunda Lake","Kyanjin Gompa","Laurebina Pass","Hindu pilgrimage site"}', 1180, 'Tea house', true),

('Tamang Heritage Trail', 'Langtang', 'Cultural trek through Tamang villages', 'easy', 7, 8, 3842, 'cultural',
 '{"Tamang culture","Hot springs","Traditional villages","Mountain views"}', 750, 'Homestay', true),

('Helambu Trek', 'Helambu', 'Cultural trek through Sherpa and Tamang villages', 'easy', 5, 9, 3650, 'trekking',
 '{"Sherpa culture","Terraced fields","Mountain views","Traditional villages"}', 780, 'Tea house', true),

-- Manaslu Region Treks
('Manaslu Circuit Trek', 'Manaslu', 'Remote circuit around world''s 8th highest peak', 'strenuous', 14, 18, 5160, 'trekking',
 '{"Larkya La Pass","Manaslu massif","Tibetan culture","Remote wilderness"}', 1450, 'Tea house', true),

('Tsum Valley Trek', 'Manaslu', 'Hidden valley with Tibetan Buddhist culture', 'moderate', 12, 19, 3700, 'cultural',
 '{"Mu Gompa monastery","Tibetan culture","Ganesh Himal views","Ancient monasteries"}', 1280, 'Tea house', true),

('Tsum Valley with Manaslu Trek', 'Manaslu', 'Combined Tsum Valley and Manaslu Circuit', 'strenuous', 20, 27, 5220, 'trekking',
 '{"Larkya La Pass","Mu Gompa","Tibetan culture","Complete circuit"}', 1850, 'Tea house', true),

-- Mustang Region Treks
('Upper Mustang Trek', 'Mustang', 'Trek to the ancient walled city of Lo Manthang', 'moderate', 12, 17, 3870, 'cultural',
 '{"Lo Manthang","Tibetan culture","Ancient monasteries","Desert landscape"}', 2150, 'Tea house', true),

('Upper Mustang Trek with Yara', 'Mustang', 'Extended Upper Mustang with Yara village', 'moderate', 15, 18, 4200, 'cultural',
 '{"Lo Manthang","Yara village","Cave monasteries","Tibetan culture"}', 2300, 'Tea house', true),

('Jomsom Muktinath Trek', 'Mustang', 'Pilgrimage trek to sacred Muktinath temple', 'moderate', 8, 10, 3800, 'pilgrimage',
 '{"Muktinath temple","Kali Gandaki gorge","Dhaulagiri views","Kagbeni village"}', 920, 'Tea house', true),

-- Other Remote Treks
('Makalu Base Camp Trek', 'Makalu', 'Remote trek to base of world''s 5th highest peak', 'strenuous', 18, 22, 4870, 'trekking',
 '{"Makalu Base Camp","Remote wilderness","Diverse landscapes","High passes"}', 1680, 'Camping', true),

('Kanchenjunga Circuit Trek', 'Kanchenjunga', 'Trek around world''s 3rd highest mountain', 'strenuous', 20, 25, 5143, 'trekking',
 '{"North and South Base Camps","Remote wilderness","Diverse culture","High altitude"}', 2100, 'Tea house/Camping', true),

('Rara Lake Trek', 'Rara', 'Trek to Nepal''s largest and most beautiful lake', 'moderate', 9, 15, 3060, 'trekking',
 '{"Rara Lake","Rara National Park","Remote western Nepal","Pristine nature"}', 1320, 'Tea house', true),

('Nar Phu Valley Trek', 'Annapurna', 'Remote valley trek in restricted area', 'strenuous', 14, 19, 5416, 'trekking',
 '{"Kang La Pass","Ancient villages","Tibetan culture","Remote wilderness"}', 1650, 'Tea house', true),

('Dolpo Trek', 'Dolpo', 'Trek through Nepal''s most remote region', 'strenuous', 18, 21, 5190, 'trekking',
 '{"Phoksundo Lake","Shey Gompa","Tibetan culture","Crystal Mountain"}', 2400, 'Camping', true);

-- ========================================
-- CULTURAL DESTINATIONS
-- ========================================

INSERT INTO destinations (name, region, description, difficulty, min_duration, max_duration, elevation, trip_type, highlights, base_cost_usd, accommodation_type, is_active)
VALUES 
('Kathmandu Valley Cultural Tour', 'Kathmandu Valley', 'Explore UNESCO World Heritage sites', 'easy', 3, 5, 1400, 'cultural',
 '{"Pashupatinath Temple","Boudhanath Stupa","Swayambhunath","Patan Durbar Square","Bhaktapur"}', 380, 'Hotel', true),

('Bhaktapur Heritage Walk', 'Kathmandu Valley', 'Ancient Newari city exploration', 'easy', 1, 2, 1400, 'cultural',
 '{"Bhaktapur Durbar Square","Pottery Square","Nyatapola Temple","Newari culture"}', 120, 'Hotel', true),

('Patan Cultural Tour', 'Kathmandu Valley', 'Explore the city of fine arts', 'easy', 1, 2, 1300, 'cultural',
 '{"Patan Durbar Square","Golden Temple","Mahabouddha Temple","Museums","Tibetan Handicrafts"}', 150, 'Hotel', true),

('Newari Cultural Experience', 'Kathmandu Valley', 'Immerse in Newari culture and cuisine', 'easy', 3, 5, 1350, 'cultural',
 '{"Traditional Newari homes","Cooking classes","Local festivals","Ancient architecture"}', 420, 'Heritage Hotel', true),

('Lumbini Buddhist Pilgrimage', 'Lumbini', 'Visit the birthplace of Buddha', 'easy', 2, 3, 150, 'pilgrimage',
 '{"Maya Devi Temple","Ashoka Pillar","Monasteries","Sacred Garden","Peace Pagoda"}', 280, 'Hotel', true),

('Chitwan Tharu Cultural Tour', 'Chitwan', 'Experience Tharu indigenous culture', 'easy', 2, 3, 200, 'cultural',
 '{"Tharu villages","Traditional dance","Cultural museum","Farming practices"}', 250, 'Homestay', true),

('Tansen Heritage Tour', 'Palpa', 'Historic hill town exploration', 'easy', 2, 3, 1371, 'cultural',
 '{"Tansen Durbar","Rani Mahal","Traditional crafts","Newari architecture"}', 220, 'Hotel', true),

('Bandipur Village Tour', 'Tanahu', 'Preserved Newari hilltop village', 'easy', 1, 2, 1030, 'cultural',
 '{"Traditional architecture","Himalayan views","Preserved culture","Local crafts"}', 180, 'Hotel', true),

('Gorkha Palace and Museum', 'Gorkha', 'Historic Shah dynasty capital', 'easy', 1, 2, 1140, 'cultural',
 '{"Gorkha Durbar","Gorakhnath Cave","Historical museum","Birthplace of Prithvi Narayan Shah"}', 150, 'Hotel', true),

('Pokhara Cultural Experience', 'Pokhara', 'Lake city culture and traditions', 'easy', 2, 4, 822, 'cultural',
 '{"Tibetan refugee camps","Gurung Museum","Traditional villages","Lake Phewa"}', 320, 'Hotel', true);

-- ========================================
-- WILDLIFE DESTINATIONS
-- ========================================

INSERT INTO destinations (name, region, description, difficulty, min_duration, max_duration, elevation, trip_type, highlights, base_cost_usd, accommodation_type, is_active)
VALUES 
('Chitwan National Park Safari', 'Chitwan', 'Premier wildlife safari in subtropical jungle', 'easy', 2, 4, 200, 'wildlife',
 '{"One-horned rhino","Bengal tiger","Elephant safari","Canoe ride","Jungle walks","Bird watching"}', 420, 'Lodge', true),

('Bardia National Park Safari', 'Bardia', 'Remote wilderness safari experience', 'easy', 3, 5, 152, 'wildlife',
 '{"Royal Bengal tiger","Wild elephants","One-horned rhino","Gangetic dolphins","Diverse wildlife"}', 580, 'Lodge', true),

('Koshi Tappu Wildlife Reserve', 'Sunsari', 'Premier bird watching destination', 'easy', 2, 3, 75, 'wildlife',
 '{"Bird watching","Wild water buffalo","Gangetic dolphins","Wetland ecosystem","450+ bird species"}', 350, 'Lodge', true),

('Shivapuri Nagarjun National Park', 'Kathmandu', 'Day wildlife tour near Kathmandu', 'easy', 1, 2, 2563, 'wildlife',
 '{"Leopards","Himalayan black bear","Bird watching","Forest walks","Waterfalls"}', 120, 'Hotel', true),

('Langtang National Park Wildlife Tour', 'Langtang', 'Mountain wildlife observation', 'moderate', 5, 7, 3800, 'wildlife',
 '{"Red panda","Himalayan tahr","Musk deer","Snow leopard (rare)","Bird watching"}', 680, 'Tea house', true),

('Sagarmatha National Park Wildlife', 'Khumbu', 'High altitude wildlife viewing', 'challenging', 10, 14, 5000, 'wildlife',
 '{"Snow leopard","Himalayan tahr","Musk deer","Red panda","High altitude birds"}', 1400, 'Tea house', true),

('Rara National Park Wildlife Tour', 'Mugu', 'Remote western Nepal wildlife', 'moderate', 7, 10, 3062, 'wildlife',
 '{"Red panda","Musk deer","Himalayan black bear","Bird watching","Pristine forests"}', 980, 'Tea house', true),

('Annapurna Conservation Area Wildlife', 'Annapurna', 'Wildlife in Annapurna region', 'moderate', 7, 10, 3500, 'wildlife',
 '{"Snow leopard","Red panda","Blue sheep","Himalayan tahr","Mountain birds"}', 890, 'Tea house', true);

-- ========================================
-- ADVENTURE DESTINATIONS
-- ========================================

INSERT INTO destinations (name, region, description, difficulty, min_duration, max_duration, elevation, trip_type, highlights, base_cost_usd, accommodation_type, is_active)
VALUES 
('Everest Base Camp Helicopter Tour', 'Khumbu', 'Helicopter tour to Everest Base Camp', 'easy', 1, 1, 5364, 'adventure',
 '{"Helicopter flight","Everest Base Camp landing","Kala Patthar","Breakfast at Everest","Aerial views"}', 3300, 'Hotel', true),

('Annapurna Base Camp Heli Trek', 'Annapurna', 'Helicopter assisted ABC trek', 'moderate', 7, 9, 4130, 'adventure',
 '{"Helicopter return","Annapurna Base Camp","Quick adventure","Mountain views"}', 1750, 'Tea house', true),

('Pokhara Paragliding', 'Pokhara', 'Tandem paragliding over Pokhara valley', 'easy', 1, 1, 1592, 'adventure',
 '{"Tandem flight","Lake and mountain views","Sarangkot takeoff","30-45 minute flight"}', 180, 'Hotel', true),

('Bungee Jumping Bhote Koshi', 'Sindhupalchok', 'Nepal''s highest bungee jump', 'easy', 1, 1, 160, 'adventure',
 '{"Bungee jump","160m free fall","Canyon swing","Bhote Koshi gorge"}', 120, 'Hotel', true),

('White Water Rafting Trishuli River', 'Trishuli', 'Thrilling river rafting adventure', 'moderate', 1, 2, 500, 'adventure',
 '{"Grade 3-4 rapids","Scenic river journey","Beach camping","Professional guides"}', 85, 'Camping', true),

('White Water Rafting Kali Gandaki', 'Gandaki', 'Multi-day rafting expedition', 'challenging', 3, 4, 600, 'adventure',
 '{"Grade 4-5 rapids","Remote canyon","Multi-day expedition","Expert guides required"}', 320, 'Camping', true),

('Mountain Biking Kathmandu Valley', 'Kathmandu Valley', 'Scenic mountain biking trails', 'moderate', 1, 3, 1600, 'adventure',
 '{"Valley rim trails","Cultural sites","Village roads","Varied terrain"}', 220, 'Hotel', true),

('Mountain Biking Annapurna', 'Annapurna', 'Multi-day mountain biking adventure', 'challenging', 7, 10, 2500, 'adventure',
 '{"Annapurna circuit roads","Challenging climbs","Scenic descents","Village trails"}', 980, 'Tea house', true),

('Rock Climbing Nagarjun', 'Kathmandu', 'Rock climbing in Kathmandu', 'moderate', 1, 1, 1400, 'adventure',
 '{"Natural rock faces","Sport climbing","Beautiful setting","All skill levels"}', 95, 'Hotel', true),

('Canyoning Adventure Sundarijal', 'Kathmandu', 'Waterfall rappelling and canyoning', 'moderate', 1, 1, 1450, 'adventure',
 '{"Waterfall rappelling","Canyon exploration","Natural slides","Swimming"}', 110, 'Hotel', true),

('Zip-lining Pokhara', 'Pokhara', 'One of world''s steepest ziplines', 'easy', 1, 1, 1600, 'adventure',
 '{"Longest zipline","Mountain views","High speed descent","Safe adventure"}', 95, 'Hotel', true),

('Ultralight Flight Pokhara', 'Pokhara', 'Microlight flight over Himalayas', 'easy', 1, 1, 900, 'adventure',
 '{"Microlight aircraft","Mountain panorama","Lake views","15-60 minute flights"}', 180, 'Hotel', true),

('Peak Climbing - Island Peak', 'Khumbu', 'Technical peak climbing expedition', 'strenuous', 16, 18, 6189, 'adventure',
 '{"Island Peak summit","Technical climbing","Mountaineering experience","Everest region"}', 2100, 'Tea house/Tent', true),

('Peak Climbing - Mera Peak', 'Khumbu', 'Nepal''s highest trekking peak', 'strenuous', 16, 18, 6476, 'adventure',
 '{"Mera Peak summit","Highest trekking peak","Remote region","Glacier climbing"}', 2250, 'Tea house/Tent', true),

('Jungle Safari - Chitwan Deluxe', 'Chitwan', 'Premium jungle safari package', 'easy', 3, 4, 200, 'adventure',
 '{"Elephant safari","Jeep safari","Canoe rides","Jungle walks","Cultural shows"}', 650, 'Luxury Lodge', true);

-- ========================================
-- PILGRIMAGE DESTINATIONS
-- ========================================

INSERT INTO destinations (name, region, description, difficulty, min_duration, max_duration, elevation, trip_type, highlights, base_cost_usd, accommodation_type, is_active)
VALUES 
('Muktinath Pilgrimage Tour', 'Mustang', 'Sacred Hindu and Buddhist pilgrimage site', 'moderate', 6, 8, 3800, 'pilgrimage',
 '{"Muktinath Temple","108 water spouts","Eternal flame","Kali Gandaki gorge","Jomsom"}', 820, 'Hotel/Tea house', true),

('Pashupatinath Temple Tour', 'Kathmandu', 'Sacred Hindu temple on Bagmati River', 'easy', 1, 1, 1400, 'pilgrimage',
 '{"Pashupatinath Temple","Cremation ghats","Hindu rituals","Sadhus","UNESCO site"}', 50, 'Hotel', true),

('Gosainkunda Lake Pilgrimage', 'Rasuwa', 'Sacred alpine lakes pilgrimage trek', 'moderate', 5, 7, 4380, 'pilgrimage',
 '{"Gosainkunda Lake","Hindu pilgrimage","Mountain lakes","Shivaratri festival"}', 780, 'Tea house', true),

('Janaki Temple Janakpur', 'Janakpur', 'Birthplace of Goddess Sita', 'easy', 1, 2, 74, 'pilgrimage',
 '{"Janaki Temple","Ram-Sita birthplace","Vivah Mandap","Hindu mythology","Art and architecture"}', 180, 'Hotel', true),

('Manakamana Temple Tour', 'Gorkha', 'Wish-fulfilling goddess temple', 'easy', 1, 1, 1302, 'pilgrimage',
 '{"Manakamana Temple","Cable car ride","Mountain views","Hindu pilgrimage"}', 120, 'Hotel', true),

('Halesi Mahadev Pilgrimage', 'Khotang', 'Sacred cave temple', 'moderate', 2, 3, 1100, 'pilgrimage',
 '{"Cave temple","Hindu-Buddhist shrine","Shivalinga","Religious significance"}', 280, 'Hotel', true),

('Swayambhunath Stupa Tour', 'Kathmandu', 'Ancient Buddhist stupa - Monkey Temple', 'easy', 1, 1, 1400, 'pilgrimage',
 '{"Swayambhunath Stupa","Monkey Temple","Buddha eyes","Valley views","Buddhist prayers"}', 35, 'Hotel', true),

('Boudhanath Stupa Exploration', 'Kathmandu', 'One of largest Buddhist stupas', 'easy', 1, 1, 1400, 'pilgrimage',
 '{"Boudhanath Stupa","Tibetan Buddhism","Monasteries","Prayer wheels","Butter lamps"}', 40, 'Hotel', true),

('Tengboche Monastery Trek', 'Khumbu', 'Highest monastery in Khumbu', 'moderate', 7, 9, 3860, 'pilgrimage',
 '{"Tengboche Monastery","Buddhist rituals","Monk blessings","Mountain views","Sherpa Buddhism"}', 980, 'Tea house', true),

('Devghat Pilgrimage', 'Tanahu', 'Sacred confluence of rivers', 'easy', 1, 2, 200, 'pilgrimage',
 '{"River confluence","Hindu ashrams","Sadhus","Religious ceremonies"}', 120, 'Hotel', true),

('Dakshinkali Temple Tour', 'Kathmandu', 'Powerful Kali temple', 'easy', 1, 1, 1400, 'pilgrimage',
 '{"Dakshinkali Temple","Animal sacrifice rituals","Hindu goddess","Weekly markets"}', 60, 'Hotel', true);

-- ========================================
-- COMBO/MULTI-ACTIVITY DESTINATIONS
-- ========================================

INSERT INTO destinations (name, region, description, difficulty, min_duration, max_duration, elevation, trip_type, highlights, base_cost_usd, accommodation_type, is_active)
VALUES 
('Everest Luxury Lodge Trek', 'Khumbu', 'Luxury trekking with comfort lodges', 'moderate', 12, 15, 5364, 'trekking',
 '{"Everest Base Camp","Luxury lodges","Gourmet meals","Hot showers","Comfort trekking"}', 4200, 'Luxury Lodge', true),

('Annapurna Luxury Trek', 'Annapurna', 'Comfort trek with premium lodges', 'easy', 8, 9, 2012, 'trekking',
 '{"Luxury lodges","Gourmet cuisine","Spa facilities","Cultural immersion","Easy pace"}', 1450, 'Luxury Lodge', true),

('Nepal Highlights Tour', 'Multi-region', 'Best of Nepal culture and nature', 'easy', 10, 12, 1400, 'cultural',
 '{"Kathmandu valley","Pokhara","Chitwan","Lumbini","Culture","Wildlife","Adventure"}', 1250, 'Hotel', true),

('Kathmandu Pokhara Chitwan Triangle', 'Multi-region', 'Three major destinations combo', 'easy', 7, 9, 822, 'cultural',
 '{"Kathmandu sightseeing","Pokhara lakes","Chitwan safari","Nepal essence"}', 890, 'Hotel', true),

('Royal Trek', 'Annapurna', 'Easy trek following Prince Charles route', 'easy', 4, 9, 1730, 'trekking',
 '{"Easy trails","Village culture","Mountain views","Gurung villages","Royal history"}', 580, 'Tea house', true),

('Pikey Peak Trek', 'Solukhumbu', 'Best Everest viewpoint trek', 'moderate', 6, 8, 4065, 'trekking',
 '{"Pikey Peak sunrise","Everest panorama","Sherpa culture","Lower Solu region"}', 720, 'Tea house', true),

('Mohare Danda Trek', 'Annapurna', 'Community eco-trek with panoramic views', 'moderate', 5, 7, 3300, 'trekking',
 '{"Mohare Danda","Community lodges","Dhaulagiri views","Annapurna range","Eco-trekking"}', 680, 'Community Lodge', true),

('Spiritual Nepal Tour', 'Multi-region', 'Comprehensive spiritual journey', 'easy', 8, 10, 1400, 'pilgrimage',
 '{"Major pilgrimage sites","Meditation","Yoga","Spiritual teachings","Temple tours"}', 980, 'Hotel/Monastery', true);