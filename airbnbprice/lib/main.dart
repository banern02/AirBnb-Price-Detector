import 'dart:ffi';

import 'package:airbnbprice/pred_page.dart';
import 'package:flutter/material.dart';
import 'package:tflite_flutter/tflite_flutter.dart';

import 'logo.dart';


final List<TextEditingController> _controllers = List.generate(11, (index) => TextEditingController());

final List<String> room_list = ['Select an option', 'Entire room/apt', 'Hotel room', 'Private room', 'Shared room'];
final List<String> Neighbourhood_group_list = ['Select an option', 'Brooklyn', 'Manhattan', 'Queens', 'Bronx', 'Staten Island'];
final List<String> Neighbourhood_brooklyn = ['Select an option','Bath Beach','Bay Ridge','Bedford-Stuyvesant','Bensonhurst','Bergen Beach','Boerum Hill','Borough Park','Brighton Beach','Brooklyn Heights','Brownsville','Bushwick','Canarsie','Carroll Gardens','Clinton Hill','Cobble Hill','Columbia St','Coney Island','Crown Heights','Cypress Hills','DUMBO','Downtown Brooklyn','Dyker Heights','East Flatbush','East New York','Flatbush','Flatlands','Fort Greene','Fort Hamilton','Gerritsen Beach','Gowanus','Gravesend','Greenpoint','Kensington','Manhattan Beach','Midwood','Mill Basin','Navy Yard','Park Slope','Prospect Heights','Prospect-Lefferts Gardens','Red Hook','Sea Gate','Sheepshead Bay','South Slope','Sunset Park','Vinegar Hill','Williamsburg','Windsor Terrace'];
final List<String> Neighbourhood_manhattan = ['Select an option','Battery Park City','Chelsea','Chinatown','Civic Center','East Harlem','East Village','Financial District','Flatiron District','Gramercy','Greenwich Village','Harlem','Hell\'s Kitchen','Inwood','Kips Bay','Little Italy','Lower East Side','Marble Hill','Midtown','Morningside Heights','Murray Hill','NoHo','Nolita','Roosevelt Island','SoHo','Stuyvesant Town','Theater District','Tribeca','Two Bridges','Upper East Side','Upper West Side','Washington Heights','West Village'];
final List<String> Neighbourhood_queens = ['Select an option','Arverne','Astoria','Bay Terrace','Bayside','Bayswater','Belle Harbor','Bellerose','Breezy Point','Briarwood','Cambria Heights','College Point','Corona','Ditmars Steinway','Douglaston','East Elmhurst','Edgemere','Elmhurst','Far Rockaway','Flushing','Forest Hills','Fresh Meadows','Glendale','Hollis','Hollis Hills','Holliswood','Howard Beach','Jackson Heights','Jamaica','Jamaica Estates','Jamaica Hills','Kew Gardens','Kew Gardens Hills','Laurelton','Little Neck','Long Island City','Maspeth','Middle Village','Neponsit','Ozone Park','Queens Village','Rego Park','Richmond Hill','Ridgewood','Rockaway Beach','Rosedale','South Ozone Park','Springfield Gardens','St. Albans','Sunnyside','Whitestone','Woodhaven','Woodside'];
final List<String> Neighbourhood_bronx = ['Select an option','Allerton','Baychester','Belmont','Bronxdale','Castle Hill','City Island','Claremont Village','Clason Point','Co-op City','Concourse','Concourse Village','Country Club','East Morrisania','Eastchester','Edenwald','Fieldston','Fordham','Highbridge','Hunts Point','Kingsbridge','Longwood','Melrose','Morris Heights','Morris Park','Morrisania','Mott Haven','Mount Eden','Mount Hope','North Riverdale','Norwood','Olinville','Parkchester','Pelham Bay','Pelham Gardens','Port Morris','Riverdale','Schuylerville','Soundview','Spuyten Duyvil','Throgs Neck','Tremont','Unionport','University Heights','Van Nest','Wakefield','West Farms','Westchester Square','Williamsbridge','Woodlawn'];
final List<String> Neighbourhood_staten = ['Select an option','Arden Heights','Arrochar','Bull\'s Head','Castleton Corners','Chelsea, Staten Island','Clifton','Concord','Dongan Hills','Eltingville','Emerson Hill','Fort Wadsworth','Graniteville','Grant City','Great Kills','Grymes Hill','Howland Hook','Huguenot','Lighthouse Hill','Mariners Harbor','Midland Beach','New Brighton','New Dorp','New Dorp Beach','New Springville','Oakwood','Port Richmond','Prince\'s Bay','Randall Manor','Richmondtown','Rosebank','Shore Acres','Silver Lake','South Beach','St. George','Stapleton','Todt Hill','Tompkinsville','Tottenville','West Brighton','Westerleigh','Willowbrook','Woodrow'];
List<String> Neighbourhood_dropdown = ['Select an option'];
var predValue = "";

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
  Future<String> predData() async {
    final interpreter = await Interpreter.fromAsset('converted_model.tflite');
    var input = [
      [-0.978042,	-0.834799,	-0.706226,	-0.226586,	1.142480,	0.915516,	0.255002,	-0.507427,	-0.224003,	1.278757,	-0.503279]
    ];
    var output = List.filled(1, 0).reshape([1, 1]);
    interpreter.run(input, output);
    print(output[0][0]);

    this.setState(() {
      predValue = output[0][0].toString();
    });
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
      'Textbox 11'
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


  Widget _getTextFieldWidget(int i) {


    switch (i) {
      case 0:
        return DropdownButton(
          value: dropdownValue1,
          onChanged: (String? newValue) {
            setState(() {
              dropdownValue1 = newValue!;
            });

            if (dropdownValue1=='Select an option') {
              dropdown1 = false;
            }
            else{
              dropdown1 = true;
            }
            Neighbourhood_dropdown = ['Select an option'];
            if (dropdownValue1=='Brooklyn'){
              Neighbourhood_dropdown = Neighbourhood_brooklyn;
            }
            else if (dropdownValue1=='Manhattan'){
              Neighbourhood_dropdown = Neighbourhood_manhattan;
            }
            else if (dropdownValue1=='Queens'){
              Neighbourhood_dropdown = Neighbourhood_queens;
            }
            else if (dropdownValue1=='Bronx'){
              Neighbourhood_dropdown = Neighbourhood_bronx;
            }
            else if (dropdownValue1=='Staten Island'){
              Neighbourhood_dropdown = Neighbourhood_staten;
            }
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

            });
            if (dropdownValue2=='Select an option') {
              dropdown2 = false;
            }
            else{
              dropdown2 = true;
            }
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
          controller: _controllers[i],
          decoration: const InputDecoration(
            hintText: 'Enter text here',
          ),
        );
      case 3:
        return TextField(
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
          controller: _controllers[i],
          decoration: const InputDecoration(
            hintText: 'Enter text here',
          ),
        );
      case 6:
        return TextField(
          controller: _controllers[i],
          decoration: const InputDecoration(
            hintText: 'Enter text here',
          ),
        );
      case 7:
        return TextField(
          controller: _controllers[i],
          decoration: const InputDecoration(
            hintText: 'Enter text here',
          ),
        );
      case 8:
        return TextField(
          controller: _controllers[i],
          decoration: const InputDecoration(
            hintText: 'Enter text here',
          ),
        );
      case 9:
        return TextField(
          controller: _controllers[i],
          decoration: const InputDecoration(
            hintText: 'Enter text here',
          ),
        );
      case 10:
        return TextField(
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
          backgroundColor: Colors.amber.shade800,

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
                      Text(textLabels[i] + ' '*(26-textLabels[i].length)+':'),
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
                         inputList.add(dropdownValue1);
                       }
                       else if(i==1){
                         //print(dropdownValue2);
                         inputList.add(dropdownValue2);
                       }
                       else if(i==4){
                         //print(dropdownValue3);
                         inputList.add(dropdownValue3);
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
                       print("ALL NOT FILLED");
                       // print(isTextFilled==false);
                       // print((dropdown1&&dropdown2&&dropdown3)==false);
                       print("INPUT LIST:");
                       print(inputList);
                       print(predData());
                     }else{
                       print("ALL FILLED");
                       // print(isTextFilled==false);
                       // print((dropdown1&&dropdown2&&dropdown3)==false);
                       print("INPUT LIST:");
                       print(inputList);
                       // Navigator.push(context,
                       //     MaterialPageRoute(builder: (context) => PredModel()))
                       print(predData());
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




