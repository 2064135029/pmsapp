

import 'package:flutter/cupertino.dart';

class RouteUtil {
  static void goMain(BuildContext context) {
    pushReplacementNamed(context, BaseConstant.routeMain);
  }
//  static void loginSuccess(BuildContext context) {
//    pushNamed(context, BaseConstant.routeMain);
//  }
  static void goLogin(BuildContext context) {
//    pushNamedAndRemoveUntil(BaseConstant.routeLogin, (Route<dynamic> route) => false);
    Navigator.of(context).pushNamedAndRemoveUntil(
        BaseConstant.routeLogin, (Route<dynamic> route) => false);
  }

  static void pushNamed(BuildContext context, String pageName) {
    Navigator.of(context).pushNamed(pageName);
  }

  static void pushReplacementNamed(BuildContext context, String pageName) {
    Navigator.of(context).pushReplacementNamed(pageName);
  }
}


class BaseConstant {
  static const String packageBase = 'base_library';

  static const String keyShowGuide = 'show_guide';
  static const String keyUserName = 'user_name';
  static const String keyUserModel = 'user_model';
  static const String keyAppToken = 'app_token';

  static const String routeMain = 'route_main';
  static const String routeLogin = 'route_login';
}
