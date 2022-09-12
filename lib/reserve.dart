// official modules
import 'globals.dart' as globals;
import 'package:interval_time_picker/interval_time_picker.dart';
import 'package:flutter/material.dart';
// custom modules
import 'reserve_complete.dart';
import 'mycolor.dart';

// main state
class ReservePage extends StatefulWidget {
  // receive id
  final int value;
  // set key
  const ReservePage({Key? key, required this.value}) : super(key: key);

  // set state
  @override
  State<ReservePage> createState() => _ReservePageState();
}

// map window
class _ReservePageState extends State<ReservePage> {
  // state variable
  late int userId;
  late VisibleStep visibleStep;
  late int interval;
  // initial time
  TimeOfDay _time = TimeOfDay.now().addMinute();
  final TimeOfDay _tmptime = TimeOfDay.now().addMinute();

  @override
  void initState() {
    super.initState();
    // time interval
    interval = 15;
    // visible interval
    visibleStep = VisibleStep.fifteenths;
    // set userID
    userId = widget.value;
  }

  // time picker
  void _selectTime() async {
    // show time picker
    final TimeOfDay? newTime = await showIntervalTimePicker(
      context: context, // context
      initialTime: _time, // inital time
      interval: interval, // interval
      visibleStep: visibleStep, // visible interval
    );

    if (newTime?.compareTo(_tmptime) == 1 && newTime != null) {
      setState(() {
        _time = newTime; // set time
      });
    } else {
      _showMyDialog('範囲外を選択しています。', '初期値より後にしてください。');
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
              '予約', // reserve
              style: TextStyle(
                  fontSize: globals.baseFontSize * 1.5,
                  color: const Color(0xFF442B2D)),
            ),
            toolbarHeight: globals.baseWidth * 0.08, // app bar height
            leading: TextButton(
              child: Text(
                '戻る', // go back
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
            height: globals.baseWidth * 2, // box height
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
                                          padding: EdgeInsets.only(
                                              top: globals.baseFontSize * 1.5,
                                              left: globals.baseFontSize),
                                          child: Text(
                                            '店舗名', // shop name
                                            style: TextStyle(
                                              fontSize: globals.baseFontSize *
                                                  1.5, // font size
                                              fontWeight:
                                                  FontWeight.bold, // bold
                                            ),
                                          )),
                                      SizedBox(
                                          height: globals.baseWidth * 0.1,
                                          child: Text(
                                              globals.shops[userId]
                                                  .name, // shop name
                                              style: TextStyle(
                                                fontSize: globals.baseFontSize *
                                                    1.5, // font size
                                              ))),
                                      SizedBox(
                                          height: globals.baseWidth * 0.1,
                                          child: Text(
                                            '店舗住所', // shop address
                                            style: TextStyle(
                                              fontSize: globals.baseFontSize *
                                                  1.5, // font size
                                              fontWeight:
                                                  FontWeight.bold, // bold
                                            ),
                                          )),
                                      SizedBox(
                                          height: globals.baseWidth * 0.1,
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
                                          child: SizedBox(
                                              child: Center(
                                                  child: SizedBox(
                                                      width: globals.baseWidth *
                                                          0.3, // area width
                                                      child: TextButton.icon(
                                                          onPressed:
                                                              _selectTime,
                                                          style: TextButton
                                                              .styleFrom(
                                                            side: BorderSide(
                                                              color: Colors
                                                                  .blue, // font folor
                                                              width: globals
                                                                      .baseFontSize *
                                                                  0.1, // bold
                                                            ),
                                                          ),
                                                          icon: const Icon(Icons
                                                              .access_time),
                                                          label: Text(
                                                              '時間設定', // reserve button
                                                              style: TextStyle(
                                                                  fontSize: globals
                                                                          .baseFontSize *
                                                                      1.6))))))),
                                      SizedBox(
                                        height: globals.baseWidth * 0.15,
                                        child: Text(
                                          _time.format(context), // reserve time
                                          style: TextStyle(
                                            fontSize: globals.baseFontSize *
                                                2, // font size
                                            fontWeight: FontWeight.bold, // bold
                                          ),
                                        ),
                                      ),
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
                                                            ReserveCompPage(
                                                                value: {
                                                              'id': globals
                                                                  .shops[userId]
                                                                  .uid,
                                                              'time':
                                                                  _time.format(
                                                                      context),
                                                            }),
                                                      ),
                                                    ), // on tapped button
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
                                                    Icons.add_box_outlined),
                                                label: Text(
                                                    '予約する', // reserve button
                                                    style: TextStyle(
                                                        fontSize: globals
                                                                .baseFontSize *
                                                            1.6))),
                                          )),
                                    ])))))))));
  }

  Future<void> _showMyDialog(String message1, String message2) async {
    return showDialog<void>(
      // call showDialog
      context: context, // buildcontext
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          // return AlertDialog()
          title: const Text('選択可能時間外'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(message1),
                Text(message2),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('はい'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

extension TimeOfDayExtension on TimeOfDay {
  TimeOfDay addMinute() {
    if (minute + 30 - minute % 30 >= 60) {
      return replacing(hour: hour + 1, minute: 0);
    } else {
      return replacing(hour: hour, minute: minute + 30 - minute % 30);
    }
  }

  int compareTo(TimeOfDay other) {
    if (hour < other.hour) return -1;
    if (hour > other.hour) return 1;
    if (minute < other.minute) return -1;
    if (minute > other.minute) return 1;
    return 0;
  }
}
