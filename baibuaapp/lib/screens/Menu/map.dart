import 'dart:async';
import 'package:baibuaapp/models/Maplocationdata.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MyMapPageState extends StatefulWidget {
  @override
  _MyMapPageStateState createState() => _MyMapPageStateState();
}

class _MyMapPageStateState extends State<MyMapPageState> {
  Completer<GoogleMapController> _controller = Completer();

  //************************** Detect Location *******************************//

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

  // Current Location
  Future _goToMe() async {
    final GoogleMapController controller = await _controller.future;
    currentLocation = await getCurrentLocation();
    controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(currentLocation.latitude, currentLocation.longitude),
          zoom: 18,
        ),
      ),
    );
  }

  // EN Location  => Faculty of Engineering (EN) *
  Future _enoRoom({latitude, longitude}) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(latitude, longitude),

//          target: LatLng(14.035854, 100.7254285),
          zoom: 18,
        ),
      ),
    );
  }

  // Business Administration Location => Faculty of  Business Administration (BA)
  Future _businessAdministrationLocation({latitude, longitude}) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(latitude, longitude),
//          target: LatLng(14.0395201,100.7288989),
          zoom: 18,
        ),
      ),
    );
  }

  //Home Economics Location => Faculty of  Home Economics Technology (HT)
  Future _homeEconomicsLocation({latitude, longitude}) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(latitude, longitude),
//          target: LatLng(14.0395201,100.7288989),
          zoom: 18,
        ),
      ),
    );
  }

  // Fine and Applied Arts Location => Faculty of  Fine and Applied Arts  (FA)
  Future _fineandAppliedArtsLocation({latitude, longitude}) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(latitude, longitude),
//          target: LatLng(14.0395201,100.7288989),
          zoom: 18,
        ),
      ),
    );
  }

  // Agricultural Location => Faculty of Agricultural Technology (AT)
  Future _agriculturalLocation({latitude, longitude}) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(latitude, longitude),
//          target: LatLng(14.0395201,100.7288989),
          zoom: 18,
        ),
      ),
    );
  }

  // Technical Education Location => Faculty of  Technical Education (TE)
  Future _technicalEducationLocation({latitude, longitude}) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(latitude, longitude),
//          target: LatLng(14.0395201,100.7288989),
          zoom: 18,
        ),
      ),
    );
  }

  // Architecture Location => Faculty of Architecture (AR)
  Future _architectureLoocation({latitude, longitude}) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(latitude, longitude),
//          target: LatLng(14.0395201,100.7288989),
          zoom: 18,
        ),
      ),
    );
  }

  // Science Location => Faculty of  Science and Technology (ST) *
  Future _sciLocation({latitude, longitude}) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(latitude, longitude),
//          target: LatLng(14.0395201,100.7288989),
          zoom: 18,
        ),
      ),
    );
  }

  // Communication Technology Location => Faculty of  Mass Communication Technology (MT)
  Future _communicationTechnologyLocation({latitude, longitude}) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(latitude, longitude),
//          target: LatLng(14.0395201,100.7288989),
          zoom: 18,
        ),
      ),
    );
  }

  // Liberal Arts Location => Faculty of  Liberal Arts (LA)
  Future _liberalArtsLocation({latitude, longitude}) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(latitude, longitude),
//          target: LatLng(14.0395201,100.7288989),
          zoom: 18,
        ),
      ),
    );
  }

  // Thai Traditional Medicine College Location => Thai Traditional Medicine College (TC)
  Future _thaiTraditionalMedicineCollegeLocation({latitude, longitude}) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(latitude, longitude),
//          target: LatLng(14.0395201,100.7288989),
          zoom: 18,
        ),
      ),
    );
  }

  // Faculty of Nurse Location => Faculty of NurseFaculty of Nurse
  Future _facultyofNurseLocation({latitude, longitude}) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(latitude, longitude),
//          target: LatLng(14.0395201,100.7288989),
          zoom: 18,
        ),
      ),
    );
  }

  //**************************************************************************//

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

  bool _dialVisible = true;

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
//              icon: customIcon,
              markerId: MarkerId("กองพัฒนานักศึกษา"),
              position: LatLng(14.036362, 100.724414),
              visible: true,
              infoWindow: InfoWindow(
                title: "กองพัฒนานักศึกษา",
                snippet: "อาคารกิจการนักศึกษา กองพัฒนานักศึกษา",
//                onTap: _openOnGoogleMapApp(14.0363362, 100.7248359),
              ),
            ),
            Marker(
              markerId: MarkerId("EnLocation"),
              position: LatLng(14.036339, 100.726138),
              infoWindow: InfoWindow(
                  title: "คณะวิศวกรรมศาสตร์ (EN)",
                  snippet: "อาคารเรียนรวมคณะวิศวกรรมศาสตร์ รหัสห้อง EN"),
            ),
            Marker(
              markerId: MarkerId("BA"),
              position: LatLng(14.0368765, 100.7307845),
              infoWindow: InfoWindow(
                  title: "คณะบริหารธุรกิจ (BA)",
                  snippet: "อาคารเรียนรวมคณะวิศวกรรมศาสตร์ รหัสห้อง EN"),
            ),
            Marker(
              markerId: MarkerId("HT"),
              position: LatLng(14.037252, 100.728780),
              infoWindow: InfoWindow(
                  title: "คณะเทคโนโลยีคหกรรมศาสตร์ (HT)",
                  snippet:
                      "อาคารเรียนรวมคณะเทคโนโลยีคหกรรมศาสตร์ รหัสห้อง  HT"),
            ),
            Marker(
              markerId: MarkerId("FA"),
              position: LatLng(14.037249, 100.727544),
              infoWindow: InfoWindow(
                  title: "คณะศิลปกรรมศาสตร์ (FA)",
                  snippet: "อาคารคณะศิลปกรรมศาสตร์์ รหัสห้อง FA"),
            ),
            Marker(
              markerId: MarkerId("AT"),
              position: LatLng(13.969284, 100.6151239),
              infoWindow: InfoWindow(
                  title: "คณะเทคโนโลยีการเกษตร (AT)",
                  snippet: "อาคารคณะเทคโนโลยีการเกษตร์ รหัสห้อง AT"),
            ),
            Marker(
              markerId: MarkerId("TE"),
              position: LatLng(14.0365526, 100.799837),
              infoWindow: InfoWindow(
                  title: "คณะครุศาสตร์อุตสาหกรรม (TE)",
                  snippet: "อาคารคณะครุศาสตร์อุตสาหกรรม รหัสห้อง TE"),
            ),
            Marker(
              markerId: MarkerId("AR"),
              position: LatLng(14.0379079, 100.7297923),
              infoWindow: InfoWindow(
                  title: "คณะสถาปัตยกรรมศาสตร์ (TE)",
                  snippet: "อาคารคณะสถาปัตยกรรมศาสตร์ รหัสห้อง TE"),
            ),
            Marker(
//              icon: customIcon,
              markerId: MarkerId("STLocation"),
              position: LatLng(14.039464, 100.728787),
              visible: true,
              infoWindow: InfoWindow(
                title: "คณะวิทยาศาสตร์",
                snippet: "คณะวิทยาศาสตร์ รหัสห้องเรียน ST",
//                onTap: _openOnGoogleMapApp(14.0363362, 100.7248359),
              ),
            ),
            Marker(
              markerId: MarkerId("MT"),
              position: LatLng(14.0391852, 100.7270293),
              infoWindow: InfoWindow(
                  title: "คณะเทคโนโลยีสื่อสารมวลชน (MT)",
                  snippet: "อาคารคณะเทคโนโลยีสื่อสารมวลชน รหัสห้อง MT"),
            ),
            Marker(
              markerId: MarkerId("LA"),
              position: LatLng(14.038062, 100.7282495),
              infoWindow: InfoWindow(
                  title: "คณะศิลปศาสตร์ (LA)",
                  snippet: "อาคารคณะศิลปศาสตร์ รหัสห้อง LA"),
            ),
            Marker(
              markerId: MarkerId("TC"),
              position: LatLng(13.9692376, 100.6156007),
              infoWindow: InfoWindow(
                  title: "วิทยาลัยการแพทย์แผนไทย (TC)",
                  snippet: "วิทยาลัยการแพทย์แผนไทยรหัสห้อง TC"),
            ),
            Marker(
              markerId: MarkerId("NURSE"),
              position: LatLng(14.00363113, 100.7285058),
              infoWindow: InfoWindow(
                  title: "คณะพยาบาลศาสตร์ (NURSE)",
                  snippet: "คณะพยาบาลศาสตร์ NURSE"),
            ),
          },
        ),
        floatingActionButton: SpeedDial(
          marginRight: 2,
          marginBottom: 10,
          animatedIcon: AnimatedIcons.menu_close,
          animatedIconTheme: IconThemeData(size: 22.0),
          // this is ignored if animatedIcon is non null
          // child: Icon(Icons.add),
          visible: _dialVisible,
          // If true user is forced to close dial manually
          // by tapping main button and overlay is not rendered.
          closeManually: false,
          curve: Curves.bounceIn,
          overlayColor: Colors.black,
          overlayOpacity: 0.7,
          onOpen: () => print('OPENING DIAL'),
          onClose: () => print('DIAL CLOSED'),
          tooltip: 'Speed Dial',
          heroTag: 'speed-dial-hero-tag',
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          elevation: 8.0,
          shape: CircleBorder(),
          children: [
//            SpeedDialChild(
//              child: Icon(Icons.accessibility),
//              backgroundColor: Colors.red,
//              label: 'My Location',
//              labelStyle: TextStyle(fontSize: 18.0),
//              onTap: () => _goToMe(),
//            ),
            SpeedDialChild(
              child: Icon(Icons.brush),
              backgroundColor: Colors.blue,
              label: 'EN',
              labelStyle: TextStyle(fontSize: 18.0),
              onTap: () => _enoRoom(
                  latitude: maplocations[0].latitude,
                  longitude: maplocations[0].longitude),
//              onTap: () => _enoRoom(latitude: 14.036339, longitude: 100.726138),
            ),
            SpeedDialChild(
              child: Icon(Icons.keyboard_voice),
              backgroundColor: Colors.green,
              label: 'BA',
              labelStyle: TextStyle(fontSize: 18.0),
              onTap: () => _businessAdministrationLocation(
                  latitude: maplocations[1].latitude,
                  longitude: maplocations[1].longitude),
            ),
            SpeedDialChild(
              child: Icon(Icons.keyboard_voice),
              backgroundColor: Colors.green,
              label: 'HT',
              labelStyle: TextStyle(fontSize: 18.0),
              onTap: () => _sciLocation(
                latitude: maplocations[2].latitude,
                longitude: maplocations[2].longitude,
              ),
            ),
            SpeedDialChild(
              child: Icon(Icons.keyboard_voice),
              backgroundColor: Colors.green,
              label: 'FA',
              labelStyle: TextStyle(fontSize: 18.0),
              onTap: () => _sciLocation(
                latitude: maplocations[3].latitude,
                longitude: maplocations[3].longitude,
              ),
            ),
            SpeedDialChild(
              child: Icon(Icons.keyboard_voice),
              backgroundColor: Colors.green,
              label: 'AT',
              labelStyle: TextStyle(fontSize: 18.0),
              onTap: () => _sciLocation(
                latitude: maplocations[4].latitude,
                longitude: maplocations[4].longitude,
              ),
            ),
            SpeedDialChild(
              child: Icon(Icons.keyboard_voice),
              backgroundColor: Colors.green,
              label: 'TE',
              labelStyle: TextStyle(fontSize: 18.0),
              onTap: () => _sciLocation(
                latitude: maplocations[5].latitude,
                longitude: maplocations[5].longitude,
              ),
            ),
            SpeedDialChild(
              child: Icon(Icons.keyboard_voice),
              backgroundColor: Colors.green,
              label: 'AR',
              labelStyle: TextStyle(fontSize: 18.0),
              onTap: () => _sciLocation(
                latitude: maplocations[6].latitude,
                longitude: maplocations[6].longitude,
              ),
            ),
            SpeedDialChild(
              child: Icon(Icons.keyboard_voice),
              backgroundColor: Colors.green,
              label: 'ST',
              labelStyle: TextStyle(fontSize: 18.0),
              onTap: () => _sciLocation(
                latitude: maplocations[7].latitude,
                longitude: maplocations[7].longitude,
              ),
            ),
            SpeedDialChild(
              child: Icon(Icons.keyboard_voice),
              backgroundColor: Colors.green,
              label: 'MT',
              labelStyle: TextStyle(fontSize: 18.0),
              //14.039464, 100.728787
              onTap: () => _sciLocation(
                  latitude: maplocations[8].latitude,
                  longitude: maplocations[8].longitude),
            ),
            SpeedDialChild(
              child: Icon(Icons.keyboard_voice),
              backgroundColor: Colors.green,
              label: 'LA',
              labelStyle: TextStyle(fontSize: 18.0),
              //14.039464, 100.728787
              onTap: () => _sciLocation(
                  latitude: maplocations[9].latitude,
                  longitude: maplocations[9].longitude),
            ),
            SpeedDialChild(
              child: Icon(Icons.keyboard_voice),
              backgroundColor: Colors.green,
              label: 'TC',
              labelStyle: TextStyle(fontSize: 18.0),
              //14.039464, 100.728787
              onTap: () => _sciLocation(
                  latitude: maplocations[10].latitude,
                  longitude: maplocations[10].longitude),
            ),
            SpeedDialChild(
              child: Icon(Icons.keyboard_voice),
              backgroundColor: Colors.green,
              label: 'NURSE',
              labelStyle: TextStyle(fontSize: 18.0),
              //14.039464, 100.728787
              onTap: () => _sciLocation(
                  latitude: maplocations[11].latitude,
                  longitude: maplocations[11].longitude),
            ),
          ],
        ),
      ),
    );
  }
}
