
import 'package:pmsapp/net/entity/app_entity.dart';

import '../Api.dart';
import '../DataResult.dart';
import '../HttpRequest.dart';
import '../ResultData.dart';

class AppModel{
  static getAppclication() async{
    ResultData response = await HttpRequest.post(Api.getApplication,{});
    if(response != null && response.result){
      AppEntity appEntity = AppEntity.fromJson(response.data);
      return new DataResult(appEntity, true);
    }else{
      return new DataResult(null, false);
    }
  }

}