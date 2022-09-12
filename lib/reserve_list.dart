// modules
import 'globals.dart' as globals;
import 'package:flutter/material.dart';
// custom modules
import 'mycolor.dart';

// main state
class ReserveListPage extends StatefulWidget {
  // set key
  const ReserveListPage({Key? key}) : super(key: key);

  // set state
  @override
  State<ReserveListPage> createState() => _ReserveListPageState();
}

// map window
class _ReserveListPageState extends State<ReserveListPage> {
  // widget
  @override
  Widget build(BuildContext context) {
    // layout
    return Scaffold(
        appBar: AppBar(
          centerTitle: true, // centering
          automaticallyImplyLeading: true, // show back button
          backgroundColor:
              AppColors.colorScheme.onSecondary, // background color
          elevation: 0.0, // no shadow
          title: Text('予約一覧', // reserve list
              style: TextStyle(
                  fontSize: globals.baseFontSize * 1.5,
                  color: const Color(0xFF442B2D)),
              overflow: TextOverflow.ellipsis, // overflow ...
              maxLines: 1),
          toolbarHeight: globals.baseWidth * 0.08, // height
        ),
        body: ListView(
            children: ListTile.divideTiles(
          color: AppColors.colorScheme.primary, // list background color
          tiles: globals.shops.map(
            (item) => ListTile(
              leading: CircleAvatar(
                backgroundColor:
                    AppColors.colorScheme.background, // time icon color
                child: Image.asset(item.url), // image url
              ),
              title: Text(item.name), // list title
              subtitle: Text(
                item.article, // list subtitle
                style: TextStyle(
                  fontSize: globals.baseFontSize * 1.3, // font size
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
              ),
              trailing: CircleAvatar(
                backgroundColor: AppColors.colorScheme.primary, // icon color
                foregroundColor: Colors.white, // icon font color
                child: Text(
                  item.weekdayopen.toString(), // remaining time
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: globals.baseFontSize * 2),
                ),
              ),
            ),
          ),
        ).toList()));
  }
}
