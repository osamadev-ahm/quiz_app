import 'package:flutter/material.dart';

import 'app_router/router.dart';
import 'app_router/pages_names.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const  MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: generateRoute,
      initialRoute: PagesNames.splashScreen,
    );
  }
}
