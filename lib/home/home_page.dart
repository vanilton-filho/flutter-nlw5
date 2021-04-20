import 'package:DevQuiz/home/widgets/appbar/app_bar_widget.dart';
import 'package:DevQuiz/home/widgets/level_button/level_button_widget.dart';
import 'package:DevQuiz/home/widgets/quiz_card/quiz_card_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 14, top: 24, bottom: 24),
            child: Container(
              // Para mim a lógica foi:
              // Se internamente cada button tem padding 26 por 6, faz a soma e tchau ;)
              height: 32,
              child: ListView(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      LevelButtonWidget(
                        label: 'Fácil',
                      ),
                      LevelButtonWidget(
                        label: 'Médio',
                      ),
                      LevelButtonWidget(
                        label: 'Difícil',
                      ),
                      LevelButtonWidget(
                        label: 'Perito',
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(10),
            child: GridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              children: [
                QuizCardWidget(),
                QuizCardWidget(),
                QuizCardWidget(),
              ],
            ),
          ))
        ],
      ),
    );
  }
}
