import 'package:baibuaapp/sizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:baibuaapp/models/mapDetail.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapRoom extends StatefulWidget {
  MapRoom({Key key}) : super(key: key);

  @override
  _MapRoomState createState() => _MapRoomState();
}

class _MapRoomState extends State<MapRoom> {
  GoogleMapController _controller;

  List<Marker> allMarker = [];

  PageController _pageController;

  int prevPage;

  void mapCreated(controller) {
    setState(() {
      _controller = controller;
    });
  }

  moveCamera() {
    _controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: mapDetail[_pageController.page.toInt()].location,
          zoom: 17.0,
          bearing: 45.0,
          // bearing: 0.0,
          tilt: 45.0,
          // tilt: 0.0,
        ),
      ),
    );
  }

  void _onScroll() {
    if (_pageController.page.toInt() != prevPage) {
      prevPage = _pageController.page.toInt();
      moveCamera();
    }
  }

  _detail(index) {
    return AnimatedBuilder(
      animation: _pageController,
      builder: (BuildContext context, Widget widget) {
        double value = 1;
        if (_pageController.position.haveDimensions) {
          value = _pageController.page - index;
          value = (1 - (value.abs() * 0.3) + 0.06).clamp(0.0, 1.0);
        }
        return Center(
          child: SizedBox(
            height: Curves.easeInOut.transform(value) * 125.0,
            width: Curves.easeInOut.transform(value) * 350.0,
            child: widget,
          ),
        );
      },
      child: InkWell(
        onTap: () {
          moveCamera();
        },
        child: Stack(
          fit: StackFit.expand,
          children: [
            Center(
              child: Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 10.0,
                  vertical: 20.0,
                ),
                height: 125.0,
                width: 275.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black54,
                        offset: Offset(0.0, 4.0),
                        blurRadius: 10.0,
                      ),
                    ]),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.white),
                  child: Row(
                    children: [
                      Container(
                        height: 90.0,
                        width: 90.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10.0),
                              topLeft: Radius.circular(10.0)),
                          image: DecorationImage(
                              image: NetworkImage(mapDetail[index].thumbNail),
                              fit: BoxFit.cover),
                        ),
                      ),
                      SizedBox(width: 5.0),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            width: 40 * SizeConfig.widthMultiplier,
                            child: Text(
                              mapDetail[index].namefacultyTH,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 12.5, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Text(
                            mapDetail[index].address,
                            style: TextStyle(
                                fontSize: 12.0, fontWeight: FontWeight.w600),
                          ),
                          Container(
                            width: 170.0,
                            child: Text(
                              mapDetail[index].description,
                              style: TextStyle(
                                  fontSize: 11.0, fontWeight: FontWeight.w300),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    mapDetail.forEach((element) {
      allMarker.add(Marker(
          markerId: MarkerId(element.namefacultyTH),
          draggable: false,
          infoWindow: InfoWindow(
              title: element.namefacultyTH, snippet: element.address),
          position: element.location));
    });
    _pageController = PageController(initialPage: 1, viewportFraction: 0.8)
      ..addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: GoogleMap(
                initialCameraPosition: CameraPosition(
                    target: LatLng(14.0369922, 100.7328257), zoom: 15.0),
                markers: Set.from(allMarker),
                onMapCreated: mapCreated,
                mapType: MapType.hybrid,
              ),
            ),
            Positioned(
              bottom: 20.0,
              child: Container(
                height: 200.0,
                width: MediaQuery.of(context).size.width,
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: mapDetail.length,
                  itemBuilder: (BuildContext context, int index) {
                    return _detail(index);
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
