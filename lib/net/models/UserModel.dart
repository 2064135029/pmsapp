import 'package:pmsapp/net/HttpRequest.dart';
import 'package:pmsapp/net/entity/user_info_entity.dart';

import '../Api.dart';
import '../DataResult.dart';
import '../ResultData.dart';

class UserModel {
  static getUserInfo() async {
    ResultData response = await HttpRequest.post(Api.getUserInfo, {});
    print(response);
    if (response != null && response.result) {
      UserInfoEntity userInfoEntity = UserInfoEntity.fromJson(response.data['data']);
      print(userInfoEntity.disName);
      return new DataResult(userInfoEntity, true);
    } else {
        return new DataResult(null, false);
    }
  }
}
