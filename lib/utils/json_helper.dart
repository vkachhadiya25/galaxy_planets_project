import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:galaxy_planets/screen/home/model/home_model.dart';

class JsonHelper
{
  Future<List<HomeModel>> planetJsonTOModel() async {
    var planetString = await rootBundle.loadString("assets/json/planet.json");
    List planet = jsonDecode(planetString);
    List<HomeModel> modelList = planet.map((e) => HomeModel.mapToModel(e)).toList();
    return modelList;
  }
}
