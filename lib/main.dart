import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pmsapp/blocs/application_bloc.dart';
import 'package:pmsapp/blocs/bloc_provider.dart';
import 'package:pmsapp/blocs/index.dart';
import 'package:pmsapp/common/SpUtils.dart';
import 'package:pmsapp/net/DataResult.dart';
import 'package:pmsapp/net/models/LoginModel.dart';
import 'package:pmsapp/utils/RouteUtil.dart';
import 'package:pmsapp/view/pages/HomePage.dart';
import 'package:pmsapp/view/pages/LoginPage.dart';
import 'package:pmsapp/view/pages/SetIpPage.dart';
import 'package:pmsapp/view/pages/MainPage.dart';

import 'common/config/Config.dart';
import 'net/HttpRequest.dart';

void main() => runApp(BlocProvider<ApplicationBloc>(
      bloc: ApplicationBloc(),
      child: BlocProvider(
        child: MyApp(),
        bloc: MainBloc(),
      ),
    ));

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _init();
    _initListener();
  }

  // 初始化ulr
  _init() {}

  // 监听bloc数据改变，做相应的逻辑判断
  _initListener() {
    final ApplicationBloc bloc = BlocProvider.of<ApplicationBloc>(context);
    bloc.appEventStream.listen((value) {
      switch (value.id) {
        default:
          break;
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'PMS',
      routes: {
        BaseConstant.routeLogin: (ctx) => LoginPage(),
        BaseConstant.routeMain: (ctx) => MainPage(),
        BaseConstant.routeSet: (ctx) => SetIpPage()
      },

      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainPage(),
    );
  }
}
