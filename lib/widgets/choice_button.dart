import 'package:flutter/material.dart';

import '../utils/constants/colors.dart';

class ChoiceButton extends StatelessWidget {
  const ChoiceButton(
      {Key? key,
      this.onTap,
      required this.disabledBackgroundColor,
      required this.body,
      required this.isCorrect,
      required this.isUserTap})
      : super(key: key);
  final VoidCallback? onTap;
  final Color disabledBackgroundColor;
  final String body;
  final bool isCorrect;
  final bool isUserTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        disabledBackgroundColor: disabledBackgroundColor,
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      ),
      child: Row(
        children: [
          if (isCorrect)
            const SizedBox(
              width: 24,
            ),
          Expanded(
            child: Center(
              child: Text(
                body,
                style: TextStyle(
                    color: isCorrect
                        ? Colors.white
                        : isUserTap
                            ? Colors.white
                            : kL2,
                    fontWeight: FontWeight.w500,
                    fontSize: 18),
              ),
            ),
          ),
          if (isCorrect)
            const Icon(
              Icons.check_rounded,
              color: Colors.white,
            ),
        ],
      ),
    );
  }
}

