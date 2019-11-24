import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:pmsapp/blocs/bloc_provider.dart';
import 'package:pmsapp/common/config/Config.dart';
import 'package:pmsapp/net/DataResult.dart';
import 'package:pmsapp/net/entity/app_data_entity.dart';
import 'package:pmsapp/net/entity/app_entity.dart';
import 'package:pmsapp/net/models/AppModel.dart';

//import 'package:pmsapp/models/models.dart';
//import 'package:pmsapp/utils/http_utils.dart';
import 'package:rxdart/rxdart.dart';

class MainBloc implements BlocBase {
  BehaviorSubject<List<AppDataData>> _app = BehaviorSubject<List<AppDataData>>();

  Sink<List<AppDataData>> get _appSink => _app.sink;

  Stream<List<AppDataData>> get appStream => _app.stream;

  MainBloc() {}

  @override
  Future getData({String labelId, int page}) {
    switch (labelId) {
      case Ids.homePage:
        return getAppData();
        break;
    }
    return null;
  }

  @override
  Future onLoadMore({String labelId}) {
    return null;
  }

  @override
  Future onRefresh({String labelId}) {
    return null;
  }

  Future getAppData() {
    AppModel.getAppclication().then((res) {
      DataResult r = res;
      AppDataEntity appDataEntity = r.data;
      _appSink.add(appDataEntity.data);
      print(res);
    });
  }

  @override
  void dispose() {
//    _version.close();
    _app.close();
  }
}
