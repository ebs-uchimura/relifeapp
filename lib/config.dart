// modules
import 'package:flutter/material.dart';

// main state
class SettingPage extends StatefulWidget {
  // set key
  const SettingPage({Key? key}) : super(key: key);

  // set state
  @override
  State<SettingPage> createState() => _SettingPageState();
}

// map window
class _SettingPageState extends State<SettingPage> {
  // widget
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Re:Life App',
      home: Text('Setting Page'),
    );
  }
}
