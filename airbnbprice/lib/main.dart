import 'dart:ffi';

import 'package:airbnbprice/map.dart';
import 'package:airbnbprice/pred_page.dart';
import 'package:flutter/material.dart';
import 'package:tflite_flutter/tflite_flutter.dart';

import 'logo.dart';


final List<TextEditingController> _controllers = List.generate(11, (index) => TextEditingController());
List<double> doubleList =[];
final List<String> room_list = ['Select an option', 'Entire home/apt', 'Hotel room', 'Private room', 'Shared room'];
final List<String> Neighbourhood_group_list = ['Select an option', 'Brooklyn', 'Manhattan', 'Queens', 'Bronx', 'Staten Island'];
final List<String> Neighbourhood_brooklyn = ['Select an option','Bath Beach','Bay Ridge','Bedford-Stuyvesant','Bensonhurst','Bergen Beach','Boerum Hill','Borough Park','Brighton Beach','Brooklyn Heights','Brownsville','Bushwick','Canarsie','Carroll Gardens','Clinton Hill','Cobble Hill','Columbia St','Coney Island','Crown Heights','Cypress Hills','DUMBO','Downtown Brooklyn','Dyker Heights','East Flatbush','East New York','Flatbush','Flatlands','Fort Greene','Fort Hamilton','Gerritsen Beach','Gowanus','Gravesend','Greenpoint','Kensington','Manhattan Beach','Midwood','Mill Basin','Navy Yard','Park Slope','Prospect Heights','Prospect-Lefferts Gardens','Red Hook','Sea Gate','Sheepshead Bay','South Slope','Sunset Park','Vinegar Hill','Williamsburg','Windsor Terrace'];
final List<String> Neighbourhood_manhattan = ['Select an option','Battery Park City','Chelsea','Chinatown','Civic Center','East Harlem','East Village','Financial District','Flatiron District','Gramercy','Greenwich Village','Harlem','Hell\'s Kitchen','Inwood','Kips Bay','Little Italy','Lower East Side','Marble Hill','Midtown','Morningside Heights','Murray Hill','NoHo','Nolita','Roosevelt Island','SoHo','Stuyvesant Town','Theater District','Tribeca','Two Bridges','Upper East Side','Upper West Side','Washington Heights','West Village'];
final List<String> Neighbourhood_queens = ['Select an option','Arverne','Astoria','Bay Terrace','Bayside','Bayswater','Belle Harbor','Bellerose','Breezy Point','Briarwood','Cambria Heights','College Point','Corona','Ditmars Steinway','Douglaston','East Elmhurst','Edgemere','Elmhurst','Far Rockaway','Flushing','Forest Hills','Fresh Meadows','Glendale','Hollis','Hollis Hills','Holliswood','Howard Beach','Jackson Heights','Jamaica','Jamaica Estates','Jamaica Hills','Kew Gardens','Kew Gardens Hills','Laurelton','Little Neck','Long Island City','Maspeth','Middle Village','Neponsit','Ozone Park','Queens Village','Rego Park','Richmond Hill','Ridgewood','Rockaway Beach','Rosedale','South Ozone Park','Springfield Gardens','St. Albans','Sunnyside','Whitestone','Woodhaven','Woodside'];
final List<String> Neighbourhood_bronx = ['Select an option','Allerton','Baychester','Belmont','Bronxdale','Castle Hill','City Island','Claremont Village','Clason Point','Co-op City','Concourse','Concourse Village','Country Club','East Morrisania','Eastchester','Edenwald','Fieldston','Fordham','Highbridge','Hunts Point','Kingsbridge','Longwood','Melrose','Morris Heights','Morris Park','Morrisania','Mott Haven','Mount Eden','Mount Hope','North Riverdale','Norwood','Olinville','Parkchester','Pelham Bay','Pelham Gardens','Port Morris','Riverdale','Schuylerville','Soundview','Spuyten Duyvil','Throgs Neck','Tremont','Unionport','University Heights','Van Nest','Wakefield','West Farms','Westchester Square','Williamsbridge','Woodlawn'];
final List<String> Neighbourhood_staten = ['Select an option','Arden Heights','Arrochar','Bull\'s Head','Castleton Corners','Chelsea, Staten Island','Clifton','Concord','Dongan Hills','Eltingville','Emerson Hill','Fort Wadsworth','Graniteville','Grant City','Great Kills','Grymes Hill','Howland Hook','Huguenot','Lighthouse Hill','Mariners Harbor','Midland Beach','New Brighton','New Dorp','New Dorp Beach','New Springville','Oakwood','Port Richmond','Prince\'s Bay','Randall Manor','Richmondtown','Rosebank','Shore Acres','Silver Lake','South Beach','St. George','Stapleton','Todt Hill','Tompkinsville','Tottenville','West Brighton','Westerleigh','Willowbrook','Woodrow'];
List<String> Neighbourhood_dropdown = ['Select an option'];
var predValue = "";
RangeValues _values2 = RangeValues(40.50029, 40.91063);
RangeValues _values3 = RangeValues(-74.24985, -73.71086);

final Map Neighbourhood = {'Sunset Park': 0, 'Upper West Side': 1,  'Bedford-Stuyvesant': 2,  'Midtown': 3,  'East Harlem': 4,  'South Slope': 5,  'Williamsburg': 6,  'Fort Greene': 7,  "Hell's Kitchen": 8,  'Harlem': 9,  'Long Island City': 10,  'East Village': 11,  'Lower East Side': 12,  'West Village': 13,  'Greenpoint': 14,  'East Flatbush': 15,  'Clinton Hill': 16,  'Chelsea': 17,  'Prospect Heights': 18,  'Eastchester': 19,  'Crown Heights': 20,  'Boerum Hill': 21,  'Washington Heights': 22,  'Upper East Side': 23,  'Nolita': 24,  'Kips Bay': 25,  'Sunnyside': 26,
    'Carroll Gardens': 27,  'St. George': 28,  'Park Slope': 29,  'Gowanus': 30,  'Ridgewood': 31,  'Morningside Heights': 32,  'Rockaway Beach': 33,  'Ditmars Steinway': 34,  'Middle Village': 35,  'Chinatown': 36,  'Greenwich Village': 37,  'Kingsbridge': 38,  'Jamaica': 39,  'Astoria': 40,  'Brooklyn Heights': 41,  'Flatiron District': 42,  'Windsor Terrace': 43,  'Tribeca': 44,  'Bushwick': 45,  'Forest Hills': 46,  'Murray Hill': 47,  'Stuyvesant Town': 48,  'Sheepshead Bay': 49,  'Arrochar': 50,  'East New York': 51,
    'Emerson Hill': 52,  'Bensonhurst': 53,  'Theater District': 54,  'University Heights': 55,  'Rego Park': 56,  'Kensington': 57,  'Shore Acres': 58,  'Woodside': 59,  'Allerton': 60,  'Richmond Hill': 61,  'Prospect-Lefferts Gardens': 62,  'Elmhurst': 63,  'Gramercy': 64,  'SoHo': 65,  'Little Italy': 66,  'Bayside': 67,  'Brighton Beach': 68,  'New Springville': 69,  'Mott Haven': 70,  'Jackson Heights': 71,  'Maspeth': 72,  'Inwood': 73,  'Spuyten Duyvil': 74,  'Briarwood': 75,  'Battery Park City': 76,  'Flushing': 77,  'Two Bridges': 78,  'Gravesend': 79,  'Fort Hamilton': 80,
    'Cypress Hills': 81,  'Mariners Harbor': 82,  'East Elmhurst': 83,  'Downtown Brooklyn': 84,  'Cobble Hill': 85,  'Concord': 86,  'Tottenville': 87,  'Flatbush': 88,  'Melrose': 89,  'NoHo': 90,  'Columbia St': 91,  'College Point': 92,  'Vinegar Hill': 93,  'Concourse': 94,  'DUMBO': 95,  'City Island': 96,  'Red Hook': 97,  'Bay Ridge': 98,  'Longwood': 99,  'Financial District': 100,  'Canarsie': 101,  'Port Morris': 102,  'Flatlands': 103,  'Arverne': 104,  'Glendale': 105,  'Williamsbridge': 106,  'Soundview': 107,  'Woodhaven': 108,  'Parkchester': 109,  'Bronxdale': 110,
  'Ozone Park': 111,  'Borough Park': 112,  'Bay Terrace': 113,  'Claremont Village': 114,  'Fordham': 115,  'Clifton': 116,  'Concourse Village': 117,  'Huguenot': 118,  'Brownsville': 119,  'Mount Hope': 120,  'Wakefield': 121,  'Midwood': 122,  'Navy Yard': 123,  'Fieldston': 124,  'Civic Center': 125,  'Norwood': 126,  'Lighthouse Hill': 127,  'Clason Point': 128,  'Unionport': 129,  'Randall Manor': 130,  'Kew Gardens Hills': 131,  'Jamaica Estates': 132,  'Kew Gardens': 133,  'Bellerose': 134,  'Fresh Meadows': 135,  'Morris Park': 136,  'South Ozone Park': 137,  'East Morrisania': 138,
  'Far Rockaway': 139,  'Springfield Gardens': 140,  'Tremont': 141,  'Corona': 142,  'West Brighton': 143,  'Manhattan Beach': 144,  'Dongan Hills': 145,  'Marble Hill': 146,  'Roosevelt Island': 147,  'Laurelton': 148,  'Hunts Point': 149,  'Queens Village': 150,  'Great Kills': 151,  'Howard Beach': 152,  'Silver Lake': 153,  'Riverdale': 154,  'Grymes Hill': 155,  'Holliswood': 156,  'Tompkinsville': 157,  'Castleton Corners': 158,  'St. Albans': 159,  'New Brighton': 160,  'Edgemere': 161,  'Pelham Gardens': 162, 'Baychester': 163,  'Sea Gate': 164,  'Bergen Beach': 165,  'Stapleton': 166,
    'Cambria Heights': 167,  'Woodlawn': 168,  'Richmondtown': 169,  'Olinville': 170,  'Dyker Heights': 171,  'Throgs Neck': 172,  'Coney Island': 173,  'Rosedale': 174,  'Highbridge': 175,  'Howland Hook': 176,  'Pelham Bay': 177,  'Bath Beach': 178,  'South Beach': 179,  'Midland Beach': 180,  'Oakwood': 181,  'Eltingville': 182,  'Schuylerville': 183,  'Whitestone': 184,  'Edenwald': 185,  'Mount Eden': 186,  'Neponsit': 187,  'Morris Heights': 188,  'Westchester Square': 189,  'Hollis': 190,  'Van Nest': 191,  'Rosebank': 192,  'Grant City': 193,  'Port Richmond': 194,  'North Riverdale': 195,  'Country Club': 196,
    'Morrisania': 197,  'Belmont': 198,  'Bayswater': 199,  'Willowbrook': 200,  'New Dorp Beach': 201,  'Douglaston': 202,  'Todt Hill': 203,  'Mill Basin': 204,  'Little Neck': 205,  'Arden Heights': 206,  'Co-op City': 207,  'Jamaica Hills': 208,  "Prince's Bay": 209,  "Bull's Head": 210,  'Castle Hill': 211,  'West Farms': 212,  'Belle Harbor': 213,  'Westerleigh': 214,  'Chelsea, Staten Island': 215,  'Gerritsen Beach': 216,  'Breezy Point': 217,  'Woodrow': 218,  'Graniteville': 219,  'Hollis Hills': 220};

final Map Neighbourhood_group = {'Brooklyn':0, 'Manhattan':1, 'Queens':2, 'Bronx':3, 'Staten Island':4};

final Map Room_type = {'Entire home/apt':0, 'Hotel room':1, 'Private room':2, 'Shared room':3};

final List<double> scale_mean = [0.8814126 ,  38.04257555,  40.72669618, -73.94218229, 0.85186129,  15.19342101,  34.13364965,   1.28683852, 10.43855683, 141.46584721,  10.38375314];
final List<double> scale_scale = [0.901201322, 43.1751756, 0.0585452690, 0.0570983405,  1.00495316, 16.1729255, 62.2205001, 1.94478734,  37.6716398, 141.179383, 20.6322141];

String ng = '';

void main() {
  runApp(const MyApp());
}

List<String> inputList= [];
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
      title: 'AirBnb Price Detector',
      theme: ThemeData(

      ),
        home:SplashScreen(),
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
    final interpreter = await Interpreter.fromAsset('converted_model.tflite');
    // var input = [
    //   [-0.978042,	-0.834799,	-0.706226,	-0.226586,	1.142480,	0.915516,	0.255002,	-0.507427,	-0.224003,	1.278757,	-0.503279]
    // ];
    var output = List.filled(1, 0).reshape([1, 1]);
    interpreter.run(input, output);
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

  String dropdownValue1 = "Select an option";
  String dropdownValue2 = 'Select an option';
  String dropdownValue3 = 'Select an option';
  String dropdownValue4 = 'Select an option';

  bool isDropdownSelected =false;
  bool dropdown1 = false;
  bool dropdown2 = false;
  bool dropdown3 = false;
  bool isTextFilled = false;

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


  Widget _getTextFieldWidget(int i) {


    switch (i) {
      case 0:
        return DropdownButton(
          value: dropdownValue1,
          onChanged: (String? newValue) {
          updateDropdownOptions(newValue!);
        },
          items: Neighbourhood_group_list
              .map<DropdownMenuItem<String>>((String value) {
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
            });
          },

          items: Neighbourhood_dropdown
              .map<DropdownMenuItem<String>>((String value) {
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
            hintText: 'Enter text here',
          ),
        );
      case 3:
        return TextField(
          keyboardType: TextInputType.number,
          controller: _controllers[i],
          decoration: const InputDecoration(
            hintText: 'Enter text here',
          ),
        );

      case 4:
        return DropdownButton(
          value: dropdownValue3,
          onChanged: (String? newValue) {
            setState(() {
              dropdownValue3 = newValue!;
            });
            if (dropdownValue3=='Select an option') {
              dropdown3 = false;
            }
            else{
              dropdown3 = true;
            }
          },
          items: room_list
              .map<DropdownMenuItem<String>>((String value) {
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
            hintText: 'Enter text here',
          ),
        );
      case 6:
        return TextField(
          keyboardType: TextInputType.number,
          controller: _controllers[i],
          decoration: const InputDecoration(
            hintText: 'Enter text here',
          ),
        );
      case 7:
        return TextField(
          keyboardType: TextInputType.number,
          controller: _controllers[i],
          decoration: const InputDecoration(
            hintText: 'Enter text here',
          ),
        );
      case 8:
        return TextField(
          keyboardType: TextInputType.number,
          controller: _controllers[i],
          decoration: const InputDecoration(
            hintText: 'Enter text here',
          ),
        );
      case 9:
        return TextField(
          keyboardType: TextInputType.number,
          controller: _controllers[i],
          decoration: const InputDecoration(
            hintText: 'Enter text here',
          ),
        );
      case 10:
        return TextField(
          keyboardType: TextInputType.number,
          controller: _controllers[i],
          decoration: const InputDecoration(
            hintText: 'Enter text here',
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
                  'Enter the following: ',
                ),
                SizedBox(height: 16),
                for (int i = 0; i < textLabels.length; i++)
                  Row(
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(padding: EdgeInsets.fromLTRB(10, 5, 5, 5)),
                      Text(textLabels[i] + ' '*(15-textLabels[i].length)+':'),
                      SizedBox(width: 25),
                      Expanded(
                        flex: 1,
                        child: _getTextFieldWidget(i),
                      ),
                      SizedBox(width: 20),
                    ],
                  ),
                SizedBox(height: 16),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green[600] ,
                    shape:RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                  ),
                   onPressed: () {
                     // final List<TextEditingController> _controllers = List.generate(
                     //     textLabels.length, (index) => TextEditingController());
                     inputList = [];

                     for (int i = 0; i < textLabels.length; i++) {
                       if (i==0) {
                         //print(dropdownValue1);
                         inputList.add(Neighbourhood_group[dropdownValue1].toString());
                       }
                       else if(i==1){
                         //print(dropdownValue2);
                         ng = dropdownValue2;
                         inputList.add(Neighbourhood[dropdownValue2].toString());
                       }
                       else if(i==4){
                         //print(dropdownValue3);
                         inputList.add(Room_type[dropdownValue3].toString());
                       }
                       else{
                        // print(_controllers[i].text);
                         inputList.add(_controllers[i].text);
                         if (_controllers[i].text.isEmpty) {
                           isTextFilled=false;
                         }else{
                           isTextFilled=true;
                         }
                       }
                     }
                     if((isTextFilled==false) || ((dropdown1&&dropdown2&&dropdown3)==false)){
                       showDialog(
                           context: context,
                           builder: (_) => AlertDialog(
                             title: Text('Error'),
                             content: Text('Please fill in all the fields.'),
                             actions: [
                               TextButton(
                                 onPressed: () => Navigator.pop(context),
                                 child: Text('OK'),
                               )
                             ],
                           )
                       );
                      // print(predData([2.3508480827550318, 1.5971544641499962, 1.538532857368896, 2.027769791312911, 2.1375510775049458, -0.8776038082905903, -0.5164479488007201, -0.6462601304263941, -0.25054807489426034, 1.547918316019273, -0.5032786636311611]));
                       // Navigator.push(context,
                       //         MaterialPageRoute(builder: (context) => MapScreen()));
                       print("ALL NOT FILLED");
                       // print(isTextFilled==false);
                       // print((dropdown1&&dropdown2&&dropdown3)==false);
                       //print("INPUT LIST:");
                       //print(inputList);
                       //print(predData());
                     }else{
                       print("ALL FILLED");
                       // print(isTextFilled==false);
                       // print((dropdown1&&dropdown2&&dropdown3)==false);
                      // print("INPUT LIST:");
                       //print(inputList);
                       // Navigator.push(context,
                       //     MaterialPageRoute(builder: (context) => PredModel()))
                       //List<double> doubleList = inputList.map((str) => double.parse(str)).toList();
                        doubleList = inputList.map((str) => double.parse(str)).toList();
                       List<double> scaledList = [];
                       for (int i=0;i<11;i++){
                         scaledList.add((doubleList[i]-scale_mean[i])/scale_scale[i]);
                       }
                       print(doubleList);
                       print(scaledList);
                       print(predData(scaledList));

                       Navigator.push(
                         context,
                         MaterialPageRoute(builder: (context) => MapPage()),
                       );
                     }

                   },
                  child: Center(
                  child: Text('Predict Price'),
                ),)
              ],
            ),
          ),
        ),
      ),
    );
  }
}




