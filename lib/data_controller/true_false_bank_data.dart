

import 'package:quiz/data_controller/quiz_controller.dart';

import '../models/question.dart';

class TrueFalseBankData extends QuizController {
  @override
  // TODO: implement questionBank
  List<Question> get questionBank => [
        Question("Are You Happy", 0, ['True', "False"]),
        Question("Are You Happy", 1, ['True', "False"]),
        Question("Are You Happy", 0, ['True', "False"]),
        Question("Are You Happy", 1, ['True', "False"]),
      ];
}
