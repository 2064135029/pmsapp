import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RentPage extends StatelessWidget {
  String title;
  RentPage({Key key, this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar:AppBar(
        title: Text(this.title),
      ),
    );
  }
}
