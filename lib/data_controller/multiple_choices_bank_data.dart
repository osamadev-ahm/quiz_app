

import '../models/question.dart';
import 'quiz_controller.dart';
class MultipleChoicesBankData extends QuizController {
  @override
  // TODO: implement questionBank
  List<Question> get questionBank => [
        Question('You can lead a cow down stairs but not up stairs.', 1,
            ['always', 'never', 'sometimes']),
        Question('Approximately one quarter of human bones are in the feet.', 0,
            ['agree', 'disagree', 'not sure']),
      ];
}
