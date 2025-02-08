import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';

class PickPlaceScreen extends StatefulWidget {
  const PickPlaceScreen({super.key});

  @override
  State<PickPlaceScreen> createState() => _PickPlaceScreenState();
}

MapController mapController = MapController();

class _PickPlaceScreenState extends State<PickPlaceScreen> {
  LatLng centerPoint = const LatLng(36.190648, 44.009154);
  bool serviceEnabled = false;
  @override
  void initState() {
    super.initState();
    getCurrentLocationStream(context);
  }

  Future<void> isLocOn() async {
    var serviceEnabled = await Geolocator.isLocationServiceEnabled();
    setState(() {});
  }

  var locasion;

  void getCurrentLocationStream(context) async {
    LocationPermission permission;

    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {}
    }

    if (permission == LocationPermission.deniedForever) {}

    var loca = await Geolocator.getCurrentPosition();
    locasion = LatLng(loca.latitude, loca.longitude);
    await isLocOn();

    mapController.move(locasion, 15.0);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Map",
          style: TextStyle(
            color: Colors.black,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
            size: 30,
          ),
        ),
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
      ),
      body: serviceEnabled
          ? Stack(
              alignment: Alignment.bottomCenter,
              children: [
                FlutterMap(
                  options: MapOptions(
                    minZoom: 15.0,
                    onPositionChanged: (position, bool hasGesture) {
                      setState(() {
                        centerPoint = mapController.camera.center;
                      });
                    },
                  ),
                  mapController: mapController,
                  children: [
                    TileLayer(
                      urlTemplate:
                          "https://api.mapbox.com/styles/v1/fahadmahfoths2/cl5prg06w007k14s0hg9uwb3z/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoiZmFoYWRtYWhmb3RoczIiLCJhIjoiY2w1cHF4NXd2MXBzaTNqcXJtbWF5d2x0NiJ9.jTsWnxxSCsIuHBa-Y37jxA",
                      additionalOptions: const {
                        'accessToken':
                            'pk.eyJ1IjoiZmFoYWRtYWhmb3RoczIiLCJhIjoiY2w1cHF4NXd2MXBzaTNqcXJtbWF5d2x0NiJ9.jTsWnxxSCsIuHBa-Y37jxA',
                        'id': 'mapbox.mapbox-streets-v8',
                      },
                    ),
                    MarkerLayer(markers: [
                      Marker(
                          width: 80.0,
                          height: 80.0,
                          point: centerPoint,
                          child: const Icon(
                            Icons.location_on_rounded,
                            color: Colors.redAccent,
                            size: 40,
                          )),
                    ]),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(25),
                  child: ElevatedButton(
                    child: const Text("Select Location"),
                    onPressed: () {
                      centerPoint =
                          LatLng(centerPoint.latitude, centerPoint.longitude);
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            )
          : const Center(
              child: Text(
                "Please Turn GPS Service On",
                style: TextStyle(color: Colors.red, fontSize: 20),
              ),
            ),
    );
  }
}
