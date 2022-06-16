import 'package:quizzler/question.dart';
import 'package:requests/requests.dart';

class QuizBrain {
  int _questionNumber = 0;

  void nextQuestion() async {
    if (_questionNumber < (_questionBank.length - 1)) {
      _questionNumber++;
      await Requests.get("http://127.0.0.1:8888/next/");
    }
  }

  void reset() async{
    await Requests.get("http://127.0.0.1:8888/reset/");
  }

  bool isFinished() {
    if (_questionNumber == (13 - 1)) {return true;}
    else {return false;}
  }

  dynamic grabQuestion() async {
    var r = await Requests.get("http://127.0.0.1:8888/question/");
    return r.json;
  }

  String getQuestionText() {
    var question =  grabQuestion();
    return question["question"];
  }

  bool getQuestionAnswer() {
    var answer = grabQuestion();
    
    return answer["answer"];
  }
}
