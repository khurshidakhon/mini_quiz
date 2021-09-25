import 'package:flutter/material.dart';
import './result.dart';
import './quiz.dart';
// void main() {
//   runApp(MyApp());
// }

void main() => runApp(MyApp());

//this class can be recreated
class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

//State class attached to MyApp class and cannot be recreated
//MyAppState => public by default; _MyAppState => private
class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var _totalScore = 0;
  final _questions = const [
    {
      'questionText': 'What\'s you favourite color?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 5},
        {'text': 'Green', 'score': 3},
        {'text': 'White', 'score': 6},
      ],
    },
    {
      'questionText': 'What\'s you favourite animals?',
      'answers': [
        {'text': 'Rabbit', 'score': 10},
        {'text': 'Dog', 'score': 5},
        {'text': 'Cat', 'score': 3},
        {'text': 'Mouse', 'score': 6},
      ],
    },
    {
      'questionText': 'Who is your favourite instructor?',
      'answers': [
        {'text': 'Max', 'score': 12},
        {'text': 'Khurshida', 'score': 32},
        {'text': 'Liza', 'score': 13},
        {'text': 'Tom', 'score': 6},
      ],
    },
  ];

  void resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('We have more questons!');
    }
  }

  //technically not required. it is decorater. to make our code clearer and cleaner
  //let know program that I override build method not accidently
  @override
  //build method responsible for returning Widgets; every Widget is a dart class
  Widget build(BuildContext context) {
    //list of text questions. can hold anything: text, int, widgets

    //Scaffold => responsible for UI. some basic page styling
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          //title dont take text as argument, it takes TEXT widget, where you can write plain text
          title: Text('My First App'),
        ),
        //cannot take two or more widgets. need to add
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questions: _questions,
                questionIndex: _questionIndex,
              )
            : Result(_totalScore, resetQuiz),
      ),
    );
  }
}
