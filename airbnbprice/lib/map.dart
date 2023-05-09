import 'dart:async';
import 'package:csv/csv.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'main.dart';


class MapPage extends StatefulWidget {
   MapPage({Key? key, required List<double> doubleList}) : super(key: key);

   //Green marker(Selected AirBnb) position set to Latitude ,Longitude value in input
  final currentLoc = LatLng(doubleList[2], doubleList[3]) ;

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {

  List<List<dynamic>> csvData = [];
  Set<Marker> _markers = {};
  //Storing neighbourhood selected in input
  int j = Neighbourhood[ng];

  //Initial map position set to Latitude ,Longitude value in input
  static get currentLoc_cam => LatLng(doubleList[2], doubleList[3]);

  //Loading data from csv for the corresponding neighbourhood to be used to mark on map
  Future<void> loadData(LatLng currentLoc) async {
    String data = await rootBundle.loadString('assets/data$j.csv');
    csvData = CsvToListConverter().convert(data);

    setState(() {
      _markers = csvData
          .map((row) {
            //Latitude
        print(row[1]);
        double lat = (row[1]);
        //Longitude
        print(row[2]);
        double lng = (row[2]);
        //title
        print(row[0]);
        String title = row[0];
        //Price
        print(row[3]);

        //Red markers for Airbnbs in same neighbourhood of selected neighbourhood
        return Marker(
          markerId: MarkerId(title),
          position: LatLng(lat, lng),
          infoWindow: InfoWindow(
            title:  title,
            snippet: 'Price: \$${row[3]}',
          ),
           icon: BitmapDescriptor.defaultMarker,

        );
      })
          .toSet();

      //Green maker for selected neighbourhood
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
