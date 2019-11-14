

import 'package:pmsapp/net/Api.dart';
import 'package:pmsapp/net/entity/login_entity.dart';
import 'package:pmsapp/net/ResultData.dart';
import 'package:pmsapp/net/HttpRequest.dart';
import 'dart:convert';
import 'package:pmsapp/net/DataResult.dart';

class LoginModel{
  static loginReq(String passWord,String userName) async{
    ResultData response = await HttpRequest.post(Api.loginApi, {"passWord" : passWord,"userName":userName});
//    print(response.data + '++++++');
    if(response != null && response.result){
//      LoginEntity loginEntity = LoginEntity.fromJson(json.decode(response.data));
      return new DataResult(response.data, true);
    }else{
      return new DataResult(null, false);
    }
  }
}