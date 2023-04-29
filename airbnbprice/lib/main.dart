import 'dart:ffi';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AirBnb Price Detector',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        //primarySwatch: Colors.amber,
      ),
      home: const MyHomePage(title: 'AirBnb Price Predictor'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> textLabels = [];
  //List<String> textValues;
  @override
  void initState() {
    super.initState();
     textLabels = [
      'Neighbourhood',
      'Neighbourhood Group',
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
  bool isTextFilled = false;

  // final List<String> textLabels = [
  //   'Neighbourhood',
  //   'Neighbourhood Group',
  //   'Latitude',
  //   'Longitude',
  //   'Room Type',
  //   'Minimum Nights',
  //   'Number of reviews',
  //   'Reviews per month',
  //   'Host listing count',
  //   'Availability(Max:365 Days)',
  //   'Textbox 11'
  // ];



  Widget _getTextFieldWidget(int i) {

    final List<TextEditingController> _controllers = List.generate(
        textLabels.length, (index) => TextEditingController());
    switch (i) {
      case 0:
        return DropdownButton(
          value: dropdownValue1,
          onChanged: (String? newValue) {
            setState(() {
              dropdownValue1 = newValue!;
            });
            isDropdownSelected = true;
          },
          items: <String>['Select an option','Option 1', 'Option 2', 'Option 3', 'Option 4']
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
            isDropdownSelected = true;
          },
          items: <String>['Select an option','Option 1', 'Option 2', 'Option 3', 'Option 4']
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
          decoration: InputDecoration(
            hintText: 'Enter text here',
          ),
        );
      case 3:
        return TextField(
          controller: _controllers[i],
          decoration: InputDecoration(
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
            isDropdownSelected = true;
          },
          items: <String>['Select an option','Room 1', 'Room 2', 'Room 3', 'Room 4']
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
          decoration: InputDecoration(
            hintText: 'Enter text here',
          ),
        );
      case 7:
        return TextField(
          controller: _controllers[i],
          decoration: InputDecoration(
            hintText: 'Enter text here',
          ),
        );
      case 6:
        return TextField(
          controller: _controllers[i],
          decoration: InputDecoration(
            hintText: 'Enter text here',
          ),
        );
      case 7:
        return TextField(
          controller: _controllers[i],
          decoration: InputDecoration(
            hintText: 'Enter text here',
          ),
        );
      case 8:
        return TextField(
          controller: _controllers[i],
          decoration: InputDecoration(
            hintText: 'Enter text here',
          ),
        );
      case 9:
        return TextField(
          controller: _controllers[i],
          decoration: InputDecoration(
            hintText: 'Enter text here',
          ),
        );
      case 10:
        return TextField(
          controller: _controllers[i],
          decoration: InputDecoration(
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
                      Text(textLabels[i] + ':'),
                      SizedBox(width: 25),
                      Expanded(
                        flex: 1,
                        child: _getTextFieldWidget(i),
                      ),
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
                     final List<TextEditingController> _controllers = List.generate(
                         textLabels.length, (index) => TextEditingController());

                     for (int i = 1; i < textLabels.length; i++) {
                       if (i!=0 || i!=1 || i!= 4) {
                         print(_controllers[i]);
                         if (_controllers[i].text.isEmpty) {
                           isTextFilled=false;
                         }else{
                           isTextFilled=true;
                         }
                       }
                     }
                     if(isTextFilled==true && isDropdownSelected==true){
                       // showDialog(
                       //     context: context,
                       //     builder: (_) => AlertDialog(
                       //       title: Text('Error'),
                       //       content: Text('Please fill in all the fields.'),
                       //       actions: [
                       //         TextButton(
                       //           onPressed: () => Navigator.pop(context),
                       //           child: Text('OK'),
                       //         )
                       //       ],
                       //     )
                       // );
                       print("ALL NOT FILLED");
                     }else{
                       print("ALL FILLED");
                       print(isTextFilled);
                       print(isDropdownSelected);
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


