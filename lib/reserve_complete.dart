// official modules
import 'globals.dart' as globals;
import 'package:flutter/material.dart';
// custom modules
import 'map.dart';
import 'mycolor.dart';

// main state
class ReserveCompPage extends StatefulWidget {
  // receive id
  final dynamic value;
  // set key
  const ReserveCompPage({Key? key, required this.value}) : super(key: key);

  // set state
  @override
  State<ReserveCompPage> createState() => _ReserveCompPageState();
}

// map window
class _ReserveCompPageState extends State<ReserveCompPage> {
  // state variable
  late int userId;
  // selected time
  late dynamic selectedTime;

  @override
  void initState() {
    super.initState();

    // pass to state
    userId = widget.value['id'] - 1;
    selectedTime = widget.value['time'];
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
              '予約完了',
              style: TextStyle(
                  fontSize: globals.baseFontSize * 1.5,
                  color: const Color(0xFF442B2D)),
            ),
            toolbarHeight: globals.baseWidth * 0.08,
            leading: TextButton(
              child: Text(
                '戻る',
                style: TextStyle(
                  color: Colors.white, // white text color
                  fontWeight: FontWeight.bold, // bold
                  fontSize: globals.baseFontSize * 1.5, // fot size
                ),
              ),
              onPressed: () => Navigator.of(context).pop(),
              // toolbar height
            )),
        body: SizedBox(
            height: globals.baseWidth * 2,
            child: Card(
                child: Container(
                    margin: EdgeInsets.only(
                        top: globals.baseFontSize * 3), // margin
                    // modal box decoration
                    decoration: BoxDecoration(
                      // color of modal
                      color: Colors.white,
                      // make border radius
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(
                            globals.baseFontSize * 2), // round border
                        topRight: Radius.circular(globals.baseFontSize * 2),
                      ),
                    ),
                    child: Scaffold(
                        body: Padding(
                            padding: EdgeInsets.only(
                                top: globals.baseFontSize * 0.5),
                            child: Center(
                                // shop info
                                child: Card(
                                    elevation: globals.baseFontSize * 0.5,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          globals.baseFontSize),
                                    ),
                                    child: Column(children: <Widget>[
                                      Container(
                                          height: globals.baseWidth * 0.1,
                                          padding: EdgeInsets.all(
                                              globals.baseFontSize * 1.5),
                                          child: Text(
                                            '下記の内容で予約を受け付けました。',
                                            style: TextStyle(
                                              fontSize: globals.baseFontSize *
                                                  1.5, // font size
                                              fontWeight:
                                                  FontWeight.bold, // bold
                                            ),
                                          )),
                                      Container(
                                          height: globals.baseWidth * 0.1,
                                          padding: EdgeInsets.only(
                                              top: globals.baseFontSize * 1.5,
                                              left: globals.baseFontSize),
                                          child: Text(
                                            '店舗名',
                                            style: TextStyle(
                                              fontSize: globals.baseFontSize *
                                                  1.5, // font size
                                              fontWeight:
                                                  FontWeight.bold, // bold
                                            ),
                                          )),
                                      Container(
                                          height: globals.baseWidth * 0.1,
                                          padding: EdgeInsets.only(
                                              right: globals.baseFontSize * 1.5,
                                              left: globals.baseFontSize * 1.5),
                                          child:
                                              Text(globals.shops[userId].name,
                                                  style: TextStyle(
                                                    fontSize:
                                                        globals.baseFontSize *
                                                            1.5, // font size
                                                  ))),
                                      Container(
                                          height: globals.baseWidth * 0.1,
                                          padding: EdgeInsets.only(
                                              right: globals.baseFontSize * 1.5,
                                              left: globals.baseFontSize * 1.5),
                                          child: Text(
                                            '店舗住所',
                                            style: TextStyle(
                                              fontSize: globals.baseFontSize *
                                                  1.5, // font size
                                              fontWeight:
                                                  FontWeight.bold, // bold
                                            ),
                                          )),
                                      Container(
                                          height: globals.baseWidth * 0.1,
                                          padding: EdgeInsets.only(
                                              right: globals.baseFontSize * 1.5,
                                              left: globals.baseFontSize * 1.5),
                                          child: Text(
                                            globals.shops[userId]
                                                .address, // shop address
                                            style: TextStyle(
                                              fontSize: globals.baseFontSize *
                                                  1.5, // font size
                                            ),
                                          )),
                                      SizedBox(
                                          height: globals.baseWidth * 0.1,
                                          child: Text(
                                            '予約時間',
                                            style: TextStyle(
                                              fontSize: globals.baseFontSize *
                                                  1.5, // font size
                                              fontWeight:
                                                  FontWeight.bold, // bold
                                            ),
                                          )),
                                      Container(
                                          height: globals.baseWidth * 0.1,
                                          padding: EdgeInsets.only(
                                              right: globals.baseFontSize * 1.5,
                                              left: globals.baseFontSize * 1.5),
                                          child: Text(
                                            selectedTime, // shop address
                                            style: TextStyle(
                                              fontSize: globals.baseFontSize *
                                                  1.5, // font size
                                            ),
                                          )),
                                      SizedBox(
                                          height: globals.baseWidth * 0.1,
                                          child: Text(
                                            'ご予約ありがとうございました。',
                                            style: TextStyle(
                                              fontSize: globals.baseFontSize *
                                                  1.5, // font size
                                            ),
                                          )),
                                      SizedBox(
                                          height: globals.baseWidth * 0.1,
                                          child: SizedBox(
                                            width: globals.baseWidth *
                                                0.3, // area width
                                            child: TextButton.icon(
                                                onPressed: () =>
                                                    Navigator.of(context).push(
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            const MapPage(),
                                                      ),
                                                    ),
                                                style: TextButton.styleFrom(
                                                  side: BorderSide(
                                                    color: Colors
                                                        .blue, // font folor
                                                    width:
                                                        globals.baseFontSize *
                                                            0.1, // bold
                                                  ),
                                                ),
                                                icon: const Icon(
                                                    Icons.arrow_back_outlined),
                                                label: Text(
                                                    '戻る', // reserve button
                                                    style: TextStyle(
                                                        fontSize: globals
                                                                .baseFontSize *
                                                            1.6))),
                                          )),
                                    ])))))))));
  }
}
