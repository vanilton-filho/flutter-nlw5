import 'package:DevQuiz/challenge/widgets/awnser/awnser_widget.dart';
import 'package:DevQuiz/core/core.dart';
import 'package:flutter/material.dart';

class QuizWidget extends StatelessWidget {
  final String title;

  QuizWidget({required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Text(
              title,
              style: AppTextStyles.heading,
            ),
          ),
          AwnserWidget(
              isRight: true,
              isSelected: true,
              title:
                  'Possibilita a criação de aplicativos compilados nativamente.'),
          AwnserWidget(
              isRight: false,
              isSelected: true,
              title:
                  'Possibilita a criação de aplicativos compilados nativamente.'),
          AwnserWidget(
              title:
                  'Possibilita a criação de aplicativos compilados nativamente.'),
          AwnserWidget(
              isRight: true,
              isSelected: true,
              title:
                  'Possibilita a criação de aplicativos compilados nativamente.'),
        ],
      ),
    );
  }
}
