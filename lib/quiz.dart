import 'package:class_day_4/data/questions.dart';
import 'package:class_day_4/question_screen.dart';
import 'package:class_day_4/result_screen.dart';
import 'package:class_day_4/start_screen.dart';
import 'package:flutter/material.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  // Widget? activeScreen;

  // @override
  // void initState() {
  //   activeScreen = const StartScreen(onAction: onScreenChange);
  //   super.initState();
  // }

  String activeScreen = 'start';
  List<String> selectednswers = [];

  void onScreenChange(String value) {
    setState(() {
      activeScreen = value;
    });
  }

  void onAnswerSelect(String answer) {
    selectednswers.add(answer);
    if (selectednswers.length == questions.length) {
      setState(() {
        activeScreen = 'result';
      });
    }
  }

  void onRestart(String value) {
    setState(() {
      selectednswers = [];
      activeScreen = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget? currentScreen = StartScreen(onAction: onScreenChange);

    if (activeScreen == 'start') {
      currentScreen = StartScreen(onAction: onScreenChange);
    }

    if (activeScreen == 'quiz') {
      currentScreen =
          QuestionScreen(onAnswer: onAnswerSelect, onAction: onScreenChange);
    }

    if (activeScreen == 'result') {
      currentScreen =
          ResultScreen(onAction: onRestart, answerList: selectednswers);
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.blue, Colors.green],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight),
          ),
          child: currentScreen,
        ),
      ),
    );
  }
}
