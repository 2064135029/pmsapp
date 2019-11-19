import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pmsapp/net/DataResult.dart';
import 'package:pmsapp/net/models/LoginModel.dart';
import 'package:pmsapp/utils/RouteUtil.dart';
import 'package:pmsapp/view/pages/LoginPage.dart';

import 'common/config/Config.dart';
import 'net/HttpRequest.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      routes: {
        BaseConstant.routeLogin: (ctx) => LoginPage(),
        BaseConstant.routeMain: (ctx) => MyHomePage(title: 'ddd')
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: "首页"),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _init();
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
      print(_counter);
    });
    LoginModel.loginReq("11", "111").then((res) => {print(res)});
  }

  void login() async {
//    DataResult res = await LoginModel.loginReq("11", "111");
//    print(res.data.msg);
//    Navigator.of(context).pushNamed('pms/router/login');
//    Navigator.of(context).pushNamedAndRemoveUntil({"pms/router/login"});
//    Navigator.of(context).pushNamedAndRemoveUntil(
//        'pms/router/login', (Route<dynamic> route) => false);
  RouteUtil.goLogin(context);
    setState(() {
      _counter++;
    });
  }

  void _init() {
    // 设置ip地刺
    HttpRequest.setBaseUrl(Config.BaseUrl);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: login,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
