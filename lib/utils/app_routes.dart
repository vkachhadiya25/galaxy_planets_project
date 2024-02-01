import 'package:flutter/cupertino.dart';
import 'package:galaxy_planets/screen/home/view/home_screen.dart';
import 'package:galaxy_planets/screen/info/view/info_screen.dart';
import 'package:galaxy_planets/screen/splesh/view/splesh_screen.dart';

Map<String,WidgetBuilder> appRoutes =
{
  '/' : (context) => const SpleshScreen(),
  'home' : (context) => const HomeScreen(),
  'info' : (context) => const InfoScreen(),
};