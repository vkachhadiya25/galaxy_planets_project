import 'package:flutter/material.dart';
import 'package:galaxy_planets/screen/home/provider/home_provider.dart';
import 'package:galaxy_planets/utils/app_theme.dart';
import 'package:provider/provider.dart';

import 'utils/app_routes.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => HomeProvider(),),
    ],
    child: Consumer<HomeProvider>(
      builder: (context, value, child) {
        value.changeTheme();
        return  MaterialApp(
          theme: value.islight?lightTheme:darkTheme,
          debugShowCheckedModeBanner: false,
          routes: appRoutes,);
      },

    ),
  ));
}

