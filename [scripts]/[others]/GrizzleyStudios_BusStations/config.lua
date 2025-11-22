Config = {}

-- Framework Selection - Set to 'qb' for QBCore, 'esx' for ESX, or 'qbox' for QBox
Config.Framework = 'qb' -- Options: 'qb' / 'esx' / 'qbox'

-- Target System Selection - Set to 'qb' for QB-Target or 'ox' for OX-Target
Config.Target = 'qb' -- Options: 'qb' / 'ox'

Config.Notify = 'dlrms' -- 'dlrms' / 'mythic' / 'other'
Config.NewNHContext = false
Config.OxLib = true
Config.BusWaitTime = 5 -- How long you need to wait for the bus in seconds
Config.BusPrice = 25

Config.Models = {'prop_busstop_05', 'prop_busstop_02', 'prop_busstop_04'}

Config.LocationMenu = {
    {
        header = 'Englewood',
        description = 'Englewood an area that peaked at 97 thousand residents since 1960-2000. Since then the number of residents have dropped drastically being that the area would be one of the more dangerous areas in Chicago. High gang violence and a lot of vacant houses and lots, the government does not provide for the englewood community.',
        location = 'englewood' -- Make sure your location name has the same name in Config.Locations
    },
    {
        header = 'Woodson South Projects',
        description = 'The Woodson South Community hosts exhibitions by local artists, and colorful murals dot neighborhood streets. A lively dining scene includes BBQ joints and soul food restaurants. This area is becoming very gentrified as it was mainly black surrounded with a lot of violence, it is still very violent and has a lot of gang presence but people are getting pushed out due to a higher cost to live there',
        location = 'woodson'
    },
    {
        header = 'Chinatown',
        description = 'At the heart of Chinatown\'s lively business district are Cermak Road and Wentworth Avenue. Offerings there include an extensive roster of shops, cafes, dim sum spots and teahouses. Chinatown Square outdoor mall has similar attractions. The Chinese-American Museum has exhibits about the history of the neighborhood. The Nine-Dragon Wall is a reproduction of the 15th-century mural of the same name in Beijing. Chinatown has little gang presence but definitely has a lot of incidents where it happens to be a shooting',
        location = 'chinatown'
    },
    {
        header = 'Oak street Beach',
        description = 'Oak Street Beach is located at 1000 N. Lake Shore Drive at Oak Street and Lake Michigan near the Gold Coast/Streeterville neighborhoods.  This popular summer hotspot offers beach goers amenities that include chair rentals, food and beverage options at Oak Street Beach Café, bike rentals, volleyball rentals, restrooms and a spectacular view of the city skyline. This beach hosts a number of popular amateur and professional volleyball tournaments throughout the summer. Distance swimming is available parallel to the shore from Division Street to the Chess Pavilion (20 yards west of the buoys). An ADA accessible beach walk is available. There is limited street parking nearby.',
        location = 'oakbeach'
    },
    {
        header = 'Ohio Street Beach',
        description = 'Ohio Street Beach. Among several other public beaches on Lake Michigan, which are located along the Lake Shore Drive and Lakefront Trail, Ohio Street Beach seems to have a unique location: it\'s right in the center of things, it\'s not that far from North Michigan Avenue and Chicago River, near Chicago Lakefront, and in very close proximity to other attractions from hotels, shops, restaurants.',
        location = 'ohiobeach'
    },
    {
        header = 'Dearborn Street',
        description = 'Dearborn Street. this would be considered DT (Downtown) or "the city" Dearborn St. emerged as the preferred corridor based on a number of factors, including roadway width, average daily traffic counts, vehicles per hour, and rush hour traffic patterns. Analyses showed that removing a travel lane would increase congestion more severely on Clark St. than on Dearborn St.',
        location = 'dearborn'
    },
    {
        header = 'Country Club Hills',
        description = 'Country Club Hills is a city in Cook County, Illinois, United States. It is a suburb of Chicago. It\'s also south of Chicago. The population was 16,775 at the 2020 census. 10,000 years ago, during a glacial period, this area was a shoreline, with a complex of moraines in the south and west',
        location = 'countryclub'
    },
    {
        header = 'Irving Park',
        description = 'The first thing to do when you arrive in Irving Park is stroll The Villa District, a tiny residential pocket that\'s listed on the National Register of Historic Places. "The Villa", recognized as an official Chicago landmark district, is a collection of 126 bungalows on seven distinctive blocks that draw upon Arts & Crafts and the Prairie School architectural styles for inspiration. Not that Irving Park lives in the past. You only have to stop at a couple of the area\'s popular breweries to appreciate that. Plus, Irving Park is home to the immersive Windy City Playhouse, which produces one-of-a-kind experiences that invite you to wander the set as the drama unfolds around you.',
        location = 'irving'
    },
    {
        header = 'Navy Pier',
        description = 'Navy Pier is a popular tourist attraction located on the shoreline of Lake Michigan in Chicago, Illinois, United States. Stretching out into the lake, it offers stunning views of the city\'s skyline and the vast expanse of the lake itself. Navy Pier has been a beloved landmark and entertainment destination for both locals and visitors since its opening in 1916.',
        location = 'pier'
    },
    {
        header = 'Marquette Park',
        description = 'Marquette Park is a public park located on the southwest side of Chicago, Illinois, in the United States. It is one of the largest parks in the city, spanning over 323 acres (131 hectares). The park is named after Jacques Marquette, a French Jesuit missionary and explorer who was one of the first Europeans to explore the region.',
        location = 'legion'
    },
    {
        header = 'W Jackson Blvd',
        description = 'West Jackson Boulevard stretches from the Chicago River in the east to the western parts of the city. It passes through various neighborhoods and landmarks, including the Loop, West Loop, and Near West Side. The street is lined with a mix of commercial, residential, and institutional buildings.',
        location = 'jackson'
    },
    {
        header = 'N Hudson Ave',
        description = 'The area around N. Hudson Ave. is known for its historic architecture, vibrant nightlife, and proximity to attractions like Lincoln Park and the Second City comedy club. It is a residential area with some commercial establishments, including restaurants, bars, and shops.',
        location = 'hudson'
    },
    {
        header = '900 N Hudson Avenue',
        description = 'Cabrini-Green was built in 1942 and consisted of several high-rise apartment buildings. At its peak, it was home to thousands of low-income residents, primarily African Americans. However, over time, the development became known for its high levels of poverty, crime, and dilapidation.',
        location = 'manny_scams'
    },
}

Config.Locations = {
    englewood = {
        coords = vector3(-110.4971, -1686.0066, 29.3079),
        label = 'Englewood',
    },
    woodson = {
        coords = vector3(439.21, -2032.38, 23.58),
        label = 'Woodson South Projects',
    },
    chinatown = {
        coords = vector3(-504.75, -670.62, 33.09),
        label = 'Chinatown',
    },
    oakbeach = {
        coords = vector3(-1214.73, -1218.43, 7.69),
        label = 'Oak street Beach',
    },
    ohiobeach = {
        coords = vector3(-1476.15, -634.91, 30.58),
        label = 'Ohio Street Beach',
    },
    dearborn = {
        coords = vector3(356.09, -1066.97, 29.56),
        label = 'Dearborn Street',
    },
    countryclub = {
        coords = vector3(-680.82, -380.48, 34.26),
        label = 'Country Club Hills',
    },
    irving = {
        coords = vector3(1221.46, -309.24, 69.09),
        label = 'Irving Park',
    },
    pier = {
        coords = vector3(-1475.68, -634.87, 30.59),
        label = 'Navy Pier',
    },
    legion = {
        coords = vector3(116.10, -781.75, 31.39),
        label = 'Marquette Park',
    }, 
    jackson = {
        coords = vector3(774.09, -1755.01, 29.50),
        label = 'W Jackson Blvd',
    },
    hudson = {
        coords = vector3(-1215.10, -1219.08, 7.687),
        label = 'N Hudson Ave',
    },
    manny_scams = {
        coords = vector3(-1170.6223, -1473.6862, 4.3786),
        label = '900 N Hudson Avenue'
    }
}