import 'dart:async';

import 'package:flutter/material.dart';
import '../../data_controller/quiz_controller.dart';
import '../../utils/constants/images_name.dart';
import '../../utils/constants/colors.dart';
import '../../utils/constants/fonts_name.dart';
import '../../widgets/alert.dart';
import '../../widgets/choice_button.dart';
import '../../widgets/quiz_header.dart';
import '../../widgets/score_view.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({Key? key, required this.quizController}) : super(key: key);
  final QuizController quizController;

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  late QuizController quizMulti;

  int? userChoice;
  int counter = 10;
  bool? isCorrect;
  late Timer timer;
  List<bool> scoreKeeper = [];
  bool _isUserTapChoice = false;
  int correctResult = 0;

  void setIsUserTapChoice(bool value) {
    _isUserTapChoice = value;
  }

  void reset() {
    scoreKeeper.clear();
    quizMulti.reset();
    reSetNextQuestionVariables();
    startTimer();
    correctResult = 0;
  }

  void reSetNextQuestionVariables() {
    setIsUserTapChoice(false);
    counter = 10;
    userChoice = null;
    isCorrect = null;
  }

  void checkAnswer() {
    int correctAnswer = quizMulti.getQuestionAnswer();
    if (userChoice == null || correctAnswer != userChoice) {
      scoreKeeper.add(false);
      isCorrect = false;
    } else {
      correctResult++;
      scoreKeeper.add(true);
      isCorrect = true;
    }
    if (counter <= 0) {
      reSetNextQuestionVariables();
      quizMulti.nextQuestion();
    }
  }

  void showResult(BuildContext context) {
    timer.cancel();
    showAlert(
        context: context,
        correctResult: correctResult,
        total: scoreKeeper.length,
        onTapRestart: () {
          reset();
          Navigator.pop(context);
        });
  }

  Color disabledBackgroundColor(int index) {
    if (isCorrect == null) {
      return Colors.white;
    } else {
      if (isCorrect! && userChoice == index) {
        return kG1;
      } else if (userChoice == index) {
        return Colors.red;
      } else {
        return Colors.white60;
      }
    }
  }

  void goToNext(BuildContext context) {
    if (quizMulti.isFinished()) {
      showResult(context);
    } else {
      if (_isUserTapChoice == false) {
        checkAnswer();
      }
      reSetNextQuestionVariables();
      quizMulti.nextQuestion();
    }
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        counter--;
        if (counter == 0) {
          userChoice = null;
          goToNext(context);
        }
      });
    });
  }

  @override
  void initState() {
    quizMulti = widget.quizController;
    startTimer();
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  void selectChoice(int index) {
    userChoice = index;
    checkAnswer();
    _isUserTapChoice = true;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              kBlueBg,
              kL2,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 60, left: 24, right: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              QuizHeader(counter: counter),
              Expanded(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 12.0),
                    child: Image.asset(imageBallonBig),
                  ),
                ),
              ),
              Text(
                'question ${quizMulti.questionNumber + 1} of ${quizMulti.getQuestionBankLength()}',
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
                quizMulti.getQuestionText(),
                style: const TextStyle(
                  fontSize: 32,
                  fontFamily: kFontFamily,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 48,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: quizMulti.getOptions().length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: ChoiceButton(
                        onTap: !_isUserTapChoice
                            ? () {
                                setState(() {
                                  selectChoice(index);
                                });
                              }
                            : null,
                        isUserTap: _isUserTapChoice,
                        isCorrect: (isCorrect ?? false) && userChoice == index,
                        disabledBackgroundColor: disabledBackgroundColor(index),
                        body: quizMulti.getOptions()[index],
                      ),
                    );
                  },
                ),
              ),
              TextButton(
                  onPressed: () {
                    setState(() {
                      goToNext(context);
                      isCorrect = null;
                      counter = 10;
                      // isButtonDisabled = false;
                    });
                  },
                  child: const Text(
                    "Next",
                    style: TextStyle(color: Colors.white),
                  )),
              ScoreKeeperView(scoreKeeper: scoreKeeper),
            ],
          ),
        ),
      ),
    );
  }

}
