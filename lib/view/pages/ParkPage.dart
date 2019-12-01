import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ParkPage extends StatelessWidget {
  String title;

  ParkPage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('pppppp');
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(this.title),
      ),
    );
  }
}
