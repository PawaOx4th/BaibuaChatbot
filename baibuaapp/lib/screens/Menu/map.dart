import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:url_launcher/url_launcher.dart';

class MyMapPageState extends StatefulWidget {
  @override
  _MyMapPageStateState createState() => _MyMapPageStateState();
}

class _MyMapPageStateState extends State<MyMapPageState> {
  Completer<GoogleMapController> _controller = Completer();

  LocationData currentLocation;

  Future<LocationData> getCurrentLocation() async {
    Location location = Location();
    try {
      return await location.getLocation();
    } catch (e) {
      if (e.code == 'PERMISSION_DENIED') {
        // Permission denied
      }
      return null;
    }
  }

  Future _goToMe() async {
    final GoogleMapController controller = await _controller.future;
    currentLocation = await getCurrentLocation();
    controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(currentLocation.latitude, currentLocation.longitude),
          zoom: 16,
        ),
      ),
    );
  }

  Future _enoRoom() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(target: LatLng(14.036362, 100.724414), zoom: 18),
      ),
    );
  }

  BitmapDescriptor customIcon;

  Future _createMarkerImageFromAsset(BuildContext context) async {
    if (customIcon == null) {
      ImageConfiguration configuration = ImageConfiguration();
      BitmapDescriptor bmpd =
          await BitmapDescriptor.fromAssetImage(configuration, 'img/flag.png');
      setState(() {
        customIcon = bmpd;
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    _createMarkerImageFromAsset(context);
    return SafeArea(
      child: Scaffold(
        body: GoogleMap(
          mapType: MapType.hybrid,
          myLocationEnabled: true,
          initialCameraPosition: CameraPosition(
            target: LatLng(14.0363362, 100.7248359),
            zoom: 16,
          ),
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
          markers: {
            Marker(
              markerId: MarkerId("ตึก ENO"),
              position: LatLng(14.036339, 100.726138),
              infoWindow: InfoWindow(
                  title: "อาคารเรียนรวมคณะวิศวกรรมศาสตร์ (EN)",
                  snippet: "ตึก EN"),
            ),
            Marker(
              icon: customIcon,
              markerId: MarkerId("กองพัฒนานักศึกษา"),
              position: LatLng(14.036362, 100.724414),
              visible: true,
              infoWindow: InfoWindow(
                title: "กองพัฒนานักศึกษา",
                snippet: "อาคารกิจการนักศึกษา กองพัฒนานักศึกษา",
//                onTap: _openOnGoogleMapApp(14.0363362, 100.7248359),
              ),
            ),
          },
        ),
        floatingActionButton:  FloatingActionButton.extended(
          onPressed: _enoRoom,
          label: Text('My location'),
          icon: Icon(Icons.near_me),
        ),
      ),
    );
  }
}
