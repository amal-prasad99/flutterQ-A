import 'package:class_day_4/answer_button.dart';
import 'package:class_day_4/data/questions.dart';
import 'package:flutter/material.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen(
      {super.key, required this.onAnswer, required this.onAction});

  final Function(String value) onAnswer;
  final Function(String value) onAction;

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  int courrentQuestionIndex = 0;

  void answerQuetion(String answer) {
    widget.onAnswer(answer);
    setState(() {
      courrentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              questions[courrentQuestionIndex].question,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white, fontSize: 28),
            ),
            ...questions[courrentQuestionIndex].getRandomAnswers().map(
                (answer) =>
                    AnswerButton(value: answer, onAnswer: answerQuetion)),
            const SizedBox(
              height: 40,
            ),
            TextButton(
                onPressed: () {
                  widget.onAction('start');
                },
                child: const Text(
                  'Back to Start',
                  style: TextStyle(fontSize: 18, color: Colors.amber),
                ))
          ],
        ),
      ),
    );
  }
}







// import 'package:flutter/material.dart';

// class QuestionScreen extends StatelessWidget {
//   const QuestionScreen({super.key, required this.onAction});

//   final Function(String value) onAction;

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           const Text('Questions'),
//           const SizedBox(
//             height: 30,
//           ),
//           OutlinedButton(onPressed: () {}, child: const Text('Answer')),
//           const SizedBox(
//             height: 30,
//           ),
//           TextButton(
//             onPressed: () {
//               onAction('start');
//             },
//             child: const Text(
//               'Back to staart',
//               style: TextStyle(fontSize: 20, color: Colors.amber),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }