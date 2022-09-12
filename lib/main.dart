// official modules
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// custom modules
import 'globals.dart' as globals;
import 'map.dart';
import 'reserve_list.dart';
import 'search.dart';
import 'config.dart';
import 'reserve.dart';
import 'mycolor.dart';

// main
void main() => runApp(const RelifeApp());

// main class
class RelifeApp extends StatelessWidget {
  // set key
  const RelifeApp({Key? key}) : super(key: key);

  // widget
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context)
              .copyWith(textScaleFactor: 1.0), // fix text scale
          child: child!,
        );
      },
      title: 'Flutter Demo', // title
      // main theme
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainPage(),
    );
  }
}

// main state
class MainPage extends StatefulWidget {
  // set key
  const MainPage({Key? key}) : super(key: key);

  // set state
  @override
  State<MainPage> createState() => _MainPageState();
}

// map window
class _MainPageState extends State<MainPage> {
  // nav list
  static const pageList = [
    MapPage(), // map
    ReserveListPage(), // reserve
    SearchPage(), // shop search
    SettingPage(), // user setting
    ReservePage(value: 1), // reserve
  ];
  // navigation index
  int _selectedIndex = 0;

  // widget
  @override
  Widget build(BuildContext context) {
    Size displaySize(BuildContext context) {
      return MediaQuery.of(context).size; // global display size
    }

    double displayWidth(BuildContext context) {
      return displaySize(context).width; // global display width
    }

    // base width
    globals.baseWidth = displayWidth(context);
    // basefont
    globals.baseFontSize = globals.baseWidth * 0.02;

    // color sheme
    final colorScheme = Theme.of(context).colorScheme;
    // layout
    return Scaffold(
        // title bar
        body: pageList[_selectedIndex], // front page
        bottomNavigationBar: SizedBox(
          height: globals.baseWidth * 0.12, // height
          child: BottomNavigationBar(
            iconSize: globals.baseFontSize * 1.5, // size of all icons
            type: BottomNavigationBarType.fixed, // define behavior
            currentIndex: _selectedIndex, // index
            backgroundColor: AppColors.colorScheme.surface, // background skin
            selectedItemColor:
                AppColors.colorScheme.onSurface, // background skin on selected
            unselectedItemColor:
                colorScheme.onSurface.withOpacity(.60), // opacity normal
            selectedLabelStyle: TextStyle(
                fontSize: globals.baseFontSize * 1.2), // text style on selected
            unselectedLabelStyle: TextStyle(
                fontSize: globals.baseFontSize * 1.2), // text style normal
            onTap: (index) {
              // on tapped
              setState(() {
                _selectedIndex = index; // set current index
              });
            },
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.map), // icon of item
                label: '周辺地図', // label txt
                tooltip: "周辺のマップ", // tip txt background color
              ),
              BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.calendar), // icon of item
                label: '予約一覧', // label txt
                tooltip: "予約のリスト", // tip txt/ background color
              ),
              BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.searchengin), // icon of item
                label: 'エリア検索', // label txt
                tooltip: "指定のエリアを検索", // tip txt/ background color
              ),
              BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.gear), // icon of item
                label: '環境設定', // label txt
                tooltip: "各種環境設定", // tip txt/ background color
              ),
            ],
          ),
        ));
  }
}
