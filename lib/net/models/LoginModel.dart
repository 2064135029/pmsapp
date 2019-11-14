

import 'package:pmsapp/net/Api.dart';
import 'package:pmsapp/net/entity/login_entity.dart';
import 'package:pmsapp/net/ResultData.dart';
import 'package:pmsapp/net/HttpRequest.dart';
import 'dart:convert';
import 'package:pmsapp/net/DataResult.dart';

class LoginModel{
  static loginReq(String passWord,String userName) async{
    ResultData response = await HttpRequest.post(Api.loginApi, {"passWord" : passWord,"userName":userName});
    print(response.data);
    print('8888888888888');
    if(response != null && response.result){
      LoginEntity loginEntity = LoginEntity.fromJson(response.data);
      return new DataResult(loginEntity, true);
    }else{
      return new DataResult(null, false);
    }
  }
}