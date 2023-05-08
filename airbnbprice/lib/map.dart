import 'dart:async';

import 'package:csv/csv.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'main.dart';

// LatLng currentLoc = LatLng(doubleList[2], doubleList[3]);


 // LatLng currentLoc= LatLng(40.334, -73.65426);

class MapPage extends StatefulWidget {
   MapPage({Key? key, required List<double> doubleList}) : super(key: key);

  final currentLoc = LatLng(doubleList[2], doubleList[3]) ;

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  // _MapPageState(this.currentLoc);


  List<List<dynamic>> csvData = [];
  Set<Marker> _markers = {};
  int j = Neighbourhood[ng];

  static get currentLoc_cam => LatLng(doubleList[2], doubleList[3]);




  Future<void> loadData(LatLng currentLoc) async {
    String data = await rootBundle.loadString('assets/data$j.csv');
    csvData = CsvToListConverter().convert(data);

    //print(csvData);
    setState(() {
      _markers = csvData
          .map((row) {
        print(row[1]);
        double lat = (row[1]);
        print(row[2]);
        double lng = (row[2]);
        print(row[0]);
        String title = row[0];
        print(row[3]);

       // bool isDifferent = title == 'Cozy SI den with multiple with easy access to NYC'; // Change title as per your requirement
        //print("bool"+ isDifferent.toString());
        return Marker(
          markerId: MarkerId(title),
          position: LatLng(lat, lng),
          infoWindow: InfoWindow(
              //title: title
            title:  title,
            snippet: 'Price: \$${row[3]}',
          ),
           icon: BitmapDescriptor.defaultMarker,
           //isDifferent
          //     ? BitmapDescriptor.defaultMarkerWithHue(
          //     BitmapDescriptor.hueGreen)
          //     : BitmapDescriptor.defaultMarker,
        );
      })
          .toSet();
      _markers.add(Marker(
        markerId: MarkerId('Specific Location'),
        position: currentLoc,
        infoWindow: InfoWindow(
          title: 'Your selected AirBnb',
            snippet: "Predicted Price: \$$predValue"
        ),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
      ));
    });
  }

  @override
  void initState() {
    super.initState();
    loadData(widget.currentLoc);
  }

  Completer<GoogleMapController> _controller = Completer();

    CameraPosition _kGooglePlex = CameraPosition(
    target: currentLoc_cam,
    zoom: 16,
  );


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Result"),
          backgroundColor: Colors.blueGrey[900],
        ),
        body: Column(
          children: [
            Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
              child: Container(
                decoration: BoxDecoration(color: Colors.lightGreen[200]?.withOpacity(0.7), borderRadius: BorderRadius.circular(5.0)),
                child: SizedBox(
                  child:
                  Center(
                    child: Text("Predicted Price: \$$predValue", style: TextStyle(fontSize: 18,
                    fontWeight: FontWeight.bold),),
                  ),
                ),
              ),
            ),
            ),
            Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: Text("Other options in the neighbourhood: ", style: TextStyle(fontWeight: FontWeight.bold),)),
            Expanded(
              flex: 4,
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Stack(
                  children: [
                    GoogleMap(
                      mapType: MapType.hybrid,
                      initialCameraPosition: _kGooglePlex,
                      onMapCreated: (GoogleMapController controller) {
                        _controller.complete(controller);
                      },
                      markers: _markers,
                      zoomControlsEnabled: false,
                    ),
                    Positioned(
                      bottom: 16.0,
                      right: 16.0,
                      child: FloatingActionButton(
                        onPressed: () async {
                          final GoogleMapController controller = await _controller.future;
                          controller.animateCamera(CameraUpdate.zoomOut());
                        },
                        child: Icon(Icons.zoom_out),
                      ),
                    ),
                    Positioned(
                      bottom: 80.0,
                      right: 16.0,
                      child: FloatingActionButton(
                        onPressed: () async {
                          final GoogleMapController controller = await _controller.future;
                          controller.animateCamera(CameraUpdate.zoomIn());
                        },
                        child: Icon(Icons.zoom_in),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );

  }
}
