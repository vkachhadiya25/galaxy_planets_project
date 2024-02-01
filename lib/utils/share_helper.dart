import 'package:shared_preferences/shared_preferences.dart';

class ShareHelper {
  Future<void> setTheme(bool isTheme) async {
    SharedPreferences shr = await SharedPreferences.getInstance();
    shr.setBool('theme', isTheme);
  }

  Future<bool?> getTheme() async {
    SharedPreferences shr = await SharedPreferences.getInstance();
    bool? isTheme = shr.getBool('theme');
    return isTheme;
  }

  Future<void> setBookMark(List<String> planetListDetail) async {
    SharedPreferences shr = await SharedPreferences.getInstance();
    shr.setStringList("bookmark", planetListDetail);
  }

  Future<List<String>?> getBookMark() async {
    SharedPreferences shr = await SharedPreferences.getInstance();
    return shr.getStringList("bookmark");
  }
}
