import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:untitled1/values/images.dart';

void main() {
  runApp(MaterialApp(
      theme: ThemeData(primaryColor: Colors.white),
      debugShowCheckedModeBanner: false,
      home: const MapScreen()));
}

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  static const _initialCameraPostion =
      CameraPosition(target: LatLng(23.0225, 72.5714), zoom: 11.05);

  GoogleMapController? mapController;
  Marker? _origin;
  Marker? _destination;
  BitmapDescriptor? mapmarker;

  @override
  void initState() {
    super.initState();
    BitmapDescriptor.fromAssetImage(
            const ImageConfiguration(), 'assets/images/place_marker.png')
        .then((value) => mapmarker = value);
  }

  // void setCustomMarker() async {
  //   mapmarker = await BitmapDescriptor.fromAssetImage(
  //       const ImageConfiguration(), "assets/images/place_marker.png");
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: const Text("Google Maps"),
          actions: [
            if (_origin != null)
              TextButton(
                onPressed: () => mapController?.animateCamera(
                  CameraUpdate.newCameraPosition(
                    CameraPosition(
                      target: _origin!.position,
                      zoom: 14.5,
                      tilt: 50.0,
                    ),
                  ),
                ),
                style: TextButton.styleFrom(
                  primary: Colors.white,
                  textStyle: const TextStyle(fontWeight: FontWeight.w600),
                ),
                child: const Text('ORIGIN'),
              ),
            if (_destination != null)
              TextButton(
                onPressed: () => mapController?.animateCamera(
                  CameraUpdate.newCameraPosition(
                    CameraPosition(
                      target: _destination!.position,
                      zoom: 14.5,
                      tilt: 50.0,
                    ),
                  ),
                ),
                style: TextButton.styleFrom(
                  primary: Colors.white,
                  textStyle: const TextStyle(fontWeight: FontWeight.w600),
                ),
                child: const Text('DEST'),
              )
          ],
        ),
        body: GoogleMap(
          myLocationButtonEnabled: false,
          zoomControlsEnabled: false,
          initialCameraPosition: _initialCameraPostion,
          markers: {
            if (_origin != null) _origin!,
            if (_destination != null) _destination!,
          },
          // mapType: MapType.satellite,
          onLongPress: _addMarker,
          onMapCreated: (controller) {
            //method called when map is created
            setState(() {
              mapController = controller;
            });
          },
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Theme.of(context).primaryColor,
          foregroundColor: Colors.black,
          onPressed: () {
            mapController?.animateCamera(
                CameraUpdate.newCameraPosition(_initialCameraPostion));
          },
          child: const Icon(Icons.center_focus_strong),
        ),
      ),
    );
  }

  void _addMarker(LatLng argument) async {
    if (_origin == null || (_origin == null && _destination == null)) {
      setState(() {
        _origin = Marker(
            markerId: const MarkerId('origin'),
            infoWindow: const InfoWindow(title: 'Origin'),
            position: argument,
            icon: BitmapDescriptor.defaultMarkerWithHue(
                BitmapDescriptor.hueGreen));
      });
      _destination = null;
    } else {
      List<Placemark> placemarks =
          await placemarkFromCoordinates(argument.latitude, argument.longitude);
      Placemark place = placemarks[0];
      String address =
          "${place.locality}, ${place.postalCode}, ${place.country}";
      setState(() {
        // String getValues = argument.latitude.toStringAsFixed(4) +
        //     "==>" +
        //     argument.longitude.toStringAsFixed(4);
        String getAddress = address;
        _destination = Marker(
            markerId: const MarkerId('_destination'),
            infoWindow: InfoWindow(title: 'Destination', snippet: getAddress),
            position: argument,
            icon: mapmarker!);
      });
    }
  }
}
