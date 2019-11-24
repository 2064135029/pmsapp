import 'package:pmsapp/net/Api.dart';
import 'package:pmsapp/net/entity/login_data_entity.dart';
import 'package:pmsapp/net/entity/login_entity.dart';
import 'package:pmsapp/net/ResultData.dart';
import 'package:pmsapp/net/HttpRequest.dart';
import 'dart:convert';
import 'package:pmsapp/net/DataResult.dart';
import 'dart:convert';
import 'package:convert/convert.dart';
import 'package:crypto/crypto.dart';

class LoginModel {
  static loginReq(String passWord, String userName) async {
    ResultData response = await HttpRequest.post(Api.loginApi,
        {"passWord": generateMd5(passWord + "wujhepms"), "userName": userName});
    print(response.data);
    if (response != null && response.result) {
      LoginDataEntity loginDataEntity = LoginDataEntity.fromJson(response.data);
      return new DataResult(loginDataEntity, true);
    } else {
      return new DataResult(null, false);
    }
  }

  // md5 加密
  static String generateMd5(String data) {
    var content = new Utf8Encoder().convert(data);
    var digest = md5.convert(content);
    // 这里其实就是 digest.toString()
    return hex.encode(digest.bytes);
  }
}
