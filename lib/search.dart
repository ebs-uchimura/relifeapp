// modules
import 'package:flutter/material.dart';

// main state
class SearchPage extends StatefulWidget {
  // set key
  const SearchPage({Key? key}) : super(key: key);

  // set state
  @override
  State<SearchPage> createState() => _SearchPageState();
}

// map window
class _SearchPageState extends State<SearchPage> {
  // widget
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Re:Life App',
      home: Text('Search Page'),
    );
  }
}
