import 'package:flutter/material.dart';
import 'package:quiz/data_controller/true_false_bank_data.dart';
import 'package:quiz/view_screens/home.dart';
import 'package:quiz/view_screens/levels/level_describtion.dart';
import 'package:quiz/view_screens/questions/qestion_screen.dart';
import 'package:quiz/view_screens/splachscreen/splash_screen.dart';

import 'app_router/approuter.dart';
import 'app_router/router.dart';
import 'app_router/pages_names.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return   MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        PagesNames.homePage: (context) => HomePage(),
        PagesNames.splashScreen: (context) => SplachScreen()
      },
      navigatorKey: AppRouter.navKey,
      // onGenerateRoute: generateRoute,
      onGenerateRoute: generateRoute ,
      initialRoute: PagesNames.splashScreen,
    );
  }
}
