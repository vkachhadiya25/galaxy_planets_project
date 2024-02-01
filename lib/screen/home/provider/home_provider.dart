import 'package:flutter/material.dart';
import 'package:galaxy_planets/screen/home/model/home_model.dart';
import 'package:galaxy_planets/utils/json_helper.dart';
import 'package:galaxy_planets/utils/share_helper.dart';

class HomeProvider with ChangeNotifier {
  List<HomeModel> planetList = [];
  bool islight = false;
  int? index;
  List<String>? planetListDetail = [];

  Future<void> planetJson() async {
    JsonHelper jsonHelper = JsonHelper();
    List<HomeModel>? p1 = await jsonHelper.planetJsonTOModel();
    planetList = p1;
    notifyListeners();
  }

  void changeTheme() async {
    ShareHelper shr = ShareHelper();
    bool? isTheme = await shr.getTheme();
    islight = isTheme ?? true;
    notifyListeners();
  }

  void changeIndex(int i) {
    index = i;
    notifyListeners();
  }

  Future<void> getBookMark() async {
    ShareHelper shareHelper = ShareHelper();
    List<String>? l1 = await shareHelper.getBookMark();
    if (l1 != null) {
      planetListDetail = l1;
    }
    notifyListeners();
  }

  void addBookMark() {
    ShareHelper shareHelper = ShareHelper();
   planetListDetail!.add(planetList![index!].name!);
   shareHelper.setBookMark(planetListDetail!);
   getBookMark();
   notifyListeners();
  }

  void removeBookMark() {
    ShareHelper shareHelper = ShareHelper();
    planetListDetail!.remove(planetList![index!].name!);
    shareHelper.setBookMark(planetListDetail!);
    getBookMark();
    notifyListeners();
  }
}
