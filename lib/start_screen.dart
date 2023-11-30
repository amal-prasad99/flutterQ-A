import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key, required this.onAction});

  final Function(String value) onAction;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Image.asset(
          //   'assets\images\quiz-cover.png',
          //   width: 300,
          // ),
          const Text('Lets do some Quez'),
          const SizedBox(
            height: 30,
          ),
          OutlinedButton(
            onPressed: () {
              onAction('quiz');
            },
            child: const Text(
              'got to Quez',
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
