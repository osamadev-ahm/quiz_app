import 'package:flutter/material.dart';
import 'package:quiz/widgets/createRoute.dart';
import '../../models/level.dart';
import '../../utils/constants/images_name.dart';
import '../../utils/constants/colors.dart';
import '../../utils/constants/fonts_name.dart';
import '../home.dart';

class LevelDescription extends StatelessWidget {
  const LevelDescription(
    this.level, {
    Key? key,
  }) : super(key: key);
  final Level level;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: level.colors,
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 74, left: 24, right: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 40,
                width: 40,
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.pop(context, CreateRoute(const HomePage()));
                  },
                  style: const ButtonStyle().copyWith(
                      shape: const WidgetStatePropertyAll(
                        CircleBorder(),
                      ),
                      side: const WidgetStatePropertyAll(
                        BorderSide(color: Colors.white),
                      ),
                      padding:
                          const WidgetStatePropertyAll(EdgeInsets.all(8))),
                  child: const Icon(
                    Icons.close,
                    color: Colors.white,
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Center(
                  child: Image.asset(imageBallonBig),
                ),
              ),
              Text(
                level.subtitle,
                style: const TextStyle(
                  fontSize: 18,
                  fontFamily: kFontFamily,
                  color: Colors.white60,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                level.title,
                style: const TextStyle(
                  fontSize: 32,
                  fontFamily: kFontFamily,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 18,
              ),
              const Text(
                'Do you feel confident? Here you\'ll challenge one of our most difficult travel questions!',
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: kFontFamily,
                  color: Colors.white60,
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, level.route,
                        arguments: level.quizcontroller);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    padding: const EdgeInsets.all(16),
                    elevation: 15,
                  ),
                  child: const Center(
                    child: Text(
                      'Game',
                      style: TextStyle(
                          color: kL2,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ),
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
