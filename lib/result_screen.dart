import 'package:class_day_4/data/questions.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(
      {Key? key, required this.answerList, required this.onAction})
      : super(key: key);

  final Function(String value) onAction;
  final List<String> answerList;

  List<Map<String, Object>> getSummary() {
    List<Map<String, Object>> summary = [];

    for (var i = 0; i < answerList.length; i++) {
      summary.add({
        'questionIndex': i,
        'question': questions[i].question,
        'correct_answer': questions[i].answers[0],
        'user_answer': answerList[i],
      });
    }
    return summary;
  }

  Widget buildCard(Map<String, Object> s) {
    return Card(
      margin: const EdgeInsets.all(10),
      elevation: 10,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          width: double.infinity,
          child: Column(
            children: [
              Text("Question " + ((s['questionIndex'] as int) + 1).toString()),
              const SizedBox(
                height: 10,
              ),
              Text((s['question']).toString()),
              const SizedBox(
                height: 10,
              ),
              const Text("Correct Answer"),
              const SizedBox(
                height: 10,
              ),
              Text((s['correct_answer']).toString()),
              const SizedBox(
                height: 10,
              ),
              const Text("Your Answer"),
              const SizedBox(
                height: 10,
              ),
              Text(s['user_answer'].toString()),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Result Screen'),
              const SizedBox(
                height: 30,
              ),
              ...getSummary().map((s) => buildCard(s)),
              OutlinedButton(
                onPressed: () {
                  onAction('start');
                },
                child: const Text(
                  'Restart',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
