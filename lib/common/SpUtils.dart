import 'package:shared_preferences/shared_preferences.dart';

class SpUtils {
  static void save(key, data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, data);
  }

  static void remove(key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }

  static Future get(key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String data = prefs.getString(key);
    return data;
  }
}

class APPKEYS {
  static const String ip = 'ipAddress';
}