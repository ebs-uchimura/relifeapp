// official modules
import 'package:flutter/material.dart';
import 'package:bubble/bubble.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// custom modules
import 'globals.dart' as globals;
import 'reserve.dart';
import 'mycolor.dart';

// main state
class MapModalPage extends StatefulWidget {
  // set key
  const MapModalPage({Key? key, required this.idx}) : super(key: key);

  final int idx;

  // set state
  @override
  State<MapModalPage> createState() => _MapModalPageState();
}

// map window
class _MapModalPageState extends State<MapModalPage> {
  late final idx = widget.idx;

  // widget
  @override
  Widget build(BuildContext context) {
    // modal sheet
    return FractionallySizedBox(
        heightFactor: 0.95, // height level
        child: Container(
            margin: EdgeInsets.only(top: globals.baseFontSize * 3), // margin
            // modal box decoration
            decoration: BoxDecoration(
              // color of modal
              color: Colors.white,
              // make border radius
              borderRadius: BorderRadius.only(
                topLeft:
                    Radius.circular(globals.baseFontSize * 2), // round border
                topRight: Radius.circular(globals.baseFontSize * 2),
              ),
            ),
            child: Scaffold(
                appBar: PreferredSize(
                    preferredSize: Size.fromHeight(
                        globals.baseWidth * 0.1), // here the desired height
                    child: AppBar(
                        backgroundColor: AppColors
                            .colorScheme.onSecondary, // background color
                        title: Text(globals.shops[idx].name, // app bar title
                            style:
                                TextStyle(fontSize: globals.baseFontSize * 1.8),
                            overflow: TextOverflow.ellipsis, // overflow ...
                            maxLines: 1))), // modal title
                body: Padding(
                    padding: EdgeInsets.only(
                        top: globals.baseFontSize * 0.5), // padding
                    child: Center(
                        // shop info
                        child: Card(
                            elevation: globals.baseFontSize * 0.5,
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(globals.baseFontSize),
                            ),
                            child: Column(
                              children: [
                                Expanded(
                                  flex: 4, // ratio
                                  child: FittedBox(
                                      fit: BoxFit.fill, // box full
                                      child: Image.asset(
                                          globals.shops[idx].inurl // image url
                                          )),
                                ),
                                Expanded(
                                  flex: 1, // ratio
                                  child: ShopDetailWidget(idx: idx),
                                ),
                                Expanded(
                                    flex: 1, // ratio
                                    child: Container(
                                      padding:
                                          EdgeInsets.all(globals.baseFontSize),
                                      alignment:
                                          Alignment.centerLeft, // align left
                                      child: Text(
                                        globals
                                            .shops[idx].article, // shop detail
                                        style: TextStyle(
                                            fontSize:
                                                globals.baseFontSize * 1.3),
                                        overflow: TextOverflow
                                            .ellipsis, // overflow ...
                                        maxLines: 3, // 2 max lines
                                      ),
                                    )),
                                Expanded(
                                    flex: 1, // ratio
                                    child: SizedBox(
                                        child: Row(children: <Widget>[
                                      SizedBox(
                                          width:
                                              globals.baseWidth * 0.5, // ratio
                                          child: Container(
                                              padding: EdgeInsets.only(
                                                  top: globals.baseFontSize,
                                                  left: globals.baseFontSize *
                                                      1.5),
                                              alignment: Alignment.centerLeft,
                                              child: Row(children: <Widget>[
                                                getReview(
                                                    4), // get review stars
                                                Container(
                                                  padding: EdgeInsets.all(
                                                      globals.baseFontSize *
                                                          0.1),
                                                  decoration: BoxDecoration(
                                                    border: Border(
                                                      bottom: BorderSide(
                                                        width: globals
                                                                .baseFontSize *
                                                            0.05,
                                                      ),
                                                    ),
                                                  ),
                                                  child: Text(
                                                      '(128)', // a number of review
                                                      style: TextStyle(
                                                          fontSize: globals
                                                              .baseFontSize)),
                                                )
                                              ]))),
                                      Container(
                                          width:
                                              globals.baseWidth * 0.45, // ratio
                                          padding: EdgeInsets.only(
                                              top: globals.baseFontSize,
                                              left: globals.baseFontSize * 0.5),
                                          child: Column(children: <Widget>[
                                            Row(children: <Widget>[
                                              Container(
                                                  alignment:
                                                      Alignment.bottomCenter,
                                                  child: Icon(
                                                    FontAwesomeIcons
                                                        .userGroup, // user group
                                                    color: Colors.red,
                                                    size: globals.baseFontSize *
                                                        1.4,
                                                  )),
                                              getBubble(0xFFFF5252,
                                                  '混んでいます') // show bubble
                                            ]),
                                            getProgress(0.9) // show prgress bar
                                          ]))
                                    ]))),
                                Expanded(
                                    flex: 1, // ratio
                                    child: Row(children: <Widget>[
                                      Expanded(
                                          flex: 1,
                                          child: Container(
                                            padding: EdgeInsets.only(
                                                left: globals.baseFontSize),
                                            alignment: Alignment
                                                .bottomLeft, // aling topleft
                                            child: ShopBusinessTimeWidget(
                                                idx: idx),
                                          )),
                                      Expanded(
                                          flex: 1,
                                          child: SizedBox(
                                              child: Column(children: <Widget>[
                                            Row(children: <Widget>[
                                              Container(
                                                  padding: EdgeInsets.only(
                                                      left:
                                                          globals.baseFontSize),
                                                  alignment:
                                                      Alignment.bottomRight,
                                                  child: Icon(
                                                    FontAwesomeIcons
                                                        .bookBookmark, // user group
                                                    color: Colors.blue,
                                                    size: globals.baseFontSize *
                                                        1.4,
                                                  )),
                                              getBubble(0xFF40C4FF,
                                                  '予約できます') // show bubble
                                            ]),
                                            SizedBox(
                                                width: globals.baseWidth * 0.4,
                                                height:
                                                    globals.baseWidth * 0.12,
                                                child: ElevatedButton.icon(
                                                  onPressed: () =>
                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  ReservePage(
                                                                      // go to reserve
                                                                      value:
                                                                          idx))),
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
                                                      Icons.book_outlined),
                                                  label: Flexible(
                                                      child: Text(
                                                          '予約する', // reserve button
                                                          style: TextStyle(
                                                              fontSize: globals
                                                                      .baseFontSize *
                                                                  1.8))),
                                                ))
                                          ]))),
                                    ])),
                                Container(
                                    margin: EdgeInsets.only(
                                        top: globals.baseFontSize),
                                    height: globals.baseWidth * 0.35, // height
                                    child: CustomScrollView(
                                      slivers: <Widget>[
                                        SliverToBoxAdapter(
                                            child: SizedBox(
                                                height: globals.baseWidth *
                                                    0.35, // box height
                                                child: ListView.builder(
                                                    scrollDirection: Axis
                                                        .horizontal, // scroll horizontal
                                                    itemCount: globals
                                                        .menus.length, // items
                                                    itemBuilder:
                                                        (context, idx) {
                                                      return ShopMenuListWidget(
                                                          idx: idx);
                                                    }))),
                                      ],
                                    )),
                              ],
                            )))))));
  }

  // bubble widget
  Widget getBubble(int colorCode, String words) {
    Color mainColor = Color(colorCode);
    return Bubble(
      color: mainColor,
      padding: BubbleEdges.all(globals.baseFontSize * 0.2),
      alignment: Alignment.bottomRight, // align right
      margin: BubbleEdges.only(
          right: globals.baseFontSize * 2, bottom: globals.baseFontSize * 0.2),
      nip: BubbleNip.leftBottom, // nip
      child: Text(words,
          textAlign: TextAlign.center, // align center
          style: TextStyle(
              color: Colors.white, fontSize: globals.baseFontSize * 1.3)),
    );
  }

  // progressbar widget
  Widget getProgress(double value) {
    return LinearPercentIndicator(
      lineHeight: globals.baseFontSize * 1.5, // line height
      percent: value, // percentage
      progressColor: Colors.red, // bar color
    );
  }

  // review widget
  Widget getReview(double score) {
    return RatingBar.builder(
      initialRating: score, // initial value
      minRating: 1, // minumum
      itemSize: globals.baseFontSize * 2.5, // star size
      direction: Axis.horizontal, // horizontal
      allowHalfRating: true, // allow half star
      itemCount: 5, // stars
      itemPadding: EdgeInsets.symmetric(horizontal: globals.baseFontSize * 0.4),
      itemBuilder: (context, _) => const Icon(
        Icons.star, // star icon
        color: Colors.amber, // yellow
      ),
      onRatingUpdate: (rating) {
        debugPrint(rating.toString());
      },
    );
  }
}

// shop detail card
class ShopDetailWidget extends StatelessWidget {
  const ShopDetailWidget({Key? key, required this.idx}) : super(key: key);

  // receive id
  final int idx;

  @override
  Widget build(BuildContext context) {
    return (Column(children: [
      Container(
          padding: EdgeInsets.only(
              top: globals.baseFontSize,
              left: globals.baseFontSize * 1.5,
              right: globals.baseFontSize * 1.5),
          alignment: Alignment.centerLeft, // align left
          child: Text(
            globals.shops[idx].name, // shop name
            style: TextStyle(fontSize: globals.baseFontSize * 1.9),
            overflow: TextOverflow.ellipsis, // overflow ...
            maxLines: 1, // 1 line max
          )),
      Container(
          width: globals.baseWidth,
          padding: EdgeInsets.only(
              // padding
              top: globals.baseFontSize,
              left: globals.baseFontSize * 1.5,
              right: globals.baseFontSize * 1.5),
          child: Row(children: <Widget>[
            SizedBox(
                width: globals.baseWidth * 0.6,
                child: Text(
                  globals.shops[idx].address, // shop address
                  style: TextStyle(fontSize: globals.baseFontSize * 1.4),
                  overflow: TextOverflow.ellipsis, // overflow ...
                  maxLines: 1, // 1 line max
                )),
            SizedBox(
              width: globals.baseWidth * 0.3, // ratio
              child: iconsList(),
            )
          ]))
    ]));
  }

  // iconlist widget
  Widget iconsList() {
    return Wrap(
        alignment: WrapAlignment.center, // align left
        spacing: globals.baseFontSize * 1.5, // space between two icons
        children: <Widget>[
          Icon(
            FontAwesomeIcons.heartCirclePlus, // favorite
            color: Colors.redAccent,
            size: globals.baseFontSize * 2.2,
          ),
          Icon(
            FontAwesomeIcons.twitter, // twitter
            color: Colors.lightBlueAccent,
            size: globals.baseFontSize * 2.2,
          ),
          Icon(
            FontAwesomeIcons.instagramSquare, // instagram
            color: Colors.purple,
            size: globals.baseFontSize * 2.2,
          ),
          Icon(
            FontAwesomeIcons.facebookF, // facebook
            color: Colors.blue,
            size: globals.baseFontSize * 2.2,
          ),
        ]);
  }
}

// shop business time widget
class ShopBusinessTimeWidget extends StatelessWidget {
  const ShopBusinessTimeWidget({Key? key, required this.idx}) : super(key: key);

  final int idx;

  @override
  Widget build(BuildContext context) {
    var descTextStyle = TextStyle(
      color: Colors.black,
      fontSize: globals.baseFontSize * 1.5,
    );
    return Row(children: [
      Column(children: <Widget>[
        Text('営業時間 (平日) : ', style: descTextStyle), // business time on weekday
        Text('営業時間 (土日) : ', style: descTextStyle), // business time on holiday1
        Text('営業時間 (休日) : ', style: descTextStyle), // business time on holiday2
      ]),
      Column(children: <Widget>[
        // business time on weekday
        Text(
            " ${globals.shops[idx].weekdayopen} ～ ${globals.shops[idx].weekdayclose} ",
            style: descTextStyle),
        // business time on holiday1
        Text(
            " ${globals.shops[idx].holidayopen1} ～ ${globals.shops[idx].holidayclose1} ",
            style: descTextStyle),
        // business time on holiday2
        Text(
            " ${globals.shops[idx].holidayopen2} ～ ${globals.shops[idx].holidayclose2} ",
            style: descTextStyle),
      ])
    ]);
  }
}

// menu widget
class ShopMenuListWidget extends StatelessWidget {
  const ShopMenuListWidget({Key? key, required this.idx}) : super(key: key);

  final int idx;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: globals.baseWidth * 0.3, // box width
        child: GestureDetector(
            child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(globals.baseFontSize * 2)),
                clipBehavior: Clip.antiAliasWithSaveLayer, // clip behavior
                child: Column(children: [
                  Row(
                    children: <Widget>[
                      SizedBox(
                        width: globals.baseWidth * 0.08,
                        child: Image.asset(
                          globals.menus[idx].url, // image url
                        ),
                      ),
                      SizedBox(
                          width: globals.baseWidth * 0.17,
                          child: Container(
                              // padding
                              padding: EdgeInsets.only(
                                  top: globals.baseFontSize,
                                  right: globals.baseFontSize,
                                  left: globals.baseFontSize),
                              child: Text(
                                globals.menus[idx].name, // shopname
                                style: TextStyle(
                                    fontSize: globals.baseFontSize * 1.1,
                                    fontWeight: FontWeight.bold // font size
                                    ),
                                overflow: TextOverflow.ellipsis, // overflow ...
                                maxLines: 2, // 2 max lines
                              )))
                    ],
                  ),
                  Text("${globals.menus[idx].price.floor()}円", // price of menu
                      style: TextStyle(
                          fontSize: globals.baseFontSize * 1.4, // font size
                          fontWeight: FontWeight.bold, // bold
                          color: Colors.red)),
                  Container(
                      padding: EdgeInsets.all(globals.baseFontSize * 0.5),
                      child: Text(
                        globals.menus[idx].article, // article of menu
                        style: TextStyle(
                            fontSize: globals.baseFontSize * 1.2, // font size
                            color: Colors.black),
                        overflow: TextOverflow.ellipsis, // overflow ...
                        maxLines: 4, // 4 max lines
                      ))
                ]))));
  }
}
