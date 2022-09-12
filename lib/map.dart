// official modules
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
// custom modules
import 'globals.dart' as globals;
import 'mapmodal.dart';
import 'mycolor.dart';

// main state
class MapPage extends StatefulWidget {
  // set key
  const MapPage({Key? key}) : super(key: key);

  // set state
  @override
  State<MapPage> createState() => _MapPageState();
}

// map window
class _MapPageState extends State<MapPage> {
  // is shown
  bool status = false;
  // images
  late Image tmpImage;
  // img str
  late String tmpImageStr;
  // images list
  List<Image> imgList = [];

  @override
  void initState() {
    super.initState();

    for (var i = 1; i < globals.shops.length + 1; i++) {
      tmpImageStr = i.toString().padLeft(7, '0');
      tmpImage = Image.asset("assets/logo/$tmpImageStr.png");
      imgList.add(tmpImage);
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    for (var i = 1; i < globals.shops.length + 1; i++) {
      precacheImage(imgList[i - 1].image, context);
    }
  }

  // widget
  @override
  Widget build(BuildContext context) {
    // layout
    return Scaffold(
      appBar: AppBar(
          centerTitle: true, //align center
          automaticallyImplyLeading: true, // back button
          backgroundColor:
              AppColors.colorScheme.onSecondary, // background color
          elevation: 0.0, // no shadow
          title: Text(
            'マップ', // map
            style: TextStyle(
                fontSize: globals.baseFontSize * 1.5, // font size
                color: const Color(0xFF442B2D)),
          ),
          toolbarHeight: globals.baseWidth * 0.08, // height of toolbar
          actions: [
            FlutterSwitch(
                width: globals.baseWidth * 0.2, // switch width
                height: globals.baseWidth * 0.075, // switch height
                valueFontSize: globals.baseFontSize, // onoff font size
                toggleSize: globals.baseWidth * 0.07, // toggle bar size
                value: status, // on/off
                activeText: '空席有', // text on active
                inactiveText: '全席', // text on inactive
                borderRadius: globals.baseFontSize * 2, // border radius
                padding: globals.baseFontSize, // padding around
                showOnOff: true, // show when off
                onToggle: (val) {
                  setState(
                    () {
                      status = val; // set onoff
                    },
                  );
                }),
          ],
          leading: TextButton(
            child: Text(
              '戻る', // back
              style: TextStyle(
                color: Colors.white, // white text color
                fontWeight: FontWeight.bold, // bold
                fontSize: globals.baseFontSize * 1.2, // fot size
              ),
            ),
            onPressed: () => Navigator.of(context).pop(),
            // toolbar height
          )),
      body: Column(children: <Widget>[
        Expanded(
            flex: 1, //
            child: Builder(
              builder: (context) => CustomScrollView(
                slivers: <Widget>[
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: globals.baseWidth * 0.18, // box height
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal, // scroll horizontal
                        itemCount: globals.shops.length, // items
                        itemBuilder: (context, index) {
                          return SizedBox(
                              width: globals.baseWidth * 0.26, // box width
                              child: GestureDetector(
                                  onTap: () => _showModalSheet(index, context),
                                  child: Center(
                                    child: sliverWidget(context, index),
                                  )));
                        },
                      ),
                    ),
                  ),
                ],
              ),
            )),
        Expanded(
          flex: 8,
          child: GoogleWidget(),
        )
      ]),
    );
  }

// Sliver widget
  Widget sliverWidget(BuildContext context, int idx) {
    return Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(globals.baseFontSize * 2)),
        clipBehavior: Clip.antiAliasWithSaveLayer, // clip behavior
        child: Column(children: <Widget>[
          Expanded(
            flex: 6,
            child: imgList[idx], // image url
          ),
          Expanded(
              flex: 4,
              child: Container(
                  padding: EdgeInsets.only(
                      left: globals.baseFontSize,
                      right: globals.baseFontSize,
                      bottom: globals.baseFontSize), // padding
                  child: Text(globals.shops[idx].name, // shopname
                      style: TextStyle(
                        fontSize: globals.baseFontSize * 1.2, // font size
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1))),
        ]));
  }
}

// show modal sheet (from bottom)
Future<void> _showModalSheet(int idx, BuildContext context) async {
  showModalBottomSheet(
      backgroundColor: Colors.transparent, // bakcground color
      context: context, // content
      isScrollControlled: true, // allow scrolling
      builder: (context) => MapModalPage(idx: idx));
}

// return google map
class GoogleWidget extends StatelessWidget {
  // set key
  GoogleWidget({Key? key}) : super(key: key);

  // initial camera position
  static const CameraPosition kGooglePlex = CameraPosition(
    target: LatLng(35.660192, 139.702585), // target latlng
    zoom: 15.4746, // zoom level
  );

  // completer
  final Completer<GoogleMapController> controller = Completer();

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
        mapType: MapType.normal, // map type
        initialCameraPosition: kGooglePlex, // initial position
        // map created
        onMapCreated: (GoogleMapController controller) {
          // completer
          controller.dispose();
        },
        // symbol marker
        markers: globals.shops.map(
          (selectedShop) {
            // marker
            return Marker(
                markerId: MarkerId(selectedShop.uid.toString()), // marker uid
                icon: BitmapDescriptor.defaultMarkerWithHue(
                    calcJam(selectedShop.jam)), // calculate jamming
                alpha: selectedShop.jam == 100 // when full jam
                    ? 0
                    : 1, // full or nothing
                infoWindow: InfoWindow(title: selectedShop.name), // marker name
                position: LatLng(selectedShop.latitude,
                    selectedShop.longitude), // marker latlng
                // when tapped
                onTap: () async {
                  // goto tapped shop detail(modal)
                  _showModalSheet(selectedShop.uid, context);
                });
          },
        ).toSet());
  }
}

// return jam
double calcJam(int jamPer) {
  // when full jam
  if (jamPer == 100) {
    return BitmapDescriptor.hueRed;
    // 80 to 100 percent
  } else if (jamPer < 100 && jamPer >= 80) {
    return BitmapDescriptor.hueOrange;
    // 60 to 80 percent
  } else if (jamPer < 80 && jamPer >= 60) {
    return BitmapDescriptor.hueYellow;
    // 40 to 60 percent
  } else if (jamPer < 60 && jamPer >= 40) {
    return BitmapDescriptor.hueCyan;
    // 20 to 40 percent
  } else if (jamPer < 40 && jamPer >= 20) {
    return BitmapDescriptor.hueMagenta;
    // 0 to 20 percent
  } else if (jamPer < 20 && jamPer >= 0) {
    return BitmapDescriptor.hueBlue;
    // else
  } else {
    return BitmapDescriptor.hueRose;
  }
}
