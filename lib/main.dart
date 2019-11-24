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
  _init(){
    SpUtils.get(APPKEYS.ip).then((value){
      HttpRequest.setBaseUrl(value);
    });
  }
  // 监听bloc数据改变，做相应的逻辑判断
  _initListener(){
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
      title: 'Flutter Demo',
      routes: {
        BaseConstant.routeLogin: (ctx) => LoginPage(),
        BaseConstant.routeMain: (ctx) => HomePage(text: '首页'),
        BaseConstant.routeSet: (ctx) => SetIpPage()
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(text: "首页"),
    );
  }
}
