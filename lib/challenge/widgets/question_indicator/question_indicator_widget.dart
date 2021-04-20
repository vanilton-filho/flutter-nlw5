import 'package:DevQuiz/core/core.dart';
import 'package:DevQuiz/shared/widgets/progress_indicator/progress_indicator_widget.dart';
import 'package:flutter/material.dart';

class QuestionIndicatorWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Questão 04',
                  style: AppTextStyles.body,
                ),
                Text(
                  "0/4 de 10",
                  style: AppTextStyles.body,
                ),
              ],
            ),
          ),
          ProgressIndicatorWidget(value: 0.3)
        ],
      ),
    );
  }
}
