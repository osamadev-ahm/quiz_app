import 'package:flutter/material.dart';
import '../data_controller/quiz_controller.dart';
import '../models/level.dart';
import '../view_screens/home.dart';
import '../view_screens/levels/level_describtion.dart';
import '../view_screens/questions/qestion_screen.dart';
import '../view_screens/splachscreen/splash_screen.dart';
import '../widgets/createRoute.dart';
import 'pages_names.dart';

Route<dynamic>? generateRoute(RouteSettings settings) {
  String? routeName = settings.name;
  switch (routeName) {
    case PagesNames.splashScreen:
      return CreateRoute( SplachScreen());
    case PagesNames.homePage:
      return CreateRoute(const HomePage());

    case PagesNames.question:
      QuizController quizcontroller = settings.arguments as QuizController;
      return CreateRoute(QuestionScreen(
        quizController: quizcontroller,
      ));
    case PagesNames.levelDescription:
      Level level = settings.arguments as Level;
      return CreateRoute(LevelDescription(level));
    default:
      return MaterialPageRoute(builder: (_) => Container());
  }
}
