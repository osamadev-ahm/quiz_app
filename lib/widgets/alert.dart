
import 'package:flutter/material.dart';
import 'package:quiz/app_router/approuter.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../app_router/pages_names.dart';
import '../view_screens/home.dart';

Future showAlert(
    {required BuildContext context,
    required int correctResult,
    required int total,
    required VoidCallback onTapRestart}) async {
  await Alert(
      context: context,
      title: "Finished",
      desc: resultMessage(correctResult, total),
      style: const AlertStyle(animationType: AnimationType.fromLeft),
      closeFunction: () {
        popToLevelDescription(context);
      },
      buttons: [
        DialogButton(
            child: const Text(
              "Exit",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            onPressed: () {
              popToLevelDescription(context);
            }),
        DialogButton(
            onPressed: onTapRestart,
            child: const Text(
              "Restart",
              style: TextStyle(
                color: Colors.white,
              ),
            )),
      ]).show();
}

void popToLevelDescription(BuildContext context) {
  AppRouter.pushAndRemoveUntil(const HomePage());

}

String resultMessage(int mark, int totalMark) {
  double result = (mark / totalMark) * 100;
  String msg = "Yore Result is ${result.round()}%\n";
  switch (result) {
    case < 60:
      return "$msg Please Check If You Have A Brain";
    case < 80:
      return "$msg Not Bad";
    case < 90:
      return "$msg You Almost There";
    case < 100:
      return "$msg You Are Hard Worker";
    case == 100.0:
      return "$msg You Are The Jewish Student";
  }
  return "Some thing wont wrong\nPlease try again";
}
