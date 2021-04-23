import 'package:DevQuiz/challenge/widgets/awnser/awnser_widget.dart';
import 'package:DevQuiz/core/core.dart';
import 'package:DevQuiz/shared/models/question_model.dart';
import 'package:flutter/material.dart';

class QuizWidget extends StatefulWidget {
  final QuestionModel question;
  final VoidCallback onChange;
  QuizWidget({
    Key? key,
    required this.question,
    required this.onChange,
  }) : super(key: key);

  @override
  _QuizWidgetState createState() => _QuizWidgetState();
}

class _QuizWidgetState extends State<QuizWidget> {
  int indexSelected = -1;

  awnsers(int index) => widget.question.awnsers[index];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 64, bottom: 32),
            child: Text(
              widget.question.title,
              style: AppTextStyles.heading,
              textAlign: TextAlign.center,
            ),
          ),
          for (var i = 0; i < widget.question.awnsers.length; i++)
            AwnserWidget(
              awnser: awnsers(i),
              disabled: indexSelected != -1,
              isSelected: indexSelected == i,
              onTap: () {
                indexSelected = i;
                setState(() {});

                Future.delayed(Duration(seconds: 1))
                    .then((value) => widget.onChange());
              },
            ),
        ],
      ),
    );
  }
}
