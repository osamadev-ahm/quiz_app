
import 'package:flutter/material.dart';
import 'package:quiz/app_router/approuter.dart';
import 'package:quiz/view_screens/levels/level_describtion.dart';
import '../app_router/pages_names.dart';
import '../data_controller/multiple_choices_bank_data.dart';
import '../data_controller/true_false_bank_data.dart';
import '../models/level.dart';
import '../utils/constants/images_name.dart';
import '../widgets/app_bar.dart';
import '../widgets/my_level_widget.dart';
import '../utils/constants/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Level> levels = [
    Level(
      icon: Icons.check,
      title: 'True or False',
      subtitle: 'Level 1',
      image: imageBags,
      colors: [kL1, kL12],
      route: PagesNames.question,
      quizcontroller: TrueFalseBankData(),
    ),
    Level(
      icon: Icons.play_arrow,
      title: 'Multiple Choice',
      subtitle: 'Level 2',
      image: imageBallonSmall,
      colors: [kL2, kL22],
      route: PagesNames.question,
      quizcontroller: MultipleChoicesBankData(),
    ),
  ];
  List<MyLevelWidget> levelWidgets = [];
  final GlobalKey<AnimatedListState> _key = GlobalKey<AnimatedListState>();

  void addToWidgets() {
    for (int i = 0; i < levels.length; i++) {
      levelWidgets.add(MyLevelWidget(
          fun: () {
            // Navigator.pushNamed(context, PagesNames.levelDescription,
            //     arguments: levels[i]);
            // AppRouter.navKey.currentState?.pushNamed(
            //   levels[i].route,
            //   arguments: levels[i].quizcontroller,
            // );
            AppRouter.goToScreen(
              LevelDescription(levels[i]),
            );

          },
          level: levels[i]));
      _key.currentState?.insertItem(
        i,
      );
    }
  }

  Tween<Offset> myOffset =
      Tween<Offset>(begin: const Offset(0, -1), end: const Offset(0, 0));
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      addToWidgets();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 28,
            ),
          ),
          HomeAppBar(
            onTapLove: () {},
            onTapPerson: () {},
          ),
          SliverFillRemaining(
            hasScrollBody: true,
            child: AnimatedList(
              key: _key,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              physics: const NeverScrollableScrollPhysics(),
              initialItemCount: levelWidgets.length,
              itemBuilder: (context, index, animation) => SlideTransition(
                position: animation.drive(myOffset),
                child: levelWidgets[index],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
