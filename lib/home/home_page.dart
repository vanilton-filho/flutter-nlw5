import 'package:DevQuiz/core/core.dart';
import 'package:DevQuiz/home/home_controller.dart';
import 'package:DevQuiz/home/home_state.dart';
import 'package:DevQuiz/home/widgets/appbar/app_bar_widget.dart';
import 'package:DevQuiz/home/widgets/level_button/level_button_widget.dart';
import 'package:DevQuiz/home/widgets/quiz_card/quiz_card_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeController controller = HomeController();

  @override
  void initState() {
    super.initState();
    controller.getUser();
    controller.getQuizzes();
    // Ficará ouvindo todas as atualizações do estado do controller
    controller.stateNotifier.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    if (controller.state == HomeState.success) {
      return Scaffold(
        appBar: AppBarWidget(user: controller.user!),
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
                children: controller.quizzes!
                    .map((e) => QuizCardWidget(
                          title: e.title,
                          percent: e.questionAnswered / e.questions.length,
                          completed:
                              "${e.questionAnswered}/${e.questions.length}",
                        ))
                    .toList(),
              ),
            ))
          ],
        ),
      );
    } else {
      return Scaffold(
        body: Center(
            child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(AppColors.chartPrimary),
        )),
      );
    }
  }
}
