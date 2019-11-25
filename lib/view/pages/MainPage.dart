

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pmsapp/view/pages/HomePage.dart';
import 'package:pmsapp/view/pages/MyCenter.dart';

class MainPage extends StatefulWidget{

  MainPage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MainPageState();
  }
}

class MainPageState extends State<MainPage> {

  int _currentIndex = 0;
  List tabs = [
    {'key': '首页'},
    {'key': '个人中心'},
  ];

  var Pages;

  initTab(){
    Pages = [HomePage(text: '首页',), MyCenter()];
  }

  @override
  Widget build(BuildContext context) {
    initTab();
    // TODO: implement build
    return Scaffold(
      body: Pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          new BottomNavigationBarItem(
              icon: Icon(Icons.home), title: Text(tabs[0]['key'])),
          new BottomNavigationBarItem(
              icon: Icon(Icons.account_box), title: Text(tabs[1]['key'])),
         ],
        type: BottomNavigationBarType.fixed,
        iconSize: 24,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      )
    );
  }
}
