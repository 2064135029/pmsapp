import 'package:pmsapp/net/entity/app_entity.dart';
import 'package:pmsapp/net/entity/login_entity.dart';
class EntityFactory {
  static T generateOBJ<T>(json) {
    if (1 == 0) {
      return null;
    } else if (T.toString() == "AppEntity") {
      return AppEntity.fromJson(json) as T;
    } else if (T.toString() == "LoginEntity") {
      return LoginEntity.fromJson(json) as T;
    } else {
      return null;
    }
  }
}