import 'package:airbnbprice/map.dart';
import 'package:flutter/material.dart';
import 'package:tflite_flutter/tflite_flutter.dart';
import 'logo.dart';

final List<TextEditingController> _controllers =
    List.generate(11, (index) => TextEditingController());
List<double> doubleList = [];

//Initializing lists for Neighbourhood Group,Neighbourhood and Room type dropdowns
final List<String> room_list = [
  'Select an option',
  'Entire home/apt',
  'Hotel room',
  'Private room',
  'Shared room'
];
final List<String> Neighbourhood_group_list = [
  'Select an option',
  'Brooklyn',
  'Manhattan',
  'Queens',
  'Bronx',
  'Staten Island'
];
final List<String> Neighbourhood_brooklyn = [
  'Select an option',
  'Bath Beach',
  'Bay Ridge',
  'Bedford-Stuyvesant',
  'Bensonhurst',
  'Bergen Beach',
  'Boerum Hill',
  'Borough Park',
  'Brighton Beach',
  'Brooklyn Heights',
  'Brownsville',
  'Bushwick',
  'Canarsie',
  'Carroll Gardens',
  'Clinton Hill',
  'Cobble Hill',
  'Columbia St',
  'Coney Island',
  'Crown Heights',
  'Cypress Hills',
  'DUMBO',
  'Downtown Brooklyn',
  'Dyker Heights',
  'East Flatbush',
  'East New York',
  'Flatbush',
  'Flatlands',
  'Fort Greene',
  'Fort Hamilton',
  'Gerritsen Beach',
  'Gowanus',
  'Gravesend',
  'Greenpoint',
  'Kensington',
  'Manhattan Beach',
  'Midwood',
  'Mill Basin',
  'Navy Yard',
  'Park Slope',
  'Prospect Heights',
  'Prospect-Lefferts Gardens',
  'Red Hook',
  'Sea Gate',
  'Sheepshead Bay',
  'South Slope',
  'Sunset Park',
  'Vinegar Hill',
  'Williamsburg',
  'Windsor Terrace'
];
final List<String> Neighbourhood_manhattan = [
  'Select an option',
  'Battery Park City',
  'Chelsea',
  'Chinatown',
  'Civic Center',
  'East Harlem',
  'East Village',
  'Financial District',
  'Flatiron District',
  'Gramercy',
  'Greenwich Village',
  'Harlem',
  'Hell\'s Kitchen',
  'Inwood',
  'Kips Bay',
  'Little Italy',
  'Lower East Side',
  'Marble Hill',
  'Midtown',
  'Morningside Heights',
  'Murray Hill',
  'NoHo',
  'Nolita',
  'Roosevelt Island',
  'SoHo',
  'Stuyvesant Town',
  'Theater District',
  'Tribeca',
  'Two Bridges',
  'Upper East Side',
  'Upper West Side',
  'Washington Heights',
  'West Village'
];
final List<String> Neighbourhood_queens = [
  'Select an option',
  'Arverne',
  'Astoria',
  'Bay Terrace',
  'Bayside',
  'Bayswater',
  'Belle Harbor',
  'Bellerose',
  'Breezy Point',
  'Briarwood',
  'Cambria Heights',
  'College Point',
  'Corona',
  'Ditmars Steinway',
  'Douglaston',
  'East Elmhurst',
  'Edgemere',
  'Elmhurst',
  'Far Rockaway',
  'Flushing',
  'Forest Hills',
  'Fresh Meadows',
  'Glendale',
  'Hollis',
  'Hollis Hills',
  'Holliswood',
  'Howard Beach',
  'Jackson Heights',
  'Jamaica',
  'Jamaica Estates',
  'Jamaica Hills',
  'Kew Gardens',
  'Kew Gardens Hills',
  'Laurelton',
  'Little Neck',
  'Long Island City',
  'Maspeth',
  'Middle Village',
  'Neponsit',
  'Ozone Park',
  'Queens Village',
  'Rego Park',
  'Richmond Hill',
  'Ridgewood',
  'Rockaway Beach',
  'Rosedale',
  'South Ozone Park',
  'Springfield Gardens',
  'St. Albans',
  'Sunnyside',
  'Whitestone',
  'Woodhaven',
  'Woodside'
];
final List<String> Neighbourhood_bronx = [
  'Select an option',
  'Allerton',
  'Baychester',
  'Belmont',
  'Bronxdale',
  'Castle Hill',
  'City Island',
  'Claremont Village',
  'Clason Point',
  'Co-op City',
  'Concourse',
  'Concourse Village',
  'Country Club',
  'East Morrisania',
  'Eastchester',
  'Edenwald',
  'Fieldston',
  'Fordham',
  'Highbridge',
  'Hunts Point',
  'Kingsbridge',
  'Longwood',
  'Melrose',
  'Morris Heights',
  'Morris Park',
  'Morrisania',
  'Mott Haven',
  'Mount Eden',
  'Mount Hope',
  'North Riverdale',
  'Norwood',
  'Olinville',
  'Parkchester',
  'Pelham Bay',
  'Pelham Gardens',
  'Port Morris',
  'Riverdale',
  'Schuylerville',
  'Soundview',
  'Spuyten Duyvil',
  'Throgs Neck',
  'Tremont',
  'Unionport',
  'University Heights',
  'Van Nest',
  'Wakefield',
  'West Farms',
  'Westchester Square',
  'Williamsbridge',
  'Woodlawn'
];
final List<String> Neighbourhood_staten = [
  'Select an option',
  'Arden Heights',
  'Arrochar',
  'Bull\'s Head',
  'Castleton Corners',
  'Chelsea, Staten Island',
  'Clifton',
  'Concord',
  'Dongan Hills',
  'Eltingville',
  'Emerson Hill',
  'Fort Wadsworth',
  'Graniteville',
  'Grant City',
  'Great Kills',
  'Grymes Hill',
  'Howland Hook',
  'Huguenot',
  'Lighthouse Hill',
  'Mariners Harbor',
  'Midland Beach',
  'New Brighton',
  'New Dorp',
  'New Dorp Beach',
  'New Springville',
  'Oakwood',
  'Port Richmond',
  'Prince\'s Bay',
  'Randall Manor',
  'Richmondtown',
  'Rosebank',
  'Shore Acres',
  'Silver Lake',
  'South Beach',
  'St. George',
  'Stapleton',
  'Todt Hill',
  'Tompkinsville',
  'Tottenville',
  'West Brighton',
  'Westerleigh',
  'Willowbrook',
  'Woodrow'
];
List<String> Neighbourhood_dropdown = ['Select an option'];
var predValue = "";

String dropdownValue1 = 'Select an option';
String dropdownValue2 = 'Select an option';
String dropdownValue3 = 'Select an option';
String dropdownValue4 = 'Select an option';

final Map Neighbourhood = {
  'Sunset Park': 0,
  'Upper West Side': 1,
  'Bedford-Stuyvesant': 2,
  'Midtown': 3,
  'East Harlem': 4,
  'South Slope': 5,
  'Williamsburg': 6,
  'Fort Greene': 7,
  "Hell's Kitchen": 8,
  'Harlem': 9,
  'Long Island City': 10,
  'East Village': 11,
  'Lower East Side': 12,
  'West Village': 13,
  'Greenpoint': 14,
  'East Flatbush': 15,
  'Clinton Hill': 16,
  'Chelsea': 17,
  'Prospect Heights': 18,
  'Eastchester': 19,
  'Crown Heights': 20,
  'Boerum Hill': 21,
  'Washington Heights': 22,
  'Upper East Side': 23,
  'Nolita': 24,
  'Kips Bay': 25,
  'Sunnyside': 26,
  'Carroll Gardens': 27,
  'St. George': 28,
  'Park Slope': 29,
  'Gowanus': 30,
  'Ridgewood': 31,
  'Morningside Heights': 32,
  'Rockaway Beach': 33,
  'Ditmars Steinway': 34,
  'Middle Village': 35,
  'Chinatown': 36,
  'Greenwich Village': 37,
  'Kingsbridge': 38,
  'Jamaica': 39,
  'Astoria': 40,
  'Brooklyn Heights': 41,
  'Flatiron District': 42,
  'Windsor Terrace': 43,
  'Tribeca': 44,
  'Bushwick': 45,
  'Forest Hills': 46,
  'Murray Hill': 47,
  'Stuyvesant Town': 48,
  'Sheepshead Bay': 49,
  'Arrochar': 50,
  'East New York': 51,
  'Emerson Hill': 52,
  'Bensonhurst': 53,
  'Theater District': 54,
  'University Heights': 55,
  'Rego Park': 56,
  'Kensington': 57,
  'Shore Acres': 58,
  'Woodside': 59,
  'Allerton': 60,
  'Richmond Hill': 61,
  'Prospect-Lefferts Gardens': 62,
  'Elmhurst': 63,
  'Gramercy': 64,
  'SoHo': 65,
  'Little Italy': 66,
  'Bayside': 67,
  'Brighton Beach': 68,
  'New Springville': 69,
  'Mott Haven': 70,
  'Jackson Heights': 71,
  'Maspeth': 72,
  'Inwood': 73,
  'Spuyten Duyvil': 74,
  'Briarwood': 75,
  'Battery Park City': 76,
  'Flushing': 77,
  'Two Bridges': 78,
  'Gravesend': 79,
  'Fort Hamilton': 80,
  'Cypress Hills': 81,
  'Mariners Harbor': 82,
  'East Elmhurst': 83,
  'Downtown Brooklyn': 84,
  'Cobble Hill': 85,
  'Concord': 86,
  'Tottenville': 87,
  'Flatbush': 88,
  'Melrose': 89,
  'NoHo': 90,
  'Columbia St': 91,
  'College Point': 92,
  'Vinegar Hill': 93,
  'Concourse': 94,
  'DUMBO': 95,
  'City Island': 96,
  'Red Hook': 97,
  'Bay Ridge': 98,
  'Longwood': 99,
  'Financial District': 100,
  'Canarsie': 101,
  'Port Morris': 102,
  'Flatlands': 103,
  'Arverne': 104,
  'Glendale': 105,
  'Williamsbridge': 106,
  'Soundview': 107,
  'Woodhaven': 108,
  'Parkchester': 109,
  'Bronxdale': 110,
  'Ozone Park': 111,
  'Borough Park': 112,
  'Bay Terrace': 113,
  'Claremont Village': 114,
  'Fordham': 115,
  'Clifton': 116,
  'Concourse Village': 117,
  'Huguenot': 118,
  'Brownsville': 119,
  'Mount Hope': 120,
  'Wakefield': 121,
  'Midwood': 122,
  'Navy Yard': 123,
  'Fieldston': 124,
  'Civic Center': 125,
  'Norwood': 126,
  'Lighthouse Hill': 127,
  'Clason Point': 128,
  'Unionport': 129,
  'Randall Manor': 130,
  'Kew Gardens Hills': 131,
  'Jamaica Estates': 132,
  'Kew Gardens': 133,
  'Bellerose': 134,
  'Fresh Meadows': 135,
  'Morris Park': 136,
  'South Ozone Park': 137,
  'East Morrisania': 138,
  'Far Rockaway': 139,
  'Springfield Gardens': 140,
  'Tremont': 141,
  'Corona': 142,
  'West Brighton': 143,
  'Manhattan Beach': 144,
  'Dongan Hills': 145,
  'Marble Hill': 146,
  'Roosevelt Island': 147,
  'Laurelton': 148,
  'Hunts Point': 149,
  'Queens Village': 150,
  'Great Kills': 151,
  'Howard Beach': 152,
  'Silver Lake': 153,
  'Riverdale': 154,
  'Grymes Hill': 155,
  'Holliswood': 156,
  'Tompkinsville': 157,
  'Castleton Corners': 158,
  'St. Albans': 159,
  'New Brighton': 160,
  'Edgemere': 161,
  'Pelham Gardens': 162,
  'Baychester': 163,
  'Sea Gate': 164,
  'Bergen Beach': 165,
  'Stapleton': 166,
  'Cambria Heights': 167,
  'Woodlawn': 168,
  'Richmondtown': 169,
  'Olinville': 170,
  'Dyker Heights': 171,
  'Throgs Neck': 172,
  'Coney Island': 173,
  'Rosedale': 174,
  'Highbridge': 175,
  'Howland Hook': 176,
  'Pelham Bay': 177,
  'Bath Beach': 178,
  'South Beach': 179,
  'Midland Beach': 180,
  'Oakwood': 181,
  'Eltingville': 182,
  'Schuylerville': 183,
  'Whitestone': 184,
  'Edenwald': 185,
  'Mount Eden': 186,
  'Neponsit': 187,
  'Morris Heights': 188,
  'Westchester Square': 189,
  'Hollis': 190,
  'Van Nest': 191,
  'Rosebank': 192,
  'Grant City': 193,
  'Port Richmond': 194,
  'North Riverdale': 195,
  'Country Club': 196,
  'Morrisania': 197,
  'Belmont': 198,
  'Bayswater': 199,
  'Willowbrook': 200,
  'New Dorp Beach': 201,
  'Douglaston': 202,
  'Todt Hill': 203,
  'Mill Basin': 204,
  'Little Neck': 205,
  'Arden Heights': 206,
  'Co-op City': 207,
  'Jamaica Hills': 208,
  "Prince's Bay": 209,
  "Bull's Head": 210,
  'Castle Hill': 211,
  'West Farms': 212,
  'Belle Harbor': 213,
  'Westerleigh': 214,
  'Chelsea, Staten Island': 215,
  'Gerritsen Beach': 216,
  'Breezy Point': 217,
  'Woodrow': 218,
  'Graniteville': 219,
  'Hollis Hills': 220
};

final Map Neighbourhood_group = {
  'Brooklyn': 0,
  'Manhattan': 1,
  'Queens': 2,
  'Bronx': 3,
  'Staten Island': 4
};

final Map Room_type = {
  'Entire home/apt': 0,
  'Hotel room': 1,
  'Private room': 2,
  'Shared room': 3
};

final Map min_lat = {
  'Select an option': 40.0,
  'Sunset Park': 40.63533,
  'Upper West Side': 40.76778,
  'Bedford-Stuyvesant': 40.6763,
  'Midtown': 40.74153,
  'East Harlem': 40.78373,
  'South Slope': 40.65998,
  'Williamsburg': 40.69884,
  'Fort Greene': 40.68214,
  "Hell's Kitchen": 40.75225,
  'Harlem': 40.79754,
  'Long Island City': 40.7349,
  'East Village': 40.72042,
  'Lower East Side': 40.70973,
  'West Village': 40.72845,
  'Greenpoint': 40.71887,
  'East Flatbush': 40.63231,
  'Clinton Hill': 40.68048,
  'Chelsea': 40.73575,
  'Prospect Heights': 40.67182,
  'Eastchester': 40.87697,
  'Crown Heights': 40.66358,
  'Boerum Hill': 40.68203,
  'Washington Heights': 40.82948,
  'Upper East Side': 40.75884,
  'Nolita': 40.71991,
  'Kips Bay': 40.73693,
  'Sunnyside': 40.73352,
  'Carroll Gardens': 40.67416,
  'St. George': 40.63704,
  'Park Slope': 40.66584,
  'Gowanus': 40.66619,
  'Ridgewood': 40.69314,
  'Morningside Heights': 40.80176,
  'Rockaway Beach': 40.58323,
  'Ditmars Steinway': 40.76736,
  'Middle Village': 40.70642,
  'Chinatown': 40.71284,
  'Greenwich Village': 40.72644,
  'Kingsbridge': 40.86209,
  'Jamaica': 40.6668,
  'Astoria': 40.75419,
  'Brooklyn Heights': 40.69003,
  'Flatiron District': 40.73912,
  'Windsor Terrace': 40.64782,
  'Tribeca': 40.71168,
  'Bushwick': 40.68136,
  'Forest Hills': 40.70397,
  'Murray Hill': 40.74338,
  'Stuyvesant Town': 40.72693,
  'Sheepshead Bay': 40.58315,
  'Arrochar': 40.58541,
  'East New York': 40.65252,
  'Emerson Hill': 40.60548,
  'Bensonhurst': 40.60296,
  'Theater District': 40.75413,
  'University Heights': 40.85477,
  'Rego Park': 40.71663,
  'Kensington': 40.62836,
  'Shore Acres': 40.60442,
  'Woodside': 40.73994,
  'Allerton': 40.85813030484085,
  'Richmond Hill': 40.67788,
  'Prospect-Lefferts Gardens': 40.65433,
  'Elmhurst': 40.72529,
  'Gramercy': 40.73167,
  'SoHo': 40.7187,
  'Little Italy': 40.71698,
  'Bayside': 40.74805,
  'Brighton Beach': 40.57467,
  'New Springville': 40.58325,
  'Mott Haven': 40.80527,
  'Jackson Heights': 40.74678,
  'Maspeth': 40.71435,
  'Inwood': 40.85901,
  'Spuyten Duyvil': 40.88045,
  'Briarwood': 40.70455,
  'Battery Park City': 40.70433,
  'Flushing': 40.72211,
  'Two Bridges': 40.70913,
  'Gravesend': 40.58482,
  'Fort Hamilton': 40.61073052427158,
  'Cypress Hills': 40.67573,
  'Mariners Harbor': 40.62667,
  'East Elmhurst': 40.75485,
  'Downtown Brooklyn': 40.68888,
  'Cobble Hill': 40.68455,
  'Concord': 40.59862,
  'Tottenville': 40.50031443485432,
  'Flatbush': 40.62895,
  'Melrose': 40.81794,
  'NoHo': 40.72446,
  'Columbia St': 40.68,
  'College Point': 40.777122,
  'Vinegar Hill': 40.69863,
  'Concourse': 40.81896,
  'DUMBO': 40.70149,
  'City Island': 40.83782,
  'Red Hook': 40.66503,
  'Bay Ridge': 40.61991,
  'Longwood': 40.81182,
  'Financial District': 40.70242,
  'Canarsie': 40.6275,
  'Port Morris': 40.80056,
  'Flatlands': 40.61235,
  'Arverne': 40.58658,
  'Glendale': 40.69263,
  'Williamsbridge': 40.86971,
  'Soundview': 40.81965,
  'Woodhaven': 40.68521,
  'Parkchester': 40.82894,
  'Bronxdale': 40.85172,
  'Ozone Park': 40.6667,
  'Borough Park': 40.6097,
  'Bay Terrace': 40.77769,
  'Claremont Village': 40.83563,
  'Fordham': 40.85142,
  'Clifton': 40.61639,
  'Concourse Village': 40.81868,
  'Huguenot': 40.53552,
  'Brownsville': 40.65239,
  'Mount Hope': 40.84498,
  'Wakefield': 40.88332,
  'Midwood': 40.60974,
  'Navy Yard': 40.69795,
  'Fieldston': 40.88747,
  'Civic Center': 40.71174,
  'Norwood': 40.86935,
  'Lighthouse Hill': 40.57583,
  'Clason Point': 40.80509,
  'Unionport': 40.82451,
  'Randall Manor': 40.62794,
  'Kew Gardens Hills': 40.71673,
  'Jamaica Estates': 40.71107,
  'Kew Gardens': 40.70259,
  'Bellerose': 40.72415,
  'Fresh Meadows': 40.72752,
  'Morris Park': 40.84486,
  'South Ozone Park': 40.66296694908267,
  'East Morrisania': 40.82871,
  'Far Rockaway': 40.59253,
  'Springfield Gardens': 40.65687,
  'Tremont': 40.83972,
  'Corona': 40.73469,
  'West Brighton': 40.62534,
  'Manhattan Beach': 40.57817,
  'Dongan Hills': 40.58013,
  'Marble Hill': 40.87478,
  'Roosevelt Island': 40.75465,
  'Laurelton': 40.66658,
  'Hunts Point': 40.81197,
  'Queens Village': 40.70285,
  'Great Kills': 40.54046,
  'Howard Beach': 40.64939,
  'Silver Lake': 40.61842,
  'Riverdale': 40.88422,
  'Grymes Hill': 40.6102,
  'Holliswood': 40.71992,
  'Tompkinsville': 40.62556,
  'Castleton Corners': 40.61066,
  'St. Albans': 40.68499,
  'New Brighton': 40.63601,
  'Edgemere': 40.59346,
  'Pelham Gardens': 40.85722,
  'Baychester': 40.86568,
  'Sea Gate': 40.57413,
  'Bergen Beach': 40.61797,
  'Stapleton': 40.62534,
  'Cambria Heights': 40.68465,
  'Woodlawn': 40.89567,
  'Richmondtown': 40.56635,
  'Olinville': 40.87077,
  'Dyker Heights': 40.60588,
  'Throgs Neck': 40.80903,
  'Coney Island': 40.57433,
  'Rosedale': 40.64881,
  'Highbridge': 40.82979,
  'Howland Hook': 40.62468,
  'Pelham Bay': 40.84425,
  'Bath Beach': 40.5999,
  'South Beach': 40.58692,
  'Midland Beach': 40.57087,
  'Oakwood': 40.55893,
  'Eltingville': 40.53887,
  'Schuylerville': 40.83027,
  'Whitestone': 40.77696,
  'Edenwald': 40.87941,
  'Mount Eden': 40.83774,
  'Neponsit': 40.56948,
  'Morris Heights': 40.84576,
  'Westchester Square': 40.83678,
  'Hollis': 40.70579,
  'Van Nest': 40.84053,
  'Rosebank': 40.61183,
  'Grant City': 40.57746,
  'Port Richmond': 40.62773,
  'North Riverdale': 40.90326,
  'Country Club': 40.84121,
  'Morrisania': 40.8242,
  'Belmont': 40.84885,
  'Bayswater': 40.59868,
  'Willowbrook': 40.59919,
  'New Dorp Beach': 40.5597,
  'Douglaston': 40.75541,
  'Todt Hill': 40.58612,
  'Mill Basin': 40.60761,
  'Little Neck': 40.76147,
  'Arden Heights': 40.54652,
  'Co-op City': 40.8609034,
  'Jamaica Hills': 40.70853,
  "Prince's Bay": 40.52034,
  "Bull's Head": 40.60394,
  'Castle Hill': 40.8159,
  'West Farms': 40.83865,
  'Belle Harbor': 40.57468,
  'Westerleigh': 40.61785,
  'Chelsea, Staten Island': 40.59116,
  'Gerritsen Beach': 40.58994,
  'Breezy Point': 40.56649,
  'Woodrow': 40.53777,
  'Graniteville': 40.61264,
  'Hollis Hills': 40.73119
};

final Map max_lat = {
  'Select an option': 41.0,
  'Sunset Park': 40.66667,
  'Upper West Side': 40.80452,
  'Bedford-Stuyvesant': 40.70048,
  'Midtown': 40.76749,
  'East Harlem': 40.81533,
  'South Slope': 40.66979376881576,
  'Williamsburg': 40.72359,
  'Fort Greene': 40.69806,
  "Hell's Kitchen": 40.77186,
  'Harlem': 40.83356,
  'Long Island City': 40.76667,
  'East Village': 40.73411,
  'Lower East Side': 40.72381,
  'West Village': 40.74087,
  'Greenpoint': 40.73876,
  'East Flatbush': 40.66542,
  'Clinton Hill': 40.69757,
  'Chelsea': 40.755322460000365,
  'Prospect Heights': 40.68292,
  'Eastchester': 40.88976,
  'Crown Heights': 40.68041,
  'Boerum Hill': 40.69042,
  'Washington Heights': 40.86091,
  'Upper East Side': 40.78752,
  'Nolita': 40.72468,
  'Kips Bay': 40.74613,
  'Sunnyside': 40.74942,
  'Carroll Gardens': 40.68604,
  'St. George': 40.64816,
  'Park Slope': 40.68425,
  'Gowanus': 40.68489,
  'Ridgewood': 40.71264,
  'Morningside Heights': 40.81662,
  'Rockaway Beach': 40.59135,
  'Ditmars Steinway': 40.78336,
  'Middle Village': 40.7264,
  'Chinatown': 40.71884,
  'Greenwich Village': 40.73666,
  'Kingsbridge': 40.8893962,
  'Jamaica': 40.71107,
  'Astoria': 40.7767,
  'Brooklyn Heights': 40.70207,
  'Flatiron District': 40.74445,
  'Windsor Terrace': 40.66053,
  'Tribeca': 40.72442,
  'Bushwick': 40.70834,
  'Forest Hills': 40.73673,
  'Murray Hill': 40.75209,
  'Stuyvesant Town': 40.73582,
  'Sheepshead Bay': 40.61021,
  'Arrochar': 40.59787,
  'East New York': 40.67901,
  'Emerson Hill': 40.60862,
  'Bensonhurst': 40.6218,
  'Theater District': 40.7637,
  'University Heights': 40.86277,
  'Rego Park': 40.73582,
  'Kensington': 40.64776,
  'Shore Acres': 40.615,
  'Woodside': 40.75651,
  'Allerton': 40.87256,
  'Richmond Hill': 40.70528,
  'Prospect-Lefferts Gardens': 40.663930108829966,
  'Elmhurst': 40.74851,
  'Gramercy': 40.7394,
  'SoHo': 40.72828,
  'Little Italy': 40.72054,
  'Bayside': 40.77873,
  'Brighton Beach': 40.583878,
  'New Springville': 40.59339,
  'Mott Haven': 40.81814,
  'Jackson Heights': 40.75786,
  'Maspeth': 40.74124,
  'Inwood': 40.87347,
  'Spuyten Duyvil': 40.88489,
  'Briarwood': 40.71589,
  'Battery Park City': 40.71812,
  'Flushing': 40.77647,
  'Two Bridges': 40.71295,
  'Gravesend': 40.60878,
  'Fort Hamilton': 40.62321,
  'Cypress Hills': 40.69067,
  'Mariners Harbor': 40.64117,
  'East Elmhurst': 40.77132,
  'Downtown Brooklyn': 40.70142,
  'Cobble Hill': 40.69073,
  'Concord': 40.60787,
  'Tottenville': 40.50863,
  'Flatbush': 40.6550780772241,
  'Melrose': 40.8245,
  'NoHo': 40.72952,
  'Columbia St': 40.69037,
  'College Point': 40.79413,
  'Vinegar Hill': 40.70417,
  'Concourse': 40.83664,
  'DUMBO': 40.70461,
  'City Island': 40.85726,
  'Red Hook': 40.68177,
  'Bay Ridge': 40.64055,
  'Longwood': 40.828,
  'Financial District': 40.7117,
  'Canarsie': 40.65492,
  'Port Morris': 40.81056,
  'Flatlands': 40.63278,
  'Arverne': 40.59926,
  'Glendale': 40.70686,
  'Williamsbridge': 40.88526,
  'Soundview': 40.83146,
  'Woodhaven': 40.69803,
  'Parkchester': 40.84136,
  'Bronxdale': 40.85686,
  'Ozone Park': 40.69037,
  'Borough Park': 40.64793,
  'Bay Terrace': 40.78797,
  'Claremont Village': 40.84467,
  'Fordham': 40.87083,
  'Clifton': 40.62578,
  'Concourse Village': 40.83582,
  'Huguenot': 40.54335,
  'Brownsville': 40.67605,
  'Mount Hope': 40.85229,
  'Wakefield': 40.90505,
  'Midwood': 40.63152,
  'Navy Yard': 40.70245,
  'Fieldston': 40.89633,
  'Civic Center': 40.71681,
  'Norwood': 40.88345,
  'Lighthouse Hill': 40.57716,
  'Clason Point': 40.82037,
  'Unionport': 40.83321,
  'Randall Manor': 40.64174,
  'Kew Gardens Hills': 40.73497,
  'Jamaica Estates': 40.72606662945048,
  'Kew Gardens': 40.71385,
  'Bellerose': 40.73596,
  'Fresh Meadows': 40.75247,
  'Morris Park': 40.85713,
  'South Ozone Park': 40.68245,
  'East Morrisania': 40.83928,
  'Far Rockaway': 40.6059,
  'Springfield Gardens': 40.69148,
  'Tremont': 40.84902,
  'Corona': 40.75233,
  'West Brighton': 40.63462,
  'Manhattan Beach': 40.58093,
  'Dongan Hills': 40.58403,
  'Marble Hill': 40.87821,
  'Roosevelt Island': 40.76949,
  'Laurelton': 40.68507,
  'Hunts Point': 40.81913,
  'Queens Village': 40.72958,
  'Great Kills': 40.56071,
  'Howard Beach': 40.67145,
  'Silver Lake': 40.63133,
  'Riverdale': 40.89802,
  'Grymes Hill': 40.61887,
  'Holliswood': 40.72358,
  'Tompkinsville': 40.6376,
  'Castleton Corners': 40.62685,
  'St. Albans': 40.70825,
  'New Brighton': 40.6438,
  'Edgemere': 40.59814,
  'Pelham Gardens': 40.86877,
  'Baychester': 40.87751,
  'Sea Gate': 40.58057,
  'Bergen Beach': 40.6308,
  'Stapleton': 40.6367341,
  'Cambria Heights': 40.7033,
  'Woodlawn': 40.901187945676526,
  'Richmondtown': 40.5734,
  'Olinville': 40.88544,
  'Dyker Heights': 40.63277,
  'Throgs Neck': 40.83171,
  'Coney Island': 40.58072,
  'Rosedale': 40.68078,
  'Highbridge': 40.84331,
  'Howland Hook': 40.63018,
  'Pelham Bay': 40.85587,
  'Bath Beach': 40.61012,
  'South Beach': 40.5960031,
  'Midland Beach': 40.57552,
  'Oakwood': 40.56082,
  'Eltingville': 40.54518,
  'Schuylerville': 40.84256,
  'Whitestone': 40.79886,
  'Edenwald': 40.89318,
  'Mount Eden': 40.84427,
  'Neponsit': 40.57068,
  'Morris Heights': 40.85522,
  'Westchester Square': 40.84518,
  'Hollis': 40.71833,
  'Van Nest': 40.8487,
  'Rosebank': 40.61616,
  'Grant City': 40.58239,
  'Port Richmond': 40.63795,
  'North Riverdale': 40.91138,
  'Country Club': 40.84414267996832,
  'Morrisania': 40.83383,
  'Belmont': 40.85829,
  'Bayswater': 40.61121,
  'Willowbrook': 40.59919,
  'New Dorp Beach': 40.56653,
  'Douglaston': 40.76741,
  'Todt Hill': 40.604679,
  'Mill Basin': 40.61784,
  'Little Neck': 40.77365,
  'Arden Heights': 40.56434,
  'Co-op City': 40.87398,
  'Jamaica Hills': 40.71856,
  "Prince's Bay": 40.53138,
  "Bull's Head": 40.60394,
  'Castle Hill': 40.82092,
  'West Farms': 40.84315,
  'Belle Harbor': 40.58115,
  'Westerleigh': 40.61785,
  'Chelsea, Staten Island': 40.59598,
  'Gerritsen Beach': 40.5915,
  'Breezy Point': 40.56822,
  'Woodrow': 40.53777,
  'Graniteville': 40.6256,
  'Hollis Hills': 40.73119
};

final Map min_lng = {
  'Select an option': -74.0,
  'Sunset Park': -74.024666,
  'Upper West Side': -73.99329,
  'Bedford-Stuyvesant': -73.96114,
  'Midtown': -73.99308,
  'East Harlem': -73.95476,
  'South Slope': -73.99229,
  'Williamsburg': -73.96918,
  'Fort Greene': -73.98253705395435,
  "Hell's Kitchen": -74.00252,
  'Harlem': -73.95909,
  'Long Island City': -73.96011,
  'East Village': -73.99249,
  'Lower East Side': -73.99473,
  'West Village': -74.01055,
  'Greenpoint': -73.96076,
  'East Flatbush': -73.95249132066965,
  'Clinton Hill': -73.97015,
  'Chelsea': -74.00903,
  'Prospect Heights': -73.97511,
  'Eastchester': -73.84126,
  'Crown Heights': -73.96389,
  'Boerum Hill': -73.99216,
  'Washington Heights': -73.94952,
  'Upper East Side': -73.97171,
  'Nolita': -73.99754,
  'Kips Bay': -73.98406,
  'Sunnyside': -73.93315338150312,
  'Carroll Gardens': -74.00295,
  'St. George': -74.08665,
  'Park Slope': -73.98821,
  'Gowanus': -73.99726,
  'Ridgewood': -73.92015,
  'Morningside Heights': -73.96761,
  'Rockaway Beach': -73.81827,
  'Ditmars Steinway': -73.92582,
  'Middle Village': -73.89829,
  'Chinatown': -74.00304,
  'Greenwich Village': -74.00234,
  'Kingsbridge': -73.91226,
  'Jamaica': -73.81526,
  'Astoria': -73.93561,
  'Brooklyn Heights': -74.0,
  'Flatiron District': -73.99389,
  'Windsor Terrace': -73.98688,
  'Tribeca': -74.01198,
  'Bushwick': -73.94082,
  'Forest Hills': -73.8568,
  'Murray Hill': -73.9826,
  'Stuyvesant Town': -73.98195,
  'Sheepshead Bay': -73.96698,
  'Arrochar': -74.08434,
  'East New York': -73.90251,
  'Emerson Hill': -74.14388,
  'Bensonhurst': -74.00691,
  'Theater District': -73.99003,
  'University Heights': -73.91597,
  'Rego Park': -73.87128,
  'Kensington': -73.9866,
  'Shore Acres': -74.07139,
  'Woodside': -73.91262,
  'Allerton': -73.86986,
  'Richmond Hill': -73.84731,
  'Prospect-Lefferts Gardens': -73.96288,
  'Elmhurst': -73.89086,
  'Gramercy': -73.99082,
  'SoHo': -74.00931,
  'Little Italy': -73.99935,
  'Bayside': -73.77776,
  'Brighton Beach': -73.96824,
  'New Springville': -74.16178,
  'Mott Haven': -73.93107,
  'Jackson Heights': -73.89718,
  'Maspeth': -73.91994,
  'Inwood': -73.93507,
  'Spuyten Duyvil': -73.91825,
  'Briarwood': -73.82423,
  'Battery Park City': -74.01869,
  'Flushing': -73.83696,
  'Two Bridges': -74.00025,
  'Gravesend': -73.99826,
  'Fort Hamilton': -74.03969,
  'Cypress Hills': -73.90786,
  'Mariners Harbor': -74.1697,
  'East Elmhurst': -73.89974,
  'Downtown Brooklyn': -73.99134,
  'Cobble Hill': -74.00002,
  'Concord': -74.09103,
  'Tottenville': -74.24984,
  'Flatbush': -73.97197,
  'Melrose': -73.92286,
  'NoHo': -73.99584,
  'Columbia St': -74.01205,
  'College Point': -73.85586,
  'Vinegar Hill': -73.98541,
  'Concourse': -73.93,
  'DUMBO': -73.9899069,
  'City Island': -73.79095,
  'Red Hook': -74.01718,
  'Bay Ridge': -74.03614,
  'Longwood': -73.91317,
  'Financial District': -74.01643,
  'Canarsie': -73.91979,
  'Port Morris': -73.93195046074752,
  'Flatlands': -73.947,
  'Arverne': -73.80273,
  'Glendale': -73.8982,
  'Williamsbridge': -73.86475,
  'Soundview': -73.88204,
  'Woodhaven': -73.86741,
  'Parkchester': -73.87709,
  'Bronxdale': -73.86908,
  'Ozone Park': -73.86265,
  'Borough Park': -74.00796,
  'Bay Terrace': -73.78404,
  'Claremont Village': -73.91198,
  'Fordham': -73.90443,
  'Clifton': -74.08581,
  'Concourse Village': -73.92691,
  'Huguenot': -74.17687,
  'Brownsville': -73.92559027728734,
  'Mount Hope': -73.911018,
  'Wakefield': -73.86499,
  'Midwood': -73.97318,
  'Navy Yard': -73.98037,
  'Fieldston': -73.90696,
  'Civic Center': -74.00795,
  'Norwood': -73.88701,
  'Lighthouse Hill': -74.14087,
  'Clason Point': -73.86517,
  'Unionport': -73.85926,
  'Randall Manor': -74.12839,
  'Kew Gardens Hills': -73.829,
  'Jamaica Estates': -73.8076,
  'Kew Gardens': -73.83618,
  'Bellerose': -73.73872,
  'Fresh Meadows': -73.79392,
  'Morris Park': -73.86482,
  'South Ozone Park': -73.82737,
  'East Morrisania': -73.8932,
  'Far Rockaway': -73.76356,
  'Springfield Gardens': -73.78462,
  'Tremont': -73.90022,
  'Corona': -73.86858,
  'West Brighton': -74.12369,
  'Manhattan Beach': -73.95325,
  'Dongan Hills': -74.107,
  'Marble Hill': -73.91133599999999,
  'Roosevelt Island': -73.95662,
  'Laurelton': -73.754036,
  'Hunts Point': -73.8968,
  'Queens Village': -73.75642,
  'Great Kills': -74.15805,
  'Howard Beach': -73.85746,
  'Silver Lake': -74.10242,
  'Riverdale': -73.91363,
  'Grymes Hill': -74.09318,
  'Holliswood': -73.77458,
  'Tompkinsville': -74.09525,
  'Castleton Corners': -74.12949,
  'St. Albans': -73.7817,
  'New Brighton': -74.09291,
  'Edgemere': -73.7782,
  'Pelham Gardens': -73.851865,
  'Baychester': -73.85098,
  'Sea Gate': -74.01229,
  'Bergen Beach': -73.91806,
  'Stapleton': -74.08415,
  'Cambria Heights': -73.748283,
  'Woodlawn': -73.87235,
  'Richmondtown': -74.13084,
  'Olinville': -73.86887,
  'Dyker Heights': -74.01748,
  'Throgs Neck': -73.83645,
  'Coney Island': -74.0022511,
  'Rosedale': -73.75058823914738,
  'Highbridge': -73.93136,
  'Howland Hook': -74.17485,
  'Pelham Bay': -73.84008,
  'Bath Beach': -74.01662,
  'South Beach': -74.0924974,
  'Midland Beach': -74.09779,
  'Oakwood': -74.1289,
  'Eltingville': -74.15396,
  'Schuylerville': -73.83582,
  'Whitestone': -73.82432,
  'Edenwald': -73.8495215,
  'Mount Eden': -73.92247,
  'Neponsit': -73.86126,
  'Morris Heights': -73.92493,
  'Westchester Square': -73.84995830000001,
  'Hollis': -73.78034,
  'Van Nest': -73.87219,
  'Rosebank': -74.07593,
  'Grant City': -74.11117,
  'Port Richmond': -74.14578,
  'North Riverdale': -73.90709,
  'Country Club': -73.82513,
  'Morrisania': -73.9133,
  'Belmont': -73.8952111,
  'Bayswater': -73.76996,
  'Willowbrook': -74.13389,
  'New Dorp Beach': -74.10441,
  'Douglaston': -73.74813,
  'Todt Hill': -74.10824,
  'Mill Basin': -73.92308,
  'Little Neck': -73.74303,
  'Arden Heights': -74.18373,
  'Co-op City': -73.83209155493961,
  'Jamaica Hills': -73.80722,
  "Prince's Bay": -74.21897,
  "Bull's Head": -74.16678,
  'Castle Hill': -73.85193392802863,
  'West Farms': -73.88425,
  'Belle Harbor': -73.85603,
  'Westerleigh': -74.1352,
  'Chelsea, Staten Island': -74.1858,
  'Gerritsen Beach': -73.92946,
  'Breezy Point': -73.87111,
  'Woodrow': -74.20674,
  'Graniteville': -74.16562,
  'Hollis Hills': -73.75412
};

final Map max_lng = {
  'Select an option': -73.0,
  'Sunset Park': -73.98785,
  'Upper West Side': -73.95878,
  'Bedford-Stuyvesant': -73.90564,
  'Midtown': -73.96064,
  'East Harlem': -73.9305,
  'South Slope': -73.97776,
  'Williamsburg': -73.92209,
  'Fort Greene': -73.96769,
  "Hell's Kitchen": -73.9827,
  'Harlem': -73.9347,
  'Long Island City': -73.91308,
  'East Village': -73.97501,
  'Lower East Side': -73.97723,
  'West Village': -73.997246,
  'Greenpoint': -73.93664,
  'East Flatbush': -73.91165,
  'Clinton Hill': -73.95862,
  'Chelsea': -73.98813,
  'Prospect Heights': -73.96271,
  'Eastchester': -73.81612,
  'Crown Heights': -73.90831,
  'Boerum Hill': -73.9788,
  'Washington Heights': -73.92538,
  'Upper East Side': -73.94339,
  'Nolita': -73.99281,
  'Kips Bay': -73.97175,
  'Sunnyside': -73.90887,
  'Carroll Gardens': -73.98923,
  'St. George': -74.07637,
  'Park Slope': -73.97132,
  'Gowanus': -73.98043,
  'Ridgewood': -73.89358,
  'Morningside Heights': -73.95635,
  'Rockaway Beach': -73.80114,
  'Ditmars Steinway': -73.88928,
  'Middle Village': -73.86837,
  'Chinatown': -73.98967,
  'Greenwich Village': -73.9913,
  'Kingsbridge': -73.89079,
  'Jamaica': -73.76184,
  'Astoria': -73.9039041573238,
  'Brooklyn Heights': -73.99068,
  'Flatiron District': -73.9835,
  'Windsor Terrace': -73.97196,
  'Tribeca': -74.00276,
  'Bushwick': -73.90272,
  'Forest Hills': -73.83276622742414,
  'Murray Hill': -73.96979,
  'Stuyvesant Town': -73.97172,
  'Sheepshead Bay': -73.93191,
  'Arrochar': -74.06296,
  'East New York': -73.85683635050027,
  'Emerson Hill': -74.11728,
  'Bensonhurst': -73.97332,
  'Theater District': -73.98077,
  'University Heights': -73.90177,
  'Rego Park': -73.85259,
  'Kensington': -73.96762,
  'Shore Acres': -74.06171,
  'Woodside': -73.8909803,
  'Allerton': -73.84657,
  'Richmond Hill': -73.80946,
  'Prospect-Lefferts Gardens': -73.93995,
  'Elmhurst': -73.86549,
  'Gramercy': -73.97908,
  'SoHo': -73.9961929321289,
  'Little Italy': -73.99457,
  'Bayside': -73.75526,
  'Brighton Beach': -73.95404,
  'New Springville': -74.15221,
  'Mott Haven': -73.90496,
  'Jackson Heights': -73.85355,
  'Maspeth': -73.88813,
  'Inwood': -73.91327,
  'Spuyten Duyvil': -73.91129,
  'Briarwood': -73.80336,
  'Battery Park City': -74.0136,
  'Flushing': -73.78644,
  'Two Bridges': -73.99265,
  'Gravesend': -73.96719,
  'Fort Hamilton': -74.023895,
  'Cypress Hills': -73.86298,
  'Mariners Harbor': -74.14626,
  'East Elmhurst': -73.85643,
  'Downtown Brooklyn': -73.98111,
  'Cobble Hill': -73.99051,
  'Concord': -74.07337,
  'Tottenville': -74.23913564532995,
  'Flatbush': -73.94767,
  'Melrose': -73.91353,
  'NoHo': -73.99104,
  'Columbia St': -73.9989,
  'College Point': -73.83217,
  'Vinegar Hill': -73.98064,
  'Concourse': -73.91801,
  'DUMBO': -73.98484,
  'City Island': -73.78328,
  'Red Hook': -74.00094,
  'Bay Ridge': -74.01739,
  'Longwood': -73.88633,
  'Financial District': -74.00041,
  'Canarsie': -73.88057,
  'Port Morris': -73.91049,
  'Flatlands': -73.91772,
  'Arverne': -73.78667,
  'Glendale': -73.85692313135996,
  'Williamsbridge': -73.84524,
  'Soundview': -73.8596,
  'Woodhaven': -73.84691,
  'Parkchester': -73.85428,
  'Bronxdale': -73.85765,
  'Ozone Park': -73.83203,
  'Borough Park': -73.97337,
  'Bay Terrace': -73.77736,
  'Claremont Village': -73.89798,
  'Fordham': -73.88378,
  'Clifton': -74.06875,
  'Concourse Village': -73.90965,
  'Huguenot': -74.16442,
  'Brownsville': -73.90149,
  'Mount Hope': -73.90076,
  'Wakefield': -73.83964,
  'Midwood': -73.9445698,
  'Navy Yard': -73.96503,
  'Fieldston': -73.89652,
  'Civic Center': -73.99876,
  'Norwood': -73.87111,
  'Lighthouse Hill': -74.12923,
  'Clason Point': -73.84952,
  'Unionport': -73.84432,
  'Randall Manor': -74.0951,
  'Kew Gardens Hills': -73.81048,
  'Jamaica Estates': -73.77634,
  'Kew Gardens': -73.81998,
  'Bellerose': -73.71087,
  'Fresh Meadows': -73.7751,
  'Morris Park': -73.83881,
  'South Ozone Park': -73.79032537295538,
  'East Morrisania': -73.88358,
  'Far Rockaway': -73.73876,
  'Springfield Gardens': -73.747,
  'Tremont': -73.88587,
  'Corona': -73.85073,
  'West Brighton': -74.09754,
  'Manhattan Beach': -73.93727,
  'Dongan Hills': -74.08876,
  'Marble Hill': -73.90721,
  'Roosevelt Island': -73.94315,
  'Laurelton': -73.72932,
  'Hunts Point': -73.8847,
  'Queens Village': -73.7282713,
  'Great Kills': -74.14322,
  'Howard Beach': -73.8289375,
  'Silver Lake': -74.09559,
  'Riverdale': -73.90791,
  'Grymes Hill': -74.08846,
  'Holliswood': -73.76413,
  'Tompkinsville': -74.0784,
  'Castleton Corners': -74.11354,
  'St. Albans': -73.7479,
  'New Brighton': -74.08723,
  'Edgemere': -73.76897,
  'Pelham Gardens': -73.8340207,
  'Baychester': -73.83403,
  'Sea Gate': -74.0046,
  'Bergen Beach': -73.90066,
  'Stapleton': -74.07553,
  'Cambria Heights': -73.72661,
  'Woodlawn': -73.86164,
  'Richmondtown': -74.12328,
  'Olinville': -73.86207,
  'Dyker Heights': -74.00731,
  'Throgs Neck': -73.802582,
  'Coney Island': -73.98278,
  'Rosedale': -73.72543,
  'Highbridge': -73.92374,
  'Howland Hook': -74.16731,
  'Pelham Bay': -73.82801,
  'Bath Beach': -73.99511,
  'South Beach': -74.08831,
  'Midland Beach': -74.08528,
  'Oakwood': -74.11788,
  'Eltingville': -74.14247,
  'Schuylerville': -73.82708,
  'Whitestone': -73.80526,
  'Edenwald': -73.83335,
  'Mount Eden': -73.91231,
  'Neponsit': -73.85941,
  'Morris Heights': -73.91028,
  'Westchester Square': -73.8452,
  'Hollis': -73.75437,
  'Van Nest': -73.86173,
  'Rosebank': -74.06649,
  'Grant City': -74.1082,
  'Port Richmond': -74.1296,
  'North Riverdale': -73.89677,
  'Country Club': -73.8167238801493,
  'Morrisania': -73.89519,
  'Belmont': -73.88169,
  'Bayswater': -73.75451,
  'Willowbrook': -74.13389,
  'New Dorp Beach': -74.09874,
  'Douglaston': -73.72988,
  'Todt Hill': -74.093307,
  'Mill Basin': -73.91076,
  'Little Neck': -73.72054,
  'Arden Heights': -74.16788571182833,
  'Co-op City': -73.82304,
  'Jamaica Hills': -73.7935,
  "Prince's Bay": -74.19113,
  "Bull's Head": -74.16678,
  'Castle Hill': -73.84628,
  'West Farms': -73.87186,
  'Belle Harbor': -73.84524,
  'Westerleigh': -74.1352,
  'Chelsea, Staten Island': -74.18478,
  'Gerritsen Beach': -73.92364,
  'Breezy Point': -73.86894,
  'Woodrow': -74.20674,
  'Graniteville': -74.14987,
  'Hollis Hills': -73.75412
};

//Feature Means
final List<double> scale_mean = [
  0.8814126,
  38.04257555,
  40.72669618,
  -73.94218229,
  0.85186129,
  15.19342101,
  34.13364965,
  1.28683852,
  10.43855683,
  141.46584721,
  10.38375314
];

//Feature Scales
final List<double> scale_scale = [
  0.901201322,
  43.1751756,
  0.0585452690,
  0.0570983405,
  1.00495316,
  16.1729255,
  62.2205001,
  1.94478734,
  37.6716398,
  141.179383,
  20.6322141
];

String ng = '';

double minlat = 40.0;
double maxlat = 41.0;
double minlng = -74.0;
double maxlng = -73.0;

void main() {
  runApp(const MyApp());
}

List<String> inputList = [];

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AirBnb Price Detector',
      theme: ThemeData(),
      home: SplashScreen(),
      // home: const MyHomePage(title: 'AirBnb Price Predictor'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> textLabels = [];
  //List<String> textValues;
  Future<String> predData(List<double> input) async {
    //Importing ML model from assets
    final interpreter = await Interpreter.fromAsset('converted_model.tflite');
    // var input = [
    //   [-0.978042,	-0.834799,	-0.706226,	-0.226586,	1.142480,	0.915516,	0.255002,	-0.507427,	-0.224003,	1.278757,	-0.503279]
    // ];

    //Empty output frame
    var output = List.filled(1, 0).reshape([1, 1]);
    interpreter.run(input, output);
    //Predicted Value
    print(output[0][0]);

    this.setState(() {
      predValue = output[0][0].toStringAsFixed(2);
    });
    print(predValue);
    return predValue;
  }

  @override
  void initState() {
    super.initState();
//Input Field Names
    textLabels = [
      'Neighbourhood Group',
      'Neighbourhood',
      'Latitude',
      'Longitude',
      'Room Type',
      'Minimum Nights',
      'Number of reviews',
      'Reviews per month',
      'Host listing count',
      'Availability(Max:365 Days)',
      'Reviews last month'
    ];
  }

  //Initializing booleans to check input fields are not empty
  bool isDropdownSelected = false;
  bool dropdown1 = false;
  bool dropdown2 = false;
  bool dropdown3 = false;
  bool isTextFilled = false;

  //Function for when Dropdown option is selected or modified
  //Neighbourhood list set as per Neighbourhood
  //Initially 'Select an option'
  void updateDropdownOptions(String selectedOption) {
    setState(() {
      dropdownValue1 = selectedOption;
      if (selectedOption == 'Select an option') {
        dropdown1 = false;
        dropdown2 = false;
        Neighbourhood_dropdown = ['Select an option'];
        dropdownValue2 = 'Select an option';
      } else {
        dropdown1 = true;
        dropdownValue2 = 'Select an option';
        Neighbourhood_dropdown = [];

        switch (selectedOption) {
          case 'Brooklyn':
            Neighbourhood_dropdown.addAll(Neighbourhood_brooklyn);
            break;
          case 'Manhattan':
            Neighbourhood_dropdown.addAll(Neighbourhood_manhattan);
            break;
          case 'Queens':
            Neighbourhood_dropdown.addAll(Neighbourhood_queens);
            break;
          case 'Bronx':
            Neighbourhood_dropdown.addAll(Neighbourhood_bronx);
            break;
          case 'Staten Island':
            Neighbourhood_dropdown.addAll(Neighbourhood_staten);
            break;
        }
      }
    });
  }

  //Widget creation for input fields according to text labels
  //Controllers are used to get input values from text fields
  Widget _getTextFieldWidget(int i) {
    switch (i) {
      case 0:
        return DropdownButton(
          value: dropdownValue1,
          onChanged: (String? newValue) {
            updateDropdownOptions(newValue!);
          },
          items: Neighbourhood_group_list.map<DropdownMenuItem<String>>(
              (String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        );

      case 1:
        return DropdownButton(
          value: dropdownValue2,
          onChanged: (String? newValue) {
            setState(() {
              dropdownValue2 = newValue!;
              if (newValue == 'Select an option') {
                dropdown2 = false;
              } else {
                dropdown2 = true;
              }
              minlat = min_lat[dropdownValue2];
              maxlat = max_lat[dropdownValue2];
              minlng = min_lng[dropdownValue2];
              maxlng = max_lng[dropdownValue2];
              textLabels[2] = 'Latitude ($minlat to $maxlat)';
              textLabels[3] = 'Longitude ($minlng to $maxlng)';
            });
          },
          items: Neighbourhood_dropdown.map<DropdownMenuItem<String>>(
              (String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        );
      case 2:
        return TextField(
          keyboardType: TextInputType.number,
          controller: _controllers[i],
          decoration: const InputDecoration(
            hintText: 'Enter your input',
          ),
        );
      case 3:
        return TextField(
          keyboardType: TextInputType.number,
          controller: _controllers[i],
          decoration: const InputDecoration(
            hintText: 'Enter your input',
          ),
        );

      case 4:
        return DropdownButton(
          value: dropdownValue3,
          onChanged: (String? newValue) {
            setState(() {
              dropdownValue3 = newValue!;
            });
            if (dropdownValue3 == 'Select an option') {
              dropdown3 = false;
            } else {
              dropdown3 = true;
            }
          },
          items: room_list.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        );

      case 5:
        return TextField(
          keyboardType: TextInputType.number,
          controller: _controllers[i],
          decoration: const InputDecoration(
            hintText: 'Enter your input',
          ),
        );
      case 6:
        return TextField(
          keyboardType: TextInputType.number,
          controller: _controllers[i],
          decoration: const InputDecoration(
            hintText: 'Enter your input',
          ),
        );
      case 7:
        return TextField(
          keyboardType: TextInputType.number,
          controller: _controllers[i],
          decoration: const InputDecoration(
            hintText: 'Enter your input',
          ),
        );
      case 8:
        return TextField(
          keyboardType: TextInputType.number,
          controller: _controllers[i],
          decoration: const InputDecoration(
            hintText: 'Enter your input',
          ),
        );
      case 9:
        return TextField(
          keyboardType: TextInputType.number,
          controller: _controllers[i],
          decoration: const InputDecoration(
            hintText: 'Enter your input',
          ),
        );
      case 10:
        return TextField(
          keyboardType: TextInputType.number,
          controller: _controllers[i],
          decoration: const InputDecoration(
            hintText: 'Enter your input',
          ),
        );
      default:
        return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          backgroundColor: Colors.blueGrey[900],
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Enter the following information: ',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
                ),
                SizedBox(height: 16),
                for (int i = 0; i < textLabels.length; i++)
                  Row(
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(padding: EdgeInsets.fromLTRB(10, 5, 5, 5)),
                      Text(
                        textLabels[i] + ' ' * (15 - textLabels[i].length) + ':',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(width: 25),
                      Expanded(
                        flex: 1,
                        child: _getTextFieldWidget(i),
                      ),
                      SizedBox(width: 20),
                    ],
                  ),
                SizedBox(height: 16),
                Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green[600],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                    ),
                    //Actions to be implemented when Predict Price Button is pressed
                    //Check if all fields are filled
                    //If yes, value navigates to next page and Predicts price
                    //If no, error box is popped up on screen
                    onPressed: () {
                      inputList = [];

                      for (int i = 0; i < textLabels.length; i++) {
                        if (i == 0) {
                          //print(dropdownValue1);
                          inputList.add(
                              Neighbourhood_group[dropdownValue1].toString());
                        } else if (i == 1) {
                          //print(dropdownValue2);
                          ng = dropdownValue2;
                          inputList
                              .add(Neighbourhood[dropdownValue2].toString());
                        } else if (i == 4) {
                          //print(dropdownValue3);
                          inputList.add(Room_type[dropdownValue3].toString());
                        } else {
                          // print(_controllers[i].text);
                          inputList.add(_controllers[i].text);
                          if (_controllers[i].text.isEmpty) {
                            isTextFilled = false;
                          } else {
                            isTextFilled = true;
                          }
                        }
                      }
                      if ((isTextFilled == false) ||
                          ((dropdown1 && dropdown2 && dropdown3) == false)) {
                        showDialog(
                            context: context,
                            builder: (_) => AlertDialog(
                                  title: Text('Error'),
                                  content:
                                      Text('Please fill in all the fields.'),
                                  actions: [
                                    TextButton(
                                      onPressed: () => Navigator.pop(context),
                                      child: Text('OK'),
                                    )
                                  ],
                                ));

                       // print("ALL NOT FILLED");

                      } else {
                        //print("ALL FILLED");

                        //doubleList is list input in double type
                        //Scaled and stored in scaledList to be used in model
                        doubleList =
                            inputList.map((str) => double.parse(str)).toList();
                        List<double> scaledList = [];
                        for (int i = 0; i < 11; i++) {
                          scaledList.add(
                              (doubleList[i] - scale_mean[i]) / scale_scale[i]);
                        }
                        print(doubleList);
                        print(scaledList);
                        //Passed through imported model
                        print(predData(scaledList));

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                MapPage(doubleList: doubleList),
                          ),
                        );
                      }
                    },
                    child: Center(
                      child: Text('Predict Price'),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
